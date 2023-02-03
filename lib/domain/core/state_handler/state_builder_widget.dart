import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_clean/domain/core/state_handler/state_controller.dart';

import '../network/base/response_handler.dart';

// ?  SuperWidget to call api and works as stream to update data from local to network

class SuperStateBuilder<T extends SuperStateController<T, P>, P> extends GetView<T> {
  final Widget Function(NetworkResponse<P>?) child;
  const SuperStateBuilder({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(builder: (controller) {
      switch (controller.state.value.networkState) {
        case NetworkState.loading:
          return const Center(child: CircularProgressIndicator());
        case NetworkState.error:
          return Center(child: Text("Error ${controller.state.value.error ?? ''}"));
        case NetworkState.success:
          return child(controller.state.value);
        default:
          return Text("Default case ");
      }
    });
  }
}
