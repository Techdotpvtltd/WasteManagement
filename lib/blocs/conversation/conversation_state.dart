// ignore: dangling_library_doc_comments
import 'package:wasteapp/exceptions/app_exceptions.dart';

/// Project: 	   wasteapp
/// File:    	   conversation_state
/// Path:    	   lib/blocs/conversation/conversation_state.dart
/// Author:       Ali Akbar
/// Date:        21-03-24 13:16:48 -- Thursday
/// Description:

abstract class ConversationState {
  final bool isLoading;
  final String loadingText;

  ConversationState(
      {this.isLoading = false, this.loadingText = "Processing..."});
}

/// Initial State
class ConversationStateInitial extends ConversationState {}

// ===========================Fetch Or Create Existing Conversation States================================
class ConversationStateCreatingOrFetchingExisted extends ConversationState {
  ConversationStateCreatingOrFetchingExisted(
      {super.isLoading = true,
      super.loadingText = "Fetching Existing Conversation"});
}

class ConversationStateCreateOrFetchExistedFailure extends ConversationState {
  final AppException exception;

  ConversationStateCreateOrFetchExistedFailure({required this.exception});
}

class ConversationStateCreatedOrFetchedExisted extends ConversationState {}
