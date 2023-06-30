import 'dart:convert';

import 'package:base_architecture/src/services/api_services/dio_client.dart';
import 'package:get_it/get_it.dart';

class CustomLogger {
  
  CustomLogger._internal();

  static final _getIt = GetIt.instance;
  static Future<void> logError(dynamic error) async {
    try {
      final errorMessage = error.toString();

      print('Error: $errorMessage');

      await _sendErrorToAPI(errorMessage);
    } catch (e) {
      print('Error logging error: $e');
    }
  }

  static Future<void> _sendErrorToAPI(String errorMessage) async {
    try {
      // TODO : Enter you logger API
      const apiUrl = '';

      final body = jsonEncode({'error': errorMessage});

      final response =
          await _getIt<DioClient>().provideDio().post(apiUrl, data: body);

      if (response.statusCode == 200) {
        print('Error sent to API successfully.');
      } else {
        print(
            'Failed to send error to API. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending error to API: $e');
    }
  }
}
