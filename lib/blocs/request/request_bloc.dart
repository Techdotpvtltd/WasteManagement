// ignore: dangling_library_doc_comments
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasteapp/blocs/request/request_event.dart';
import 'package:wasteapp/blocs/request/request_state.dart';

/// Project: 	   wasteapp
/// File:    	   request_bloc
/// Path:    	   lib/blocs/request/request_bloc.dart
/// Author:       Ali Akbar
/// Date:        20-03-24 13:56:12 -- Wednesday
/// Description:

class RequestBloc extends Bloc<RequestEvent, RequestState> {
  RequestBloc() : super(RequestStateInitial()) {
    // Send Request Event
    on<RequestEventSend>(
      (event, emit) async {},
    );
  }
}
