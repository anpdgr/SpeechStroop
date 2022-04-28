// Date format
import 'package:intl/intl.dart';
import 'package:buddhist_datetime_dateformat/buddhist_datetime_dateformat.dart';

var dateFormatter = DateFormat.yMMMd();
var chartDateFormatter = DateFormat.EEEE();

String convertDateTime(DateTime date) {
  return dateFormatter.formatInBuddhistCalendarThai(date);
}

String chartDate(DateTime date) {
  return chartDateFormatter.formatInBuddhistCalendarThai(date);
}
