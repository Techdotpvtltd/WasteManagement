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
  final UserLocation? location;
  final DateTime createdAt;
  final String apartment;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.avatar,
    required this.createdAt,
    required this.phoneNumber,
    this.location,
    required this.apartment,
  });

  UserModel copyWith({
    String? uid,
    String? name,
    String? email,
    String? avatar,
    String? phoneNumber,
    String? apartment,
    String? address,
    DateTime? createdAt,
    UserLocation? location,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      apartment: apartment ?? this.apartment,
      createdAt: createdAt ?? this.createdAt,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'email': email,
      'avatar': avatar,
      'phone': phoneNumber,
      'apartment': apartment,
      'createdAt': Timestamp.fromDate(createdAt),
      'location': location?.toMap(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      name: map['name'] as String? ?? "",
      email: map['email'] as String? ?? "",
      avatar: map['avatar'] as String? ?? "",
      phoneNumber: map['phone'] as String? ?? "",
      apartment: map['apartment'] as String? ?? "",
      createdAt: (map['createdAt'] as Timestamp? ?? Timestamp.now()).toDate(),
      location: map['location'] != null
          ? UserLocation.fromMap(map['location'])
          : null,
    );
  }

  @override
  String toString() {
    return 'UserModel(uid: $uid, name: $name, email: $email, avatar: $avatar, createdAt: $createdAt, phone: $phoneNumber, apartment: $apartment), location: $location';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.name == name &&
        other.email == email &&
        other.avatar == avatar &&
        other.phoneNumber == phoneNumber &&
        other.apartment == apartment &&
        other.location == location &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        name.hashCode ^
        email.hashCode ^
        avatar.hashCode ^
        phoneNumber.hashCode ^
        apartment.hashCode ^
        location.hashCode ^
        createdAt.hashCode;
  }
}

class UserLocation {
  final String? address;
  final String? city;
  final String? country;
  final double? latitude;
  final double? longitude;
  UserLocation({
    this.address,
    this.city,
    this.country,
    this.latitude,
    this.longitude,
  });

  UserLocation copyWith({
    String? address,
    String? city,
    String? country,
    double? latitude,
    double? longitude,
  }) {
    return UserLocation(
      address: address ?? this.address,
      city: city ?? this.city,
      country: country ?? this.country,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'address': address,
      'city': city,
      'country': country,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory UserLocation.fromMap(Map<String, dynamic> map) {
    return UserLocation(
      address: map['address'] != null ? map['address'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
      latitude: map['latitude'] != null ? map['latitude'] as double : null,
      longitude: map['longitude'] != null ? map['longitude'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserLocation.fromJson(String source) =>
      UserLocation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserLocation(address: $address, city: $city, country: $country, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(covariant UserLocation other) {
    if (identical(this, other)) return true;

    return other.address == address &&
        other.city == city &&
        other.country == country &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    return address.hashCode ^
        city.hashCode ^
        country.hashCode ^
        latitude.hashCode ^
        longitude.hashCode;
  }
}
