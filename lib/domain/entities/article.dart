import 'package:bloc_learning/domain/entities/source.dart';

class Article {
  Article(
      {required this.source,
      required this.author,
      required this.title,
      required this.description,
      required this.content,
      required this.url,
      required this.imageUrl,
      required this.publishedAt});

  final Source source;
  final String author;
  final String title;
  final String description;
  final String content;
  final String url;
  final String imageUrl;
  final DateTime publishedAt;
}
