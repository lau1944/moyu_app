import 'package:flutter/material.dart';
import 'package:moyu_app/core/device_info.dart';
import 'moyu_app.dart';

void main() async {
  // check system os
  await initPlatformState();

  runApp(const MoyuApp());
}
