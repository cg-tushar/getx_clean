import 'dart:async';
import 'package:get/get.dart' hide Response;
import 'package:getx_clean/domain/core/network/connectivity/internet_connectivity.dart';

import '../../../app/core/base_widgets/base_snackbar_widget.dart';
import '../network/base/response_handler.dart';

class SuperStateController<T> extends GetxController
    with StateMixin<NetworkResponse> {
  dynamic controller;
  Rxn<NetworkCall> currentCall = Rxn();
  RxBool isOnline = RxBool(true);
  final connection = Get.find<ConnectivityCheck>();
  RxMap stateData = RxMap({
    NetworkCall.one: null,
    NetworkCall.two: null,
    NetworkCall.three: null,
    NetworkCall.four: null
  });
  Rxn<NetworkState> currentState = Rxn(NetworkState.idle);
  RxList errorLog = RxList();
  late StreamSubscription subscription;
  networkCalls(Stream<NetworkResponse> Function() method,
      {NetworkCall? call}) async {
    controller.currentCall.value = call ?? NetworkCall.one;
    controller.currentState = Rxn(NetworkState.loading);
    controller.change(null, status: RxStatus.loading());
    subscription = method().listen(null);
    subscription.onData(
      (event) {
        if (event.isError) {
          errorLog.removeWhere((e) => e['call'] == call);
          errorLog.add({"call": call, "methord": method});
          controller.change(event, status: RxStatus.error());
          controller.currentState = Rxn(NetworkState.error);
          subscription.cancel();
          return;
        } else {
          errorLog.removeWhere((e) => e['call'] == call);
          controller.change(event, status: RxStatus.success());
          controller.stateData[call] = event;
          controller.currentState = Rxn(NetworkState.success);
        }
      },
    );
  }

  @override
  void onInit() {
    connection.connectionStream.stream.listen((event) {
      isOnline(event);
    });
    ever(isOnline, (callback) => showSnackBar(callback ? "Online" : "Offline"));

    ever(isOnline, (callback) {
      if (callback && errorLog.isNotEmpty) {
        for (var element in errorLog) {
          networkCalls(element['methord'], call: element['call']);
        }
      }
    });
    super.onInit();
  }
}

enum NetworkCall { one, two, three, four }

enum NetworkState { loading, success, error, idle }
