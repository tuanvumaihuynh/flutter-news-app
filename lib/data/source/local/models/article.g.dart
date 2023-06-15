// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArticleHiveModelAdapter extends TypeAdapter<ArticleHiveModel> {
  @override
  final int typeId = 1;

  @override
  ArticleHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArticleHiveModel()
      ..source = fields[0] as SourceHiveModel
      ..author = fields[1] as String
      ..title = fields[2] as String
      ..description = fields[3] as String
      ..content = fields[4] as String
      ..url = fields[5] as String
      ..imageUrl = fields[6] as String
      ..publishedAt = fields[7] as String;
  }

  @override
  void write(BinaryWriter writer, ArticleHiveModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.source)
      ..writeByte(1)
      ..write(obj.author)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.content)
      ..writeByte(5)
      ..write(obj.url)
      ..writeByte(6)
      ..write(obj.imageUrl)
      ..writeByte(7)
      ..write(obj.publishedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticleHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
