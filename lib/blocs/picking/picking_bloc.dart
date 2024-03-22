// ignore: dangling_library_doc_comments
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasteapp/blocs/picking/picking_event.dart';
import 'package:wasteapp/blocs/picking/picking_state.dart';
import 'package:wasteapp/exceptions/app_exceptions.dart';
import 'package:wasteapp/models/picking_time_model.dart';
import 'package:wasteapp/repos/picking_repo.dart';

/// Project: 	   wasteapp
/// File:    	   picking_bloc
/// Path:    	   lib/blocs/picking/picking_bloc.dart
/// Author:       Ali Akbar
/// Date:        19-03-24 13:49:47 -- Tuesday
/// Description:

class PickingBloc extends Bloc<PickingEvent, PickingState> {
  PickingBloc() : super(PickingStateInitial()) {
    on<PickingEventPickTime>(
      (event, emit) async {
        try {
          emit(PickingStatePickingTime());
          final PickingTimeModel timeModel =
              await PickingRepo().pickLatestTime();
          emit(PickingStateTimePicked(timeModel: timeModel));
        } on AppException catch (e) {
          emit(PickingStatePickingTimeFailure(exception: e));
          debugPrint(e.message.toLowerCase());
        }
      },
    );
  }
}
