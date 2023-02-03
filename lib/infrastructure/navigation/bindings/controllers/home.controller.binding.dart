import 'package:get/get.dart';
import 'package:getx_clean/infrastructure/dal/daos/news_model.dart';
import 'package:getx_clean/presentation/home/controllers/article.controller.dart';

import '../../../../domain/usecases/headline.usecase.dart';
import '../../../../presentation/home/controllers/everything.controller.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<HomeController>(
    //   () => HomeController(Get.put(FetchHeadlineUseCase<NewsModel>(Get.find<ArticleRepositoryIml<NewsModel>>()))),
    // );
    Get.lazyPut<ArticleController>(
      () => ArticleController(Get.find<FetchHeadlineUseCase<NewsModel>>()),
    );
    Get.lazyPut<EverythingController>(
      () => EverythingController(Get.find<EverythingUseCase<NewsModel>>()),
    );
  }
}
