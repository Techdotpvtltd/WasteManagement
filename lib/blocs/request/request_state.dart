// ignore: dangling_library_doc_comments
import 'package:wasteapp/exceptions/app_exceptions.dart';

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
