enum System { windows, macos, android, ios, linux, unknown }

String translateSystem(System os) {
  switch (os) {
    case System.windows:
      {
        return "微软系统";
      }
    case System.macos:
      {
        return "MAC系统";
      }
    case System.linux:
      {
        return "LINUX系统";
      }
    case System.android:
      {
        return "安卓系统";
      }
    case System.ios:
      {
        return "iOS系统";
      }
    default:
      return "未知系统";
  }
}
