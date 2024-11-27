enum EnvType { main }

class Env {
  static EnvType get envType {
    switch (const String.fromEnvironment('flavor', defaultValue: 'error')) {
      case 'main':
        return EnvType.main;
      default:
        return EnvType.main;
    }
  }
//TODO CHANGE URL DEPEND ON PC
  static String apiUrl = "https://api.rawg.io/api";
  static String apiKey = "7f0a694da71149889043c9c1d468ff53";
  static String get gcuUrl => "https://www.google.fr/";

  static String get privacyPolicy => "https://www.google.fr/";
}


