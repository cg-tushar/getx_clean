import 'dart:async';

import 'package:get/get.dart' hide Response;
import 'package:getx_clean/domain/core/database/storage.dart';
import 'package:getx_clean/domain/core/network/connectivity/internet_connectivity.dart';

import '../../../app/core/base_widgets/base_snackbar_widget.dart';
import '../network/base/response_handler.dart';

// ? Super Controller to handle states and errors with connectivity checks

abstract class StateController<T, P> extends GetxController {
  T? stateController;

  late Rx<NetworkResponse<P>> state;

  late StreamSubscription<NetworkResponse<P>> subscription; // * Stream to listen data

  networkCalls(Stream<NetworkResponse<P>> Function() method) async {
    state = NetworkResponse<P>.loading().obs;
    subscription = method().listen((event) {
      state.value = event.isError ? NetworkResponse<P>.error(error: event.error) : NetworkResponse<P>.success(data: event.data);
      update();
    });
  }
}

class SuperStateController<T, P> extends StateController<T, P> {
  @override
  void onInit() {
    checkConnectivity();
    super.onInit();
  }
}

extension ConnectivityChecker on GetxController {
  void checkConnectivity() {
    RxBool isOnline = RxBool(true);
    final connection = Get.find<ConnectivityCheck>();
    connection.connectionStream.stream.listen((event) {
      isOnline(event);
    });
    ever(isOnline, (callback) => showSnackBar(callback ? "Online" : "Offline"));

    ever(isOnline, (callback) {});
  }
}

extension LocalStorageCleaner on GetxController {
  void clearLocalStorage({String? key}) {
    LocalStorage localStorageInstance = Get.find<LocalStorage>();
    if (key == null) {
      localStorageInstance.deleteAllSecureData();
    } else {
      localStorageInstance.deleteSecureData(key);
    }
  }
}
