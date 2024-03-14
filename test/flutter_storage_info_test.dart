import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_storage_info/flutter_storage_info.dart';
import 'package:flutter_storage_info/flutter_storage_info_platform_interface.dart';
import 'package:flutter_storage_info/flutter_storage_info_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterStorageInfoPlatform
    with MockPlatformInterfaceMixin
    implements FlutterStorageInfoPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<int?> getStorageFreeSpace() => Future.value(42);

  @override
  Future<int?> getStorageUsedSpace() => Future.value(42);

  @override
  Future<int?> getStorageTotalSpace() => Future.value(42);

  @override
  Future<int?> getExternalStorageTotalSpace() => Future.value(42);

  @override
  Future<int?> getExternalStorageFreeSpace() => Future.value(42);

  @override
  Future<int?> getExternalStorageUsedSpace() => Future.value(42);
  @override
  Future<double?> getStorageFreeSpaceInMB() => Future.value(42.0);

  @override
  Future<double?> getStorageUsedSpaceInMB() => Future.value(42.0);

  @override
  Future<double?> getStorageTotalSpaceInMB() => Future.value(42.0);

  @override
  Future<double?> getExternalStorageTotalSpaceInMB() => Future.value(42.0);

  @override
  Future<double?> getExternalStorageFreeSpaceInMB() => Future.value(42.0);

  @override
  Future<double?> getExternalStorageUsedSpaceInMB() => Future.value(42.0);

  @override
  Future<double?> getStorageFreeSpaceInGB() => Future.value(42.0);

  @override
  Future<double?> getStorageUsedSpaceInGB() => Future.value(42.0);

  @override
  Future<double?> getStorageTotalSpaceInGB() => Future.value(42.0);

  @override
  Future<double?> getExternalStorageTotalSpaceInGB() => Future.value(42.0);

  @override
  Future<double?> getExternalStorageFreeSpaceInGB() => Future.value(42.0);

  @override
  Future<double?> getExternalStorageUsedSpaceInGB() => Future.value(42.0);
}

void main() {
  final FlutterStorageInfoPlatform initialPlatform =
      FlutterStorageInfoPlatform.instance;

  test('$MethodChannelFlutterStorageInfo is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterStorageInfo>());
  });

  test('getPlatformVersion', () async {
    FlutterStorageInfo flutterStorageInfoPlugin = FlutterStorageInfo();
    MockFlutterStorageInfoPlatform fakePlatform =
        MockFlutterStorageInfoPlatform();
    FlutterStorageInfoPlatform.instance = fakePlatform;

    expect(await flutterStorageInfoPlugin.getPlatformVersion(), 42);
  });
  test('getStorageFreeSpace', () async {
    FlutterStorageInfo flutterStorageInfoPlugin = FlutterStorageInfo();
    MockFlutterStorageInfoPlatform fakePlatform =
        MockFlutterStorageInfoPlatform();
    FlutterStorageInfoPlatform.instance = fakePlatform;

    expect(await flutterStorageInfoPlugin.getStorageFreeSpace(), 42);
  });

  test('getStorageUsedSpace', () async {
    FlutterStorageInfo flutterStorageInfoPlugin = FlutterStorageInfo();
    MockFlutterStorageInfoPlatform fakePlatform =
        MockFlutterStorageInfoPlatform();
    FlutterStorageInfoPlatform.instance = fakePlatform;

    expect(await flutterStorageInfoPlugin.getStorageUsedSpace(), 42);
  });

  test('getStorageTotalSpace', () async {
    FlutterStorageInfo flutterStorageInfoPlugin = FlutterStorageInfo();
    MockFlutterStorageInfoPlatform fakePlatform =
        MockFlutterStorageInfoPlatform();
    FlutterStorageInfoPlatform.instance = fakePlatform;

    expect(await flutterStorageInfoPlugin.getStorageTotalSpace(), 42);
  });

  test('getExternalStorageTotalSpace', () async {
    FlutterStorageInfo flutterStorageInfoPlugin = FlutterStorageInfo();
    MockFlutterStorageInfoPlatform fakePlatform =
        MockFlutterStorageInfoPlatform();
    FlutterStorageInfoPlatform.instance = fakePlatform;

    expect(await flutterStorageInfoPlugin.getExternalStorageTotalSpace(), 42);
  });

  test('getExternalStorageFreeSpace', () async {
    FlutterStorageInfo flutterStorageInfoPlugin = FlutterStorageInfo();
    MockFlutterStorageInfoPlatform fakePlatform =
        MockFlutterStorageInfoPlatform();
    FlutterStorageInfoPlatform.instance = fakePlatform;

    expect(await flutterStorageInfoPlugin.getExternalStorageFreeSpace(), 42);
  });

  test('getExternalStorageUsedSpace', () async {
    FlutterStorageInfo flutterStorageInfoPlugin = FlutterStorageInfo();
    MockFlutterStorageInfoPlatform fakePlatform =
        MockFlutterStorageInfoPlatform();
    FlutterStorageInfoPlatform.instance = fakePlatform;

    expect(await flutterStorageInfoPlugin.getExternalStorageUsedSpace(), 42);
  });

  test('getStorageFreeSpaceInMB', () async {
    FlutterStorageInfo flutterStorageInfoPlugin = FlutterStorageInfo();
    MockFlutterStorageInfoPlatform fakePlatform =
        MockFlutterStorageInfoPlatform();
    FlutterStorageInfoPlatform.instance = fakePlatform;

    expect(await flutterStorageInfoPlugin.getStorageFreeSpaceInMB(), 42.0);
  });

  test('getStorageUsedSpaceInMB', () async {
    FlutterStorageInfo flutterStorageInfoPlugin = FlutterStorageInfo();
    MockFlutterStorageInfoPlatform fakePlatform =
        MockFlutterStorageInfoPlatform();
    FlutterStorageInfoPlatform.instance = fakePlatform;

    expect(await flutterStorageInfoPlugin.getStorageUsedSpaceInMB(), 42.0);
  });

  test('getStorageTotalSpaceInMB', () async {
    FlutterStorageInfo flutterStorageInfoPlugin = FlutterStorageInfo();
    MockFlutterStorageInfoPlatform fakePlatform =
        MockFlutterStorageInfoPlatform();
    FlutterStorageInfoPlatform.instance = fakePlatform;

    expect(await flutterStorageInfoPlugin.getStorageTotalSpaceInMB(), 42.0);
  });

  test('getStorageFreeSpaceInGB', () async {
    FlutterStorageInfo flutterStorageInfoPlugin = FlutterStorageInfo();
    MockFlutterStorageInfoPlatform fakePlatform =
        MockFlutterStorageInfoPlatform();
    FlutterStorageInfoPlatform.instance = fakePlatform;

    expect(await flutterStorageInfoPlugin.getStorageFreeSpaceInGB(), 42.0);
  });

  test('getStorageUsedSpaceInGB', () async {
    FlutterStorageInfo flutterStorageInfoPlugin = FlutterStorageInfo();
    MockFlutterStorageInfoPlatform fakePlatform =
        MockFlutterStorageInfoPlatform();
    FlutterStorageInfoPlatform.instance = fakePlatform;

    expect(await flutterStorageInfoPlugin.getStorageUsedSpaceInGB(), 42.0);
  });

  test('getStorageTotalSpaceInGB', () async {
    FlutterStorageInfo flutterStorageInfoPlugin = FlutterStorageInfo();
    MockFlutterStorageInfoPlatform fakePlatform =
        MockFlutterStorageInfoPlatform();
    FlutterStorageInfoPlatform.instance = fakePlatform;

    expect(await flutterStorageInfoPlugin.getStorageTotalSpaceInGB(), 42.0);
  });

  test('getExternalStorageTotalSpaceInMB', () async {
    FlutterStorageInfo flutterStorageInfoPlugin = FlutterStorageInfo();
    MockFlutterStorageInfoPlatform fakePlatform =
        MockFlutterStorageInfoPlatform();
    FlutterStorageInfoPlatform.instance = fakePlatform;

    expect(await flutterStorageInfoPlugin.getExternalStorageTotalSpaceInMB(),
        42.0);
  });

  test('getExternalStorageFreeSpaceInMB', () async {
    FlutterStorageInfo flutterStorageInfoPlugin = FlutterStorageInfo();
    MockFlutterStorageInfoPlatform fakePlatform =
        MockFlutterStorageInfoPlatform();
    FlutterStorageInfoPlatform.instance = fakePlatform;

    expect(
        await flutterStorageInfoPlugin.getExternalStorageFreeSpaceInMB(), 42.0);
  });

  test('getExternalStorageTotalSpaceInMB', () async {
    FlutterStorageInfo flutterStorageInfoPlugin = FlutterStorageInfo();
    MockFlutterStorageInfoPlatform fakePlatform =
        MockFlutterStorageInfoPlatform();
    FlutterStorageInfoPlatform.instance = fakePlatform;

    expect(await flutterStorageInfoPlugin.getExternalStorageTotalSpaceInGB(),
        42.0);
  });

  test('getExternalStorageUsedSpaceInGB', () async {
    FlutterStorageInfo flutterStorageInfoPlugin = FlutterStorageInfo();
    MockFlutterStorageInfoPlatform fakePlatform =
        MockFlutterStorageInfoPlatform();
    FlutterStorageInfoPlatform.instance = fakePlatform;

    expect(
        await flutterStorageInfoPlugin.getExternalStorageUsedSpaceInGB(), 42.0);
  });

  test('getExternalStorageFreeSpaceInGB', () async {
    FlutterStorageInfo flutterStorageInfoPlugin = FlutterStorageInfo();
    MockFlutterStorageInfoPlatform fakePlatform =
        MockFlutterStorageInfoPlatform();
    FlutterStorageInfoPlatform.instance = fakePlatform;

    expect(
        await flutterStorageInfoPlugin.getExternalStorageFreeSpaceInGB(), 42.0);
  });

  tearDown(() {
    FlutterStorageInfoPlatform.instance = initialPlatform;
  });
}
