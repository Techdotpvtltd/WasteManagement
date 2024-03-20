import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: dangling_library_doc_comments
/// Project: 	   wasteapp
/// File:    	   request_model
/// Path:    	   lib/models/request_model.dart
/// Author:       Ali Akbar
/// Date:        20-03-24 13:33:34 -- Wednesday
/// Description:

class RequestModel {
  final String id;
  final RequesterModel requester;
  final ResponserModel? responser;
  RequestModel({
    required this.id,
    required this.requester,
    this.responser,
  });

  RequestModel copyWith({
    String? id,
    RequesterModel? requester,
    ResponserModel? responser,
  }) {
    return RequestModel(
      id: id ?? this.id,
      requester: requester ?? this.requester,
      responser: responser ?? this.responser,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'requester': requester.toMap(),
    };
  }

  factory RequestModel.fromMap(Map<String, dynamic> map) {
    return RequestModel(
      id: map['id'] as String,
      requester:
          RequesterModel.fromMap(map['requester'] as Map<String, dynamic>),
      responser: map['responser'] != null
          ? ResponserModel.fromMap(map['responser'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  String toString() =>
      'RequestModel(id: $id, requester: $requester, responser: $responser)';

  @override
  bool operator ==(covariant RequestModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.requester == requester &&
        other.responser == responser;
  }

  @override
  int get hashCode => id.hashCode ^ requester.hashCode ^ responser.hashCode;
}

class RequesterModel {
  final String requesterId;
  final String request;
  final DateTime requestTime;
  RequesterModel({
    required this.requesterId,
    required this.request,
    required this.requestTime,
  });

  RequesterModel copyWith({
    String? requesterId,
    String? request,
    DateTime? requestTime,
  }) {
    return RequesterModel(
      requesterId: requesterId ?? this.requesterId,
      request: request ?? this.request,
      requestTime: requestTime ?? this.requestTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'requesterId': requesterId,
      'request': request,
      'requestTime': Timestamp.fromDate(requestTime),
    };
  }

  factory RequesterModel.fromMap(Map<String, dynamic> map) {
    return RequesterModel(
        requesterId: map['requesterId'] as String,
        request: map['request'] as String,
        requestTime: (map['requestTime'] as Timestamp).toDate());
  }

  @override
  String toString() =>
      '_RequesterModel(requesterId: $requesterId, request: $request, requestTime: $requestTime)';

  @override
  bool operator ==(covariant RequesterModel other) {
    if (identical(this, other)) return true;

    return other.requesterId == requesterId &&
        other.request == request &&
        other.requestTime == requestTime;
  }

  @override
  int get hashCode =>
      requesterId.hashCode ^ request.hashCode ^ requestTime.hashCode;
}

class ResponserModel {
  final DateTime responseTime;
  final String response;
  ResponserModel({
    required this.responseTime,
    required this.response,
  });

  factory ResponserModel.fromMap(Map<String, dynamic> map) {
    return ResponserModel(
      responseTime: (map['responseTime'] as Timestamp).toDate(),
      response: map['response'] as String,
    );
  }

  @override
  String toString() =>
      '_ResponserModel(responseTime: $responseTime, response: $response)';

  @override
  bool operator ==(covariant ResponserModel other) {
    if (identical(this, other)) return true;

    return other.responseTime == responseTime && other.response == response;
  }

  @override
  int get hashCode => responseTime.hashCode ^ response.hashCode;
}
