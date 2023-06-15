import 'package:bloc_learning/data/source/local/local_datasource.dart';
import 'package:bloc_learning/data/translators/entity_to_local.dart';
import 'package:bloc_learning/data/translators/local_to_entity.dart';
import 'package:bloc_learning/domain/entities/setting.dart';

abstract class SettingRepositoryBase {
  Setting get setting;

  Future<void> updateSetting(Setting setting);
}

class SettingRepository implements SettingRepositoryBase {
  SettingRepository({required LocalDataSource localDataSource})
      : _localDataSource = localDataSource;

  final LocalDataSource _localDataSource;

  @override
  Setting get setting {
    final setting = _localDataSource.getSettingData();

    return setting?.toEntity() ??
        Setting(firstOpenApp: true, isDarkMode: false, favoriteSubject: []);
  }

  @override
  Future<void> updateSetting(Setting setting) async {
    await _localDataSource.updateSettingData(setting.toHiveModel());
  }
}
