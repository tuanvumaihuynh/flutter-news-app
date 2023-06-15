import 'package:bloc_learning/data/source/remote/models/article.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable(explicitToJson: true)
class ResponseModel {
  ResponseModel(this.status, this.totalResults, this.articles);

  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);

  @JsonKey(name: 'status', disallowNullValue: true)
  final String status;

  @JsonKey(name: 'totalResults', defaultValue: 0)
  final int totalResults;

  @JsonKey(name: 'articles', defaultValue: [])
  final List<ArticleModel> articles;
}
