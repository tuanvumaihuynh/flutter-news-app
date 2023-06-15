import '../../../domain/entities/article.dart';

abstract class ArticleEvent {}

class ArticleLoad extends ArticleEvent {
  final String? query;

  ArticleLoad({this.query});
}

class ArticleLoadMore extends ArticleEvent {}

class ArticleSelectedChanged extends ArticleEvent {
  final Article article;

  ArticleSelectedChanged({required this.article});
}
