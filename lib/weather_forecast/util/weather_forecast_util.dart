import 'package:intl/intl.dart';

class Util {
  static String appId = "ed60fcfbd110ee65c7150605ea8aceea";

  static String convertDate(DateTime date) {
    return new DateFormat("EEE, MMM d, y").format(date);
  }
  static String convertDate_2(DateTime date_2) {
    return new DateFormat("EEEE").format(date_2);
  }

}