import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_storage_info_method_channel.dart';

abstract class FlutterStorageInfoPlatform extends PlatformInterface {
  /// Constructs a FlutterStorageInfoPlatform.
  FlutterStorageInfoPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterStorageInfoPlatform _instance =
      MethodChannelFlutterStorageInfo();

  /// The default instance of [FlutterStorageInfoPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterStorageInfo].
  static FlutterStorageInfoPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterStorageInfoPlatform] when
  /// they register themselves.
  static set instance(FlutterStorageInfoPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<int?> getStorageFreeSpace() {
    throw UnimplementedError('getStorageFreeSpace() has not been implemented.');
  }

  Future<int?> getStorageUsedSpace() {
    throw UnimplementedError('getStorageUsedSpace() has not been implemented.');
  }

  Future<int?> getStorageTotalSpace() {
    throw UnimplementedError(
        'getStorageTotalSpace() has not been implemented.');
  }

  Future<int?> getExternalStorageTotalSpace() {
    throw UnimplementedError(
        'getExternalStorageTotalSpace() has not been implemented.');
  }

  Future<int?> getExternalStorageFreeSpace() {
    throw UnimplementedError(
        'getExternalStorageFreeSpace() has not been implemented.');
  }

  Future<int?> getExternalStorageUsedSpace() {
    throw UnimplementedError(
        'getExternalStorageUsedSpace() has not been implemented.');
  }

  Future<double?> getStorageFreeSpaceInMB() {
    throw UnimplementedError(
        'getStorageFreeSpaceInMB() has not been implemented.');
  }

  Future<double?> getStorageUsedSpaceInMB() {
    throw UnimplementedError(
        'getStorageUsedSpaceInMB() has not been implemented.');
  }

  Future<double?> getStorageTotalSpaceInMB() {
    throw UnimplementedError(
        'getStorageTotalSpaceInMB() has not been implemented.');
  }

  Future<double?> getStorageFreeSpaceInGB() {
    throw UnimplementedError(
        'getStorageFreeSpaceInGB() has not been implemented.');
  }

  Future<double?> getStorageUsedSpaceInGB() {
    throw UnimplementedError(
        'getStorageUsedSpaceInGB() has not been implemented.');
  }

  Future<double?> getStorageTotalSpaceInGB() {
    throw UnimplementedError(
        'getStorageTotalSpaceInGB() has not been implemented.');
  }

  Future<double?> getExternalStorageTotalSpaceInMB() {
    throw UnimplementedError(
        'getExternalStorageTotalSpaceInMB() has not been implemented.');
  }

  Future<double?> getExternalStorageFreeSpaceInMB() {
    throw UnimplementedError(
        'getExternalStorageFreeSpaceInMB() has not been implemented.');
  }

  Future<double?> getExternalStorageUsedSpaceInMB() {
    throw UnimplementedError(
        'getExternalStorageUsedSpaceInMB() has not been implemented.');
  }

  Future<double?> getExternalStorageTotalSpaceInGB() {
    throw UnimplementedError(
        'getExternalStorageTotalSpaceInGB() has not been implemented.');
  }

  Future<double?> getExternalStorageFreeSpaceInGB() {
    throw UnimplementedError(
        'getExternalStorageFreeSpaceInGB() has not been implemented.');
  }

  Future<double?> getExternalStorageUsedSpaceInGB() {
    throw UnimplementedError(
        'getExternalStorageUsedSpaceInGB() has not been implemented.');
  }
}
