import 'package:base_architecture/src/app/router.dart';
import 'package:flutter/material.dart';
import '../services/service_locator.dart' as service_locator;

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  void initState() {
    service_locator.init();
    super.initState();
  }

  @override
  void dispose() {
    service_locator.disposeServices();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: NavigationManager().router,
    );
  }
}
