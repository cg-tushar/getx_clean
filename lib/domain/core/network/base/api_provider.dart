import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get_connect/connect.dart';

import '../../../../infrastructure/dal/services/logger_service.dart';
import '../../database/get_key.dart';
import '../../database/interfaces/local_db_interface.dart';
import '../../database/storage.dart';
import 'api_exceptions.dart';
import 'api_request_representable.dart';

class APIProvider {
  static const requestTimeOut = Duration(seconds: 25);
  final _client = GetConnect(timeout: requestTimeOut);

  static final _singleton = APIProvider._();
  static APIProvider get instance => _singleton;
  final _cacheKeyGenerator = CacheKeyGenerator();

  APIProvider._();

  Stream<Response> request(APIRequestRepresentable request) async* {
    try {
      if (request.cache) {
        final localItem = await LocalStorage.instance.readSecureData(_cacheKeyGenerator.generate(request.path, request.query));
        if (localItem != null) {
          LoggerService.instance.logAPILocalData(data: localItem, key: _cacheKeyGenerator.generate(request.path, request.query));
          yield Response(body: jsonDecode(localItem), statusCode: 200);
        }
      }
      final response = await _client.request(
        request.url,
        HTTPMethod.get.string,
        headers: request.headers,
        query: request.query,
        body: request.body,
      );
      LoggerService.instance.logAPICalls(response);
      if (response.isOk) {
        LocalStorage.instance.writeSecureData(StorageItem(_cacheKeyGenerator.generate(request.path, request.query), jsonEncode(response.body)));
        yield response;
      }
    } on TimeoutException catch (_) {
      LoggerService.instance.logger.e(_);
      throw TimeOutException(null);
    } on SocketException {
      LoggerService.instance.logger.e('No Internet connection');
      throw FetchDataException('No Internet connection');
    }
  }
}

// class APIProvider {
//   static const requestTimeOut = Duration(seconds: 25);
//   final _client = GetConnect(timeout: requestTimeOut);
//
//   static final _singleton = APIProvider();
//   static APIProvider get instance => _singleton;
//
//   // * APIRequestRepresentable: type of request we are performing with all data like url,endpoints,query and more
//   Stream<Response> request(APIRequestRepresentable request) async* {
//     try {
//       if (request.cache) {
//         // get cache data
//         final localItem = await LocalStorage.instance.readSecureData(getKey(request.path, request.query));
//         if (localItem != null) {
//           // return the cache data
//           GetLogService.instance.logAPILocalData(data: localItem, key: getKey(request.path, request.query));
//           yield Response(body: jsonDecode(localItem), statusCode: 200);
//         }
//       }
//       final response = await _client.request(
//         request.url,
//         HTTPMethod.get.string,
//         headers: request.headers,
//         query: request.query,
//         body: request.body,
//       );
//       GetLogService.instance.logAPICalls(response);
//       // >>>[ check the response is ok and cache is enabled ]
//       if (response.isOk) {
//         // >>>[ updating local storage with new data]
//         LocalStorage.instance.writeSecureData(StorageItem(getKey(request.path, request.query), jsonEncode(response.body)));
//         yield response;
//       }
//     } on TimeoutException catch (_) {
//       GetLogService.instance.logger.e(_);
//
//       throw TimeOutException(null);
//     } on SocketException {
//       GetLogService.instance.logger.e('No Internet connection');
//       throw FetchDataException('No Internet connection');
//     }
//   }
// }
