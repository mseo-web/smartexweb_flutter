import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class PreferencesService {
  PreferencesService(this._sharedPreferences);

  static const String _useDarkModeKey = 'useDarkMode';
  // static const String _projectsKey = 'prefProjects';

  final SharedPreferences _sharedPreferences;

  set useDarkMode(bool useDarkMode) {
    _sharedPreferences.setBool(_useDarkModeKey, useDarkMode);
  }

  bool get useDarkMode => _sharedPreferences.getBool(_useDarkModeKey) ?? false;

  // metods
  save(_prefKey, value) async {
    _sharedPreferences.setString(_prefKey, value);
  }

  read(_prefKey) async {
    return _sharedPreferences.getString(_prefKey);
  }

  remove(_prefKey) async {
    _sharedPreferences.remove(_prefKey);
  }

  // OBJECTS metods
  saveObject(_objectKey, value) async {
    _sharedPreferences.setString(_objectKey, json.encode(value));
  }

  readObject(_objectKey) async {
    return json.decode(_sharedPreferences.getString(_objectKey));
  }

  removeObject(_objectKey) async {
    _sharedPreferences.remove(_objectKey);
  }
}
