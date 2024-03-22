// ignore: dangling_library_doc_comments
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasteapp/exceptions/exception_parsing.dart';
import 'package:wasteapp/models/message_model.dart';
import 'package:wasteapp/repos/conversation_repo.dart';
import 'package:wasteapp/repos/user_repo.dart';
import 'package:wasteapp/utilities/constants/constants.dart';
import 'package:wasteapp/utilities/extensions/date_extension.dart';

/// Project: 	   wasteapp
/// File:    	   message_repo
/// Path:    	   lib/repos/message_repo.dart
/// Author:       Ali Akbar
/// Date:        21-03-24 15:00:37 -- Thursday
/// Description:

class MessageRepo {
  // ===========================Singleton================================
  static final MessageRepo _instance = MessageRepo._internal();
  MessageRepo._internal();
  factory MessageRepo() => _instance;
  // ====================================================================

  List<MessageModel> _messages = [];
  List<GroupedMessageModel> get messages {
    final List<GroupedMessageModel> groupedMessages = [];
    for (final message in _messages) {
      final DateTime date = message.messageTime.onlyDate();
      final int index =
          groupedMessages.indexWhere((element) => element.date == date);
      if (index > -1) {
        groupedMessages[index].messages.add(message);
      } else {
        groupedMessages
            .add(GroupedMessageModel(date: date, messages: [message]));
      }
    }
    groupedMessages.sort((a, b) =>
        b.date.millisecondsSinceEpoch.compareTo(a.date.millisecondsSinceEpoch));
    return groupedMessages;
  }

  // Fetch Messages
  Future<void> fetchMessages() async {
    try {
      final String conversationId =
          ConversationRepo().conversation.conversationId;
      final FirebaseFirestore instance = FirebaseFirestore.instance;
      final snapshotQuery = await instance
          .collection(FIREBASE_COLLECTION_CONVERSATIONS)
          .doc(conversationId)
          .collection(FIREBASE_COLLECTION_MESSAGES)
          .get();
      final List<Map<String, dynamic>> mapData =
          snapshotQuery.docs.map((e) => e.data()).toList();
      _messages = mapData.map((e) => MessageModel.fromMap(e)).toList();
    } catch (e) {
      throw thrownAppException(e: e);
    }
  }

  // Send Message
  Future<void> sendMessage(
      {required MessageType type, required String content}) async {
    try {
      final String conversationId =
          ConversationRepo().conversation.conversationId;
      final String userId = UserRepo().currentUser.uid;
      final FirebaseFirestore instance = FirebaseFirestore.instance;
      final ref = instance
          .collection(FIREBASE_COLLECTION_CONVERSATIONS)
          .doc(conversationId)
          .collection(FIREBASE_COLLECTION_MESSAGES)
          .doc();
      final MessageModel messageModel = MessageModel(
          messageId: ref.id,
          conversationId: conversationId,
          content: content,
          messageTime: DateTime.now(),
          type: type,
          senderId: userId);

      await ref.set(messageModel.toMap());
    } catch (e) {
      throw thrownAppException(e: e);
    }
  }
}
