import 'package:getx_clean/domain/core/api/response_handler.dart';
import 'package:getx_clean/domain/core/usecases/pram_usecase.dart';
import '../repositories/article_repository.dart';

class PostNewsUseCase extends ParamUseCase<NetworkResponse, PostDataUseCase> {
  final ArticleRepository _repo;
  PostNewsUseCase(this._repo);

  @override
  Stream<NetworkResponse> execute(PostDataUseCase useCase) {
    return _repo.postData(useCase.userId);
  }
}

class PostDataUseCase {
  final int userId;
  PostDataUseCase(this.userId);
}
