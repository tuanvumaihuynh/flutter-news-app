import 'package:bloc_learning/data/source/remote/models/source.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable(explicitToJson: true)
class ArticleModel {
  ArticleModel(this.source, this.author, this.title, this.description,
      this.content, this.url, this.imageUrl, this.publishedAt);

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);

  @JsonKey(name: 'source')
  final SourceModel source;

  @JsonKey(name: 'author', defaultValue: '')
  final String author;

  @JsonKey(name: 'title', defaultValue: '')
  final String title;

  @JsonKey(name: 'description', defaultValue: '')
  final String description;

  @JsonKey(name: 'content', defaultValue: '')
  final String content;

  @JsonKey(name: 'url', defaultValue: '')
  final String url;

  @JsonKey(
      name: 'urlToImage',
      defaultValue: 'https://fakeimg.pl/600x400?text=No+Image&font=noto')
  final String imageUrl;

  @JsonKey(name: 'publishedAt', defaultValue: '')
  final String publishedAt;
}
