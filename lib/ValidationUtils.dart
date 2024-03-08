import 'package:flutter_custom_utility/regex_validation_util.dart';

class ValidationUtils {
  static String? validateName(
      {required String text,
      required String emptyErrorMsg,
      required String textLengthErrorMsg,
      required int textLength}) {
    if (text.isEmpty) {
      return emptyErrorMsg;
    } else if (text.length < textLength) {
      return textLengthErrorMsg;
    } else {
      return null;
    }
  }

  static String? validateEmail({
    required String text,
    required String emptyErrorMsg,
    required String validationErrorMsg,
  }) {
    if (text.isEmpty) {
      return emptyErrorMsg;
    } else if (!RegexValidationUtil().isEmail(text)) {
      return validationErrorMsg;
    } else {
      return null;
    }
  }

  static String? validatePassword({
    required String text,
    required String emptyErrorMsg,
    required String validationErrorMsg,
  }) {
    if (text.isEmpty) {
      return emptyErrorMsg;
    } else if (!RegexValidationUtil().isPasswordValid(text)) {
      return validationErrorMsg;
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword({
    required String text,
    required String passwordText,
    required String emptyErrorMsg,
    required String validationErrorMsg,
  }) {
    if (text.isEmpty) {
      return emptyErrorMsg;
    } else if (text != passwordText) {
      return validationErrorMsg;
    } else {
      return null;
    }
  }

  static String? validateEmptyText({
    String? text,
    required String emptyErrorMsg,
  }) {
    if (text == null || text.isEmpty) {
      return emptyErrorMsg;
    } else {
      return null;
    }
  }
}
