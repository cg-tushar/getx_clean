import 'package:get/get_connect.dart' as get_connect;
import 'package:get/instance_manager.dart';

import '../../model/base_model.dart';

// * Handles the network response

class NetworkResponseHandler<T extends BaseModel> {
  response(get_connect.Response response) {
    switch (response.statusCode) {
      case 200:
        return NetworkResponse<T>(data: Get.find<T>().fromJson(response.body));
      default:
        return NetworkResponse<T>(
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
  NetworkState networkState;

  NetworkResponse({this.data, this.error = '', this.statusCode = 0, this.isError = false, this.networkState = NetworkState.idle});
  NetworkResponse.loading({this.error = '', this.statusCode = 0, this.isError = false, this.networkState = NetworkState.loading});
  NetworkResponse.success({this.error = '', required this.data, this.statusCode = 0, this.isError = false, this.networkState = NetworkState.success});
  NetworkResponse.error({required this.error, this.statusCode = 0, this.isError = true, this.networkState = NetworkState.error});
}

enum NetworkState { loading, success, error, idle }
