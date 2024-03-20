// ignore: dangling_library_doc_comments
/// Project: 	   wasteapp
/// File:    	   request_event
/// Path:    	   lib/blocs/request/request_event.dart
/// Author:       Ali Akbar
/// Date:        20-03-24 13:54:37 -- Wednesday
/// Description:

abstract class RequestEvent {}

// Send Request Event
class RequestEventSend extends RequestEvent {
  final String requestMessage;

  RequestEventSend({required this.requestMessage});
}
