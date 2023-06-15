import 'package:bloc_learning/data/source/local/models/article.dart';
import 'package:bloc_learning/data/source/remote/models/article.dart';
import 'package:bloc_learning/data/source/remote/models/source.dart';

import '../source/local/models/source.dart';

extension RemoteArticleModelToLocal on ArticleModel {
  ArticleHiveModel toHiveModel() => ArticleHiveModel()
    ..source = source.toHiveModel()
    ..author = author
    ..title = title
    ..description = description
    ..content = content
    ..url = url
    ..imageUrl = imageUrl
    ..publishedAt = publishedAt;
}

extension RemoteSourceModelToLocal on SourceModel {
  SourceHiveModel toHiveModel() => SourceHiveModel()
    ..id = id
    ..name = name;
}
