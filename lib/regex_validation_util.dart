import 'dart:io';

import 'package:flutter_custom_utility/RegexConstant.dart';

class RegexValidationUtil {
  ///CustomRegex
  bool isCustomRegexFormat(String value, String regexString) =>
      RegExp(regexString).hasMatch(value);

  ///Name
  bool isValidNameFormat(String value) =>
      RegExp(REGEX_ALPHANUMERIC_WITH_SPACE).hasMatch(value);

  ///Mobile number
  bool isMobileNumberInValidFormat(String value) =>
      RegExp(PHONE_NUMBER_VALID_FORMAT_REGEX).hasMatch(value);

  ///Password
  bool isPasswordValid(String val) =>
      RegExp(VALID_PASSWORD_REGEX).hasMatch(val);

  ///Email
  bool isEmail(String email) =>
      RegExp(EMAIL_VALID_FORMAT_REGEX).hasMatch(email);

  ///Website
  bool isWebsiteValid(String website) =>
      RegExp(WEBSITE_VALID_FORMAT_REGEX).hasMatch(website);

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
