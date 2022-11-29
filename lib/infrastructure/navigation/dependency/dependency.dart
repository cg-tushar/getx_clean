import 'package:get/get.dart';
import '../../../domain/core/database/storage.dart';
import '../../../domain/usecases/fetch_headline_use_case.dart';
import '../../dal/daos/news_model.dart';
import '../../dal/repository/article_repo_iml.dart';

class DependencyCreator {
  static init() async {
    Get.put(ArticleRepositoryIml());
    Get.put(NewsModel());
    Get.put(LocalStorage.instance);
    Get.put(FetchHeadlineUseCase(Get.find<ArticleRepositoryIml>()));
  }
}
