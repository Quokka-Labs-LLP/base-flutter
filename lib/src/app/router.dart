import 'package:base_architecture/src/features/new_feature/presentation/view/sample_screen.dart';
import 'package:base_architecture/src/shared/constants/route_constants.dart';
import 'package:base_architecture/src/shared/utilities/debug_logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:lifecycle/lifecycle.dart';
import '../features/new_feature/presentation/widget/sample_widget.dart';
import '../shared/widgets/page_not_found.dart';

class NavigationManager {
  final GoRouter router = GoRouter(
    initialLocation: RouteConst.signInScreen,
    navigatorKey: navigatorKey,
    observers: [
      GoRouterObserver(),
      defaultLifecycleObserver,
    ],
    errorBuilder: (context, state) => const PageNotFound(),
    routes: <RouteBase>[
      GoRoute(
        path: RouteConst.signInScreen,
        name: RouteConst.signInScreen.substring(1),
        builder: (BuildContext context, GoRouterState state) {
          return const SampleScreen();
        },
      ),
      GoRoute(
        path: RouteConst.dashboardScreen,
        name: RouteConst.dashboardScreen.substring(1),
        builder: (BuildContext context, GoRouterState state) {
          final msg = state.extra as String;
          printMessage(msg);
          return const SampleWidget();
        },
      ),
    ],
  );
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

/// MARK: - Observing Navigation Stack
class GoRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('Pushed: ${route.settings.name}, with arguments: ${route.settings.arguments}');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('Popped: ${route.settings.name}, with arguments: ${route.settings.arguments}');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    debugPrint('Removed: ${route.settings.name}, with arguments: ${route.settings.arguments}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    debugPrint('Replaced: ${newRoute?.settings.name}, with arguments: ${newRoute?.settings.arguments}');
  }
}