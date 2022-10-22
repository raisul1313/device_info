import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';

class DeviceInfoApi {
  static final _deviceInfoPlugin = DeviceInfoPlugin();

/*  static Future<String> getPhoneManufacturerInfo() async {
    if (Platform.isAndroid) {
      final androidInfo = await _deviceInfoPlugin.androidInfo;
      return androidInfo.manufacturer;
    } else if (Platform.isIOS) {
      final iosInfo = await _deviceInfoPlugin.iosInfo;
      return '${iosInfo.name}';
    } else {
      throw UnimplementedError();
    }
  }

  static Future<String> getPhoneModelInfo() async {
    if (Platform.isAndroid) {
      final androidInfo = await _deviceInfoPlugin.androidInfo;
      return androidInfo.model;
    } else if (Platform.isIOS) {
      final iosInfo = await _deviceInfoPlugin.iosInfo;
      return '${iosInfo.model}';
    } else {
      throw UnimplementedError();
    }
  }

  static Future<String> getPhoneBrandInfo() async {
    if (Platform.isAndroid) {
      final androidInfo = await _deviceInfoPlugin.androidInfo;
      return androidInfo.brand;
    } else if (Platform.isIOS) {
      final iosInfo = await _deviceInfoPlugin.iosInfo;
      return '${iosInfo.model}';
    } else {
      throw UnimplementedError();
    }
  }*/

  static Future<Map<String, dynamic>> getDeviceInfo() async {
    try {
      if (Platform.isAndroid) {
        final info = await _deviceInfoPlugin.androidInfo;
        return _readAndroidBuildData(info);
      } else if (Platform.isIOS) {
        final info = await _deviceInfoPlugin.iosInfo;
        return _readIosDeviceInfo(info);
      } else {
        throw UnimplementedError();
      }
    } on PlatformException {
      return <String, dynamic>{"Error": 'Failed to get platform version'};
    }
  }

  static Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo androidDeviceInfo) =>
      <String, dynamic>{
        'Model': androidDeviceInfo.model,
        'Device:': androidDeviceInfo.device,
        'Manufacturer:': androidDeviceInfo.manufacturer,
        'Brand:': androidDeviceInfo.brand,
        'Android Version:': androidDeviceInfo.version.release,
        'Api Version:': androidDeviceInfo.version.sdkInt,

        /*'device': androidDeviceInfo.device,
        'brand': androidDeviceInfo.brand,
        'isPhysicalDevice': androidDeviceInfo.isPhysicalDevice,
        'version.sdkInt': androidDeviceInfo.version.sdkInt,
        'manufacturer': androidDeviceInfo.manufacturer,
        'model': androidDeviceInfo.model,
        '': '',
        ' ': '',
        'version.securityPatch': androidDeviceInfo.version.securityPatch,
        'version.release': androidDeviceInfo.version.release,
        'version.previewSdkInt': androidDeviceInfo.version.previewSdkInt,
        'version.incremental': androidDeviceInfo.version.incremental,
        'version.codename': androidDeviceInfo.version.codename,
        'version.baseOS': androidDeviceInfo.version.baseOS,
        'board': androidDeviceInfo.board,
        'bootloader': androidDeviceInfo.bootloader,
        'display': androidDeviceInfo.display,
        'fingerprint': androidDeviceInfo.fingerprint,
        'hardware': androidDeviceInfo.hardware,
        'host': androidDeviceInfo.host,
        'id': androidDeviceInfo.id,
        'product': androidDeviceInfo.product,
        'supported32BitAbis': androidDeviceInfo.supported32BitAbis,
        'supported64BitAbis': androidDeviceInfo.supported64BitAbis,
        'supportedAbis': androidDeviceInfo.supportedAbis,
        'tags': androidDeviceInfo.tags,
        'type': androidDeviceInfo.type,
        //'androidId': androidDeviceInfo.androidId,
        'systemFeatures': androidDeviceInfo.systemFeatures,*/
      };

  static Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo iosDeviceInfo) =>
      <String, dynamic>{
        'Name:': iosDeviceInfo.name,
        'SystemName:': iosDeviceInfo.systemName,
        'SystemVersion:': iosDeviceInfo.systemVersion,
        'Model:': iosDeviceInfo.model,

        /*'name': info.name,
        'systemName': info.systemName,
        'systemVersion': info.systemVersion,
        'model': info.model,
        'localizedModel': info.localizedModel,
        'identifierForVendor': info.identifierForVendor,
        'isPhysicalDevice': info.isPhysicalDevice,
        'utsname.sysname:': info.utsname.sysname,
        'utsname.nodename:': info.utsname.nodename,
        'utsname.release:': info.utsname.release,
        'utsname.version:': info.utsname.version,
        'utsname.machine:': info.utsname.machine,*/
      };
}
