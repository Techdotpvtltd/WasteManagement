// Project: 	   waste_admin
// File:    	   appartment_bloc
// Path:    	   lib/blocs/appartment/appartment_bloc.dart
// Author:       Ali Akbar
// Date:        17-04-24 17:25:01 -- Wednesday
// Description:

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../exceptions/app_exceptions.dart';
import '../../repos/appartment_repo.dart';
import 'appartment_state.dart';

import 'appartment_event.dart';

class AppartmentBloc extends Bloc<AppartmentEvent, AppartmentState> {
  AppartmentBloc() : super(AppartmentStateInitial()) {
    on<AppartmentEventFetch>((event, emit) async {
      try {
        emit(AppartmentStateFetching());
        await AppartmentRepo().fetchAppartments();
        emit(AppartmentStateFetched());
      } on AppException catch (e) {
        emit(AppartmentStateFetchFailure(exception: e));
      }
    });
  }
}
