import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static const _onboarding = true;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get showOnboarding => _prefs.getBool('onboarding') ?? _onboarding;

  static set showOnboarding(bool value) {
    _prefs.setBool('onboarding', value);
  }

  String? get defaultFolderPath => _prefs.getString('defaultPath');

  /// Send a null or empty value to delete the [defaultPath] key
  set defaultFolderPath(String? newPath) {
    newPath != null
        ? _prefs.setString('defaultPath', newPath)
        : _prefs.remove('defaultPath');
  }
}
