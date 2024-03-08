import 'package:intl/intl.dart';

class DateUtil {
  ///get24ClockTimeFromDateTime
  static String get24ClockTimeFromDateTime({DateTime? dateTime}) =>
      dateTime != null ? DateFormat("HH:mm").format(dateTime) : "";

  ///get12ClockTimeFromDateTime
  static String get12ClockTimeFromDateTime({DateTime? dateTime}) =>
      dateTime != null ? DateFormat("hh:mm aa").format(dateTime) : "";

  ///get24ClockTimeFromApiDateString
  static String get24ClockTimeFromApiDateString(
          {String? apiDateFormat, String? parseDateFormat}) =>
      parseDateFormat != null && parseDateFormat.isNotEmpty
          ? DateFormat("HH:mm")
              .format(DateFormat(apiDateFormat).parse(parseDateFormat))
          : "";

  ///get12ClockTimeFromApiDateString
  static String get12ClockTimeFromApiDateString(
          {String? apiDateFormat, String? parseDateFormat}) =>
      parseDateFormat != null && parseDateFormat.isNotEmpty
          ? DateFormat("hh:mm aa")
              .format(DateFormat(apiDateFormat).parse(parseDateFormat))
          : "";

  ///getDDMMYYYYFromApiDateFormat
  static String getDDMMYYYYFromApiDateFormat(
          {String? apiDateFormat,
          String? parseDateFormat,
          String? localLang}) =>
      parseDateFormat != null && parseDateFormat.isNotEmpty
          ? DateFormat('dd/MM/yyyy', localLang ?? 'en')
              .format(DateFormat(apiDateFormat).parse(parseDateFormat))
          : "";

  ///Example: API Date Format "yyyy-MM-dd'T'hh:mm:ssZ"
  static String changeApiDateFormat(
          {String? apiDateFormat,
          String? parseDateFormat,
          String? getDateFormat,
          String? localLang}) =>
      parseDateFormat != null && parseDateFormat.isNotEmpty
          ? DateFormat(getDateFormat, localLang ?? 'en')
              .format(DateFormat(apiDateFormat).parse(parseDateFormat))
          : "";

  ///getSendAPIDateFormat
  static String getSendAPIDateFormat(
          {DateTime? apiDateFormat,
          String? getDateFormat,
          String? localLang}) =>
      apiDateFormat != null
          ? DateFormat(getDateFormat, localLang ?? 'en').format(apiDateFormat)
          : "";

  ///Custom Date Format
  static String getCustomDateFormat(
          {String? apiDateFormat,
          String? parseDateFormat,
          String? localLang,
          String? getCustomFormat}) =>
      parseDateFormat!.isNotEmpty
          ? DateFormat(getCustomFormat, localLang ?? 'en')
              .format(DateFormat(apiDateFormat).parse(parseDateFormat))
          : "";

  ///MMMM (Example: JUNE)
  static String getFullMonthName(
          {String? parseDateFormat,
          String? getAPIDateFormat,
          String? localLang}) =>
      DateFormat("MMMM", localLang ?? 'en')
          .format(DateFormat(getAPIDateFormat).parse(parseDateFormat!));

  ///MMMM yyyy(Example: JUNE 2024)
  static String getFullMonthNameWithYear(
          {String? parseDateFormat,
          String? getAPIDateFormat,
          String? localLang}) =>
      DateFormat("MMMM yyyy", localLang ?? 'en')
          .format(DateFormat(getAPIDateFormat).parse(parseDateFormat!));

  ///MMM yyyy(Example: jun 2024)
  static String getMonthWithYear(
          {String? parseDateFormat,
          String? getAPIDateFormat,
          String? localLang}) =>
      DateFormat("MMM yyyy", localLang ?? 'en')
          .format(DateFormat(getAPIDateFormat).parse(parseDateFormat!));

  ///dd EEEE(Example: 05, Monday)
  static String getDateWithDay(
          {String? parseDateFormat,
          String? getAPIDateFormat,
          String? localLang}) =>
      DateFormat("dd, EEEE", localLang ?? 'en')
          .format(DateFormat(getAPIDateFormat).parse(parseDateFormat!));
}
