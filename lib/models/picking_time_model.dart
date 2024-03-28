// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

/// Project: 	   wasteapp
/// File:    	   picking_time_model
/// Path:    	   lib/models/picking_time_model.dart
/// Author:       Ali Akbar
/// Date:        19-03-24 13:15:34 -- Tuesday
/// Description:

class PickingTimeModel {
  final DateTime pickingTime;
  final String apartment;
  PickingTimeModel({
    required this.pickingTime,
    required this.apartment,
  });

  factory PickingTimeModel.fromMap(Map<String, dynamic> map) {
    return PickingTimeModel(
      pickingTime: (map['pickingTime'] as Timestamp).toDate(),
      apartment: map['apartment'] as String? ?? "",
    );
  }

  @override
  String toString() =>
      'PickingTimeModel(pickingTime: $pickingTime, apartment: $apartment)';

  @override
  bool operator ==(covariant PickingTimeModel other) {
    if (identical(this, other)) return true;

    return other.pickingTime == pickingTime && other.apartment == apartment;
  }

  @override
  int get hashCode => pickingTime.hashCode ^ apartment.hashCode;
}
