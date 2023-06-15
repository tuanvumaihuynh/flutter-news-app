import 'package:bloc_learning/data/source/local/models/source.dart';
import 'package:hive/hive.dart';

part 'article.g.dart';

@HiveType(typeId: 1)
class ArticleHiveModel extends HiveObject {
  static const String boxKey = 'article';

  @HiveField(0)
  late SourceHiveModel source;

  @HiveField(1)
  late String author;

  @HiveField(2)
  late String title;

  @HiveField(3)
  late String description;

  @HiveField(4)
  late String content;

  @HiveField(5)
  late String url;

  @HiveField(6)
  late String imageUrl;

  @HiveField(7)
  late String publishedAt;
}
