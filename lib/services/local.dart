import 'package:moyu_app/models/local_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: prefer_typing_uninitialized_variables
late final _settings;
LocalSettings get settings => _settings;

Future<void> initSettings() async {
  final preferences = await _initLocalCache();
  _settings = LocalSettings(
      timer: preferences.getInt('timer'),
      errorKey: preferences.getString("exit_key"));
}

Future<SharedPreferences> _initLocalCache() async {
  return await SharedPreferences.getInstance();
}
