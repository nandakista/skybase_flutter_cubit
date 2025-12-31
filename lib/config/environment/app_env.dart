import 'config_data.dart';

/* Created by
   Varcant
   nanda.kista@gmail.com
*/
enum Environment {
  PRODUCTION,
  STAGING,
  DEVELOPMENT,
}

extension EnvExtension on Environment {
  bool get isStaging => this == Environment.STAGING;

  bool get isDev => this == Environment.DEVELOPMENT;

  bool get isProduction => this == Environment.PRODUCTION;
}

class AppEnv {
  static late ConfigData config;
  static Environment env = Environment.DEVELOPMENT;

  static void init({
    required Environment environment,
    required ConfigData configuration,
  }) {
    env = environment;
    config = configuration;
  }
}
