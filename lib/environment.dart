import 'app_constant.dart';

class Environment {
  factory Environment() {
    return _singleton;
  }

  Environment._internal();

  static final Environment _singleton = Environment._internal();

  static const String TEST = "TEST";
  static const String LOCAL = "LOCAL";
  static const String DEV = "DEV";
  static const String PROD = "PROD";

  late BaseConfig config;

  initConfig(String environment) {
    config = _getConfig(environment);
  }

  BaseConfig _getConfig(String environment) {
    switch (environment) {
      case Environment.PROD:
        return ProdEnvironmentConfig();
      case Environment.TEST:
        return TestEnvironmentConfig();
      case Environment.LOCAL:
        return LocalEnvironmentConfig();
      default:
        return DevEnvironmentConfig();
    }
  }
}

abstract class BaseConfig {
  String get serviceApi;
}

class TestEnvironmentConfig extends BaseConfig {
  @override
  String get serviceApi => "http://localhost:8888";
}

class LocalEnvironmentConfig extends BaseConfig {
  @override
  String get serviceApi => "http://localhost:8888";
}

class DevEnvironmentConfig extends BaseConfig {
  @override
  String get serviceApi => AppConstant.API_URL_DEV;
}

class ProdEnvironmentConfig extends BaseConfig {
  @override
  String get serviceApi => AppConstant.API_URL_PROD;
}
