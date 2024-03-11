import 'package:flutter/material.dart';
import 'package:flutter_custom_utility/flutter_custom_utility.dart';

class CommonUtilityExamplePage extends StatefulWidget {
  const CommonUtilityExamplePage({super.key});

  @override
  State<CommonUtilityExamplePage> createState() =>
      _CommonUtilityExamplePageState();
}

class _CommonUtilityExamplePageState extends State<CommonUtilityExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Common Utility Example"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Utilities.showToast(
                      message: "Show toast",
                      backgroundColors: Colors.black87,
                      textColors: Colors.white);
                },
                child: Text("Show toast"),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              margin: EdgeInsets.all(16),
              height: 50,
              width: double.infinity,
              color: Utilities.convertHaxColorCodeToColorObject(
                  colorCode: "B39DDB"),
              child: Center(child: Text("Convert Hax Code To Color Object")),
            ),
            Container(
              margin: EdgeInsets.all(16),
              height: 50,
              width: double.infinity,
              color: Utilities.convertHaxColorCodeToColorObject(
                  colorCode: "B39DDB"),
              child: Center(
                  child: Text(
                      "Hax Color Code: ${Utilities.convertHaxColorCodeToString(color: Color(0xFFB39DDB))}")),
            ),
            SizedBox(
              height: 16,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  const nativeUrl =
                      "instagram:instagram://user?username=severinas_app";
                  const webUrl = "https://www.instagram.com/car/";
                  Utilities.launchAppOrWeb(
                      androidUrl: nativeUrl,
                      androidWebUrl: webUrl,
                      iOSUrl: nativeUrl,
                      iOSWebUrl: webUrl,
                      useExternalApplication: true);
                },
                child: Text("Open app Url"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
