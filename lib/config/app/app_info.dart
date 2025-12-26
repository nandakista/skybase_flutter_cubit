import 'package:package_info_plus/package_info_plus.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
class AppInfo {
  static late PackageInfo packageInfo;

  static void setInfo(PackageInfo info) {
    packageInfo = info;
  }

  static String appVersion = AppInfo.packageInfo.version;
  static String buildNumber = AppInfo.packageInfo.buildNumber;
  static String packageName = AppInfo.packageInfo.packageName;
}
