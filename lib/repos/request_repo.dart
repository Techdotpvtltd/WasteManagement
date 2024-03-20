// ignore: dangling_library_doc_comments
import 'package:wasteapp/exceptions/data_exceptions.dart';
import 'package:wasteapp/exceptions/exception_parsing.dart';
import 'package:wasteapp/models/request_model.dart';
import 'package:wasteapp/models/user_model.dart';
import 'package:wasteapp/repos/user_repo.dart';
import 'package:wasteapp/utilities/constants/constants.dart';
import 'package:wasteapp/web_services/firestore_services.dart';

/// Project: 	   wasteapp
/// File:    	   request_repo
/// Path:    	   lib/repos/request_repo.dart
/// Author:       Ali Akbar
/// Date:        20-03-24 14:03:28 -- Wednesday
/// Description:

class RequestRepo {
  // Create Request
  Future<void> sendRequest({required String requestMessage}) async {
    try {
      if (requestMessage == "") {
        throw throwDataException(
            errorCode: "request-message-required",
            message: "Please write your special request.");
      }
      final UserModel user = UserRepo().currentUser;
      final RequestModel model = RequestModel(
        id: "",
        requester: RequesterModel(
          requesterId: user.uid,
          request: requestMessage,
          requestTime: DateTime.now(),
        ),
      );
      await FirestoreService().saveWithSpecificIdFiled(
          path: FIREBASE_COLLECTION_SPECIAL_REQUESTS,
          data: model.toMap(),
          docIdFiled: "id");
    } catch (e) {
      throw thrownAppException(e: e);
    }
  }
}
