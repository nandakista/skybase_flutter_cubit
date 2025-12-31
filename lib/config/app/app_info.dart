import 'package:package_info_plus/package_info_plus.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
class AppInfo {
  static late PackageInfo packageInfo;

  static Future<void> init() async {
    packageInfo = await PackageInfo.fromPlatform();
  }

  static String appVersion = AppInfo.packageInfo.version;
  static String buildNumber = AppInfo.packageInfo.buildNumber;
  static String packageName = AppInfo.packageInfo.packageName;
}
