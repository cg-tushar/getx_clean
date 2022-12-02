import 'package:get/get.dart';
import 'package:getx_clean/domain/core/network/connectivity/internet_connectivity.dart';
import '../../../domain/core/database/storage.dart';
import '../../../domain/usecases/fetch_headline_use_case.dart';
import '../../dal/daos/news_model.dart';
import '../../dal/repository/article_repo_iml.dart';

class DependencyCreator {

  // * injecting dependency and initializing the storage
  static init() async {
    LocalStorage.instance.initialize();
    ConnectivityCheck.instance.initConnectionCheck();

    // * Creating instance of Implementation Repo class
    Get.put(ArticleRepositoryIml());

    Get.put(LocalStorage.instance);
    Get.put(ConnectivityCheck.instance);

    // * Creating instance of Response model class
    Get.put(NewsModel());

    // * adding Implementation repo in the same use-case
    Get.put(FetchHeadlineUseCase(Get.find<ArticleRepositoryIml>()));

  }
}
