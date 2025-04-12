import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MapsService {
  static const MethodChannel _channel = MethodChannel('com.example.favorite_places/maps');
  static bool _initialized = false;

  /// Initialize the Google Maps API on iOS platform
  /// This securely passes the API key from .env to the iOS native side
  static Future<void> initializeApiKey() async {
    if (_initialized) return;

    try {
      // Get API key from environment variables
      final apiKey = dotenv.env['GOOGLE_MAPS_API_KEY'];
      
      if (apiKey == null || apiKey.isEmpty) {
        print('Warning: Google Maps API key not found in environment variables');
        return;
      }

      // Send API key to iOS native side via method channel
      await _channel.invokeMethod('setApiKey', {'apiKey': apiKey});
      _initialized = true;
      print('Google Maps API key successfully passed to iOS native code');
    } on PlatformException catch (e) {
      print('Failed to initialize Google Maps API key: ${e.message}');
    }
  }
}