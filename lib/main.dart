import 'dart:async';
import 'package:base_architecture/src/app/app.dart';
import 'package:base_architecture/src/shared/utilities/debug_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  /// MARK:- Load environment file
  await dotenv.load(fileName: '.env');

  runZonedGuarded(
    () async {
      printMessage(dotenv.env['BaseUrl'].toString());
      runApp(const App());
    },
    (error, stack) {
      /// MARK:- To trace crash if happen in overall app
      printError(error.toString());
      printError(stack.toString());
    },
  );
}
