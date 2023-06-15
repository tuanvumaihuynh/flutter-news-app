import 'package:bloc_learning/data/repositories/article_repository.dart';
import 'package:bloc_learning/presentation/blocs/article/article_event.dart';
import 'package:bloc_learning/presentation/blocs/article/article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  static const int articlesPerPage = 10;

  final ArticleRepository _articleRepository;

  ArticleBloc({required ArticleRepository articleRepository})
      : _articleRepository = articleRepository,
        super(const ArticleState.initialize()) {
    on<ArticleLoad>(_onArticleLoad);
    on<ArticleLoadMore>(_onArticleLoadMore);
    on<ArticleSelectedChanged>(_onArticleSelectedChanged);
  }

  void _onArticleLoad(ArticleLoad event, Emitter<ArticleState> emit) async {
    emit(state.asLoading());
    try {
      final query = event.query ?? state.query;

      final articles = await _articleRepository.getArticles(
        query: query,
        page: 1,
        limit: articlesPerPage,
      );

      final canLoadMore = articles.length >= articlesPerPage;

      emit(state.asLoadSuccess(articles, query, canLoadMore: canLoadMore));
    } on Exception catch (e) {
      emit(state.asLoadFailure(e));
    }
  }

  void _onArticleLoadMore(
      ArticleLoadMore event, Emitter<ArticleState> emit) async {
    if (!state.canLoadMore) return;

    emit(state.asLoadingMore());

    try {
      final articles = await _articleRepository.getArticles(
        query: state.query,
        page: state.page + 1,
        limit: articlesPerPage,
      );

      final canLoadMore = articles.length >= articlesPerPage;

      emit(state.asLoadMoreSuccess(articles, canLoadMore: canLoadMore));
    } on Exception catch (e) {
      emit(state.asLoadMoreFailure(e));
    }
  }

  void _onArticleSelectedChanged(
      ArticleSelectedChanged event, Emitter<ArticleState> emit) {
    emit(state.copyWith(selectedArticle: event.article));
  }
}
