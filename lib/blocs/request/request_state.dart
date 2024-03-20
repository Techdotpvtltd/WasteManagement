// ignore: dangling_library_doc_comments
import 'package:wasteapp/exceptions/app_exceptions.dart';
import 'package:wasteapp/models/request_model.dart';

/// Project: 	   wasteapp
/// File:    	   request_state
/// Path:    	   lib/blocs/request/request_state.dart
/// Author:       Ali Akbar
/// Date:        20-03-24 13:50:59 -- Wednesday
/// Description:

abstract class RequestState {
  final bool isLoading;
  final String loadingText;

  RequestState({this.isLoading = false, this.loadingText = "Processing..."});
}

/// Initial State
class RequestStateInitial extends RequestState {}

// ===========================Send Request States================================
class RequestStateSending extends RequestState {
  RequestStateSending(
      {super.isLoading = true, super.loadingText = "Sending Request..."});
}

class RequestStateSendingFailure extends RequestState {
  final AppException exception;

  RequestStateSendingFailure({required this.exception});
}

class RequestStateSent extends RequestState {}

// ===========================Fetch Requests States================================
class RequestStateFetching extends RequestState {
  RequestStateFetching(
      {super.isLoading = true, super.loadingText = "Fetching..."});
}

class RequestStateFetchFailure extends RequestState {
  final AppException exception;

  RequestStateFetchFailure({required this.exception});
}

class RequestStateFetched extends RequestState {
  final List<RequestModel> requests;

  RequestStateFetched({required this.requests});
}

// =========================== Rate Response States ================================
class RequestStateRating extends RequestState {
  RequestStateRating({super.isLoading = true, super.loadingText = "Rating..."});
}

class RequestStateRatingFailure extends RequestState {
  final AppException exception;

  RequestStateRatingFailure({required this.exception});
}

class RequestStateRated extends RequestState {}
