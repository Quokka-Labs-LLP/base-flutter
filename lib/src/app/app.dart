import 'package:base_architecture/src/app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../services/service_locator.dart' as service_locator;
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
    service_locator.init();
  }

  @override
  void dispose() {
    service_locator.disposeServices();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// MARK: - Add Localization & Router configuration
    return MaterialApp.router(
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.getSupportedLocales(),
      debugShowCheckedModeBanner: false,
      routerConfig: NavigationManager().router,
    );
  }
}