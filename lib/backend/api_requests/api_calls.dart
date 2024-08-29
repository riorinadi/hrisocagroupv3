import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ClockInCall {
  static Future<ApiCallResponse> call({
    String? userRef = '',
    String? checkIn = '',
    String? officeRef = '',
    String? dateIn = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userRef": "$userRef",
  "checkIn": "$checkIn",
  "officeRef": "$officeRef",
  "dateIn": "$dateIn"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ClockIn',
      apiUrl: 'https://hook.us1.make.com/z1xb1c39aw6svfjfg3c2kpvcmmwendko',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ClockOutCall {
  static Future<ApiCallResponse> call({
    String? userRef = '',
    String? dateOut = '',
    String? clockOut = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userRef": "$userRef",
  "dateOut": "$dateOut",
  "clockOut": "$clockOut"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ClockOut',
      apiUrl: 'https://hook.us1.make.com/424gz6s8jxc5bu9gvfxcba2si71jfeos',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
