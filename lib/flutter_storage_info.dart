import 'dart:async';

import 'package:flutter/services.dart';


/// A class providing methods to retrieve storage information.
class FlutterStorageInfo {
  static const MethodChannel _channel = MethodChannel('flutter_storage_info');

  /// Retrieves the amount of free space in internal storage in bytes.
  static Future<int> get getStorageFreeSpace async {
    final int freeSpace = await _channel.invokeMethod('getStorageFreeSpace');
    return freeSpace;
  }

  /// Retrieves the total space in internal storage in bytes.
  static Future<int> get getStorageTotalSpace async {
    final int totalSpace = await _channel.invokeMethod('getStorageTotalSpace');
    return totalSpace;
  }

  /// Retrieves the used space in internal storage in bytes.
  static Future<int> get getStorageUsedSpace async {
    final int usedSpace = await _channel.invokeMethod('getStorageUsedSpace');
    return usedSpace;
  }

  /// Retrieves the total space in external storage in bytes.
  static Future<int> get getExternalStorageTotalSpace async {
    final int totalSpace =
    await _channel.invokeMethod('getExternalStorageTotalSpace');
    return totalSpace;
  }

  /// Retrieves the amount of free space in external storage in bytes.
  static Future<int> get getExternalStorageFreeSpace async {
    final int freeSpace =
    await _channel.invokeMethod('getExternalStorageFreeSpace');
    return freeSpace;
  }

  /// Retrieves the used space in external storage in bytes.
  static Future<int> get getExternalStorageUsedSpace async {
    final int usedSpace =
    await _channel.invokeMethod('getExternalStorageUsedSpace');
    return usedSpace;
  }

  /// Retrieves the amount of free space in internal storage in megabytes (MB).
  static Future<double> get getStorageFreeSpaceInMB async {
    final double freeSpace =
    await _channel.invokeMethod('getStorageFreeSpaceInMB');
    return freeSpace;
  }

  /// Retrieves the used space in internal storage in megabytes (MB).
  static Future<double> get getStorageUsedSpaceInMB async {
    final double usedSpace =
    await _channel.invokeMethod('getStorageUsedSpaceInMB');
    return usedSpace;
  }

  /// Retrieves the total space in internal storage in megabytes (MB).
  static Future<double> get getStorageTotalSpaceInMB async {
    final double totalSpace =
    await _channel.invokeMethod('getStorageTotalSpaceInMB');
    return totalSpace;
  }

  /// Retrieves the amount of free space in internal storage in gigabytes (GB).
  static Future<double> get getStorageFreeSpaceInGB async {
    final double freeSpace =
    await _channel.invokeMethod('getStorageFreeSpaceInGB');
    return freeSpace;
  }

  /// Retrieves the used space in internal storage in gigabytes (GB).
  static Future<double> get getStorageUsedSpaceInGB async {
    final double usedSpace =
    await _channel.invokeMethod('getStorageUsedSpaceInGB');
    return usedSpace;
  }

  /// Retrieves the total space in internal storage in gigabytes (GB).
  static Future<double> get getStorageTotalSpaceInGB async {
    final double totalSpace =
    await _channel.invokeMethod('getStorageTotalSpaceInGB');
    return totalSpace;
  }

  /// Retrieves the amount of free space in external storage in megabytes (MB).
  static Future<double> get getExternalStorageFreeSpaceInMB async {
    final double freeSpace =
    await _channel.invokeMethod('getExternalStorageFreeSpaceInMB');
    return freeSpace;
  }

  /// Retrieves the used space in external storage in megabytes (MB).
  static Future<double> get getExternalStorageUsedSpaceInMB async {
    final double usedSpace =
    await _channel.invokeMethod('getExternalStorageUsedSpaceInMB');
    return usedSpace;
  }

  /// Retrieves the total space in external storage in megabytes (MB).
  static Future<double> get getExternalStorageTotalSpaceInMB async {
    final double totalSpace =
    await _channel.invokeMethod('getExternalStorageTotalSpaceInMB');
    return totalSpace;
  }

  /// Retrieves the amount of free space in external storage in gigabytes (GB).
  static Future<double> get getExternalStorageFreeSpaceInGB async {
    final double freeSpace =
    await _channel.invokeMethod('getExternalStorageFreeSpaceInGB');
    return freeSpace;
  }

  /// Retrieves the used space in external storage in gigabytes (GB).
  static Future<double> get getExternalStorageUsedSpaceInGB async {
    final double usedSpace =
    await _channel.invokeMethod('getExternalStorageUsedSpaceInGB');
    return usedSpace;
  }

  /// Retrieves the total space in external storage in gigabytes (GB).
  static Future<double> get getExternalStorageTotalSpaceInGB async {
    final double totalSpace =
    await _channel.invokeMethod('getExternalStorageTotalSpaceInGB');
    return totalSpace;
  }

  /// Retrieves the size of the specified [directory] in megabytes (MB).
  static Future<double> getSizeOfDirectoryInMB(String directory) async {
    final double directorySize = await _channel
        .invokeMethod('getSizeOfDirectoryInMB', {'directory': directory});
    return directorySize;
  }

  /// Determines the storage type based on the provided [path].
  static DeviceStorageType getStorageTypeFromPath(String path) {
    // Checking if the path starts with internal storage path.
    return path.startsWith('/storage/emulated/0') == true
        ? DeviceStorageType.internal
        : DeviceStorageType.external;
  }

  /// Calculates the storage usage value based on used and total storage space.
  ///
  /// [storageUsed] and [storageTotal] should be in gigabytes (GB).
  static double getStorageUsageValue(double storageUsed, double storageTotal) {
    final double storageUsageValue =
    (((storageUsed / storageTotal) * 100.0) * 0.01);
    return storageUsageValue;
  }

  /// Checks if the storage usage is below the specified threshold.
  ///
  /// [storageUsageValue] represents the percentage of storage used.
  /// [threshold] is the threshold value, default is set to 0.98 (98%).
  static Future<bool> getIsLowOnStorage(DeviceStorageType storageType,
      {double threshold = 0.98}) async {
    double storageTotal = 0.0;
    double storageUsed = 0.0;
    if (storageType == DeviceStorageType.internal) {
      storageTotal = await FlutterStorageInfo.getStorageTotalSpaceInGB;
      storageUsed = await FlutterStorageInfo.getStorageUsedSpaceInGB;
    } else if (storageType == DeviceStorageType.external) {
      storageTotal = await FlutterStorageInfo.getExternalStorageTotalSpaceInGB;
      storageUsed = await FlutterStorageInfo.getExternalStorageUsedSpaceInGB;
    } else {
      throw Exception('storageType must be a value of DeviceStorageType');
    }

    double storageUsageValue = getStorageUsageValue(storageUsed, storageTotal);

    return getIsStorageBelowThreshold(storageUsageValue, threshold);
  }

  /// Checks if the storage usage is below the specified threshold.
  static bool getIsStorageBelowThreshold(
      double storageUsageValue, double threshold) {
    if (storageUsageValue <= 0.0 || storageUsageValue >= 1.0) {
      throw Exception(
          'storageUsageValue must be within the range of 0.0 and 1.0');
    }
    if (threshold <= 0.0 || threshold >= 1.0) {
      throw Exception('threshold must be within the range of 0.0 and 1.0');
    }

    return storageUsageValue >= threshold;
  }
}
/// Enumeration for device storage types.
enum DeviceStorageType {
  /// Internal storage.
  internal,

  /// External storage.
  external,
}