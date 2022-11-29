import 'package:get/get_connect/http/src/response/response.dart';
import 'package:getx_clean/domain/core/network/base/api_provider.dart';
import '../base/api_request_representable.dart';
import '../endpoints/api_endpoint.dart';

enum ArticleType { postData, fetchNews }

class ArticleAPI implements APIRequestRepresentable {
  final ArticleType type;
  final int? userId;

  ArticleAPI._({this.userId, required this.type});

  ArticleAPI.postData(int userId) : this._(type: ArticleType.postData, userId: userId);
  ArticleAPI.fetchNews() : this._(type: ArticleType.fetchNews);

  @override
  String get endpoint => APIEndpoint.newsapi;

  @override
  HTTPMethod get method {
    switch (type) {
      case ArticleType.postData:
        return HTTPMethod.post;
      case ArticleType.fetchNews:
        return HTTPMethod.get;
    }
  }

  @override
  Map<String, String> get headers => {"X-Api-Key": "d809d6a547734a67af23365ce5bc8c02"};

  @override
  Map<String, String>? get query {
    switch (type) {
      case ArticleType.postData:
        return {"userId": userId.toString()};
      case ArticleType.fetchNews:
        return null;
    }
  }

  @override
  Stream<Response> request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get path {
    switch (type) {
      case ArticleType.fetchNews:
        return "/top-headlines?country=in&category=business&apiKey=d809d6a547734a67af23365ce5bc8c02";
      case ArticleType.postData:
        return "/top-headlines";
    }
  }

  @override
  String get url => endpoint+path;

  @override
  bool get cache => true;

  @override
  get body => null;
}
