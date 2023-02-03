import 'package:get/get.dart';
import 'package:logger/logger.dart';

class LoggerService {
  static final _singleton = LoggerService();
  static LoggerService get instance => _singleton;

  final logger = Logger();

  void logAPICalls(Response response) {
    logger.d(
        '\n[API CALL] \nurl: ${response.request?.url.path} \nmethod: ${response.request?.method} \nheaders: ${response.headers} \nbody: ${response.body}');
  }

  void logAPILocalData({required String key, required String data}) {
    logger.d('\n[API LOCAL Data] \nkey: $key \ndata: $data');
  }
}

// class GetLogService {
//   static final instance = GetLogService._();
//   GetLogService._();
//
//   Logger logger = Logger(printer: PrettyPrinter());
//   void logAPICalls(Response response) {
//     logger.i("""
//   REQUEST: ${response.request!.method},
//   URL: ${response.request!.url}
//   HEADERS: ${response.request!.headers}
//   POST DATA: ${response.request!.bodyBytes}
//   REQUEST PARAMS: ${response.request},
//
//
//   RESPONSE STATUS CODE: ${response.statusCode},
//   RESPONSE: ${response.body},
//   """);
//     // logger.d(response.status);
//     // logger.d(response.status);
//   }
//
//   logAPIErrors(Response response, String error) {
//     logger.e("""
//   REQUEST: ${response.request!.method},
//   URL: ${response.request!.url}
//   HEADERS: ${response.request!.headers}
//   POST DATA: ${response.request!.bodyBytes}
//   REQUEST PARAMS: ${response.request},
//   --------------------------------
//   RESPONSE STATUS CODE: ${response.statusCode},
//   RESPONSE: ${response.body},
//   [ERROR]: $error,
//
//   """);
//   }
//
//   logAPILocalData({required String data, required String key}) {
//     logger.v("""
//     LOCAL STORAGE DATA: KEY::$key\n$data
//     """);
//   }
// }
