import 'package:getx_clean/config.dart';

// * Creating local Storage key from url and endpoint to store cache data
class CacheKeyGenerator {
  String generate(String path, Map<String, String>? query) {
    if (query != null) {
      return "${EnvironmentConfig.getUrl()}$path?${query.entries.map((e) => '${e.key}=${e.value}').join('&')}";
    }
    return "${EnvironmentConfig.getUrl()}$path";
  }
}
