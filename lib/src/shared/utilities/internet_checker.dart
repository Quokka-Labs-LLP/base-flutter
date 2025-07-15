import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import '../../app/router/router.dart';
import 'debug_logger.dart';
import 'internet_checker_bloc.dart';
import 'utils.dart';

/// Internet Checker
class InternetChecker {
  InternetChecker._();

  static StreamSubscription<List<ConnectivityResult>>? subscription;

  static void startInternetChecking() {
    printMessage('Internet checking service has been started');
    subscription = Connectivity().onConnectivityChanged.listen((
      final List<ConnectivityResult> results,
    ) {
      for (var result in results) {
        if (result == ConnectivityResult.mobile) {
          InternetCheckerBloc.bloc.add(
            ListenInternetConnectionEvent(
              isConnected: true,
              internetType: InternetType.mobile,
            ),
          );
        } else if (result == ConnectivityResult.wifi) {
          InternetCheckerBloc.bloc.add(
            ListenInternetConnectionEvent(
              isConnected: true,
              internetType: InternetType.wifi,
            ),
          );
        } else if (result == ConnectivityResult.vpn) {
          InternetCheckerBloc.bloc.add(
            ListenInternetConnectionEvent(
              isConnected: true,
              internetType: InternetType.vpn,
            ),
          );
        } else if (result == ConnectivityResult.bluetooth) {
          InternetCheckerBloc.bloc.add(
            ListenInternetConnectionEvent(
              isConnected: true,
              internetType: InternetType.bluetooth,
            ),
          );
        } else if (result == ConnectivityResult.ethernet ||
            result == ConnectivityResult.other) {
          InternetCheckerBloc.bloc.add(
            ListenInternetConnectionEvent(
              isConnected: true,
              internetType: InternetType.ethernet,
            ),
          );
        } else {
          ScaffoldMessenger.of(
            NavigationManager.navigatorKey.currentContext!,
          ).showSnackBar(Utils.instance.internetLostSnackBar);
          InternetCheckerBloc.bloc.add(
            ListenInternetConnectionEvent(
              isConnected: false,
              internetType: InternetType.none,
            ),
          );
        }
      }
    });
  }

  static void stopInternetChecking() {
    printMessage('Internet checking service has been ended');
    subscription?.cancel();
  }
}
