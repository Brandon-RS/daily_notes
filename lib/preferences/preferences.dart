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
}
