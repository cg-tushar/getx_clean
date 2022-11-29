import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../domain/core/network/base/api_request_representable.dart';



class GetLogService {
  static final instance = GetLogService._();
  GetLogService._();

  Logger logger = Logger(printer: PrettyPrinter());
  void logAPICalls(Response response) {
    logger.i("""
  REQUEST: ${response.request!.method},
  URL: ${response.request!.url}
  HEADERS: ${response.request!.headers}
  POST DATA: ${response.request!.bodyBytes}
  REQUEST PARAMS: ${response.request},               


  RESPONSE STATUS CODE: ${response.statusCode},               
  RESPONSE: ${response.body},               
  """);
    // logger.d(response.status);
    // logger.d(response.status);
  }

  logAPIErrors(Response response, String error) {
    logger.e("""
  REQUEST: ${response.request!.method},
  URL: ${response.request!.url}
  HEADERS: ${response.request!.headers}
  POST DATA: ${response.request!.bodyBytes}
  REQUEST PARAMS: ${response.request},               
  --------------------------------
  RESPONSE STATUS CODE: ${response.statusCode},               
  RESPONSE: ${response.body},    
  [ERROR]: $error,   
              
  """);
  }
  logAPILocalData(String res){
    logger.v(""" 
    LOCAL STORAGE DATA: $res
    """);
  }
}
