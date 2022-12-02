
import '../core/network/base/response_handler.dart';

// * base network call repository
abstract class ArticleRepository {
  Stream<NetworkResponse> fetchHeadline();
  Stream<NetworkResponse> postData(int userId);
}
