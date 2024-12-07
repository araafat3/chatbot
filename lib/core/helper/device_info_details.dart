import 'dart:io';

import 'package:path_provider/path_provider.dart' as path;

class DeviceInfoDetails {
  static DeviceInfoDetails? _instance;

  DeviceInfoDetails._internal();

  factory DeviceInfoDetails() {
    return _instance ??= DeviceInfoDetails._internal();
  }

  late Directory appPath;

  bool isStoreGrid=true;
  bool isCouponGrid=true;

  Future<void> initPlatformState() async {
    List data = await Future.wait([
      path.getApplicationDocumentsDirectory(),
    ]);
    appPath = data[0];
  }

}