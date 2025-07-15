import 'package:flutter/foundation.dart';
 import 'package:logger/logger.dart';
import 'package:ql_logger_flutter/ql_logger_flutter.dart';

 final logger = Logger();

void printMessage(final String text, {bool recordLog = false}) {
  if (recordLog) {
    _recordLogs(text, logType: LogType.user);
  }
  if (kDebugMode) {
     logger.d(text);
  }
}

void printWarning(final String text) {
  if (kDebugMode) {
     logger.w(text);
  }
}

void printError(final String text, {bool recordLog = true}) async {
  if (recordLog) {
    _recordLogs(text, logType: LogType.error);
  }
  if (kDebugMode) {
     logger.e(text);
  }
}

void _recordLogs(String text, {LogType? logType}) async {
  await ServerLogger.log(message: text, logType: logType);
}

