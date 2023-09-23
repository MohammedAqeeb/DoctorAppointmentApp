import 'package:intl/intl.dart';

String formatDate(String inputDate) {
  final dateTime = DateTime.parse(inputDate);
  final formattedDate = DateFormat('EEE d MMM').format(dateTime);
  return formattedDate;
}
