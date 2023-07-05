import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:base_architecture/src/services/api_services/dio_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';

import '../models/model_export.dart';

class CustomLogger {
  CustomLogger._internal();

  /// TODO :: Set reciever mail address
  static String recieverMail = '';
  static String subject = 'Testing Logs';

  // initialize logger
  static Future<void> initialize() async {
    File file = await jsonFile;

    if (!await file.exists()) {
      final ErrorLogModel errorLogModel = ErrorLogModel();

      errorLogModel.createdAt = DateTime.now().toString();
      errorLogModel.errorData = [];
      var x = errorLogModel.toJson();

      await file.writeAsString(json.encode(x));
    }
  }

  static Future<File> get jsonFile async {
    final path = await _directoryPath;
    return File('$path/error.json');
  }

  static Future<String> get _directoryPath async {
    Directory? directory;
    if (kIsWeb) {
      return '';
    } else if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    } else if (Platform.isAndroid) {
      directory = await getExternalStorageDirectory();
    }
    return directory?.path ?? '';
  }

  static String get timeStamp {
    DateTime now = DateTime.now();
    return now.toString();
  }

  static Future<ErrorLogModel?> fetchLogs() async {
    try {
      File file = await jsonFile;
      String fileContent = await file.readAsString();
      Map<String, dynamic> fileData = json.decode(fileContent);

      if (fileData.isNotEmpty) {
        return ErrorLogModel.fromJson(fileData);
      }
      return null;
    } catch (e) {
      log('Error reading file: $e');
      return null;
    }
  }

  static Future<void> addLog(ErrorData newErrorData) async {
    try {
      File file = await jsonFile;
      ErrorLogModel? existingFileData = await fetchLogs();

      if (existingFileData != null) {
        existingFileData.errorData!.add(newErrorData);

        await file.writeAsString(jsonEncode(existingFileData.toJson()));
      }
      log('Data added successfully!');
    } catch (e) {
      log('Error adding data: $e');
    }
  }

  static final _getIt = GetIt.instance;
  static Future<void> logError(dynamic error) async {
    try {
      final errorMessage = error.toString();

      log('Error: $errorMessage');
      // write logs to error.json file
      await _logErrorInFile(errorMessage);
      // send logs to api
      await _sendErrorToAPI(errorMessage);
    } catch (e) {
      log('Error logging error: $e');
    }
  }

  static Future<void> _sendErrorToAPI(
    String errorMessage, {
    final bool sendToApi = false,
  }) async {
    try {
      // TODO : Enter you logger API
      if (!sendToApi) return;
      const apiUrl = '';

      final body = jsonEncode({'error': errorMessage});

      final response =
          await _getIt<DioClient>().provideDio().post(apiUrl, data: body);

      if (response.statusCode == 200) {
        log('Error sent to API successfully.');
      } else {
        log('Failed to send error to API. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error sending error to API: $e');
    }
  }

  static Future<void> _logErrorInFile(String error) async => await addLog(
        ErrorData(
          errorDescription: error,
          errorTimestamp: timeStamp,
        ),
      );

  static Future<bool> sendEmailWithAttachment(String body) async {
    final File file = await jsonFile;

    final Email emailObject = Email(
      body: body,
      subject: subject,
      recipients: [recieverMail],
      isHTML: false,
      attachmentPaths: [
        file.path
      ], // Provide the path of the file as an attachment
    );

    try {
      await FlutterEmailSender.send(emailObject);
      log('Email sent successfully');
      return true;
    } catch (e) {
      log('Error sending email: $e');
      return false;
    }
  }
}
