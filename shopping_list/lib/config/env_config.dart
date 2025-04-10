import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  // Firebase Database URL
  static String get firebaseDbUrl => dotenv.env['FIREBASE_DB_URL'] ?? 'default-db-placeholder.firebaseio.com';
  
  // You can add more environment variables here as needed
}