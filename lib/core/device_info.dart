import 'dart:io';

import 'package:moyu_app/models/device_info.dart';
import 'package:moyu_app/models/system.dart';

final DeviceInfo _deviceInfo = DeviceInfo();
DeviceInfo get deviceInfo => _deviceInfo;

Future<void> initPlatformState() async {
  if (Platform.isWindows) {
    _deviceInfo.setOs(System.windows);
  } else if (Platform.isLinux) {
    _deviceInfo.setOs(System.linux);
  } else if (Platform.isMacOS) {
    _deviceInfo.setOs(System.macos);
  } else if (Platform.isIOS) {
    _deviceInfo.setOs(System.ios);
  } else if (Platform.isAndroid) {
    _deviceInfo.setOs(System.android);
  }
}
