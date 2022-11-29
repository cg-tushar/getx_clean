import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageItem {
  StorageItem(this.key, this.value);

  final String key;
  final String value;
}

abstract class BaseLocalStorage {
  /// writing data into secure storage
  Future<void> writeSecureData(StorageItem newItem);

  /// read the secured data concerning the key
  Future<String?> readSecureData(String key);

  /// delete a key-value pair
  Future<void> deleteSecureData(String key);

  /// checking whether the storage contains the provided key or not
  Future<bool> containsKeyInSecureData(String key);

  /// read all the secured data
  Future<List<StorageItem>> readAllSecureData();

  /// to delete all the secured data
  Future<void> deleteAllSecureData();
}

class LocalStorage implements BaseLocalStorage {
  static final LocalStorage instance = LocalStorage._();
  static late final FlutterSecureStorage _secureStorage;

  LocalStorage._();

  // final IOSOptions options = const IOSOptions(accessibility: KeychainAccessibility.first_unlock);
  // IOSOptions _getIosOptions() => const IOSOptions();

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  initialize() {
    _secureStorage = const FlutterSecureStorage();
  }

  @override
  Future<void> writeSecureData(StorageItem newItem) async {
    await _secureStorage.write(
        key: newItem.key, value: newItem.value, aOptions: _getAndroidOptions());
  }

  @override
  Future<String?> readSecureData(String key) async {
    String? readData =
        await _secureStorage.read(key: key, aOptions: _getAndroidOptions());
    return readData;
  }

  @override
  Future<void> deleteSecureData(String key) async {
    await _secureStorage.delete(key: key, aOptions: _getAndroidOptions());
  }

  @override
  Future<bool> containsKeyInSecureData(String key) async {
    bool containsKey = await _secureStorage.containsKey(
        key: key, aOptions: _getAndroidOptions());
    return containsKey;
  }

  @override
  Future<List<StorageItem>> readAllSecureData() async {
    Map<String, String> allData =
        await _secureStorage.readAll(aOptions: _getAndroidOptions());
    List<StorageItem> list =
        allData.entries.map((e) => StorageItem(e.key, e.value)).toList();
    return list;
  }

  @override
  Future<void> deleteAllSecureData() async {
    await _secureStorage.deleteAll(aOptions: _getAndroidOptions());
  }
}
