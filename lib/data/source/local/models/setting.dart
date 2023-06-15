import 'package:hive/hive.dart';

part 'setting.g.dart';

@HiveType(typeId: 2)
class SettingHiveModel extends HiveObject {
  static const String boxKey = 'setting';

  @HiveField(0)
  late bool firstOpenApp;

  @HiveField(1)
  late bool isDarkMode;

  @HiveField(2)
  late List<String> favoriteSubject;
}
