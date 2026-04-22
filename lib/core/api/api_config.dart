import 'package:flutter/foundation.dart';

class ApiConfig {
  static String get baseUrl {
    if (kDebugMode) {
      return 'http://localhost:8000'; // Adres API dla debugowania
    } else {
      return 'https://10.0.0.2:8080'; // Adres API dla produkcji
    }
  }
}