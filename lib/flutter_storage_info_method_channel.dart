import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_storage_info_platform_interface.dart';

/// An implementation of [FlutterStorageInfoPlatform] that uses method channels.
class MethodChannelFlutterStorageInfo extends FlutterStorageInfoPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_storage_info');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<int?> getStorageFreeSpace() async {
    final freeSpace = await methodChannel.invokeMethod('getStorageFreeSpace');
    return freeSpace;
  }

  @override
  Future<int?> getStorageUsedSpace() async {
    final usedSpace = await methodChannel.invokeMethod('getStorageUsedSpace');
    return usedSpace;
  }

  @override
  Future<int?> getStorageTotalSpace() async {
    final totalSpace = await methodChannel.invokeMethod('getStorageTotalSpace');
    return totalSpace;
  }

  @override
  Future<int?> getExternalStorageTotalSpace() async {
    final totalSpace = await methodChannel.invokeMethod('getExternalStorageTotalSpace');
    return totalSpace;
  }

  @override
  Future<int?> getExternalStorageFreeSpace() async {
    final freeSpace = await methodChannel.invokeMethod('getExternalStorageFreeSpace');
    return freeSpace;
  }

  @override
  Future<int?> getExternalStorageUsedSpace() async {
    final usedSpace = await methodChannel.invokeMethod('getExternalStorageUsedSpace');
    return usedSpace;
  }

  @override
  Future<double?> getStorageFreeSpaceInMB() async {
    final freeSpace = await methodChannel.invokeMethod('getStorageFreeSpaceInMB');
    return freeSpace;
  }

  @override
  Future<double?> getStorageUsedSpaceInMB() async {
    final usedSpace = await methodChannel.invokeMethod('getStorageUsedSpaceInMB');
    return usedSpace;
  }

  @override
  Future<double?> getStorageTotalSpaceInMB() async {
    final totalSpace = await methodChannel.invokeMethod('getStorageTotalSpaceInMB');
    return totalSpace;
  }

  @override
  Future<double?> getStorageFreeSpaceInGB() async {
    final freeSpace = await methodChannel.invokeMethod('getStorageFreeSpaceInGB');
    return freeSpace;
  }

  @override
  Future<double?> getStorageUsedSpaceInGB() async {
    final usedSpace = await methodChannel.invokeMethod('getStorageUsedSpaceInGB');
    return usedSpace;
  }

  @override
  Future<double?> getStorageTotalSpaceInGB() async {
    final totalSpace = await methodChannel.invokeMethod('getStorageTotalSpaceInGB');
    return totalSpace;
  }

  @override
  Future<double?> getExternalStorageTotalSpaceInMB() async {
    final totalSpace = await methodChannel.invokeMethod('getExternalStorageTotalSpaceInMB');
    return totalSpace;
  }

  @override
  Future<double?> getExternalStorageFreeSpaceInMB() async {
    final freeSpace = await methodChannel.invokeMethod('getExternalStorageFreeSpaceInMB');
    return freeSpace;
  }

  @override
  Future<double?> getExternalStorageUsedSpaceInMB() async {
    final usedSpace = await methodChannel.invokeMethod('getExternalStorageUsedSpaceInMB');
    return usedSpace;
  }

  @override
  Future<double?> getExternalStorageTotalSpaceInGB() async {
    final totalSpace = await methodChannel.invokeMethod('getExternalStorageTotalSpaceInGB');
    return totalSpace;
  }

  @override
  Future<double?> getExternalStorageFreeSpaceInGB() async {
    final freeSpace = await methodChannel.invokeMethod('getExternalStorageFreeSpaceInGB');
    return freeSpace;
  }

  @override
  Future<double?> getExternalStorageUsedSpaceInGB() async {
    final usedSpace = await methodChannel.invokeMethod('getExternalStorageUsedSpaceInGB');
    return usedSpace;
  }

}
