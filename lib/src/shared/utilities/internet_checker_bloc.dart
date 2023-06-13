import 'package:base_architecture/src/shared/utilities/internet_checker.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/router.dart';

class InternetCheckerBloc extends Bloc<InternetCheckerEvent, InternetCheckerState> {
  static InternetCheckerBloc bloc = InternetCheckerBloc();

  InternetCheckerBloc() : super(InternetCheckerState()) {
    on<EmitInternetStatus>((event, emit) => emit(state.copyWith(event.isConnected, event.internetType)));

    on<CheckInternetConnection>((event, emit) async {
      final connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile) {
        emit(state.copyWith(true, InternetType.mobile));
      } else if (connectivityResult == ConnectivityResult.wifi) {
        emit(state.copyWith(true, InternetType.wifi));
      } else if (connectivityResult == ConnectivityResult.vpn) {
        emit(state.copyWith(true, InternetType.vpn));
      } else if (connectivityResult == ConnectivityResult.bluetooth) {
        emit(state.copyWith(true, InternetType.bluetooth));
      } else if (connectivityResult == ConnectivityResult.other ||
          connectivityResult == ConnectivityResult.ethernet) {
        emit(state.copyWith(true, InternetType.ethernet));
      } else if (connectivityResult == ConnectivityResult.none) {
        emit(state.copyWith(false, InternetType.none));
        ScaffoldMessenger.of(NavigationManager.navigatorKey.currentContext!).showSnackBar(InternetChecker.snackBar);
      }
    });
  }
}


/// MARK: Internet Checker Events
abstract class InternetCheckerEvent {}

class EmitInternetStatus extends InternetCheckerEvent {
  final bool isConnected;
  final InternetType internetType;

  EmitInternetStatus({required this.isConnected, required this.internetType});
}

class CheckInternetConnection extends InternetCheckerEvent {}

/// MARK: Internet Checker States
class InternetCheckerState{
  final bool isConnected;
  final InternetType internetType;
  InternetCheckerState({this.isConnected = false, this.internetType = InternetType.none});

  InternetCheckerState copyWith(bool? isConnected, InternetType? internetType)
  => InternetCheckerState(
    isConnected: isConnected ?? this.isConnected,
    internetType: internetType ??  this.internetType,
  );
}

enum InternetType {
  wifi, mobile, vpn, bluetooth, ethernet, none
}