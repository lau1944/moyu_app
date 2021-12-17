import 'package:flutter/material.dart';
import 'package:moyu_app/core/device_info.dart';
import 'package:moyu_app/services/local.dart';
import 'moyu_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // check system os
  await initPlatformState();
  // init local settings
  await initSettings();

  runApp(const MoyuApp());
}
