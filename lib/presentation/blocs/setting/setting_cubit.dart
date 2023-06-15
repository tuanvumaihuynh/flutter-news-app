import 'package:bloc_learning/data/repositories/setting_repository.dart';
import 'package:bloc_learning/presentation/blocs/setting/setting_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit({required this.settingRepository})
      : super(SettingState.initialize(settingRepository.setting));
  final SettingRepository settingRepository;

  Future<void> toggleTheme() async {
    emit(state.asLoading());

    final newState = state.asDone(isDarkMode: !state.isDarkMode);

    await settingRepository.updateSetting(newState.toEntity());

    emit(newState);
  }

  Future<void> updateFavoriteSubject(List<String> favoriteSubject) async {
    emit(state.asLoading());

    final newState =
        state.asDone(firstOpenApp: false, favoriteSubject: favoriteSubject);

    await settingRepository.updateSetting(newState.toEntity());

    emit(newState);
  }
}
