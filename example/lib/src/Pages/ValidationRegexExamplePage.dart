import 'dart:async';

import 'package:example/src/widget/custom_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utility/Utilities.dart';
import 'package:flutter_custom_utility/ValidationUtils.dart';

class ValidationRegexExamplePage extends StatefulWidget {
  const ValidationRegexExamplePage({super.key});

  @override
  State<ValidationRegexExamplePage> createState() =>
      _ValidationRegexExamplePageState();
}

class _ValidationRegexExamplePageState
    extends State<ValidationRegexExamplePage> {
  String? genderGroupValue;
  StreamController<String> selectedGenderStreamController = StreamController();
  StreamController<bool> isRememberMeStreamController = StreamController();
  StreamController<bool> isTermAndConditionAcceptedStreamController =
      StreamController();

  /// Initialize TextEditingController for form fields
  TextEditingController _firstNameTextEditingController =
      TextEditingController();
  TextEditingController _emailTextEditingController = TextEditingController();
  TextEditingController _passwordTextEditingController =
      TextEditingController();
  TextEditingController _confirmPasswordTextEditingController =
      TextEditingController();
  bool? isRememberMe;

  bool isTermsAndConditionAccepted = false;

  /// Declare error test string variables
  String? firstNameError, emailError, passwordError, confirmPasswordError;
  StreamController<bool> _signUpFormErrorStreamController =
      StreamController.broadcast();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Validation Regex Example"),
      ),
      body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: StreamBuilder<bool>(
                    stream: _signUpFormErrorStreamController.stream,
                    builder: (context, snapshot) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFieldWidget(
                            controller: _firstNameTextEditingController,
                            labelText: "User Name",
                            hintText: "User Name",
                            errorText: firstNameError,
                            onChanged: (value) {
                              firstNameError = ValidationUtils.validateName(
                                  name: value,
                                  emptyErrorMsg: "User name is empty",
                                  textLengthErrorMsg:
                                      "User should be More than 3 word",
                                  textLength: 3);
                              _signUpFormErrorStreamController.add(true);
                            },
                            isMandatoryField: true,
                            textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFieldWidget(
                            controller: _emailTextEditingController,
                            labelText: "Email Address",
                            hintText: "Email Address",
                            errorText: emailError,
                            onChanged: (value) {
                              emailError = ValidationUtils.validateEmail(
                                  email: value,
                                  emptyErrorMsg: "Email Address is empty",
                                  validationErrorMsg: "Email is not valid");
                              _signUpFormErrorStreamController.add(true);
                            },
                            isMandatoryField: true,
                            textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFieldWidget(
                            controller: _passwordTextEditingController,
                            labelText: "Password",
                            hintText: "Password",
                            errorText: passwordError,
                            onChanged: (value) {
                              passwordError = ValidationUtils.validatePassword(
                                  password: value,
                                  emptyErrorMsg: "Password is empty",
                                  validationErrorMsg: "Enter valid password");
                              _signUpFormErrorStreamController.add(true);
                            },
                            isMandatoryField: true,
                            textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextFieldWidget(
                            controller: _confirmPasswordTextEditingController,
                            labelText: "Confirm Password",
                            hintText: "Confirm Password",
                            errorText: confirmPasswordError,
                            onChanged: (value) {
                              confirmPasswordError =
                                  ValidationUtils.validateConfirmPassword(
                                      confirmPassword: value,
                                      passwordText:
                                          _passwordTextEditingController.text,
                                      emptyErrorMsg:
                                          "Confirm Password is empty",
                                      validationErrorMsg: "Password not match");
                              _signUpFormErrorStreamController.add(true);
                            },
                            isMandatoryField: true,
                            textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          StreamBuilder<bool>(
                              stream: _signUpFormErrorStreamController.stream,
                              initialData: false,
                              builder: (context, snapshot) {
                                bool isEnabled = isSignUpButtonEnabled();
                                return ElevatedButton(
                                  onPressed: isEnabled
                                      ? () {
                                          Utilities.showToast(
                                              message: "Sign Up Done",
                                              backgroundColors: Colors.black87,
                                              textColors: Colors.white);
                                        }
                                      : null,
                                  child: Text("Sign Up"),
                                );
                              }),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      );
                    }),
              ))),
    );
  }

  /// enable button based on validation
  bool isSignUpButtonEnabled() {
    if (firstNameError == null &&
        emailError == null &&
        passwordError == null &&
        confirmPasswordError == null) {
      _signUpFormErrorStreamController.add(true);
      return true;
    } else {
      _signUpFormErrorStreamController.add(false);
      return false;
    }
  }
}
