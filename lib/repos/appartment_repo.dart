// Project: 	   waste_admin
// File:    	   appartment_repo
// Path:    	   lib/repos/appartment_repo.dart
// Author:       Ali Akbar
// Date:        17-04-24 17:28:46 -- Wednesday
// Description:

import '../exceptions/exception_parsing.dart';
import '../models/appartment.dart';
import '../utilities/constants/constants.dart';
import '../web_services/firestore_services.dart';

class AppartmentRepo {
  static final AppartmentRepo _instance = AppartmentRepo._internal();
  AppartmentRepo._internal();
  factory AppartmentRepo() => _instance;

  List<AppartmentModel> _appartments = [];
  List<AppartmentModel> get appartments => _appartments;

  // =========================== Fetch Appartments ================================
  Future<void> fetchAppartments() async {
    try {
      final List<Map<String, dynamic>> data = await FirestoreService()
          .fetchWithMultipleConditions(
              collection: FIREBASE_COLLECTION_APPARTMENT, queries: []);
      _appartments = data.map((e) => AppartmentModel.fromMap(e)).toList();
      _appartments.sort((a, b) =>
          a.appartment.toLowerCase().compareTo(b.appartment.toLowerCase()));
    } catch (e) {
      throw thrownAppException(e: e);
    }
  }
}
