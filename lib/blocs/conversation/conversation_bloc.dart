// ignore: dangling_library_doc_comments
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasteapp/blocs/conversation/conversation_event.dart';
import 'package:wasteapp/blocs/conversation/conversation_state.dart';
import 'package:wasteapp/exceptions/app_exceptions.dart';
import 'package:wasteapp/repos/conversation_repo.dart';

/// Project: 	   wasteapp
/// File:    	   conversation_bloc
/// Path:    	   lib/blocs/conversation/conversation_bloc.dart
/// Author:       Ali Akbar
/// Date:        21-03-24 13:26:42 -- Thursday
/// Description:

class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  ConversationBloc() : super(ConversationStateInitial()) {
    // Create Or Fetch Conversation Event
    on<ConversationEventCreateOrFetch>(
      (event, emit) async {
        try {
          emit(ConversationStateCreatingOrFetchingExisted());
          await ConversationRepo().fetchOrCreateConversation();
          emit(ConversationStateCreatedOrFetchedExisted());
        } on AppException catch (e) {
          debugPrint(e.message.toString());
          emit(ConversationStateCreateOrFetchExistedFailure(exception: e));
        }
      },
    );
  }
}
