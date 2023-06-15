import '../../../domain/entities/article.dart';

enum ArticleStateStatus {
  initial,
  loading,
  loadSuccess,
  loadFailure,
  loadingMore,
  loadMoreSuccess,
  loadMoreFailure
}

class ArticleState {
  final ArticleStateStatus status;
  final List<Article> articles;
  final Article? selectedArticle;
  final String query;
  final int page;
  final Exception? error;
  final bool canLoadMore;

  const ArticleState._({
    this.status = ArticleStateStatus.initial,
    this.articles = const <Article>[],
    this.selectedArticle,
    this.page = 1,
    this.canLoadMore = true,
    this.query = 'popular',
    this.error,
  });

  const ArticleState.initialize() : this._();

  ArticleState asLoading() {
    return copyWith(status: ArticleStateStatus.loading);
  }

  ArticleState asLoadSuccess(
    List<Article> articles,
    String query, {
    bool canLoadMore = true,
  }) {
    return copyWith(
      status: ArticleStateStatus.loadSuccess,
      articles: articles,
      query: query,
      page: 1,
      canLoadMore: canLoadMore,
    );
  }

  ArticleState asLoadFailure(Exception error) {
    return copyWith(status: ArticleStateStatus.loadFailure, error: error);
  }

  ArticleState asLoadingMore() {
    return copyWith(status: ArticleStateStatus.loadingMore);
  }

  ArticleState asLoadMoreSuccess(
    List<Article> newArticles, {
    bool canLoadMore = true,
  }) {
    return copyWith(
      status: ArticleStateStatus.loadMoreSuccess,
      articles: [...articles, ...newArticles],
      page: page + 1,
      canLoadMore: canLoadMore,
    );
  }

  ArticleState asLoadMoreFailure(Exception error) {
    return copyWith(status: ArticleStateStatus.loadMoreFailure, error: error);
  }

  ArticleState copyWith({
    ArticleStateStatus? status,
    List<Article>? articles,
    Article? selectedArticle,
    String? query,
    int? page,
    bool? canLoadMore,
    Exception? error,
  }) {
    return ArticleState._(
      status: status ?? this.status,
      articles: articles ?? this.articles,
      selectedArticle: selectedArticle ?? this.selectedArticle,
      query: query ?? this.query,
      page: page ?? this.page,
      canLoadMore: canLoadMore ?? this.canLoadMore,
      error: error ?? this.error,
    );
  }
}
