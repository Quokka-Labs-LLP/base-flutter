import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/router.dart';
import 'utils.dart';

class InternetCheckerBloc
    extends Bloc<InternetCheckerEvent, InternetCheckerState> {
  static InternetCheckerBloc bloc = InternetCheckerBloc();

  InternetCheckerBloc() : super(InternetCheckerState()) {
    on<ListenInternetConnectionEvent>(
      (final event, final emit) => emit(
        state.copyWith(event.isConnected, event.internetType),
      ),
    );

    on<CheckInternetConnectionEvent>(
      (final event, final emit) async {
        final connectivityResult = await Connectivity().checkConnectivity();
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
          ScaffoldMessenger.of(NavigationManager.navigatorKey.currentContext!)
              .showSnackBar(Utils.instance.internetLostSnackBar);
        }
      },
    );
  }
}

/// MARK: InternetChecker Events
abstract class InternetCheckerEvent {}

class ListenInternetConnectionEvent extends InternetCheckerEvent {
  final bool isConnected;
  final InternetType internetType;

  ListenInternetConnectionEvent(
      {required this.isConnected, required this.internetType,});
}

class CheckInternetConnectionEvent extends InternetCheckerEvent {}

/// MARK: InternetChecker States
class InternetCheckerState {
  final bool isConnected;
  final InternetType internetType;
  InternetCheckerState(
      {this.isConnected = false, this.internetType = InternetType.none,});

  InternetCheckerState copyWith(
          final bool? isConnected, final InternetType? internetType,) =>
      InternetCheckerState(
        isConnected: isConnected ?? this.isConnected,
        internetType: internetType ?? this.internetType,
      );
}

enum InternetType { wifi, mobile, vpn, bluetooth, ethernet, none }
