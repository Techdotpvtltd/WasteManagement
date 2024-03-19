// ignore: dangling_library_doc_comments
import 'package:flutter/material.dart';

/// Project: 	   wasteapp
/// File:    	   helping_methods
/// Path:    	   lib/utilities/helping_methods.dart
/// Author:       Ali Akbar
/// Date:        19-03-24 14:33:09 -- Tuesday
/// Description:

String? remainigTime(DateTime? pickingDate) {
  if (pickingDate == null) return null;
  final DateTime now = DateTime.now();
  final DateTime diffDuration = pickingDate.subtract(
      Duration(hours: now.hour, minutes: now.minute, seconds: now.second));

  final TimeOfDay diffTime = TimeOfDay.fromDateTime(diffDuration);
  return "${diffTime.hour}h ${diffTime.minute}m";
}
