import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasteapp/blocs/message/message_event.dart';
import 'package:wasteapp/blocs/message/message_state.dart';
import 'package:wasteapp/exceptions/app_exceptions.dart';
import 'package:wasteapp/exceptions/exception_parsing.dart';
import 'package:wasteapp/repos/message_repo.dart';

/// Project: 	   wasteapp
/// File:    	   mesaage_bloc
/// Path:    	   lib/blocs/message/mesaage_bloc.dart
/// Author:       Ali Akbar
/// Date:        21-03-24 14:59:11 -- Thursday
/// Description:

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageBloc() : super(MessageStateInitial()) {
    // Fetch Messages Event
    on<MessageEventFetch>((event, emit) async {
      try {
        emit(MessageStateFetching());
        await MessageRepo().fetchMessages(
          onData: () {
            emit(MessageStateFetched());
          },
          onError: (e) {
            emit(MessageStateFetchFailure(exception: e));
          },
        );
      } catch (e) {
        throw thrownAppException(e: e);
      }
    });

    // Send Message Event
    on<MessageEventSend>(
      (event, emit) async {
        try {
          emit(MessageStateSending());
          await MessageRepo().sendMessage(
            type: event.type,
            content: event.content,
            onMessagePrepareToSend: () {
              emit(MessageStatePrepareToSend());
            },
          );
          emit(MessageStateSent());
        } on AppException catch (e) {
          emit(MessageStateSendFailure(exception: e));
        }
      },
    );
  }
}
