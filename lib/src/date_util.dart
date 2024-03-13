import 'package:flutter_custom_utility/flutter_custom_utility.dart';
import 'package:intl/intl.dart';

class DateUtil {
  ///Custom Date Format
  String getCustomDateFormat(
          {String? apiDateFormat,
          String? parseDateFormat,
          String? localLang,
          String? getCustomFormat}) =>
      parseDateFormat!.isNotEmpty
          ? DateFormat(getCustomFormat, localLang ?? 'en').format(
              DateFormat(apiDateFormat ?? API_DATE_FORMAT)
                  .parse(parseDateFormat))
          : "";

  ///get24ClockTimeFromDateTime
  String get24ClockTimeFromDateTime({
    DateTime? dateTime,
    String? localLang,
  }) =>
      dateTime != null
          ? DateFormat("HH:mm", localLang ?? 'en').format(dateTime)
          : "";

  ///get12ClockTimeFromDateTime
  String get12ClockTimeFromDateTime({
    DateTime? dateTime,
    String? localLang,
  }) =>
      dateTime != null
          ? DateFormat("hh:mm aa", localLang ?? 'en').format(dateTime)
          : "";

  ///get24ClockTimeFromApiDateString
  String get24ClockTimeFromApiDateString(
          {String? apiDateFormat,
          String? localLang,
          String? parseDateFormat}) =>
      parseDateFormat != null && parseDateFormat.isNotEmpty
          ? DateFormat("HH:mm", localLang ?? 'en').format(
              DateFormat(apiDateFormat ?? API_DATE_FORMAT)
                  .parse(parseDateFormat))
          : "";

  ///get12ClockTimeFromApiDateString
  String get12ClockTimeFromApiDateString(
          {String? apiDateFormat,
          String? localLang,
          String? parseDateFormat}) =>
      parseDateFormat != null && parseDateFormat.isNotEmpty
          ? DateFormat("hh:mm aa", localLang ?? 'en').format(
              DateFormat(apiDateFormat ?? API_DATE_FORMAT)
                  .parse(parseDateFormat))
          : "";

  ///getDDMMYYYYFromApiDateFormat
  String getDDMMYYYYFromApiDateFormat(
          {String? apiDateFormat,
          String? parseDateFormat,
          String? localLang}) =>
      parseDateFormat != null && parseDateFormat.isNotEmpty
          ? DateFormat('dd/MM/yyyy', localLang ?? 'en').format(
              DateFormat(apiDateFormat ?? API_DATE_FORMAT)
                  .parse(parseDateFormat))
          : "";

  ///Example: API Date Format "yyyy-MM-dd'T'hh:mm:ssZ"
  String changeApiDateFormat(
          {String? apiDateFormat,
          String? parseDateFormat,
          String? getDateFormat,
          String? localLang}) =>
      parseDateFormat != null && parseDateFormat.isNotEmpty
          ? DateFormat(getDateFormat, localLang ?? 'en').format(
              DateFormat(apiDateFormat ?? API_DATE_FORMAT)
                  .parse(parseDateFormat))
          : "";

  ///getSendAPIDateFormat
  String getSendAPIDateFormat(
          {DateTime? apiDateFormat,
          String? getDateFormat,
          String? localLang}) =>
      apiDateFormat != null
          ? DateFormat(getDateFormat, localLang ?? 'en').format(apiDateFormat)
          : "";

  ///MMMM (Example: JUNE)
  String getFullMonthName(
          {String? parseDateFormat,
          String? getAPIDateFormat,
          String? localLang}) =>
      DateFormat("MMMM", localLang ?? 'en').format(
          DateFormat(getAPIDateFormat ?? API_DATE_FORMAT)
              .parse(parseDateFormat!));

  ///MMMM yyyy(Example: JUNE 2024)
  String getFullMonthNameWithYear(
          {String? parseDateFormat,
          String? getAPIDateFormat,
          String? localLang}) =>
      DateFormat("MMMM yyyy", localLang ?? 'en').format(
          DateFormat(getAPIDateFormat ?? API_DATE_FORMAT)
              .parse(parseDateFormat!));

  ///MMM yyyy(Example: jun 2024)
  String getMonthWithYear(
          {String? parseDateFormat,
          String? getAPIDateFormat,
          String? localLang}) =>
      DateFormat("MMM yyyy", localLang ?? 'en').format(
          DateFormat(getAPIDateFormat ?? API_DATE_FORMAT)
              .parse(parseDateFormat!));

  ///dd EEEE(Example: 05, Monday)
  String getDateWithDay(
          {String? parseDateFormat,
          String? getAPIDateFormat,
          String? localLang}) =>
      DateFormat("dd, EEEE", localLang ?? 'en').format(
          DateFormat(getAPIDateFormat ?? API_DATE_FORMAT)
              .parse(parseDateFormat!));
}
