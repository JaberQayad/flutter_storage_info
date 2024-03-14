import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_storage_info/flutter_storage_info_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelFlutterStorageInfo platform = MethodChannelFlutterStorageInfo();
  const MethodChannel channel = MethodChannel('flutter_storage_info');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });

  test('getStorageFreeSpace', () async {
    expect(await platform.getStorageFreeSpace(), 42);
  });

  test('getStorageUsedSpace', () async {
    expect(await platform.getStorageUsedSpace(), 42);
  });

  test('getStorageTotalSpace', () async {
    expect(await platform.getStorageTotalSpace(), 42);
  });

  test('getExternalStorageTotalSpace', () async {
    expect(await platform.getExternalStorageTotalSpace(), 42);
  });

  test('getExternalStorageFreeSpace', () async {
    expect(await platform.getExternalStorageFreeSpace(), 42);
  });

  test('getExternalStorageUsedSpace', () async {
    expect(await platform.getExternalStorageUsedSpace(), 42);
  });

  test('getStorageFreeSpaceInMB', () async {
    expect(await platform.getStorageFreeSpaceInMB(), 42);
  });

  test('getStorageUsedSpaceInMB', () async {
    expect(await platform.getStorageUsedSpaceInMB(), 42);
  });

  test('getStorageTotalSpaceInMB', () async {
    expect(await platform.getStorageTotalSpaceInMB(), 42);
  });

  test('getStorageFreeSpaceInGB', () async {
    expect(await platform.getStorageFreeSpaceInGB(), 42);
  });

  test('getStorageUsedSpaceInGB', () async {
    expect(await platform.getStorageUsedSpaceInGB(), 42);
  });

  test('getStorageTotalSpaceInGB', () async {
    expect(await platform.getStorageTotalSpaceInGB(), 42);
  });

  test('getExternalStorageTotalSpaceInMB', () async {
    expect(await platform.getExternalStorageTotalSpaceInMB(), 42);
  });

  test('getExternalStorageFreeSpaceInMB', () async {
    expect(await platform.getExternalStorageFreeSpaceInMB(), 42);
  });

  test('getExternalStorageTotalSpaceInGB', () async {
    expect(await platform.getExternalStorageTotalSpaceInGB(), 42);
  });

  test('getExternalStorageUsedSpaceInGB', () async {
    expect(await platform.getExternalStorageUsedSpaceInGB(), 42);
  });

  test('getExternalStorageFreeSpaceInGB', () async {
    expect(await platform.getExternalStorageFreeSpaceInGB(), 42);
  });
}
