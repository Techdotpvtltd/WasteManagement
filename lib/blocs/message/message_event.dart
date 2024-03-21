// ignore: dangling_library_doc_comments
import 'package:wasteapp/models/message_model.dart';

/// Project: 	   wasteapp
/// File:    	   message_event
/// Path:    	   lib/blocs/message/message_event.dart
/// Author:       Ali Akbar
/// Date:        21-03-24 14:56:30 -- Thursday
/// Description:

abstract class MessageEvent {}

// Fetch Messages Event
class MessageEventFetch extends MessageEvent {}

// Send Message Event
class MessageEventSend extends MessageEvent {
  final String content;
  final MessageType type;

  MessageEventSend({required this.content, required this.type});
}
