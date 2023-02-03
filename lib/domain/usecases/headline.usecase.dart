import '../core/network/base/response_handler.dart';
import '../core/usecases/no_param_usecase.dart';
import '../repositories/article_repository.dart';

class FetchHeadlineUseCase<T> extends NoParamUseCase<NetworkResponse<T>> {
  final ArticleRepository<T> _repo;
  FetchHeadlineUseCase(this._repo);

  @override
  Stream<NetworkResponse<T>> execute() {
    return _repo.fetchHeadline();
  }
}

class EverythingUseCase<T> extends NoParamUseCase<NetworkResponse<T>> {
  final ArticleRepository<T> _repo;
  EverythingUseCase(this._repo);

  @override
  Stream<NetworkResponse<T>> execute() {
    return _repo.everything();
  }
}

class PostDataUseCase {
  final int userId;
  PostDataUseCase(this.userId);
}
