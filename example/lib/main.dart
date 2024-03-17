import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_storage_info/flutter_storage_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Storage Info Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const StorageInfoPage(),
    );
  }
}

class StorageInfoPage extends StatefulWidget {
  const StorageInfoPage({super.key});

  @override
  StorageInfoPageState createState() => StorageInfoPageState();
}

class StorageInfoPageState extends State<StorageInfoPage>
    with SingleTickerProviderStateMixin {
  double _internalStorageFreeSpace = 0.0;
  double _internalStorageUsedSpace = 0.0;
  double _internalStorageTotalSpace = 0.0;
  double _externalStorageFreeSpace = 0.0;
  double _externalStorageUsedSpace = 0.0;
  double _externalStorageTotalSpace = 0.0;

  late Timer _timer;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _fetchStorageInfo();

    // Set up a timer to refresh storage info every 5 seconds
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _fetchStorageInfo();
    });

    // Set up animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to prevent memory leaks
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _fetchStorageInfo() async {
    // Internal Storage Info
    _internalStorageFreeSpace =
        await FlutterStorageInfo.getStorageFreeSpaceInGB;
    _internalStorageUsedSpace =
        await FlutterStorageInfo.getStorageUsedSpaceInGB;
    _internalStorageTotalSpace =
        await FlutterStorageInfo.getStorageTotalSpaceInGB;

    // External Storage Info
    _externalStorageFreeSpace =
        await FlutterStorageInfo.getExternalStorageFreeSpaceInGB;
    _externalStorageUsedSpace =
        await FlutterStorageInfo.getExternalStorageUsedSpaceInGB;
    _externalStorageTotalSpace =
        await FlutterStorageInfo.getExternalStorageTotalSpaceInGB;

    setState(() {});
  }

  String _formatSpace(double space) {
    if (space < 1) {
      return "${(space * 1024).toStringAsFixed(2)} MB";
    } else {
      return "${space.toStringAsFixed(2)} GB";
    }
  }

  Color _getSpaceColor(double space) {
    // change the color every 50 MB
    if (space < 0.05) {
      return Colors.red;
    } else if (space < 0.1) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Storage Info Example',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF292F2F),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFFE0E0E0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Internal Storage',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              CircularProgressIndicator(
                value: _internalStorageTotalSpace > 0
                    ? _internalStorageUsedSpace / _internalStorageTotalSpace
                    : 0,
                valueColor: AlwaysStoppedAnimation<Color>(
                  _getSpaceColor(_internalStorageFreeSpace),
                ),
                backgroundColor: Colors.grey,
                strokeWidth: 10,
              ),
              const SizedBox(height: 10),
              Text(
                'Free: ${_formatSpace(_internalStorageFreeSpace)}',
                style: TextStyle(
                  color: _getSpaceColor(_internalStorageFreeSpace),
                  fontSize: 20,
                ),
              ),
              Text(
                'Used: ${_formatSpace(_internalStorageUsedSpace)}',
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                'Total: ${_formatSpace(_internalStorageTotalSpace)}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              const Text(
                'External Storage',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              CircularProgressIndicator(
                value: _externalStorageTotalSpace > 0
                    ? _externalStorageUsedSpace / _externalStorageTotalSpace
                    : 0,
                valueColor: AlwaysStoppedAnimation<Color>(
                  _getSpaceColor(_externalStorageFreeSpace),
                ),
                backgroundColor: Colors.grey,
                strokeWidth: 10,
              ),
              const SizedBox(height: 10),
              Text(
                'Free: ${_formatSpace(_externalStorageFreeSpace)}',
                style: TextStyle(
                  color: _getSpaceColor(_externalStorageFreeSpace),
                  fontSize: 20,
                ),
              ),
              Text(
                'Used: ${_formatSpace(_externalStorageUsedSpace)}',
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                'Total: ${_formatSpace(_externalStorageTotalSpace)}',
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
