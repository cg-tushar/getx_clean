import 'package:get/get_connect/http/src/response/response.dart';
import 'package:getx_clean/config.dart';
import 'package:getx_clean/domain/core/network/base/api_provider.dart';

import '../../../domain/core/network/base/api_request_representable.dart';

enum ArticleType { everything, fetchNews }

class ArticleAPI implements APIRequestRepresentable {
  final ArticleType type;
  final int? userId;

  ArticleAPI._({this.userId, required this.type});

  ArticleAPI.fetchNews() : this._(type: ArticleType.fetchNews);
  ArticleAPI.everything() : this._(type: ArticleType.everything);

  @override
  String get endpoint => EnvironmentConfig.getUrl();

  @override
  HTTPMethod get method {
    return HTTPMethod.get;
    switch (type) {
      case ArticleType.everything:
        return HTTPMethod.get;
      case ArticleType.fetchNews:
        return HTTPMethod.get;
    }
  }

  @override
  Map<String, String> get headers => {"X-Api-Key": "d809d6a547734a67af23365ce5bc8c02"};

  @override
  Map<String, String>? get query {
    switch (type) {
      case ArticleType.everything:
        return {"q": "bitcoin"};
      case ArticleType.fetchNews:
        return {"country": "us", "category": "business", "apiKey": "d809d6a547734a67af23365ce5bc8c02"};
    }
  }
  //top-headlines?sources=techcrunch

  @override
  Stream<Response> request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get path {
    switch (type) {
      case ArticleType.fetchNews:
        return "/top-headlines";
      case ArticleType.everything:
        return "/everything";
    }
  }

  @override
  String get url => endpoint + path;

  @override
  bool get cache => true;

  @override
  get body => null;
}
