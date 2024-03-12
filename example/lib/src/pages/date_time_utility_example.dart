import 'package:example/src/constants/date_time_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_utility/flutter_custom_utility.dart';

class DateTimeUtilityExamplePage extends StatefulWidget {
  const DateTimeUtilityExamplePage({super.key});

  @override
  State<DateTimeUtilityExamplePage> createState() =>
      _DateTimeUtilityExamplePageState();
}

class _DateTimeUtilityExamplePageState
    extends State<DateTimeUtilityExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("DateTime Utility Example"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "DateTime Utility: ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
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
                        'Custom Format: ',
                      ),
                      Text(
                        DateUtil.getCustomDateFormat(
                            getCustomFormat: "dd MMM yyyy",
                            apiDateFormat: API_DATE_FORMAT,
                            localLang: FORMAT_LANGUAGE,
                            parseDateFormat: "1974-02-12T00:00:00.00+4"),
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
                        'dd, EEEE: ',
                      ),
                      Text(
                        DateUtil.getDateWithDay(
                            getAPIDateFormat: API_DATE_FORMAT,
                            localLang: FORMAT_LANGUAGE,
                            parseDateFormat: "1974-02-12T00:00:00.00+4"),
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
                        DateUtil.getMonthWithYear(
                            getAPIDateFormat: API_DATE_FORMAT,
                            localLang: FORMAT_LANGUAGE,
                            parseDateFormat: "1974-02-12T00:00:00.00+4"),
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
                        DateUtil.getFullMonthNameWithYear(
                            getAPIDateFormat: API_DATE_FORMAT,
                            localLang: FORMAT_LANGUAGE,
                            parseDateFormat: "1974-02-12T00:00:00.00+4"),
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
                        DateUtil.getFullMonthName(
                            getAPIDateFormat: API_DATE_FORMAT,
                            localLang: FORMAT_LANGUAGE,
                            parseDateFormat: "1974-02-12T00:00:00.00+4"),
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
                        DateUtil.get24ClockTimeFromApiDateString(
                            apiDateFormat: API_DATE_FORMAT,
                            parseDateFormat: "1974-02-12T13:10:30.00+4"),
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
                        DateUtil.get12ClockTimeFromApiDateString(
                            apiDateFormat: API_DATE_FORMAT,
                            parseDateFormat: "1974-02-12T00:00:00.00+4"),
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
                        DateUtil.getDDMMYYYYFromApiDateFormat(
                            apiDateFormat: API_DATE_FORMAT,
                            localLang: FORMAT_LANGUAGE,
                            parseDateFormat: "1974-02-12T00:00:00.00+4"),
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
