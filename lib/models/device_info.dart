import 'system.dart';

// 设备详情
// @param os - 设备os
class DeviceInfo {
  final String? name;
  System os;

  DeviceInfo({this.os = System.windows, this.name});

  void setOs(System system) {
    os = system;
  }
}
