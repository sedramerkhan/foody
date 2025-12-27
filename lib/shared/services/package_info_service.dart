import 'package:package_info_plus/package_info_plus.dart';

/// Need package_info_plus Package to import
class PackageInfoService {
  static late PackageInfo packageInfo;

  ///initialize the package to get info
  static Future<void> init() async {
    packageInfo = await PackageInfo.fromPlatform();
  }

  ///get the  number of build
  static String getVersionNumber() {
    return "${packageInfo.version}+${packageInfo.buildNumber}";
  }
}
