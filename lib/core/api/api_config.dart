import 'package:flutter/foundation.dart';

class ApiConfig {
  static String get baseUrl {
    if (kDebugMode) {
      return 'http://10.0.2.2:8080/';
    } else {
      return 'http://10.0.2.2:8080/';
    }
  }
}