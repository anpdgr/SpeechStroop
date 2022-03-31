// Date format
import 'package:intl/intl.dart';
import 'package:buddhist_datetime_dateformat/buddhist_datetime_dateformat.dart';

var dateFormatter = DateFormat.yMMMd();

String convertDateTime(DateTime date) {
  return dateFormatter.formatInBuddhistCalendarThai(date);
}
