import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConst {
  ApiConst._();

  static String baseUrl = dotenv.env['BaseUrl'] ?? '';
  static String sampleApi = '$baseUrl/api/v1/employees';
}
