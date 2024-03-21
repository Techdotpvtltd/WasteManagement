// ignore: dangling_library_doc_comments
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasteapp/exceptions/data_exceptions.dart';
import 'package:wasteapp/exceptions/exception_parsing.dart';
import 'package:wasteapp/models/conversation_model.dart';
import 'package:wasteapp/models/user_model.dart';
import 'package:wasteapp/repos/user_repo.dart';
import 'package:wasteapp/utilities/constants/constants.dart';

/// Project: 	   wasteapp
/// File:    	   conversation_repo
/// Path:    	   lib/repos/conversation_repo.dart
/// Author:       Ali Akbar
/// Date:        21-03-24 13:28:55 -- Thursday
/// Description:

class ConversationRepo {
  // ===========================Singleton================================
  static final ConversationRepo _instance = ConversationRepo._internal();
  ConversationRepo._internal();
  factory ConversationRepo() => _instance;
  // ===================================================================
  ConversationModel? _conversation;
  ConversationModel get conversation => _conversation == null
      ? throw DataExceptionNotFound(message: "Conversation not found.")
      : _conversation!;

  /// Create or Fetch Conversations
  Future<void> fetchOrCreateConversation() async {
    try {
      final UserModel user = UserRepo().currentUser;
      final FirebaseFirestore instance = FirebaseFirestore.instance;
      final querySnapshot = await instance
          .collection(FIREBASE_COLLECTION_CONVERSATIONS)
          .where("participants", arrayContains: user.uid)
          .limit(1)
          .get();
      // ignore: sdk_version_since
      final mappedData = querySnapshot.docs.firstOrNull?.data();
      if (mappedData != null) {
        _conversation = ConversationModel.fromMap(mappedData);
        return;
      }

      // Create New one if not existed

      final DocumentReference<Map<String, dynamic>> ref =
          instance.collection(FIREBASE_COLLECTION_CONVERSATIONS).doc();
      final ConversationModel conversationModel = ConversationModel(
          conversationId: ref.id,
          participants: [user.uid],
          createdAt: DateTime.now(),
          createdBy: user.uid);
      await ref.set(conversationModel.toMap());
      _conversation = conversationModel;
    } catch (e) {
      throw thrownAppException(e: e);
    }
  }
}
