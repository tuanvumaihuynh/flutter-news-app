import 'package:json_annotation/json_annotation.dart';

part 'source.g.dart';

@JsonSerializable()
class SourceModel {
  SourceModel(this.id, this.name);

  factory SourceModel.fromJson(Map<String, dynamic> json) =>
      _$SourceModelFromJson(json);

  Map<String, dynamic> toJson() => _$SourceModelToJson(this);

  @JsonKey(name: 'id', defaultValue: 'No id')
  final String id;

  @JsonKey(name: 'name', defaultValue: 'No name')
  final String name;
}
