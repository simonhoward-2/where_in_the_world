import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Configuration class to access environment variables
class AppConfig {
  // Private constructor to prevent instantiation
  AppConfig._();

  /// Get the maps URL template from environment variables
  static String get mapsUrlTemplate {
    final urlTemplate = dotenv.env['MAPS_URL_TEMPLATE'];
    if (urlTemplate == null || urlTemplate.isEmpty) {
      throw Exception('MAPS_URL_TEMPLATE not found in .env file');
    }
    return urlTemplate;
  }

  /// Check if environment variables are properly loaded
  static bool get isConfigured {
    return dotenv.env['MAPS_URL_TEMPLATE'] != null;
  }
}
