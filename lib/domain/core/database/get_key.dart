import 'package:getx_clean/config.dart';

String getKey(String path, Map<String, String>? query) {
  if (query != null) {
    return "${ConfigEnvironments.getEnvironments()['url']}$path?${query.entries.map((e) => '${e.key}=${e.value}').join('&')}";
  }
  return "${ConfigEnvironments.getEnvironments()['url']}$path";
}
