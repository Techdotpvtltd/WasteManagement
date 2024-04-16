// Gap Height  ========================================

// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/widgets.dart';

import '../../main.dart';
import '../../repos/user_repo.dart';

const SizedBox gapH2 = SizedBox(height: 2);
const SizedBox gapH4 = SizedBox(height: 4);
const SizedBox gapH6 = SizedBox(height: 6);
const SizedBox gapH8 = SizedBox(height: 8);
const SizedBox gapH10 = SizedBox(height: 10);
const SizedBox gapH12 = SizedBox(height: 12);
const SizedBox gapH14 = SizedBox(height: 14);
const SizedBox gapH16 = SizedBox(height: 16);
const SizedBox gapH18 = SizedBox(height: 18);
const SizedBox gapH20 = SizedBox(height: 20);
const SizedBox gapH22 = SizedBox(height: 22);
const SizedBox gapH24 = SizedBox(height: 24);
const SizedBox gapH26 = SizedBox(height: 26);
const SizedBox gapH28 = SizedBox(height: 28);
const SizedBox gapH30 = SizedBox(height: 30);
const SizedBox gapH32 = SizedBox(height: 32);
const SizedBox gapH34 = SizedBox(height: 34);
const SizedBox gapH36 = SizedBox(height: 36);
const SizedBox gapH38 = SizedBox(height: 38);
const SizedBox gapH40 = SizedBox(height: 40);
const SizedBox gapH42 = SizedBox(height: 42);
const SizedBox gapH44 = SizedBox(height: 44);
const SizedBox gapH46 = SizedBox(height: 46);
const SizedBox gapH48 = SizedBox(height: 48);
const SizedBox gapH50 = SizedBox(height: 50);

// Gap Weight  ========================================
const SizedBox gapW2 = SizedBox(width: 2);
const SizedBox gapW4 = SizedBox(width: 4);
const SizedBox gapW6 = SizedBox(width: 6);
const SizedBox gapW8 = SizedBox(width: 8);
const SizedBox gapW10 = SizedBox(width: 10);
const SizedBox gapW12 = SizedBox(width: 12);
const SizedBox gapW14 = SizedBox(width: 14);
const SizedBox gapW16 = SizedBox(width: 16);
const SizedBox gapW18 = SizedBox(width: 18);
const SizedBox gapW20 = SizedBox(width: 20);
const SizedBox gapW22 = SizedBox(width: 22);
const SizedBox gapW24 = SizedBox(width: 24);
const SizedBox gapW26 = SizedBox(width: 26);
const SizedBox gapW28 = SizedBox(width: 28);
const SizedBox gapW30 = SizedBox(width: 30);
const SizedBox gapW32 = SizedBox(width: 32);
const SizedBox gapW34 = SizedBox(width: 34);
const SizedBox gapW36 = SizedBox(width: 36);
const SizedBox gapW38 = SizedBox(width: 38);
const SizedBox gapW40 = SizedBox(width: 40);
const SizedBox gapW42 = SizedBox(width: 42);
const SizedBox gapW44 = SizedBox(width: 44);
const SizedBox gapW46 = SizedBox(width: 46);
const SizedBox gapW48 = SizedBox(width: 48);

SizedBox gapSreenHeight(double value) =>
    SizedBox(height: MediaQuery.of(navKey.currentContext!).size.height * value);
SizedBox gapSreenWidth(double value) =>
    SizedBox(width: MediaQuery.of(navKey.currentContext!).size.width * value);

final double screenWidth = MediaQuery.of(navKey.currentContext!).size.width;
final double screenHeight = MediaQuery.of(navKey.currentContext!).size.height;

//  Firebase Collection Path ====================================
const FIREBASE_COLLECTION_USER = "users";
const FIREBASE_COLLECTION_USER_PROFILES = "profiles";
const FIREBASE_COLLECTION_PICKING_TIMES = "pickingTimes";
const FIREBASE_COLLECTION_SPECIAL_REQUESTS = "requests";
const FIREBASE_COLLECTION_CONVERSATIONS = "conversations";
const FIREBASE_COLLECTION_MESSAGES = "messages";

// =========================== Push Notification ================================
final PUSH_NOTIFICATION_CHAT = "chat-${UserRepo().currentUser.uid}";
const PUSH_NOTIFICATION_TRASH_REMINDER = "trash-pickup-reminder";
const PUSH_NOTIFICATION_CHANGE_PICKING_UP_TIME = "change-picking-up-time";
final PUSH_NOTIFICATION_SPECIAL_REQUEST =
    "request-${UserRepo().currentUser.uid}";
final PUSH_NOTIFICATION_APPARTMENT =
    "appartment-${UserRepo().currentUser.apartment}";
