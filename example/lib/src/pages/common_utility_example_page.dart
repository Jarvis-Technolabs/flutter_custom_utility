import 'package:flutter/material.dart';
import 'package:flutter_custom_utility/flutter_custom_utility.dart';

class CommonUtilityExamplePage extends StatefulWidget {
  const CommonUtilityExamplePage({super.key});

  @override
  State<CommonUtilityExamplePage> createState() =>
      _CommonUtilityExamplePageState();
}

class _CommonUtilityExamplePageState extends State<CommonUtilityExamplePage> {
  Utilities utilities = Utilities();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Common Utility Example"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    utilities.showToast(
                      message: "Show toast",
                      backgroundColors: Colors.black87,
                      textColors: Colors.white,
                    );
                  },
                  child: const Text("Show toast"),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                margin: const EdgeInsets.all(16),
                height: 50,
                width: double.infinity,
                color: utilities.convertHaxColorCodeToColorObject(
                    colorCode: "B39DDB"),
                child: const Center(
                    child: Text("Convert Hax Code To Color Object")),
              ),
              Container(
                margin: const EdgeInsets.all(16),
                height: 50,
                width: double.infinity,
                color: utilities.convertHaxColorCodeToColorObject(
                    colorCode: "B39DDB"),
                child: Center(
                  child: Text(
                    "Hax Color Code: ${utilities.convertHaxColorCodeToString(
                      color: const Color(0xFFB39DDB),
                    )}",
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    const nativeUrl =
                        "instagram:instagram://user?username=severinas_app";
                    const webUrl = "https://www.instagram.com/car/";
                    await utilities.launchAppOrWeb(
                      androidUrl: nativeUrl,
                      androidWebUrl: webUrl,
                      iOSUrl: nativeUrl,
                      iOSWebUrl: webUrl,
                      useExternalApplication: true,
                    );
                  },
                  child: const Text("Open app Url"),
                ),
              ),
            ],
          ),
        ),
      );
}
