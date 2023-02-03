import 'package:get/get.dart';
import 'package:getx_clean/domain/core/state_handler/state_controller.dart';
import 'package:getx_clean/infrastructure/dal/daos/news_model.dart';

import '../../../domain/core/database/storage.dart';
import '../../../domain/usecases/headline.usecase.dart';

class HomeController extends SuperStateController<HomeController, NewsModel> {
  HomeController(this._fetchHeadlineUseCase);

  final FetchHeadlineUseCase<NewsModel> _fetchHeadlineUseCase;

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

  // @networkCalls

  fetchData() {
    networkCalls(
      _fetchHeadlineUseCase.execute,
    );
  }

  // call1() async {
  //   await networkCalls(
  //     _fetchHeadlineUseCase.execute,
  //     call: NetworkCall.one,
  //   );
  // }

  removeCache() {
    Get.find<LocalStorage>().deleteAllSecureData();
  }
}
