import 'flutter_storage_info_platform_interface.dart';

class FlutterStorageInfo {
  Future<String?> getPlatformVersion() {
    return FlutterStorageInfoPlatform.instance.getPlatformVersion();
  }

  Future<int?> getStorageFreeSpace() {
    return FlutterStorageInfoPlatform.instance.getStorageFreeSpace();
  }

  Future<int?> getStorageUsedSpace() {
    return FlutterStorageInfoPlatform.instance.getStorageUsedSpace();
  }

  Future<int?> getStorageTotalSpace() {
    return FlutterStorageInfoPlatform.instance.getStorageTotalSpace();
  }

  Future<int?> getExternalStorageTotalSpace() {
    return FlutterStorageInfoPlatform.instance.getExternalStorageTotalSpace();
  }

  Future<int?> getExternalStorageFreeSpace() {
    return FlutterStorageInfoPlatform.instance.getExternalStorageFreeSpace();
  }

  Future<int?> getExternalStorageUsedSpace() {
    return FlutterStorageInfoPlatform.instance.getExternalStorageUsedSpace();
  }

  Future<double?> getStorageFreeSpaceInMB() {
    return FlutterStorageInfoPlatform.instance.getStorageFreeSpaceInMB();
  }

  Future<double?> getStorageUsedSpaceInMB() {
    return FlutterStorageInfoPlatform.instance.getStorageUsedSpaceInMB();
  }

  Future<double?> getStorageTotalSpaceInMB() {
    return FlutterStorageInfoPlatform.instance.getStorageTotalSpaceInMB();
  }

  Future<double?> getStorageFreeSpaceInGB() {
    return FlutterStorageInfoPlatform.instance.getStorageFreeSpaceInGB();
  }

  Future<double?> getStorageUsedSpaceInGB() {
    return FlutterStorageInfoPlatform.instance.getStorageUsedSpaceInGB();
  }

  Future<double?> getStorageTotalSpaceInGB() {
    return FlutterStorageInfoPlatform.instance.getStorageTotalSpaceInGB();
  }

  Future<double?> getExternalStorageTotalSpaceInMB() {
    return FlutterStorageInfoPlatform.instance
        .getExternalStorageTotalSpaceInMB();
  }

  Future<double?> getExternalStorageFreeSpaceInMB() {
    return FlutterStorageInfoPlatform.instance
        .getExternalStorageFreeSpaceInMB();
  }

  Future<double?> getExternalStorageUsedSpaceInMB() {
    return FlutterStorageInfoPlatform.instance
        .getExternalStorageUsedSpaceInMB();
  }

  Future<double?> getExternalStorageTotalSpaceInGB() {
    return FlutterStorageInfoPlatform.instance
        .getExternalStorageTotalSpaceInGB();
  }

  Future<double?> getExternalStorageFreeSpaceInGB() {
    return FlutterStorageInfoPlatform.instance
        .getExternalStorageFreeSpaceInGB();
  }

  Future<double?> getExternalStorageUsedSpaceInGB() {
    return FlutterStorageInfoPlatform.instance
        .getExternalStorageUsedSpaceInGB();
  }
}
