import 'dart:async';
import 'package:base_architecture/src/app/router.dart';
import 'package:base_architecture/src/shared/utilities/debug_logger.dart';
import 'package:base_architecture/src/shared/widgets/common_title_text.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'internet_checker_bloc.dart';

/// Internet Checker
class InternetChecker {
  static StreamSubscription<ConnectivityResult>? subscription;

  static final snackBar = SnackBar(
    duration: const Duration(hours: 1),
    content: const CommonTitleText(text: 'No Internet Connection', fontSize: 16, fontColor: Colors.white),
    action: SnackBarAction(
      label: 'Check Again',textColor: Colors.green,
      onPressed: () {
        InternetCheckerBloc.bloc.add(CheckInternetConnection());
      },
    ), padding: const EdgeInsets.all(5),
  );

  static void startInternetChecking() {
    printMessage('Internet checking service has been started');
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile) {
        InternetCheckerBloc.bloc.add(EmitInternetStatus(isConnected: true, internetType: InternetType.mobile));
      } else if (result == ConnectivityResult.wifi) {
        InternetCheckerBloc.bloc.add(EmitInternetStatus(isConnected: true, internetType: InternetType.wifi));
      } else if (result == ConnectivityResult.vpn) {
        InternetCheckerBloc.bloc.add(EmitInternetStatus(isConnected: true, internetType: InternetType.vpn));
      } else if (result == ConnectivityResult.bluetooth) {
        InternetCheckerBloc.bloc.add(EmitInternetStatus(isConnected: true, internetType: InternetType.bluetooth));
      } else if (result == ConnectivityResult.ethernet || result == ConnectivityResult.other) {
        InternetCheckerBloc.bloc.add(EmitInternetStatus(isConnected: true, internetType: InternetType.ethernet));
      } else {
        ScaffoldMessenger.of(NavigationManager.navigatorKey.currentContext!).showSnackBar(snackBar);
        InternetCheckerBloc.bloc.add(EmitInternetStatus(isConnected: false, internetType: InternetType.none));
      }
    });
  }

  static void stopInternetChecking() {
    printMessage('Internet checking service has been ended');
    subscription?.cancel();
  }
}


