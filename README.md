# Flutter Custom Utility

This package includes Common Utility functions (such as launching URLs, app URL launches, hex-to-color conversion, 
downloading files with caching functionality, displaying toasts, and opening files), along with modules for Validation, Regex, and Date and Time utilities

## Features

A versatile Flutter package offering essential utility functions for common tasks. Simplify your development process with features including:
- Common Utility: Streamline your code with a set of general-purpose utility functions.
- Validation: Validate user inputs effortlessly with pre-built validation methods.
- Regex: Harness the power of regular expressions for pattern matching and data extraction.
- Date and Time Util: Easily handle date and time operations for a seamless user experience.

## Flutter Compatibility 

| **Package version** | **Flutter version** |
|:-------------------:|:-------------------:|
|        0.0.9        |   3.16.0 - 3.19.3   |

## ScreenShot

<a href="https://raw.githubusercontent.com/Jarvis-Technolabs/flutter_custom_utility/assets/1.png"><img src="https://raw.githubusercontent.com/Jarvis-Technolabs/flutter_custom_utility/assets/1.png" alt=" ScreenShot 1" height="310"/>
<a href="https://raw.githubusercontent.com/Jarvis-Technolabs/flutter_custom_utility/assets/2.png"><img src="https://raw.githubusercontent.com/Jarvis-Technolabs/flutter_custom_utility/assets/2.png" alt=" ScreenShot 2" height="310"/>
<a href="https://raw.githubusercontent.com/Jarvis-Technolabs/flutter_custom_utility/assets/3.png"><img src="https://raw.githubusercontent.com/Jarvis-Technolabs/flutter_custom_utility/assets/3.png" alt=" ScreenShot 3" height="310"/>

## Example
Date and time util
``` dart
     DateUtil.getCustomDateFormat(
        getCustomFormat: "dd MMM yyyy",
        apiDateFormat: "yyyy-MM-dd'T'hh:mm:ssZ",
        localLang: "en",
        parseDateFormat: "1974-02-12T00:00:00.00+4"
     )
```
Validation
``` dart
     ValidationUtils.validateName(
        name: value!,
        emptyErrorMsg: "User name is empty",
        textLengthErrorMsg:
            "User should be More than 3 word",
        textLength: 3
     )
```

Regex
``` dart
      bool isCustomRegexFormat(String value, String regexString) =>
         RegExp(regexString).hasMatch(value);
```

Common Utility
``` dart
      const nativeUrl =
                   "instagram:instagram://user?username=severinas_app";
      const webUrl = "https://www.instagram.com/car/";
      Utilities.launchAppOrWeb(
          androidUrl: nativeUrl,
          androidWebUrl: webUrl,
          iOSUrl: nativeUrl,
          iOSWebUrl: webUrl,
          useExternalApplication: true
      );
```


## Installation

To use this flutter_custom_utility component in your project, follow these steps:

1. This will add a line like this to your package's pubspec.yaml (and run an implicit dart pub get):

    ``` dart
   dependencies:
      flutter_custom_utility: ^0.0.9
    ```

2. Import it:

    ``` dart
    import 'package:flutter_custom_utility/flutter_custom_utility.dart';
    ```
