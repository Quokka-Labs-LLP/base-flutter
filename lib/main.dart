import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'src/app/app.dart';
import 'src/services/db_services/db_init.dart';
import 'src/shared/utilities/debug_logger.dart';

void main() async {
  runZonedGuarded(
    () async {
      initializeApp();
      await DatabaseService.init();
      ///MARK: Uncomment this code and import the dependencies related to it
      // ServerLogger.initLoggerService(
      //     userId: '<userId>',   //<Optional> Logs will be stored or handled separately for each user based on their unique user ID.
      //     userName: '<userName>', //<Optional> Logs will be stored or handled separately for each user based on their unique user name.
      //     env: '<environment>',   // Specifies the current project environment (e.g., 'dev' for development).
      //     apiToken:'<Auth token>',   // use your API's authorization token here.
      //     appName: '<App Name>',   // You will get the app name from logger panel
      //     url: '<Logger Url>',   // URL where logs will be stored.
      //     maskKeys: [],  // Keys to be masked in your logs.
      //     recordPermission: true, // Key to enable or disable recording permissions.
      //     durationInMin: 3,  // Duration (in minutes) for periodically uploading logs.
      //     recordNetworkLogs: '<Record Network Logs>'  // Enable or disable recording of network connection logs.
      // );
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      /// MARK:- Load environment file
      await dotenv.load();
      await manageSplashDelay(duration: const Duration(seconds: 2));
      runApp(const App());
    },
    (final error, final stack) {
      /// MARK:- To trace crash if happen
      printError(error.toString());
      printError(stack.toString());
    },
  );
}

/// MARK: - To show splash screen until flutter Initialized.
WidgetsBinding initializeApp() {
  final binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);
  return binding;
}

Future manageSplashDelay({final Duration duration = Duration.zero}) async {
  if (duration.inMilliseconds > 0) {
    await Future.delayed(duration);
  }
  FlutterNativeSplash.remove();
}
