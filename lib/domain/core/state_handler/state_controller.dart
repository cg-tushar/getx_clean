import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:getx_clean/domain/core/network/connectivity/internet_connectivity.dart';

import '../../../app/core/base_widgets/base_snackbar_widget.dart';
import '../network/base/response_handler.dart';

class SuperStateController<T> extends GetxController with StateMixin<NetworkResponse> {
  dynamic controller;
  // GetxStateController({this.controller});
  Rxn<NetworkCall> currentCall = Rxn();
  RxBool isOnline = RxBool(true);
  final connection = Get.find<ConnectivityCheck>();
  RxMap stateData = RxMap({NetworkCall.one: null, NetworkCall.two: null, NetworkCall.three: null, NetworkCall.four: null});
  Rxn<NetworkState> currentState = Rxn(NetworkState.idle);
  networkCalls(Stream<NetworkResponse> method, {NetworkCall? call}) async {
    // controller = controllerVal;
    controller.currentCall.value = call ?? NetworkCall.one;
    controller.currentState = Rxn(NetworkState.loading);
    controller.change(null, status: RxStatus.loading());
    method.listen(
      (event) {
        if (event.isError) {
          controller.change(event, status: RxStatus.error());
          controller.currentState = Rxn(NetworkState.error);
        } else {
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
    ever(
        isOnline,
        (callback) => showSnackBar(callback?"Online":"Offline"));
    super.onInit();
  }
}

enum NetworkCall { one, two, three, four }

enum NetworkState { loading, success, error, idle }


