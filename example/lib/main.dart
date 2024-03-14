import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_storage_info/flutter_storage_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  late int _storageFreeSpace = 0;
  late int _storageUsedSpace = 0;
  late int _storageTotalSpace = 0;
  late final FlutterStorageInfo _flutterStorageInfo = FlutterStorageInfo();
  @override
  void initState() {
    super.initState();
    _initStorageInfo();
  }

  Future<void> _initStorageInfo() async {
    try {
      int? freeSpace = await _flutterStorageInfo.getStorageFreeSpace();
      int? usedSpace = await _flutterStorageInfo.getStorageUsedSpace();
      int? totalSpace = await _flutterStorageInfo.getStorageTotalSpace();

      setState(() {
        _storageFreeSpace = freeSpace ?? 0; // in bytes
        _storageUsedSpace = usedSpace ?? 0; // in bytes
        _storageTotalSpace = totalSpace ?? 0; // in bytes
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching storage info: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Storage Info Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Free Space: $_storageFreeSpace'),
            Text('Used Space: $_storageUsedSpace'),
            Text('Total Space: $_storageTotalSpace'),
          ],
        ),
      ),
    );
  }
}
