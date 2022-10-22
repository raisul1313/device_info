import 'dart:io';

import 'package:device_information/api/device_info_api.dart';
import 'package:device_information/api/package_info_api.dart';
import 'package:device_information/widget/info_widget.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Device Information',
      theme: ThemeData(),
      home: const DeviceInformation(),
    );
  }
}

class DeviceInformation extends StatefulWidget {
  const DeviceInformation({Key? key}) : super(key: key);

  @override
  State<DeviceInformation> createState() => _DeviceInformationState();
}

class _DeviceInformationState extends State<DeviceInformation> {
  Map<String, dynamic> allInformation = {};

  static final String title =
      '${Platform.isAndroid ? 'Android' : 'iOS'} Device Info';

  @override
  void initState() {
    init();
    super.initState();
  }

  Future init() async {
    final deviceInfo = await DeviceInfoApi.getDeviceInfo();
    final appInfo = await PackageInfoApi.getAppInfo();

    final newAllInformation = {
      ...deviceInfo,
      ...appInfo,
      //TODO imei, phone number
    };

    if (!mounted) return;
    setState(() => allInformation = newAllInformation);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: InfoWidget(map: allInformation,),
    );
  }
}
