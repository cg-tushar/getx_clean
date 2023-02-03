import 'package:getx_clean/domain/core/state_handler/state_controller.dart';
import 'package:getx_clean/infrastructure/dal/daos/news_model.dart';

import '../../../domain/usecases/headline.usecase.dart';

class EverythingController extends SuperStateController<EverythingController, NewsModel> {
  final EverythingUseCase<NewsModel> _everythingUseCase;

  EverythingController(this._everythingUseCase);

  @override
  void onInit() {
    networkCalls(() => _everythingUseCase.execute());
    super.onInit();
  }
}
