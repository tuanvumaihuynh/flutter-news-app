import 'package:bloc_learning/core/services/network_service.dart';
import 'package:bloc_learning/data/source/local/local_datasource.dart';
import 'package:bloc_learning/data/source/remote/remote_datasource.dart';
import 'package:bloc_learning/data/translators/local_to_entity.dart';
import 'package:bloc_learning/data/translators/remote_to_entity.dart';
import 'package:bloc_learning/data/translators/remote_to_local.dart';

import '../../domain/entities/article.dart';

abstract class ArticleRepositoryBase {
  Future<List<Article>> getArticles(
      {required String query, required int page, required int limit});
}

class ArticleRepository implements ArticleRepositoryBase {
  ArticleRepository({
    required RemoteDataSource remoteDataSource,
    required LocalDataSource localDataSource,
    required NetworkService networkService,
  })  : _remoteDataSource = remoteDataSource,
        _localDataSource = localDataSource,
        _networkService = networkService;

  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final NetworkService _networkService;

  @override
  Future<List<Article>> getArticles(
      {required String query, required int page, required int limit}) async {
    if (await _networkService.isConnected) {
      final responseModel = await _remoteDataSource.getArticles(
          query: query, limit: limit, page: page);

      final articleHiveModels =
          responseModel.articles.map((e) => e.toHiveModel());

      await _localDataSource.saveNewsData(articleHiveModels);

      if (responseModel.status == 'ok') {
        final articleEntities =
            responseModel.articles.map((e) => e.toEntity()).toList();

        return articleEntities;
      }
    }

    if (!_localDataSource.hasArticleData()) return [];

    final articleHiveModels = _localDataSource.getArticleData();

    final articleEntities = articleHiveModels.map((e) => e.toEntity()).toList();

    return articleEntities;
  }
}
