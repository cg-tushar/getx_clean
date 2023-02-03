import 'package:get/get.dart';
import 'package:getx_clean/domain/core/network/connectivity/internet_connectivity.dart';
import 'package:getx_clean/infrastructure/navigation/dependencies/home_dependencies/home.dependency.dart';

import '../../../domain/core/database/storage.dart';

class DependencyCreator {
  // * injecting dependency and initializing the storage
  static init() async {
    LocalStorage.instance.initialize();
    ConnectivityCheck.instance.initConnectionCheck();
    Get.put(LocalStorage.instance);
    Get.put(ConnectivityCheck.instance);

    //!-------------Pages Dependency----------------//
    HomePageDependency.init();
  }
}
