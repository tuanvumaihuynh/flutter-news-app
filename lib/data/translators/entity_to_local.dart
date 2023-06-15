import 'package:bloc_learning/data/source/local/models/setting.dart';
import 'package:bloc_learning/domain/entities/setting.dart';

extension SettingEntityToLocal on Setting {
  SettingHiveModel toHiveModel() => SettingHiveModel()
    ..firstOpenApp = firstOpenApp
    ..isDarkMode = isDarkMode
    ..favoriteSubject = favoriteSubject;
}
