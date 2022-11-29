import '../core/network/base/response_handler.dart';
import '../core/usecases/no_param_usecase.dart';
import '../repositories/article_repository.dart';

class FetchHeadlineUseCase extends NoParamUseCase<NetworkResponse> {
  final ArticleRepository _repo;
  FetchHeadlineUseCase(this._repo);

  @override
  Stream<NetworkResponse> execute() {
    return _repo.fetchHeadline();
  }
}

class PostDataUseCase {
  final int userId;
  PostDataUseCase(this.userId);
}
