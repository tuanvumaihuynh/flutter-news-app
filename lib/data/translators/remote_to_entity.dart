import 'package:bloc_learning/data/source/remote/models/source.dart';

import '../../domain/entities/article.dart';
import '../../domain/entities/source.dart';
import '../source/remote/models/article.dart';

extension RemoteArticleModelToEntiTy on ArticleModel {
  Article toEntity() => Article(
        source: source.toEntity(),
        author: author.trim(),
        title: title.trim(),
        description: description.trim(),
        content: content.trim(),
        url: url.trim(),
        imageUrl: imageUrl.trim(),
        publishedAt: DateTime.parse(publishedAt),
      );
}

extension RemoteSourceModelToEntiTy on SourceModel {
  Source toEntity() => Source(
        id: id.trim(),
        name: name.trim(),
      );
}
