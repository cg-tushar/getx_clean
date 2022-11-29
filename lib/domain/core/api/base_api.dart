import 'dart:convert';
import 'package:get/get_connect/connect.dart';
import 'package:getx_clean/domain/core/database/get_key.dart';
import 'package:getx_clean/config.dart';

import '../database/storage.dart';


class BaseApi extends GetConnect {
  final String url = "${ConfigEnvironments.getEnvironments()['url']}";
  // Handle get request//
  Stream<Response> getRequest({
    required String path,
    bool cache = true,
    bool allowOffline = false,
    Map<String, String>? query,
  }) async* {
    final api = "$url$path";
    if (cache) {
      // get cache data
      final localItem =
          await LocalStorage.instance.readSecureData(getKey(path, query));
      if (localItem != null) {
        // return the cache data
        yield Response(body: jsonDecode(localItem), statusCode: 200);
      }
    }
    final result = await get(
      api,
      query: query,
      headers: {"X-Api-Key": "09a19abb37734481b72d84a90998c978"},
    );

    // check the response is ok and cache is enabled
    if (result.isOk && cache) {
      // cache data
      LocalStorage.instance.writeSecureData(
          StorageItem(getKey(path, query), jsonEncode(result.body)));
    }
    yield result;
    return;
  }

  Stream<Response> postRequest({
    required String path,
    bool cache = true,
    bool allowOfflie = false,
    Map<String, String>? query,
    dynamic body,
  }) async* {
    final api = "$url$path";
    if (cache) {
      // get cache data
      final localItem =
          await LocalStorage.instance.readSecureData(getKey(path, query));
      if (localItem != null) {
        // return the cache data
        yield Response(body: jsonDecode(localItem), statusCode: 200);
      }
    }
    final result = await post(
      api,
      body,
      query: query,
      headers: {"X-Api-Key": "09a19abb37734481b72d84a90998c978"},
    );

    // check the response is ok and cache is enabled
    if (result.isOk && cache) {
      // cache data
      LocalStorage.instance.writeSecureData(
          StorageItem(getKey(path, query), jsonEncode(result.body)));
    }
    yield result;
    return;
  }

  Stream<Response> putRequest({
    required String path,
    bool cache = true,
    bool allowOfflie = false,
    Map<String, String>? query,
    dynamic body,
  }) async* {
    final api = "$url$path";
    if (cache) {
      // get cache data
      final localItem =
          await LocalStorage.instance.readSecureData(getKey(path, query));
      if (localItem != null) {
        // return the cache data
        yield Response(body: jsonDecode(localItem), statusCode: 200);
      }
    }
    final result = await put(
      api,
      body,
      query: query,
      headers: {"X-Api-Key": "09a19abb37734481b72d84a90998c978"},
    );

    // check the response is ok and cache is enabled
    if (result.isOk && cache) {
      // cache data
      LocalStorage.instance.writeSecureData(
          StorageItem(getKey(path, query), jsonEncode(result.body)));
    }
    yield result;
    return;
  }

  Stream<Response> deleteRequest({
    required String path,
    bool cache = true,
    bool allowOfflie = false,
    Map<String, String>? query,
    dynamic body,
  }) async* {
    final api = "$url$path";
    if (cache) {
      // get cache data
      final localItem =
          await LocalStorage.instance.readSecureData(getKey(path, query));
      if (localItem != null) {
        // return the cache data
        yield Response(body: jsonDecode(localItem), statusCode: 200);
      }
    }
    final result = await delete(
      api,
      query: query,
      headers: {"X-Api-Key": "09a19abb37734481b72d84a90998c978"},
    );

    // check the response is ok and cache is enabled
    if (result.isOk && cache) {
      // cache data
      LocalStorage.instance.writeSecureData(
          StorageItem(getKey(path, query), jsonEncode(result.body)));
    }
    yield result;
    return;
  }
}
