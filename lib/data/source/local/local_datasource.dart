import 'package:bloc_learning/data/source/local/models/article.dart';
import 'package:bloc_learning/data/source/local/models/setting.dart';
import 'package:bloc_learning/data/source/local/models/source.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalDataSource {
  static Future<void> initialize() async {
    await Hive.initFlutter();

    Hive.registerAdapter<ArticleHiveModel>(ArticleHiveModelAdapter());
    Hive.registerAdapter<SourceHiveModel>(SourceHiveModelAdapter());
    Hive.registerAdapter<SettingHiveModel>(SettingHiveModelAdapter());

    await Hive.openBox<ArticleHiveModel>(ArticleHiveModel.boxKey);
    await Hive.openBox<SourceHiveModel>(SourceHiveModel.boxKey);
    await Hive.openBox<SettingHiveModel>(SettingHiveModel.boxKey);
  }

  bool hasSettingData() {
    final settingBox = Hive.box<SettingHiveModel>(SettingHiveModel.boxKey);
    return settingBox.length > 0;
  }

  SettingHiveModel? getSettingData() {
    final settingBox = Hive.box<SettingHiveModel>(SettingHiveModel.boxKey);

    if (settingBox.length > 0) {
      return settingBox.values.first;
    }
    return null;
  }

  Future<void> updateSettingData(SettingHiveModel setting) async {
    final settingBox = Hive.box<SettingHiveModel>(SettingHiveModel.boxKey);

    await settingBox.clear();
    await settingBox.put('setting', setting);
  }

  bool hasArticleData() {
    final articleBox = Hive.box<ArticleHiveModel>(ArticleHiveModel.boxKey);
    return articleBox.length > 0;
  }

  List<ArticleHiveModel> getArticleData() {
    final articleBox = Hive.box<ArticleHiveModel>(ArticleHiveModel.boxKey);

    final articles = articleBox.values.toList();

    return articles;
  }

  Future<void> saveNewsData(Iterable<ArticleHiveModel> articles) async {
    final articleBox = Hive.box<ArticleHiveModel>(ArticleHiveModel.boxKey);

    final articlesMap = {for (var article in articles) article.title: article};

    await articleBox.clear();
    await articleBox.putAll(articlesMap);
  }
}
