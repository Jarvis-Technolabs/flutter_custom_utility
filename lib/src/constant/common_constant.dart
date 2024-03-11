///Files
const double ALLOW_PDF_FILE_SIZE_IN_MB = 10;
const double ALLOW_IMAGE_FILE_SIZE_IN_MB = 3;

///Dates
const String API_DATE_FORMAT = "yyyy-MM-dd'T'HH:mm:ssZ";
final String CURRENT_TIME_STAMP =
DateTime.parse(DateTime.now().toString()).toString().replaceAll(":", "_");
