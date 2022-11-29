
import 'package:getx_clean/domain/core/network/api/article_api.dart';

import '../../../domain/core/network/base/base_api.dart';
import '../../../domain/core/network/base/response_handler.dart';
import '../../../domain/repositories/article_repository.dart';
import '../daos/news_model.dart';

class ArticleRepositoryIml extends ArticleRepository {
  @override
  Stream<NetworkResponse> fetchHeadline() {
    return ArticleAPI.fetchNews().request().map(
        (event) => NetworkResponseHandler<NewsModel>().response(event) as NetworkResponse);
  }

  @override
  Stream<NetworkResponse> postData(int userId) {
    throw UnimplementedError();
  }
}
