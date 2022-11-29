import 'package:get/get.dart';

import '../../../../domain/usecases/fetch_headline_use_case.dart';
import '../../../../presentation/home/controllers/home.controller.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(Get.find<FetchHeadlineUseCase>()),
    );
  }
}
