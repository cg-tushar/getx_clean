import '../core/network/base/response_handler.dart';

// * base network call repository
abstract class ArticleRepository<T> {
  Stream<NetworkResponse<T>> fetchHeadline();
  Stream<NetworkResponse<T>> everything();
  // Stream<NetworkResponse> postData(int userId);
}
