import 'package:flutter_custom_utility/DateUtil.dart';
import 'package:example/src/Constants/DateTimeConstants.dart';
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
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "DateTime Utility: ",
                style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        'dd, EEEE: ',
                      ),
                      Text(
                        DateUtil.getDateWithDay(getAPIDateFormat: API_DATE_FORMAT,localLang: FORMAT_LANGUAGE,parseDateFormat: "1974-02-12T00:00:00.00+4"),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        'MMM yyyy: ',
                      ),
                      Text(
                        DateUtil.getMonthWithYear(getAPIDateFormat: API_DATE_FORMAT,localLang: FORMAT_LANGUAGE,parseDateFormat: "1974-02-12T00:00:00.00+4"),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        'MMMM yyyy: ',
                      ),
                      Text(
                        DateUtil.getFullMonthNameWithYear(getAPIDateFormat: API_DATE_FORMAT,localLang: FORMAT_LANGUAGE,parseDateFormat: "1974-02-12T00:00:00.00+4"),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        'MMMM: ',
                      ),
                      Text(
                        DateUtil.getFullMonthName(getAPIDateFormat: API_DATE_FORMAT,localLang: FORMAT_LANGUAGE,parseDateFormat: "1974-02-12T00:00:00.00+4"),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        'HH:mm: ',
                      ),
                      Text(
                        DateUtil.get24ClockTimeFromApiDateString(apiDateFormat: API_DATE_FORMAT,parseDateFormat: "1974-02-12T13:10:30.00+4"),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        'hh:mm aa: ',
                      ),
                      Text(
                        DateUtil.get12ClockTimeFromApiDateString(apiDateFormat: API_DATE_FORMAT ,parseDateFormat: "1974-02-12T00:00:00.00+4"),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        'dd/MM/yyyy: ',
                      ),
                      Text(
                        DateUtil.getDDMMYYYYFromApiDateFormat(apiDateFormat: API_DATE_FORMAT,localLang: FORMAT_LANGUAGE,parseDateFormat: "1974-02-12T00:00:00.00+4"),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text(
                        'Custom Format: ',
                      ),
                      Text(
                        DateUtil.getCustomDateFormat(getCustomFormat: "dd MMM yyyy",apiDateFormat: API_DATE_FORMAT,localLang: FORMAT_LANGUAGE,parseDateFormat: "1974-02-12T00:00:00.00+4"),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
