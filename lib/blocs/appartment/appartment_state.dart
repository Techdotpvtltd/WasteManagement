// Project: 	   waste_admin
// File:    	   appartment_state
// Path:    	   lib/blocs/appartment/appartment_state.dart
// Author:       Ali Akbar
// Date:        17-04-24 17:18:43 -- Wednesday
// Description:

import '../../exceptions/app_exceptions.dart';

abstract class AppartmentState {
  final String loadingText;
  final bool isLoading;

  AppartmentState({this.loadingText = "", this.isLoading = false});
}

/// initial State
class AppartmentStateInitial extends AppartmentState {}

// ===========================Fetch Appartments================================
class AppartmentStateFetching extends AppartmentState {
  AppartmentStateFetching(
      {super.isLoading = true, super.loadingText = "Fetching Appartments..."});
}

class AppartmentStateFetchFailure extends AppartmentState {
  final AppException exception;

  AppartmentStateFetchFailure({required this.exception});
}

class AppartmentStateFetched extends AppartmentState {}
