# Flutter Storage Info

A Flutter plugin to retrieve information about device storage.

This plugin provides methods to get information about both internal and external storage space on an Android device.

## Usage 

To use this plugin, add `flutter_storage_info` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).


```yaml
dependencies:
  flutter_storage_info: ^0.0.5
```

```dart
import 'package:flutter_storage_info/flutter_storage_info.dart';
```

## Example

```dart
import 'package:flutter_storage_info/flutter_storage_info.dart';

void main() async {
  // Fetch the storage info
    final flutterStorageInfo = FlutterStorageInfo();
    double totalSpace = await flutterStorageInfo.getTotalDiskSpace;
    double freeSpace = await flutterStorageInfo.getFreeDiskSpace;
    double usedSpace = await flutterStorageInfo.getUsedDiskSpace;
    
    print('Total Space: $totalSpace');
    print('Free Space: $freeSpace');
    print('Used Space: $usedSpace');
    
}
```

## Methods 


- You can access all the methods using the `flutterStorageInfo` object as shown below:

```dart
final flutterStorageInfo = FlutterStorageInfo();
```


### Internal Storage (Device Storage)

- `getFreeDiskSpace`: Returns the amount of free space available on the device's internal storage.
- `getTotalDiskSpace`: Returns the total amount of space available on the device's internal storage.
- `getUsedDiskSpace`: Returns the amount of used space on the device's internal storage.
- `getFreeDiskSpaceInGB`: Returns the amount of free space available on the device's internal storage in gigabytes.
- `getTotalDiskSpaceInGB`: Returns the total amount of space available on the device's internal storage in gigabytes.
- `getUsedDiskSpaceInGB`: Returns the amount of used space on the device's internal storage in gigabytes.
- `getFreeDiskSpaceInMB`: Returns the amount of free space available on the device's internal storage in megabytes.
- `getTotalDiskSpaceInMB`: Returns the total amount of space available on the device's internal storage in megabytes.
- `getUsedDiskSpaceInMB`: Returns the amount of used space on the device's internal storage in megabytes.

### External Storage (SD Card)

- `getFreeExternalDiskSpace`: Returns the amount of free space available on the device's external storage.
- `getTotalExternalDiskSpace`: Returns the total amount of space available on the device's external storage.
- `getUsedExternalDiskSpace`: Returns the amount of used space on the device's external storage.
- `getFreeExternalDiskSpaceInGB`: Returns the amount of free space available on the device's external storage in gigabytes.
- `getTotalExternalDiskSpaceInGB`: Returns the total amount of space available on the device's external storage in gigabytes.
- `getUsedExternalDiskSpaceInGB`: Returns the amount of used space on the device's external storage in gigabytes.
- `getFreeExternalDiskSpaceInMB`: Returns the amount of free space available on the device's external storage in megabytes.
- `getTotalExternalDiskSpaceInMB`: Returns the total amount of space available on the device's external storage in megabytes.
- `getUsedExternalDiskSpaceInMB`: Returns the amount of used space on the device's external storage in megabytes.


#### Get the size of a given directory in MB (megabytes)

```dart
String directoryPath = '/storage/emulated/0/Movies/MyFolder/';
double directorySize = await FlutterStorageInfo.getSizeOfDirectoryInMB(directoryPath);
>> 12.98790
```

#### Get storage type from path (internal or external)

```dart
String path = '/storage/emulated/0/Android';
DeviceStorageType storageType = FlutterStorageInfo.getStorageTypeFromPath(path);
>> DeviceStorageType.internal
```

#### Get storage usage value from total and used space

Get a value from 0.0 to 1.0 indicating the storage usage given the total and used space.

```dart
double storageTotal = await FlutterStorageInfo.getExternalStorageTotalSpaceInGB;
double storageUsed = await FlutterStorageInfo.getExternalStorageUsedSpaceInGB;

double storageUsageValue = FlutterStorageInfo.getStorageUsageValue(storageUsed, storageTotal);
>> 0.95
```

#### Get whether - given the storage type - the storage is below the threshold

This method calls the above methods internally and returns a boolean value indicating whether the storage is below the threshold.

```dart
DeviceStorageType storageType = DeviceStorageType.internal;

// Optionally set the threshold. The default is 0.98 (98%)
double threshold = 0.96;

bool isBelowThreshold = FlutterStorageInfo.getIsStorageTypeBelowThreshold(storageType, threshold);
>> true
```

#### Get whether the storage is low on storage using the storage usage value and threshold

```dart
double storageTotal = await FlutterStorageInfo.getExternalStorageTotalSpaceInGB;
double storageUsed = await FlutterStorageInfo.getExternalStorageUsedSpaceInGB;

double threshold = 0.96;
double storageUsageValue = FlutterStorageInfo.getStorageUsageValue(storageUsed, storageTotal);

bool isBelowThreshold = FlutterStorageInfo.getIsStorageBelowThreshold(storageUsageValue, threshold);
>> true
```




## Screenshot
![Screenshot](example/screenshot/Screenshot.png)


## Permissions

### Android
Add the following permissions to your AndroidManifest.xml file:

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
          package="com.example.app">

    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>

</manifest>
```
### Supported Platforms
- Android (✅)
- iOS (🕑)
- Linux (❌)
- macOS (❌)
- Windows (❌)


### Issues and feedback

Please file [issues](https://github.com/JaberQayad/flutter_storage_info/issues) to send feedback or report a bug. Thank you!



