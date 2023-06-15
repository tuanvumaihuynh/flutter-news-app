import '../../domain/entities/article.dart';
import '../../domain/entities/setting.dart';
import '../../domain/entities/source.dart';
import '../source/local/models/article.dart';
import '../source/local/models/setting.dart';
import '../source/local/models/source.dart';

extension LocalArticleModelToEntity on ArticleHiveModel {
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

extension LocalSourceModelToEntity on SourceHiveModel {
  Source toEntity() => Source(
        id: id.trim(),
        name: name.trim(),
      );
}

extension LocalSettingModelToEntity on SettingHiveModel {
  Setting toEntity() => Setting(
        isDarkMode: isDarkMode,
        firstOpenApp: firstOpenApp,
        favoriteSubject: favoriteSubject,
      );
}
