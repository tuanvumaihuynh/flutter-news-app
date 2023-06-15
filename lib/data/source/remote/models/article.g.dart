// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) => ArticleModel(
      SourceModel.fromJson(json['source'] as Map<String, dynamic>),
      json['author'] as String? ?? '',
      json['title'] as String? ?? '',
      json['description'] as String? ?? '',
      json['content'] as String? ?? '',
      json['url'] as String? ?? '',
      json['urlToImage'] as String? ??
          'https://fakeimg.pl/600x400?text=No+Image&font=noto',
      json['publishedAt'] as String? ?? '',
    );

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
    <String, dynamic>{
      'source': instance.source.toJson(),
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'content': instance.content,
      'url': instance.url,
      'urlToImage': instance.imageUrl,
      'publishedAt': instance.publishedAt,
    };
