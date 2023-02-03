import 'package:getx_clean/domain/core/state_handler/state_controller.dart';
import 'package:getx_clean/infrastructure/dal/daos/news_model.dart';

import '../../../domain/usecases/headline.usecase.dart';

class ArticleController extends SuperStateController<ArticleController, NewsModel> {
  final FetchHeadlineUseCase<NewsModel> _fetchHeadlineUseCase;

  ArticleController(this._fetchHeadlineUseCase);

  @override
  void onInit() {
    networkCalls(() => _fetchHeadlineUseCase.execute());
    super.onInit();
  }
}
