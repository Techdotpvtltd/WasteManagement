// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// Project: 	   waste_admin
// File:    	   appartment
// Path:    	   lib/models/appartment.dart
// Author:       Ali Akbar
// Date:        17-04-24 17:27:17 -- Wednesday
// Description:

class AppartmentModel {
  final String id;
  final String appartment;
  final String address;
  final DateTime createdAt;
  AppartmentModel({
    required this.id,
    required this.appartment,
    required this.address,
    required this.createdAt,
  });

  AppartmentModel copyWith({
    String? id,
    String? appartment,
    String? address,
    DateTime? createdAt,
  }) {
    return AppartmentModel(
      id: id ?? this.id,
      appartment: appartment ?? this.appartment,
      address: address ?? this.address,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory AppartmentModel.fromMap(Map<String, dynamic> map) {
    return AppartmentModel(
      id: map['id'] as String,
      appartment: map['appartment'] as String,
      address: map['address'] as String,
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }

  factory AppartmentModel.fromJson(String source) =>
      AppartmentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AppartmentModel(id: $id, appartment: $appartment, address: $address, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant AppartmentModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.appartment == appartment &&
        other.address == address &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        appartment.hashCode ^
        address.hashCode ^
        createdAt.hashCode;
  }
}
