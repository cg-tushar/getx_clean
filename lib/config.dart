// ignore_for_file: constant_identifier_names

class Environments {
  static const String PRODUCTION = 'prod';
  static const String QAS = 'qas';
  static const String DEV = 'dev';
  static const String LOCAL = 'local';
}

class ConfigEnvironments {
  static const String _currentEnvironments = Environments.QAS;
  static final List<Map<String, String>> _availableEnvironments = [
    {
      'env': Environments.LOCAL,
      'url': 'https://newsapi.org/v2',
    },
    {
      'env': Environments.DEV,
      'url': 'https://newsapi.org/v2',
    },
    {
      'env': Environments.QAS,
      'url': 'https://newsapi.org/v2',
    },
    {
      'env': Environments.PRODUCTION,
      'url': 'https://newsapi.org/v2',
    },
  ];

  static Map<String, String> getEnvironments() {
    return _availableEnvironments.firstWhere(
      (d) => d['env'] == _currentEnvironments,
    );
  }
}
