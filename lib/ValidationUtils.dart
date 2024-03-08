import 'package:flutter_custom_utility/regex_validation_util.dart';

class ValidationUtils {
  static String? validateName(
      {required String name,
      required String emptyErrorMsg,
      required String textLengthErrorMsg,
      required int textLength}) {
    if (name.isEmpty) {
      return emptyErrorMsg;
    } else if (name.length < textLength) {
      return textLengthErrorMsg;
    } else {
      return null;
    }
  }

  static String? validateEmail({
    required String email,
    required String emptyErrorMsg,
    required String validationErrorMsg,
  }) {
    if (email.isEmpty) {
      return emptyErrorMsg;
    } else if (!RegexValidationUtil().isEmail(email)) {
      return validationErrorMsg;
    } else {
      return null;
    }
  }

  static String? validatePassword({
    required String password,
    required String emptyErrorMsg,
    required String validationErrorMsg,
  }) {
    if (password.isEmpty) {
      return emptyErrorMsg;
    } else if (!RegexValidationUtil().isPasswordValid(password)) {
      return validationErrorMsg;
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword({
    required String confirmPassword,
    required String passwordText,
    required String emptyErrorMsg,
    required String validationErrorMsg,
  }) {
    if (confirmPassword.isEmpty) {
      return emptyErrorMsg;
    } else if (confirmPassword != passwordText) {
      return validationErrorMsg;
    } else {
      return null;
    }
  }

  static String? validateEmptyText({
    String? value,
    required String emptyErrorMsg,
  }) {
    if (value == null || value.isEmpty) {
      return emptyErrorMsg;
    } else {
      return null;
    }
  }
}
