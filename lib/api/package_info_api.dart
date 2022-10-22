import 'dart:io';

import 'package:package_info_plus/package_info_plus.dart';

class PackageInfoApi {
  static Future<Map<String, dynamic>> getAppInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final idName = Platform.isAndroid ? 'packageName' : 'bundleID';
    return <String, dynamic>{
      'App Name': packageInfo.appName,
      'App Version': packageInfo.version,
      'Build Number': packageInfo.buildNumber,
      idName: packageInfo.packageName,
    };
  }
}
