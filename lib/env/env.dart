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

  static final String apiUrl = "https://api.rawg.io";
  static final String apiKey = "7f0a694da71149889043c9c1d468ff53";
}


