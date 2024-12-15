import 'dart:async';
import 'package:flutter/services.dart';

/// A class providing methods to retrieve and manage storage information.
class FlutterStorageInfo {
  static const MethodChannel _channel = MethodChannel('flutter_storage_info');

  /// Retrieves the amount of free space in internal storage in bytes.
  static Future<int> get storageFreeSpace async {
    return await _channel.invokeMethod<int>('getStorageFreeSpace') ?? 0;
  }

  /// Retrieves the total space in internal storage in bytes.
  static Future<int> get storageTotalSpace async {
    return await _channel.invokeMethod<int>('getStorageTotalSpace') ?? 0;
  }

  /// Retrieves the used space in internal storage in bytes.
  static Future<int> get storageUsedSpace async {
    return await _channel.invokeMethod<int>('getStorageUsedSpace') ?? 0;
  }

  /// Retrieves the total space in external storage in bytes.
  static Future<int> get externalStorageTotalSpace async {
    return await _channel.invokeMethod<int>('getExternalStorageTotalSpace') ?? 0;
  }

  /// Retrieves the amount of free space in external storage in bytes.
  static Future<int> get externalStorageFreeSpace async {
    return await _channel.invokeMethod<int>('getExternalStorageFreeSpace') ?? 0;
  }

  /// Retrieves the used space in external storage in bytes.
  static Future<int> get externalStorageUsedSpace async {
    return await _channel.invokeMethod<int>('getExternalStorageUsedSpace') ?? 0;
  }

  /// Retrieves the specified storage space in megabytes (MB).
  static Future<double> getStorageSpaceInMB(String method) async {
    return await _channel.invokeMethod<double>(method) ?? 0.0;
  }

  /// Retrieves the specified storage space in gigabytes (GB).
  static Future<double> getStorageSpaceInGB(String method) async {
    return await _channel.invokeMethod<double>(method) ?? 0.0;
  }

  /// Retrieves the size of the specified [directory] in megabytes (MB).
  static Future<double> getSizeOfDirectoryInMB(String directory) async {
    return await _channel.invokeMethod<double>('getSizeOfDirectoryInMB', {
      'directory': directory,
    }) ??
        0.0;
  }

  /// Determines the storage type based on the provided [path].
  static DeviceStorageType getStorageTypeFromPath(String path) {
    return path.startsWith('/storage/emulated/0')
        ? DeviceStorageType.internal
        : DeviceStorageType.external;
  }

  /// Calculates the storage usage value based on used and total storage space.
  /// [storageUsed] and [storageTotal] should be in gigabytes (GB).
  static double calculateStorageUsage(double storageUsed, double storageTotal) {
    if (storageTotal <= 0) {
      throw Exception('Total storage must be greater than zero.');
    }
    return storageUsed / storageTotal;
  }

  /// Checks if the storage usage is below the specified threshold.
  static Future<bool> isLowOnStorage(DeviceStorageType storageType,
      {double threshold = 0.98}) async {
    if (threshold <= 0.0 || threshold > 1.0) {
      throw Exception('Threshold must be between 0.0 and 1.0.');
    }

    double storageTotal;
    double storageUsed;

    if (storageType == DeviceStorageType.internal) {
      storageTotal = await getStorageSpaceInGB('getStorageTotalSpaceInGB');
      storageUsed = await getStorageSpaceInGB('getStorageUsedSpaceInGB');
    } else {
      storageTotal = await getStorageSpaceInGB('getExternalStorageTotalSpaceInGB');
      storageUsed = await getStorageSpaceInGB('getExternalStorageUsedSpaceInGB');
    }

    double usage = calculateStorageUsage(storageUsed, storageTotal);
    return usage >= threshold;
  }
}

/// Enumeration for device storage types.
enum DeviceStorageType {
  /// Internal storage.
  internal,

  /// External storage.
  external,
}
