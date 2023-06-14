import 'package:base_architecture/src/app/router.dart';
import 'package:base_architecture/src/shared/utilities/internet_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../services/service_locator.dart' as service_locator;
import '../shared/utilities/internet_checker_bloc.dart';
import 'locale/locales.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  void initState() {
    super.initState();
    // Uncomment the below line if you want to listen internet status without any trigger
    // InternetChecker.startInternetChecking();

    // an event to return one-time internet status
    InternetCheckerBloc.bloc.add(CheckInternetConnectionEvent());
    service_locator.init();
  }

  @override
  void dispose() {
    // Uncomment the below line if you listing internet status
    // InternetChecker.stopInternetChecking();
    service_locator.disposeServices();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// MARK: - Add Localization & Router configuration
    return BlocProvider(
      create: (context) => InternetCheckerBloc.bloc,
      child: MaterialApp.router(
        localizationsDelegates: const [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.getSupportedLocales(),
        debugShowCheckedModeBanner: false,
        routerConfig: NavigationManager().router,
      ),
    );
  }
}