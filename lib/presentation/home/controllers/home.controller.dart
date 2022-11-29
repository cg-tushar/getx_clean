import 'package:get/get.dart';
import 'package:getx_clean/domain/core/state_handler/state_controller.dart';
import '../../../domain/core/database/storage.dart';
import '../../../domain/usecases/fetch_headline_use_case.dart';

class HomeController extends SuperStateController {
  HomeController(this._fetchHeadlineUseCase) : super() {
    controller = this;
  }
  final FetchHeadlineUseCase _fetchHeadlineUseCase;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  fetchData() async {
    await networkCalls(
      _fetchHeadlineUseCase.execute(),
      call: NetworkCall.three,
    );
  }

  call1() async {
    await networkCalls(
      _fetchHeadlineUseCase.execute(),
      call: NetworkCall.one,
    );
  }

  removeCache() {
    Get.find<LocalStorage>().deleteAllSecureData();
  }
}
