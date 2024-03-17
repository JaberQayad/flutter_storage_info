package com.example.flutter_storage_info

import android.content.Context
import android.os.Environment
import android.os.StatFs
import androidx.core.content.ContextCompat.getExternalFilesDirs
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.io.File

/** A Flutter plugin to retrieve information about device storage. */
class FlutterStorageInfoPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var channel: MethodChannel
    private lateinit var context: Context

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_storage_info")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            // Internal storage
            "getStorageFreeSpace" -> result.success(getStorageFreeSpace())
            "getStorageUsedSpace" -> result.success(getStorageUsedSpace())
            "getStorageTotalSpace" -> result.success(getStorageTotalSpace())
            // External storage
            "getExternalStorageTotalSpace" -> result.success(getExternalStorageTotalSpace())
            "getExternalStorageFreeSpace" -> result.success(getExternalStorageFreeSpace())
            "getExternalStorageUsedSpace" -> result.success(getExternalStorageUsedSpace())
            // Storage space in MB
            "getStorageFreeSpaceInMB" -> result.success(getStorageFreeSpaceInMB())
            "getStorageUsedSpaceInMB" -> result.success(getStorageUsedSpaceInMB())
            "getStorageTotalSpaceInMB" -> result.success(getStorageTotalSpaceInMB())
            // Storage space in GB
            "getStorageFreeSpaceInGB" -> result.success(getStorageFreeSpaceInGB())
            "getStorageUsedSpaceInGB" -> result.success(getStorageUsedSpaceInGB())
            "getStorageTotalSpaceInGB" -> result.success(getStorageTotalSpaceInGB())
            // External storage space in MB
            "getExternalStorageTotalSpaceInMB" -> result.success(getExternalStorageTotalSpaceInMB())
            "getExternalStorageFreeSpaceInMB" -> result.success(getExternalStorageFreeSpaceInMB())
            "getExternalStorageUsedSpaceInMB" -> result.success(getExternalStorageUsedSpaceInMB())
            // External storage space in GB
            "getExternalStorageTotalSpaceInGB" -> result.success(getExternalStorageTotalSpaceInGB())
            "getExternalStorageFreeSpaceInGB" -> result.success(getExternalStorageFreeSpaceInGB())
            "getExternalStorageUsedSpaceInGB" -> result.success(getExternalStorageUsedSpaceInGB())
            // Directory size
            "getSizeOfDirectoryInMB" -> {
                val directory: String? = call.argument("directory")
                if (directory != null) {
                    result.success(getSizeOfDirectoryInMB(directory))
                } else {
                    result.error("MISSING_DIRECTORY", "Directory path argument is missing", null)
                }
            }
            else -> result.notImplemented()
        }
    }

    private fun getStorageTotalSpace(): Long {
        val path: File = Environment.getExternalStorageDirectory()
        val stat = StatFs(path.path)
        return stat.totalBytes
    }

    private fun getStorageFreeSpace(): Long {
        val path: File = Environment.getExternalStorageDirectory()
        val stat = StatFs(path.path)
        return stat.availableBytes
    }

    private fun getStorageUsedSpace(): Long {
        return getStorageTotalSpace() - getStorageFreeSpace()
    }

    private fun getExternalStorageTotalSpace(): Long {
        val dirs: Array<File> = getExternalFilesDirs(context, null)
        val stat = StatFs(getBaseStoragePath(dirs[1]))
        return stat.totalBytes
    }

    private fun getExternalStorageFreeSpace(): Long {
        val dirs: Array<File> = getExternalFilesDirs(context, null)
        val stat = StatFs(getBaseStoragePath(dirs[1]))
        return stat.availableBytes
    }

    private fun getExternalStorageUsedSpace(): Long {
        return getExternalStorageTotalSpace() - getExternalStorageFreeSpace()
    }

    private fun getStorageFreeSpaceInMB(): Double {
        return getStorageFreeSpace().toDouble() / 1024 / 1024
    }

    private fun getStorageUsedSpaceInMB(): Double {
        return getStorageUsedSpace().toDouble() / 1024 / 1024
    }

    private fun getStorageTotalSpaceInMB(): Double {
        return getStorageTotalSpace().toDouble() / 1024 / 1024
    }

    private fun getStorageFreeSpaceInGB(): Double {
        return getStorageFreeSpace().toDouble() / 1024 / 1024 / 1024
    }

    private fun getStorageUsedSpaceInGB(): Double {
        return getStorageUsedSpace().toDouble() / 1024 / 1024 / 1024
    }

    private fun getStorageTotalSpaceInGB(): Double {
        return getStorageTotalSpace().toDouble() / 1024 / 1024 / 1024
    }

    private fun getExternalStorageTotalSpaceInMB(): Double {
        return getExternalStorageTotalSpace().toDouble() / 1024 / 1024
    }

    private fun getExternalStorageFreeSpaceInMB(): Double {
        return getExternalStorageFreeSpace().toDouble() / 1024 / 1024
    }

    private fun getExternalStorageUsedSpaceInMB(): Double {
        return getExternalStorageUsedSpace().toDouble() / 1024 / 1024
    }

    private fun getExternalStorageTotalSpaceInGB(): Double {
        return getExternalStorageTotalSpace().toDouble() / 1024 / 1024 / 1024
    }

    private fun getExternalStorageFreeSpaceInGB(): Double {
        return getExternalStorageFreeSpace().toDouble() / 1024 / 1024 / 1024
    }

    private fun getExternalStorageUsedSpaceInGB(): Double {
        return getExternalStorageUsedSpace().toDouble() / 1024 / 1024 / 1024
    }

    private fun getSizeOfDirectoryInMB(directory: String): Double {
        return File(directory)
            .walkTopDown()
            .map { it.length() }
            .sum().toDouble() / 1024 / 1024
    }

    private fun getBaseStoragePath(directory: File): String {
        return if (!directory.path.contains("Android")) {
            directory.path
        } else {
            directory.path.split("Android")[0]
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}


//package com.example.flutter_storage_info
//
//
//import android.content.Context
//import android.os.Environment
//import android.os.StatFs
//import androidx.core.content.ContextCompat.getExternalFilesDirs
//import io.flutter.embedding.engine.plugins.FlutterPlugin
//import io.flutter.plugin.common.MethodCall
//import io.flutter.plugin.common.MethodChannel
//import io.flutter.plugin.common.MethodChannel.MethodCallHandler
//import io.flutter.plugin.common.MethodChannel.Result
//import java.io.File
//
///** A Flutter plugin to retrieve information about device storage. */
///** FlutterStorageInfoPlugin */
//class FlutterStorageInfoPlugin: FlutterPlugin, MethodCallHandler {
//  /// The MethodChannel that will the communication between Flutter and native Android
//  ///
//  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
//  /// when the Flutter Engine is detached from the Activity
//  private lateinit var channel : MethodChannel
//    private lateinit var context: Context
//
//  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
//    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_storage_info")
//    channel.setMethodCallHandler(this)
//    context = flutterPluginBinding.applicationContext
//  }
//    /** Handles incoming method calls */
//    override fun onMethodCall(call: MethodCall, result: Result) {
//        when (call.method) {
//            // Internal storage
//            "getStorageFreeSpace" -> result.success(getStorageFreeSpace())
//            "getStorageUsedSpace" -> result.success(getStorageUsedSpace())
//            "getStorageTotalSpace" -> result.success(getStorageTotalSpace())
//            // External storage
//            "getExternalStorageTotalSpace" -> result.success(getExternalStorageTotalSpace())
//            "getExternalStorageFreeSpace" -> result.success(getExternalStorageFreeSpace())
//            "getExternalStorageUsedSpace" -> result.success(getExternalStorageUsedSpace())
//            // Storage space in MB
//            "getStorageFreeSpaceInMB" -> result.success(getStorageFreeSpaceInMB())
//            "getStorageUsedSpaceInMB" -> result.success(getStorageUsedSpaceInMB())
//            "getStorageTotalSpaceInMB" -> result.success(getStorageTotalSpaceInMB())
//            // Storage space in GB
//            "getStorageFreeSpaceInGB" -> result.success(getStorageFreeSpaceInGB())
//            "getStorageUsedSpaceInGB" -> result.success(getStorageUsedSpaceInGB())
//            "getStorageTotalSpaceInGB" -> result.success(getStorageTotalSpaceInGB())
//            // External storage space in MB
//            "getExternalStorageTotalSpaceInMB" -> result.success(getExternalStorageTotalSpaceInMB())
//            "getExternalStorageFreeSpaceInMB" -> result.success(getExternalStorageFreeSpaceInMB())
//            "getExternalStorageUsedSpaceInMB" -> result.success(getExternalStorageUsedSpaceInMB())
//            // External storage space in GB
//            "getExternalStorageTotalSpaceInGB" -> result.success(getExternalStorageTotalSpaceInGB())
//            "getExternalStorageFreeSpaceInGB" -> result.success(getExternalStorageFreeSpaceInGB())
//            "getExternalStorageUsedSpaceInGB" -> result.success(getExternalStorageUsedSpaceInGB())
//            // Directory size
//            "getSizeOfDirectoryInMB" -> {
//                val directory: String? = call.argument("directory")
//                if (directory != null) {
//                    result.success(getSizeOfDirectoryInMB(directory))
//                } else {
//                    result.error("DIRECTORY_NULL", "Directory argument is null", null)
//                }
//
//            else -> result.notImplemented()
//        }
//    }
//
//    /** Retrieves total space of internal storage */
//    private fun getStorageTotalSpace(): Long {
//        val path: File = Environment.getExternalStorageDirectory()
//        val stat = StatFs(path.path)
//        return stat.totalBytes
//    }
//
//    /** Retrieves free space of internal storage */
//    private fun getStorageFreeSpace(): Long {
//        val path: File = Environment.getExternalStorageDirectory()
//        val stat = StatFs(path.path)
//        return stat.availableBytes
//    }
//
//    /** Retrieves used space of internal storage */
//    private fun getStorageUsedSpace(): Long {
//        return getStorageTotalSpace() - getStorageFreeSpace()
//    }
//
//    /** Retrieves total space of external storage */
//    private fun getExternalStorageTotalSpace(): Long {
//        val dirs: Array<File> = getExternalFilesDirs(context, null)
//        val stat = StatFs(getBaseStoragePath(dirs[1]))
//        return stat.totalBytes
//    }
//
//    /** Retrieves free space of external storage */
//    private fun getExternalStorageFreeSpace(): Long {
//        val dirs: Array<File> = getExternalFilesDirs(context, null)
//        val stat = StatFs(getBaseStoragePath(dirs[1]))
//        return stat.availableBytes
//    }
//
//    /** Retrieves used space of external storage */
//    private fun getExternalStorageUsedSpace(): Long {
//        return getExternalStorageTotalSpace() - getExternalStorageFreeSpace()
//    }
//
//    /** Retrieves free space of internal storage in MB */
//    private fun getStorageFreeSpaceInMB(): Double {
//        return getStorageFreeSpace().toDouble() / 1024 / 1024
//    }
//
//    /** Retrieves used space of internal storage in MB */
//    private fun getStorageUsedSpaceInMB(): Double {
//        return getStorageUsedSpace().toDouble() / 1024 / 1024
//    }
//
//    /** Retrieves total space of internal storage in MB */
//    private fun getStorageTotalSpaceInMB(): Double {
//        return getStorageTotalSpace().toDouble() / 1024 / 1024
//    }
//
//    /** Retrieves free space of internal storage in GB */
//    private fun getStorageFreeSpaceInGB(): Double {
//        return getStorageFreeSpace().toDouble() / 1024 / 1024 / 1024
//    }
//
//    /** Retrieves used space of internal storage in GB */
//    private fun getStorageUsedSpaceInGB(): Double {
//        return getStorageUsedSpace().toDouble() / 1024 / 1024 / 1024
//    }
//
//    /** Retrieves total space of internal storage in GB */
//    private fun getStorageTotalSpaceInGB(): Double {
//        return getStorageTotalSpace().toDouble() / 1024 / 1024 / 1024
//    }
//
//    /** Retrieves free space of external storage in MB */
//    private fun getExternalStorageFreeSpaceInMB(): Double {
//        return getExternalStorageFreeSpace().toDouble() / 1024 / 1024
//    }
//
//    /** Retrieves used space of external storage in MB */
//    private fun getExternalStorageUsedSpaceInMB(): Double {
//        return getExternalStorageUsedSpace().toDouble() / 1024 / 1024
//    }
//
//    /** Retrieves total space of external storage in MB */
//    private fun getExternalStorageTotalSpaceInMB(): Double {
//        return getExternalStorageTotalSpace().toDouble() / 1024 / 1024
//    }
//
//    /** Retrieves free space of external storage in GB */
//    private fun getExternalStorageFreeSpaceInGB(): Double {
//        return getExternalStorageFreeSpace().toDouble() / 1024 / 1024 / 1024
//    }
//
//    /** Retrieves used space of external storage in GB */
//    private fun getExternalStorageUsedSpaceInGB(): Double {
//        return getExternalStorageUsedSpace().toDouble() / 1024 / 1024 / 1024
//    }
//
//    /** Retrieves total space of external storage in GB */
//    private fun getExternalStorageTotalSpaceInGB(): Double {
//        return getExternalStorageTotalSpace().toDouble() / 1024 / 1024 / 1024
//    }
//
//    /** Retrieves the size of a directory in MB */
//    private fun getSizeOfDirectoryInMB(directory: String): Double {
//        return File(directory)
//            .walkTopDown()
//            .map { it.length() }
//            .sum().toDouble() / 1024 / 1024
//    }
//
//    /** Extracts base storage path */
//    private fun getBaseStoragePath(directory: File): String {
//        // Handle cases where this is already the root dir
//        return if (!directory.path.contains("Android")) {
//            directory.path
//        } else {
//            directory.path.split("Android")[0]
//        }
//    }
//
//    /** Called when the plugin is detached from the FlutterEngine */
//    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
//        channel.setMethodCallHandler(null)
//    }
//
//
//    }
