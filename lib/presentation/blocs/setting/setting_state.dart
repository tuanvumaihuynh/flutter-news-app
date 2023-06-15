import 'package:bloc_learning/domain/entities/setting.dart';

enum SettingStateStatus { initial, loading, done }

class SettingState {
  final SettingStateStatus settingStateStatus;
  final bool firstOpenApp;
  final bool isDarkMode;
  final List<String> categories;

  const SettingState._(this.settingStateStatus, this.firstOpenApp,
      this.isDarkMode, this.categories);

  SettingState.initialize(Setting setting)
      : this._(
          SettingStateStatus.initial,
          setting.firstOpenApp,
          setting.isDarkMode,
          setting.favoriteSubject,
        );

  SettingState asLoading() {
    return copyWith(settingStateStatus: SettingStateStatus.loading);
  }

  SettingState asDone(
      {bool? firstOpenApp, bool? isDarkMode, List<String>? favoriteSubject}) {
    return copyWith(
      settingStateStatus: SettingStateStatus.done,
      firstOpenApp: firstOpenApp,
      isDarkMode: isDarkMode,
      favoriteSubject: favoriteSubject,
    );
  }

  SettingState copyWith({
    SettingStateStatus? settingStateStatus,
    bool? firstOpenApp,
    bool? isDarkMode,
    List<String>? favoriteSubject,
  }) {
    return SettingState._(
      settingStateStatus ?? this.settingStateStatus,
      firstOpenApp ?? this.firstOpenApp,
      isDarkMode ?? this.isDarkMode,
      favoriteSubject ?? this.categories,
    );
  }

  Setting toEntity() => Setting(
        firstOpenApp: firstOpenApp,
        isDarkMode: isDarkMode,
        favoriteSubject: categories,
      );
}
