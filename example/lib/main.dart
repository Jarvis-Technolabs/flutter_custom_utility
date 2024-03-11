import 'package:example/src/pages/common_utility_example_page.dart';
import 'package:example/src/pages/date_time_utility_example.dart';
import 'package:example/src/pages/validation_regex_example_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Custom Utility'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            exampleList("DateTime Utility Example", () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      DateTimeUtilityExamplePage(),
                ),
              );
            }),
            exampleList("Common Utility Example", () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => CommonUtilityExamplePage(),
                ),
              );
            }),
            exampleList("Regex Validation Example", () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ValidationRegexExamplePage(),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget exampleList(String title, Function onTap) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            onTap();
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Text(
                  title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
                const Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.black,
                  size: 18,
                )
              ],
            ),
          ),
        ),
        const Divider(
          color: Colors.black,
          thickness: 1,
          height: 1,
        )
      ],
    );
  }
}
