// 本地设置
// [timer] 摸鱼倒计时 单位seconds (默认15分钟)
// [exitKey] 退出摸鱼模式按键
class LocalSettings {
  int? timer;
  String? errorKey;

  LocalSettings({this.timer, this.errorKey}) {
    timer ??= 35 * 60;
    errorKey ??= 'esc';
  }
}
