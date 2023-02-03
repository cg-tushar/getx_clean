import 'package:get/get.dart';

import '../../../../domain/usecases/headline.usecase.dart';
import '../../../dal/daos/news_model.dart';
import '../../../dal/repository/article_repo_iml.dart';

class HomePageDependency {
  // * injecting dependency and initializing the storage
  static init() async {
    // * Creating instance of Response model class
    Get.put(NewsModel());
    // * Creating instance of Implementation Repo class
    Get.put(ArticleRepositoryIml<NewsModel>());
    // * adding Implementation repo in the same use-case
    Get.put(FetchHeadlineUseCase<NewsModel>(Get.find<ArticleRepositoryIml<NewsModel>>()));
    Get.put(EverythingUseCase<NewsModel>(Get.find<ArticleRepositoryIml<NewsModel>>()));
  }
}
