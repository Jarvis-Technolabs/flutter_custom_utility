import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:open_filex/open_filex.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'package:url_launcher/url_launcher.dart';

class Utilities {
  ///To open default app system
  static void launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw Exception('Could not launch $url');
    }
  }

  ///To open default map app
  static void launchMapURL(
      double latitude,
      double longitude,
      String? appleMapAppUrl,
      String? appleMapsUrl,
      String? launchMapUrl,
      String? appleMapApp) async {
    String appleApp = '$appleMapAppUrl${latitude},${longitude}';
    String appleMaps = '${appleMapsUrl}${latitude},${longitude}';
    String androidUrl = '$launchMapUrl${latitude},${longitude}';
    if (Platform.isAndroid) {
      if (await canLaunchUrl(Uri.parse(androidUrl))) {
        await launchUrl(Uri.parse(androidUrl));
      }
    } else if (Platform.isIOS) {
      if (await canLaunchUrl(Uri.parse(appleMaps))) {
        await launchUrl(Uri.parse(Uri.encodeFull(appleMaps)));
      } else if (await canLaunchUrl(Uri.parse(appleMapApp!))) {
        await launchUrl(Uri.parse(Uri.encodeFull(appleApp)));
      }
    }
  }

  ///Launch any app url
  static launchAPPWEB(
      {String? androidUrl,
      String? iOSUrl,
      String? androidWebUrl,
      String? iOSWebUrl,
      bool? useExternalApplication}) async {
    if (Platform.isIOS) {
      if (await launchUrl(Uri.parse(iOSUrl!))) {
        await launchUrl(Uri.parse(iOSUrl),
            mode: useExternalApplication != null
                ? LaunchMode.externalApplication
                : LaunchMode.platformDefault);
      } else if (await launchUrl(Uri.parse(iOSWebUrl!))) {
        await launchUrl(Uri.parse(iOSWebUrl),
            mode: useExternalApplication != null
                ? LaunchMode.externalApplication
                : LaunchMode.platformDefault);
      } else {
        throw Exception('Could not launch iOS url');
      }
    } else {
      if (await launchUrl(Uri.parse(androidUrl!))) {
        await launchUrl(Uri.parse(androidUrl),
            mode: useExternalApplication != null
                ? LaunchMode.externalApplication
                : LaunchMode.platformDefault);
      } else if (await launchUrl(Uri.parse(androidWebUrl!))) {
        await launchUrl(Uri.parse(androidWebUrl),
            mode: useExternalApplication != null
                ? LaunchMode.externalApplication
                : LaunchMode.platformDefault);
      } else {
        throw Exception('Could not launch android url');
      }
    }
  }

  ///Launch Facebook
  static launchFacebook({
    required String androidURL,
    required String iosURL,
    required String fallBackURL,
  }) async {
    String url;
    if (Platform.isIOS) {
      url = iosURL;
    } else {
      url = androidURL;
    }

    try {
      bool launched = await launchUrl(
        Uri.parse(url),
        webViewConfiguration: WebViewConfiguration(),
        mode: LaunchMode.externalApplication,
      );

      if (!launched) {
        await launchUrl(
          Uri.parse(fallBackURL),
          mode: LaunchMode.externalApplication,
        );
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  ///Convert Hax Color Code To Color Object
  static Color convertHaxColorCodeToColorObject({
    required String colorCode,
  }) =>
      Color(
        int.parse("0xff${colorCode.replaceAll("#", "")}"),
      );

  ///Convert Hax Color Code To String
  static String convertHaxColorCodeToString({
    required Color color,
  }) =>
      color.value.toRadixString(16).substring(2, 8);

  ///Get File Using URL
  static Future<File> getFileUsingURL(String url) async =>
      await DefaultCacheManager().getSingleFile(url);

  ///Show Toast
  static void showToast({
    required String message,
    required Color backgroundColors,
    required Color textColors,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: backgroundColors,
      textColor: textColors,
      timeInSecForIosWeb: 5,
    );
  }

  /// open file method
  static Future<void> openFile({required String path}) async {
    await OpenFilex.open(path);
  }
}
