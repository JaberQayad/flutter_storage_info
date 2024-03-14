package com.example.flutter_storage_info

import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import android.os.Environment
import android.content.Context
import android.os.StatFs
import java.io.File
import androidx.core.content.ContextCompat.getExternalFilesDirs
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** FlutterStorageInfoPlugin */
class FlutterStorageInfoPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
    private lateinit var context: Context

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_storage_info")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
   if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
  }else if (call.method == "getStorageFreeSpace") {
      result.success(getStorageFreeSpace())
    } else if (call.method == "getStorageUsedSpace") {
      result.success(getStorageUsedSpace())
    } else if (call.method == "getStorageTotalSpace") {
      result.success(getStorageTotalSpace())
    } else if (call.method == "getExternalStorageTotalSpace") {
      result.success(getExternalStorageTotalSpace())
    } else if (call.method == "getExternalStorageFreeSpace") {
      result.success(getExternalStorageFreeSpace())
    } else if (call.method == "getExternalStorageUsedSpace") {
      result.success(getExternalStorageUsedSpace())
    } else if (call.method == "getStorageFreeSpaceInMB") {
      result.success(getStorageFreeSpaceInMB())
    } else if (call.method == "getStorageUsedSpaceInMB") {
      result.success(getStorageUsedSpaceInMB())
    } else if (call.method == "getStorageTotalSpaceInMB") {
      result.success(getStorageTotalSpaceInMB())
    } else if (call.method == "getStorageFreeSpaceInGB") {
      result.success(getStorageFreeSpaceInGB())
    } else if (call.method == "getStorageUsedSpaceInGB") {
      result.success(getStorageUsedSpaceInGB())
    } else if (call.method == "getStorageTotalSpaceInGB") {
      result.success(getStorageTotalSpaceInGB())
    } else if (call.method == "getExternalStorageTotalSpaceInMB") {
      result.success(getExternalStorageTotalSpaceInMB())
    } else if (call.method == "getExternalStorageFreeSpaceInMB") {
      result.success(getExternalStorageFreeSpaceInMB())
    } else if (call.method == "getExternalStorageUsedSpaceInMB") {
      result.success(getExternalStorageUsedSpaceInMB())
    } else if (call.method == "getExternalStorageTotalSpaceInGB") {
      result.success(getExternalStorageTotalSpaceInGB())
    } else if (call.method == "getExternalStorageFreeSpaceInGB") {
      result.success(getExternalStorageFreeSpaceInGB())
    } else if (call.method == "getExternalStorageUsedSpaceInGB") {
      result.success(getExternalStorageUsedSpaceInGB())
    } else {
      result.notImplemented()
    }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }



    fun getStorageTotalSpace(): Long{
        val path = Environment.getDataDirectory()
        val stat = StatFs(path.path)
        return stat.totalBytes
    }

    fun getStorageFreeSpace(): Long{
        val path = Environment.getDataDirectory()
        val stat = StatFs(path.path)
        return stat.availableBytes
    }

    fun getStorageUsedSpace(): Long{
        val usedSpace: Long = getStorageTotalSpace() - getStorageFreeSpace()
        return usedSpace
    }

    fun getExternalStorageTotalSpace(): Long{
        val dirs: Array<File> = getExternalFilesDirs(context, null)
        val stat = StatFs(dirs[1].path.split("Android")[0])
        return stat.totalBytes
    }

    fun getExternalStorageFreeSpace(): Long{
        val dirs: Array<File> = getExternalFilesDirs(context, null)
        val stat = StatFs(dirs[1].path.split("Android")[0])
        return stat.availableBytes
    }

    fun getExternalStorageUsedSpace(): Long{
        val usedSpace: Long = getExternalStorageTotalSpace() - getExternalStorageFreeSpace()
        return usedSpace
    }

    // Storage space in MB
    fun getStorageFreeSpaceInMB(): Double{
        val freeSpace: Double = getStorageFreeSpace().toDouble() / 1024 / 1024
        return roundNumberTo2DecimalPlace(freeSpace)
    }

    fun getStorageUsedSpaceInMB(): Double{
        val usedSpace: Double = getStorageUsedSpace().toDouble() / 1024 /  1024
        return roundNumberTo2DecimalPlace(usedSpace)
    }

    fun getStorageTotalSpaceInMB(): Double{
        val totalSpace: Double = getStorageTotalSpace().toDouble() / 1024 /  1024
        return roundNumberTo2DecimalPlace(totalSpace)
    }

    // Storage space in GB
    fun getStorageFreeSpaceInGB(): Double{
        val freeSpace: Double = getStorageFreeSpace().toDouble() / 1024 / 1024 / 1024
        return roundNumberTo2DecimalPlace(freeSpace)
    }

    fun getStorageUsedSpaceInGB(): Double{
        val usedSpace: Double = getStorageUsedSpace().toDouble() / 1024 /  1024 / 1024
        return roundNumberTo2DecimalPlace(usedSpace)
    }

    fun getStorageTotalSpaceInGB(): Double{
        val totalSpace: Double = getStorageTotalSpace().toDouble() / 1024 /  1024 / 1024
        return roundNumberTo2DecimalPlace(totalSpace)
    }

    // External storage in MB
    fun getExternalStorageFreeSpaceInMB(): Double{
        val freeSpace: Double = getExternalStorageFreeSpace().toDouble() / 1024 / 1024
        return roundNumberTo2DecimalPlace(freeSpace)
    }

    fun getExternalStorageUsedSpaceInMB(): Double{
        val usedSpace: Double = getExternalStorageUsedSpace().toDouble() / 1024 / 1024
        return roundNumberTo2DecimalPlace(usedSpace)
    }

    fun getExternalStorageTotalSpaceInMB(): Double{
        val totalSpace: Double = getExternalStorageTotalSpace().toDouble() / 1024 / 1024
        return roundNumberTo2DecimalPlace(totalSpace)
    }

    // External storage in GB

    fun getExternalStorageFreeSpaceInGB(): Double{
        val freeSpace: Double = getExternalStorageFreeSpace().toDouble() / 1024 / 1024 / 1024
        return roundNumberTo2DecimalPlace(freeSpace)
    }


    fun getExternalStorageUsedSpaceInGB(): Double{
        val usedSpace: Double = getExternalStorageUsedSpace().toDouble() / 1024 / 1024 / 1024
        return roundNumberTo2DecimalPlace(usedSpace)
    }


    fun getExternalStorageTotalSpaceInGB(): Double{
        val totalSpace: Double = getExternalStorageTotalSpace().toDouble() / 1024 / 1024 / 1024
        return roundNumberTo2DecimalPlace(totalSpace)
    }

    fun roundNumberTo2DecimalPlace(value: Double) : Double {
        val number2digits: Double = String.format("%.2f", value).toDouble()
        return number2digits
    }


}
