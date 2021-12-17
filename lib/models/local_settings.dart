// 本地设置
// [timer] 摸鱼倒计时 单位ms
// [exitKey] 退出摸鱼模式按键
class LocalSettings {
  int? timer;
  String? exitKey;

  LocalSettings({this.timer, this.exitKey}) {
    timer ??= 1200000;
    exitKey ??= 'esc';
  }
}
