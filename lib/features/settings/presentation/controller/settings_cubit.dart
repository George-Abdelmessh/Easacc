import 'package:easacc/core/services/cache/shared_preferences_service.dart';
import 'package:easacc/core/services/cache/shared_prefs_keys.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_states.dart';

class SettingCubit extends Cubit<SettingStates> {
  SettingCubit() : super(SettingInitial());

  String? selectedDevice =
      SharedPreferencesService.getData(key: SharedPrefsKeys.selectedDevice) ??
      'Wifi';

  void changeSelectedDevice(String device) {
    selectedDevice = device;
    emit(ChangeSelectedDeviceState());
  }

  void saveSettings({required String url}) {
    SharedPreferencesService.saveData(
      key: SharedPrefsKeys.url,
      value: url,
    );
    SharedPreferencesService.saveData(
      key: SharedPrefsKeys.selectedDevice,
      value: selectedDevice,
    );
  }
}
