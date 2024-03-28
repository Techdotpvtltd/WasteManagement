// ignore: dangling_library_doc_comments
import 'package:wasteapp/exceptions/data_exceptions.dart';
import 'package:wasteapp/exceptions/exception_parsing.dart';
import 'package:wasteapp/models/picking_time_model.dart';
import 'package:wasteapp/utilities/constants/constants.dart';
import 'package:wasteapp/web_services/firestore_services.dart';

/// Project: 	   wasteapp
/// File:    	   picking_repo
/// Path:    	   lib/repos/picking_repo.dart
/// Author:       Ali Akbar
/// Date:        19-03-24 13:55:42 -- Tuesday
/// Description:

class PickingRepo {
  // =========================== Singleton Instance ================================
  static final PickingRepo _instance = PickingRepo._internal();
  PickingRepo._internal();
  factory PickingRepo() => _instance;
  // ===============================================================================
  PickingTimeModel? timeModel;

  Future<PickingTimeModel> pickLatestTime() async {
    try {
      final mapedData = await FirestoreService().fetchWithMultipleConditions(
          collection: FIREBASE_COLLECTION_PICKING_TIMES, queries: []);
      // ignore: sdk_version_since
      if (mapedData.firstOrNull != null) {
        timeModel = PickingTimeModel.fromMap(mapedData.first);
        return timeModel!;
      }
      throw throwDataException(
          errorCode: "parsing-data-error", message: "Something went wrong");
    } catch (e) {
      throw thrownAppException(e: e);
    }
  }
}
