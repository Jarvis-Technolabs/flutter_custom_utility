import 'package:flutter_custom_utility/src/constant/regex_constant.dart';

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
}
