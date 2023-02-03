import 'dart:async';

import 'package:get/get.dart' hide Response;
import 'package:getx_clean/domain/core/database/storage.dart';
import 'package:getx_clean/domain/core/network/connectivity/internet_connectivity.dart';

import '../../../app/core/base_widgets/base_snackbar_widget.dart';
import '../network/base/response_handler.dart';

// ? Super Controller to handle states and errors with connectivity checks
class SuperStateController<T, P> extends GetxController {
  T? stateController;

  // * this Map helps us to call multiple API at same point
  late Rx<NetworkResponse<P>> state;

  late StreamSubscription<NetworkResponse<P>> subscription; // * Stream to listen data

  networkCalls(Stream<NetworkResponse<P>> Function() method) async {
    state = NetworkResponse<P>.loading().obs;
    subscription = method().listen(null);
    subscription.onData(
      (event) {
        if (event.isError) {
          subscription.cancel();
          state = NetworkResponse<P>.error(error: event.error).obs;
          return;
        } else {
          state = NetworkResponse<P>.success(data: event.data).obs;
        }
        update();
      },
    );
  }

  @override
  void onInit() {
    checkConnectivity();
    super.onInit();
  }
}

extension InternetConnectionChecker on GetxController {
  checkConnectivity() {
    RxBool isOnline = RxBool(true);
    final connection = Get.find<ConnectivityCheck>();
    connection.connectionStream.stream.listen((event) {
      isOnline(event);
    });
    ever(isOnline, (callback) => showSnackBar(callback ? "Online" : "Offline"));

    ever(isOnline, (callback) {});
  }
}

extension LocalStorageClean on GetxController {
  clearLocalStorage({String? key}) {
    LocalStorage localStorageInstance = Get.find<LocalStorage>();
    if (key == null) {
      localStorageInstance.deleteAllSecureData();
    } else {
      localStorageInstance.deleteSecureData(key);
    }
  }
}
