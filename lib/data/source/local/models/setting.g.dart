// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingHiveModelAdapter extends TypeAdapter<SettingHiveModel> {
  @override
  final int typeId = 2;

  @override
  SettingHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SettingHiveModel()
      ..firstOpenApp = fields[0] as bool
      ..isDarkMode = fields[1] as bool
      ..favoriteSubject = (fields[2] as List).cast<String>();
  }

  @override
  void write(BinaryWriter writer, SettingHiveModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.firstOpenApp)
      ..writeByte(1)
      ..write(obj.isDarkMode)
      ..writeByte(2)
      ..write(obj.favoriteSubject);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
