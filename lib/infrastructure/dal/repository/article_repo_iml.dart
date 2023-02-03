import 'package:getx_clean/domain/core/model/base_model.dart';
import 'package:getx_clean/infrastructure/dal/apis/article_api.dart';

import '../../../domain/core/network/base/response_handler.dart';
import '../../../domain/repositories/article_repository.dart';

class ArticleRepositoryIml<T extends BaseModel> extends ArticleRepository<T> {
  @override
  Stream<NetworkResponse<T>> fetchHeadline() {
    return ArticleAPI.fetchNews().request().map((event) => NetworkResponseHandler<T>().response(event));
  }

  @override
  Stream<NetworkResponse<T>> everything() {
    return ArticleAPI.everything().request().map((event) => NetworkResponseHandler<T>().response(event));
  }
}
