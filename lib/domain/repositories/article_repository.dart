
import '../core/network/base/response_handler.dart';

abstract class ArticleRepository {
  Stream<NetworkResponse> fetchHeadline();
  Stream<NetworkResponse> postData(int userId);
}
