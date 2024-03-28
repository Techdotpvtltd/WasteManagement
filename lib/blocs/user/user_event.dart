// ignore: dangling_library_doc_comments
import 'package:wasteapp/models/user_model.dart';

/// Project: 	   playtogethher
/// File:    	   user_event
/// Path:    	   lib/blocs/user/user_event.dart
/// Author:       Ali Akbar
/// Date:        13-03-24 15:41:39 -- Wednesday
/// Description:
///

abstract class UserEvent {}

/// Update Profile Event
class UserEventUpdateProfile extends UserEvent {
  final String? avatarUrl;
  final String name;
  final String email;
  final String phone;
  final String apartment;
  final UserLocation? location;
  UserEventUpdateProfile({
    this.avatarUrl,
    required this.name,
    required this.email,
    required this.phone,
    required this.apartment,
    this.location,
  });
}
