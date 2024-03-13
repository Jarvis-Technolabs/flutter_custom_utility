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
  DateUtil dateUtil = DateUtil();

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
                        dateUtil.getCustomDateFormat(
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
                        dateUtil.getDateWithDay(
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
                        dateUtil.getMonthWithYear(
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
                        dateUtil.getFullMonthNameWithYear(
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
                        dateUtil.getFullMonthName(
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
                        dateUtil.get24ClockTimeFromApiDateString(
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
                        dateUtil.get12ClockTimeFromApiDateString(
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
                        dateUtil.getDDMMYYYYFromApiDateFormat(
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
