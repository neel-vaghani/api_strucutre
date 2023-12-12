import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

InterceptorsWrapper getInterceptor(String loggerName) {
  return InterceptorsWrapper(
    // onRequest
    onRequest: (request, handler) async {
      log("💎 💎 💎 💎 💎  * API * 💎 💎 💎 💎 💎 ");
      log(
        '${request.uri} || ${jsonEncode(request.headers)} || ${request.data}',
      );
      handler.next(request);
    },

    // onResponse
    onResponse: (response, handler) {
      log("💀 💀 💀 💀 💀 * RESPONSE * 💀 💀 💀 💀 💀");
      log(
        'STATUS: ${response.statusCode} | RESPONSE: ${json.encode(response.data)}',
        name: loggerName,
      );
      handler.next(response);
    },

    // onError
    onError: (error, handler) {
      log(
        'ERROR-TYPE: ${error.type} | ERROR ${error.error}',
        name: loggerName,
      );
      handler.next(error);
    },
  );
}
