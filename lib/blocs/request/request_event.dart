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

// Fetch Request Event
class RequestEventFetch extends RequestEvent {}

// Rating Response Event
class RequestEventRateResponse extends RequestEvent {
  final String requestId;
  final String? review;
  final double rating;

  RequestEventRateResponse(
      {required this.requestId, required this.review, required this.rating});
}
