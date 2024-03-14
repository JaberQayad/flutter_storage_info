# Flutter Storage Info

A Flutter plugin to retrieve information about device storage.

This plugin provides methods to get information about both internal and external storage space on an Android device.

## Usage 

To use this plugin, add `flutter_storage_info` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

```yaml
dependencies:
  flutter_storage_info: ^0.0.1
```

```dart
import 'package:flutter_storage_info/flutter_storage_info.dart';
```

## Example

```dart
import 'package:flutter_storage_info/flutter_storage_info.dart';

void main() async {
  // Get storage info
  final flutterStorageInfo = FlutterStorageInfo();
    final storageInfo = await flutterStorageInfo.getTotalDiskSpace;
    final freeStorageInfo = await flutterStorageInfo.getFreeDiskSpace;
    final usedStorageInfo = await flutterStorageInfo.getUsedDiskSpace;
    print('Total storage: $storageInfo'); // returns storage in bytes
    print('Free storage: $freeStorageInfo'); // returns storage in bytes
    print('Used storage: $usedStorageInfo'); // returns storage in bytes
}
```

### Supported Platforms
- Android (✅)
- iOS (🕑)
- Linux (❌)
- macOS (❌)
- Windows (❌)

## Method available
- getFreeDiskSpace
- getTotalDiskSpace
- getUsedDiskSpace
- getFreeDiskSpaceInGB
- getTotalDiskSpaceInGB
- getUsedDiskSpaceInGB
- getFreeDiskSpaceInMB
- getTotalDiskSpaceInMB
- getUsedDiskSpaceInMB
- getFreeExternalDiskSpace
- getTotalExternalDiskSpace
- getUsedExternalDiskSpace
- getFreeExternalDiskSpaceInGB
- getTotalExternalDiskSpaceInGB
- getUsedExternalDiskSpaceInGB
- getFreeExternalDiskSpaceInMB
- getTotalExternalDiskSpaceInMB
- getUsedExternalDiskSpaceInMB



![Screenshot](example/screenshot/Screenshot.png)

## Permissions

### Android
Add the following permissions to your AndroidManifest.xml file:

```xml
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
```



## Issues and feedback

Please file [issues] to send feedback or report a bug. Thank you!


