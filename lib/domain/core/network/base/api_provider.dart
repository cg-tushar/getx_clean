import 'dart:async';
import 'dart:io';

import 'package:get/get_connect/connect.dart';

import '../../../../infrastructure/dal/services/logger_service.dart';
import '../api/api_endpoint.dart';
import 'api_exceptions.dart';
import 'api_request_representable.dart';


class APIProvider {
  static const requestTimeOut = Duration(seconds: 25);
  final _client = GetConnect(timeout: requestTimeOut);

  static final _singleton = APIProvider();
  static APIProvider get instance => _singleton;

  Future<Response> request(APIRequestRepresentable request) async {
    try {
      final response = await _client.request(
        APIEndpoint.newsapi,
        HTTPMethod.get.string,
        headers: request.headers,
        query: request.query,
        body: request.body,
      );
      GetLogService.instance.logAPICalls(response, request);
      return response;
    } on TimeoutException catch (_) {
      GetLogService.instance.logger.e(_);

      throw TimeOutException(null);
    } on SocketException {
      GetLogService.instance.logger.e('No Internet connection');
      throw FetchDataException('No Internet connection');
    }
  }

  dynamic _returnResponse(Response<dynamic> response) {
    return response;
    // switch (response.statusCode) {
    //   case 200:
    //     return response.body;
    //   case 400:
    //     throw BadRequestException(response.body.toString());
    //   case 401:
    //   case 403:
    //     throw UnauthorisedException(response.body.toString());
    //   case 404:
    //     throw BadRequestException('Not found');
    //   case 500:
    //     throw FetchDataException('Internal Server Error');
    //   default:
    //     throw FetchDataException(
    //         'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    // }
  }
}
