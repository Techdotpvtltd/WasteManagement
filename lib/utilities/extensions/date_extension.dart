import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  DateTime onlyDate() {
    return DateTime(year, month, day);
  }

  String dateToString(String pattern) {
    return DateFormat(pattern).format(this);
  }

  String formatChatDateToString() {
    final days = DateTime.now().difference(this).inDays;
    debugPrint(days.toString());
    if (days == 0) {
      return "Today";
    }
    if (days == 1) {
      return "Yesterday";
    }

    if (days > 1 && days < 7) {
      return dateToString("EEEE");
    }
    return dateToString("dd-MMM-yyyy");
  }
}
