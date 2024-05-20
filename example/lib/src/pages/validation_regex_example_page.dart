import 'dart:async';

import 'package:example/src/widget/custom_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utility/flutter_custom_utility.dart';

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
  final TextEditingController _firstNameTextEditingController =
      TextEditingController();
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  final TextEditingController _confirmPasswordTextEditingController =
      TextEditingController();
  bool? isRememberMe;

  bool isTermsAndConditionAccepted = false;
  ValidationUtils validationUtils = ValidationUtils();
  Utilities utilities = Utilities();

  /// Declare error test string variables
  String? firstNameError, emailError, passwordError, confirmPasswordError;
  final StreamController<bool> _signUpFormErrorStreamController =
      StreamController.broadcast();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Validation Regex Example"),
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: StreamBuilder<bool>(
                stream: _signUpFormErrorStreamController.stream,
                builder: (context, snapshot) => Form(
                  key: _formKey,
                  child: Column(
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
                        validator: (value) {
                          return validationUtils.validateName(
                            name: value!,
                            emptyErrorMsg: "User name is empty",
                            textLengthErrorMsg:
                                "User should be More than 3 word",
                            textLength: 3,
                          );
                        },
                        onChanged: (value) {
                          firstNameError = validationUtils.validateName(
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
                        validator: (value) {
                          return validationUtils.validateEmail(
                            email: value!,
                            emptyErrorMsg: "Email Address is empty",
                            validationErrorMsg: "Email is not valid",
                          );
                        },
                        onChanged: (value) {
                          emailError = validationUtils.validateEmail(
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
                        validator: (value) {
                          return validationUtils.validatePassword(
                            password: value!,
                            emptyErrorMsg: "Password is empty",
                            validationErrorMsg: "Enter valid password",
                          );
                        },
                        onChanged: (value) {
                          passwordError = validationUtils.validatePassword(
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
                        validator: (value) {
                          return validationUtils.validateConfirmPassword(
                            confirmPassword: value!,
                            passwordText: _passwordTextEditingController.text,
                            emptyErrorMsg: "Confirm Password is empty",
                            validationErrorMsg: "Password not match",
                          );
                        },
                        onChanged: (value) {
                          confirmPasswordError =
                              validationUtils.validateConfirmPassword(
                            confirmPassword: value,
                            passwordText: _passwordTextEditingController.text,
                            emptyErrorMsg: "Confirm Password is empty",
                            validationErrorMsg: "Password not match",
                          );
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
                        builder: (context, snapshot) => Center(
                          child: ElevatedButton(
                            onPressed: () {
                              final isValid = _formKey.currentState!.validate();
                              if (isValid) {
                                utilities.showToast(
                                  message: "Sign Up Done",
                                  backgroundColors: Colors.black87,
                                  textColors: Colors.white,
                                );
                              }
                            },
                            child: const Text("Sign Up"),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );

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
