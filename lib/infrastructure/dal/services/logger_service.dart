import 'package:get/get.dart';
import 'package:logger/logger.dart';


class GetLogService {
  static final instance = GetLogService._();
  GetLogService._();

  Logger logger = Logger(printer: PrettyPrinter());
  void logAPICalls(Response response, APIRequestRepresentable request) {
    logger.i("""
  REQUEST: ${request.method},
  URL: ${request.url}
  HEADERS: ${request.headers}
  POST DATA: ${request.body}
  REQUEST PARAMS: ${request.query},         

  RESPONSE STATUS CODE: ${response.statusCode},               
  RESPONSE: ${response.body},               
  """);
    // logger.d(response.status);
    // logger.d(response.status);
  }

  logAPIErrors(Response response, APIRequestRepresentable request, String error) {
    logger.e("""
  REQUEST: ${request.method},
  URL: ${request.url}
  HEADERS: ${request.headers}
  POST DATA: ${request.body}
  REQUEST PARAMS: ${request.query},               
  --------------------------------
  RESPONSE STATUS CODE: ${response.statusCode},               
  RESPONSE: ${response.body},    
  [ERROR]: $error,   
              
  """);
  }
}
