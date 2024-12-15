
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
  late Animation<double> _animation;

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
      duration: const Duration(seconds: 5),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });

    _animationController.forward();
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer to prevent memory leaks
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _fetchStorageInfo() async {
    try {
      // Internal Storage Info
      _internalStorageFreeSpace =
      (await FlutterStorageInfo.storageFreeSpace / (1024 * 1024 * 1024));
      _internalStorageUsedSpace =
          (await FlutterStorageInfo.storageUsedSpace) / (1024 * 1024 * 1024);
      _internalStorageTotalSpace =
          (await FlutterStorageInfo.storageTotalSpace) / (1024 * 1024 * 1024);

      // External Storage Info
      _externalStorageFreeSpace =
          (await FlutterStorageInfo.externalStorageFreeSpace) / (1024 * 1024 * 1024);
      _externalStorageUsedSpace =
          (await FlutterStorageInfo.externalStorageUsedSpace) / (1024 * 1024 * 1024);
      _externalStorageTotalSpace =
          (await FlutterStorageInfo.externalStorageTotalSpace) / (1024 * 1024 * 1024);

      // Update the UI with the new data
      setState(() {});
    } catch (e) {
      debugPrint("Error fetching storage info: $e");
    }
  }

  String _formatSpace(double space) {
    if (space < 1) {
      return "${(space * 1024).toStringAsFixed(2)} MB";
    } else {
      return "${space.toStringAsFixed(2)} GB";
    }
  }

  Color _getSpaceColor(double freeSpace) {
    // add colors to all the possible states
    if (freeSpace > 10) {
      return Colors.green;
    } else if (freeSpace > 5) {
      return Colors.orange;
    } else {
      return Colors.red;
    }

  }

  Widget _buildStorageSection({
    required String title,
    required double freeSpace,
    required double usedSpace,
    required double totalSpace,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        CircularProgressIndicator(
          value: totalSpace > 0 ? usedSpace / totalSpace * _animation.value : 0,
          valueColor: AlwaysStoppedAnimation<Color>(_getSpaceColor(freeSpace)),
          backgroundColor: Colors.grey[300],
          strokeWidth: 15,
        ),
        const SizedBox(height: 10),
        Text(
          'Free: ${_formatSpace(freeSpace * _animation.value)}',
          style: TextStyle(
            color: _getSpaceColor(freeSpace),
            fontSize: 18,
          ),
        ),
        Text(
          'Used: ${_formatSpace(usedSpace * _animation.value)}',
          style: const TextStyle(fontSize: 18),
        ),
        Text(
          'Total: ${_formatSpace(totalSpace * _animation.value)}',
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Storage Info',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF292F2F),
      ),
      body:  Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildStorageSection(
                    title: 'Internal Storage',
                    freeSpace: _internalStorageFreeSpace,
                    usedSpace: _internalStorageUsedSpace,
                    totalSpace: _internalStorageTotalSpace,
                  ),
                  const SizedBox(height: 30),
                  _buildStorageSection(
                    title: 'External Storage',
                    freeSpace: _externalStorageFreeSpace,
                    usedSpace: _externalStorageUsedSpace,
                    totalSpace: _externalStorageTotalSpace,
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      _fetchStorageInfo();
                      _animationController.reset();
                      _animationController.forward();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                    // if the animation is not completed, show a loading indicator
                    child: Visibility(
                      visible: _animationController.status != AnimationStatus.completed,
                      replacement: const Text('Refresh'
                    ),
                      child: const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
