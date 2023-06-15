import 'package:bloc_learning/core/services/api_service.dart';

import 'models/response.dart';

class RemoteDataSource {
  RemoteDataSource(ApiService apiService) : _apiService = apiService;

  final ApiService _apiService;

  static const apiKey = "ddc50df1275744b8a06b8e56a4457b15";

  static const url = "https://newsapi.org/v2/everything";

  /// Maximum number of result is 100
  ///
  Future<ResponseModel> getArticles(
      {required String query, required int limit, required int page}) async {
    final Map<String, dynamic> queryParameters = {
      "q": query,
      "apiKey": apiKey,
      "pageSize": limit <= 100 ? limit : 100,
      "page": page
    };

    try {
      final response = await _apiService.request(
        RequestMethod.get,
        url,
        queryParameters: queryParameters,
      );

      return ResponseModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
