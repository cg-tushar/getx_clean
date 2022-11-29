import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_clean/domain/core/state_handler/state_controller.dart';

import '../network/base/response_handler.dart';

class SuperStateBuilder<T extends SuperStateController> extends StatelessWidget {
  final Widget Function(NetworkResponse?) child;
  final Widget? errorWidget;
  final NetworkCall call;
  const SuperStateBuilder(
      {super.key, required this.child, required this.call, this.errorWidget});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      builder: (val) {
        dynamic controller = val;
        if (controller.currentCall == call) {
          switch (controller.currentState.value) {
            case NetworkState.loading:
              return const Center(child: CircularProgressIndicator());
            case NetworkState.error:
              return errorWidget ?? const Center(child: Text("Error"));
            case NetworkState.success:
              return child(controller.stateData[call]);
            default:
              return child(controller.stateData[call]);
          }
        } else {
          return child(controller.stateData[call]);
        }
      },
    );
  }
}
