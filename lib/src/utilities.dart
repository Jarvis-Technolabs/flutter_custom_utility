import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_custom_utility/flutter_custom_utility.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:open_filex/open_filex.dart';
import 'package:url_launcher/url_launcher.dart';

class Utilities {
  ///To open default app system
  Future<bool> launchURL({
    required String url,
  }) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      return await launchUrl(Uri.parse(url));
    } else {
      return false;
    }
  }

  ///To open default map app
  Future<bool> launchMapURL({
    required double latitude,
    required double longitude,
    String? appleMapAppUrl,
    String? appleMapsUrl,
    String? launchMapUrl,
    String? appleMapApp,
  }) async {
    if (Platform.isAndroid) {
      if (launchMapUrl != null) {
        String androidUrl = '$launchMapUrl$latitude,$longitude';
        if (await canLaunchUrl(Uri.parse(androidUrl))) {
          return await launchUrl(Uri.parse(androidUrl));
        }
      }
    } else if (Platform.isIOS) {
      if (appleMapsUrl != null) {
        String appleMaps = '$appleMapsUrl$latitude,$longitude';
        if (await canLaunchUrl(Uri.parse(appleMaps))) {
          return await launchUrl(Uri.parse(Uri.encodeFull(appleMaps)));
        }
      } else if (appleMapApp != null &&
          appleMapAppUrl != null &&
          await canLaunchUrl(Uri.parse(appleMapApp))) {
        String appleApp = '$appleMapAppUrl$latitude,$longitude';
        return await launchUrl(Uri.parse(Uri.encodeFull(appleApp)));
      }
    }
    return false;
  }

  ///Launch any app url
  Future<bool> launchAppOrWeb({
    String? androidUrl,
    String? iOSUrl,
    String? androidWebUrl,
    String? iOSWebUrl,
    bool? useExternalApplication,
  }) async {
    if (Platform.isIOS) {
      if (await launchUrl(Uri.parse(iOSUrl!))) {
        return await launchUrl(Uri.parse(iOSUrl),
            mode: useExternalApplication != null
                ? LaunchMode.externalApplication
                : LaunchMode.platformDefault);
      } else if (await launchUrl(Uri.parse(iOSWebUrl!))) {
        return await launchUrl(Uri.parse(iOSWebUrl),
            mode: useExternalApplication != null
                ? LaunchMode.externalApplication
                : LaunchMode.platformDefault);
      }
    } else {
      if (await launchUrl(Uri.parse(androidUrl!))) {
        return await launchUrl(Uri.parse(androidUrl),
            mode: useExternalApplication != null
                ? LaunchMode.externalApplication
                : LaunchMode.platformDefault);
      } else if (await launchUrl(Uri.parse(androidWebUrl!))) {
        return await launchUrl(Uri.parse(androidWebUrl),
            mode: useExternalApplication != null
                ? LaunchMode.externalApplication
                : LaunchMode.platformDefault);
      }
    }
    return false;
  }

  ///Convert Hax Color Code To Color Object
  Color convertHaxColorCodeToColorObject({
    required String colorCode,
  }) =>
      Color(
        int.parse("0xff${colorCode.replaceAll("#", "")}"),
      );

  ///Convert Hax Color Code To String
  String convertHaxColorCodeToString({
    required Color color,
  }) =>
      color.value.toRadixString(16).substring(2, 8);

  ///Get File Using URL
  Future<File> getFileUsingURL(String url) async =>
      await DefaultCacheManager().getSingleFile(url);

  ///Show Toast
  void showToast({
    required String message,
    required Color backgroundColors,
    required Color textColors,
    Toast? toastLength = Toast.LENGTH_SHORT,
    ToastGravity? gravity = ToastGravity.BOTTOM,
    int timeInSecForIosWeb = 5,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength,
      gravity: gravity,
      backgroundColor: backgroundColors,
      textColor: textColors,
      timeInSecForIosWeb: timeInSecForIosWeb,
    );
  }

  /// open file method
  Future<void> openFile({required String path}) async {
    await OpenFilex.open(path);
  }

  ///File size
  bool isFileSizeValid({
    required File file,
    double allowMb = ALLOW_IMAGE_FILE_SIZE_IN_MB,
  }) {
    int sizeInBytes = file.lengthSync();
    double sizeInMb = sizeInBytes / (1024 * 1024);
    if (sizeInMb <= allowMb) {
      return true;
    } else {
      return false;
    }
  }
}
