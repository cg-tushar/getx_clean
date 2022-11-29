import 'package:get/get_connect.dart' as get_connect;
import 'package:get/instance_manager.dart';

import '../model/base_model.dart';

class NetworkResponseHandler<T extends BaseModel> {
  response(get_connect.Response response) {
    switch (response.statusCode) {
      case 200:
        return NetworkResponse<T>(data: Get.find<T>().fromJson(response.body));
      default:
        return NetworkResponse(
          error: response.statusText,
          statusCode: response.statusCode ?? 0,
          isError: true,
        );
    }
  }
}

class NetworkResponse<T> {
  T? data;
  int? statusCode;
  String? error;
  bool isError;
  NetworkResponse({
    this.data,
    this.error = '',
    this.statusCode = 0,
    this.isError = false,
  });
}
