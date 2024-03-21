// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

// ignore: dangling_library_doc_comments
/// Project: 	   wasteapp
/// File:    	   conversation_model
/// Path:    	   lib/models/conversation_model.dart
/// Author:       Ali Akbar
/// Date:        21-03-24 12:55:31 -- Thursday
/// Description:

class ConversationModel {
  final String conversationId;
  final List<String> participants;
  final DateTime createdAt;
  final String createdBy;
  ConversationModel({
    required this.conversationId,
    required this.participants,
    required this.createdAt,
    required this.createdBy,
  });

  ConversationModel copyWith({
    String? conversationId,
    List<String>? participants,
    DateTime? createdAt,
    String? createdBy,
  }) {
    return ConversationModel(
      conversationId: conversationId ?? this.conversationId,
      participants: participants ?? this.participants,
      createdAt: createdAt ?? this.createdAt,
      createdBy: createdBy ?? this.createdBy,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'conversationId': conversationId,
      'participants': participants,
      'createdAt': Timestamp.fromDate(createdAt),
      'createdBy': createdBy,
    };
  }

  factory ConversationModel.fromMap(Map<String, dynamic> map) {
    return ConversationModel(
      conversationId: map['conversationId'] as String,
      participants: (map['participants'] as List<dynamic>)
          .map((e) => e.toString())
          .toList(),
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      createdBy: map['createdBy'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ConversationModel.fromJson(String source) =>
      ConversationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ConversationModel(conversationId: $conversationId, participants: $participants, createdAt: $createdAt, createdBy: $createdBy)';
  }

  @override
  bool operator ==(covariant ConversationModel other) {
    if (identical(this, other)) return true;

    return other.conversationId == conversationId &&
        listEquals(other.participants, participants) &&
        other.createdAt == createdAt &&
        other.createdBy == createdBy;
  }

  @override
  int get hashCode {
    return conversationId.hashCode ^
        participants.hashCode ^
        createdAt.hashCode ^
        createdBy.hashCode;
  }
}
