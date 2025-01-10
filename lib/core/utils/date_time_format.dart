import 'package:intl/intl.dart';

class DateTimeFormat {
  static String formatDDYYMM(DateTime? dateTime) {
    return DateFormat('dd/MM/yyyy').format(dateTime ?? DateTime.now());
  }
}
