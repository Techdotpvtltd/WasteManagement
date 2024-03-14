// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: dangling_library_doc_comments
/// Project: 	   playtogethher
/// File:    	   user_model
/// Path:    	   lib/model/user_model.dart
/// Author:       Ali Akbar
/// Date:        08-03-24 14:13:23 -- Friday
/// Description:

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String avatar;
  final String phoneNumber;
  final String agent;
  final String address;

  final DateTime createdAt;
  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.avatar,
    required this.createdAt,
    required this.phoneNumber,
    required this.agent,
    required this.address,
  });

  UserModel copyWith({
    String? uid,
    String? name,
    String? email,
    String? avatar,
    String? phoneNumber,
    String? agent,
    String? address,
    DateTime? createdAt,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      agent: agent ?? this.agent,
      address: address ?? this.address,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'email': email,
      'avatar': avatar,
      'phone': phoneNumber,
      'agent': agent,
      'address': address,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      name: map['name'] as String? ?? "",
      email: map['email'] as String? ?? "",
      avatar: map['avatar'] as String? ?? "",
      phoneNumber: map['phone'] as String? ?? "",
      agent: map['agent'] as String? ?? "",
      address: map['address'] as String? ?? "",
      createdAt: (map['createdAt'] as Timestamp? ?? Timestamp.now()).toDate(),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(uid: $uid, name: $name, email: $email, avatar: $avatar, createdAt: $createdAt, address: $address, phone: $phoneNumber, agent: $agent)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.name == name &&
        other.email == email &&
        other.avatar == avatar &&
        other.address == address &&
        other.phoneNumber == phoneNumber &&
        other.agent == agent &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        name.hashCode ^
        email.hashCode ^
        avatar.hashCode ^
        phoneNumber.hashCode ^
        address.hashCode ^
        agent.hashCode ^
        createdAt.hashCode;
  }
}
