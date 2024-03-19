// ignore: dangling_library_doc_comments
import 'package:wasteapp/exceptions/app_exceptions.dart';
import 'package:wasteapp/models/picking_time_model.dart';

/// Project: 	   wasteapp
/// File:    	   picking_state
/// Path:    	   lib/blocs/picking/picking_state.dart
/// Author:       Ali Akbar
/// Date:        19-03-24 13:38:22 -- Tuesday
/// Description:

abstract class PickingState {
  final bool isLoading;
  final String loadingText;

  PickingState({this.isLoading = false, this.loadingText = "Loading..."});
}

// Initial State
class PickingStateInitial extends PickingState {}

// =========================== Picking Time States ================================
class PickingStatePickingTime extends PickingState {
  PickingStatePickingTime(
      {super.isLoading = true, super.loadingText = "Picking Latest Time..."});
}

class PickingStatePickingTimeFailure extends PickingState {
  final AppException exception;

  PickingStatePickingTimeFailure({required this.exception});
}

class PickingStateTimePicked extends PickingState {
  final PickingTimeModel timeModel;

  PickingStateTimePicked({required this.timeModel});
}
