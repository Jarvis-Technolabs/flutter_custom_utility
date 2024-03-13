const String REGEX_NUMBER = r"[0-9]";
const String REGEX_ALPHANUMERIC = r"[a-zA-Z0-9]";
const String REGEX_ALPHANUMERIC_WITH_SPACE = '[a-z A-Z0-9]';
const String REGEX_ONLY_CHARACTERS = '[a-zA-Z]';
const String REGEX_ONLY_CHARACTERS_WITH_SPACE = '[a-z A-Z]';
const String REGEX_RESTRICT_ZERO_AT_FIRST_POSITION = r'^0+';
const String REGEX_DOUBLE = r'(^\d*\.?\d*)';
const String REGEX_TO_RESTRICT_EMOJI =
    r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])';
const String REGEX_TO_RESTRICT_FIRST_CHAR_COMMA = r'^,+';
const String WEBSITE_VALID_FORMAT_REGEX =
    r"((https?:www\.)|(https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?";

///Mobile number
const String REGEX_ALLOWED_PHONE_NUMBER_CHAR = '[0-9+]';
const String PHONE_NUMBER_VALID_FORMAT_REGEX = r"^\+1\d*$";

///Email
const String ALLOWED_EMAIL_REGEX = r"[a-zA-Z0-9@._#\/\-$%^&*+`,~!?']";
const String EMAIL_VALID_FORMAT_REGEX =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

///Password
const String OBSCURE_CHARACTER = "*";
const int PASSWORD_LIMIT = 32;
const String ALLOWED_PASSWORD_REGEX =
    r"""[a-zA-Z0-9@._#\/\-$%^&*+`,~!?'():;<>=ˆ˜{}|\\\[\]"]""";
const String VALID_PASSWORD_REGEX =
    "^(?=.{8,32}\$)(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!\-/@#\$%^&*(),.?:{}|<>]).*";
