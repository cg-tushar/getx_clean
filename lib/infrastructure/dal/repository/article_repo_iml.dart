import '../../../domain/core/api/base_api.dart';
import '../../../domain/core/api/response_handler.dart';
import '../../../domain/repositories/article_repository.dart';
import '../daos/news_model.dart';

class ArticleRepositoryIml extends ArticleRepository {
  @override
  Stream<NetworkResponse> fetchHeadline() {
    String getNews = 'top-headlines';
    Map<String, String> query = {
      "country": "us",
      "category": "business",
      "apiKey": "09a19abb37734481b72d84a90998c978"
    };

    return BaseApi().getRequest(path: getNews, cache: true, query: query).map(
        (event) => NetworkResponseHandler<NewsModel>().response(event) as NetworkResponse);
  }

  @override
  Stream<NetworkResponse> postData(int userId) {
    throw UnimplementedError();
  }
}
