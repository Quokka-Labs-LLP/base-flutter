import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lifecycle/lifecycle.dart';
import '../../app/router/route_args.dart';
import '../../features/new_feature/presentation/view/sample_screen.dart';
import '../../features/new_feature/presentation/widget/sample_widget.dart';
import '../../shared/constants/route_constants.dart';
import '../../shared/utilities/debug_logger.dart';
import '../../shared/widgets/page_not_found.dart';

class NavigationManager {
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
  GlobalKey<ScaffoldMessengerState>();

  final GoRouter router = GoRouter(
    initialLocation: '/${RouteConst.signInScreen}',
    navigatorKey: navigatorKey,
    observers: [
      GoRouterObserver(),
      defaultLifecycleObserver,
    ],
    errorBuilder: (final context, final state) => const PageNotFound(),
    routes: <RouteBase>[
      GoRoute(
        path: '/${RouteConst.signInScreen}',
        name: RouteConst.signInScreen,
        builder: (final BuildContext context, final GoRouterState state) {
          return const SampleScreen();
        },
      ),
      GoRoute(
        path: '/${RouteConst.dashboardScreen}',
        name: RouteConst.dashboardScreen,
        builder: (final BuildContext context, final GoRouterState state) {
          final sampleWidgetArgs = state.extra as SampleWidgetArgs?;
          printMessage("msg! $sampleWidgetArgs");
          return  SampleWidget(sampleWidgetArgs: sampleWidgetArgs,);
        },
      ),
    ],
  );
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}

/// MARK: - Observing Navigation Stack
class GoRouterObserver extends NavigatorObserver {
  @override
  void didPush(final Route<dynamic> route, final Route<dynamic>? previousRoute) {
    debugPrint('Pushed: ${route.settings.name}, with arguments: ${route.settings.arguments}');
  }

  @override
  void didPop(final Route<dynamic> route, final Route<dynamic>? previousRoute) {
    debugPrint('Popped: ${route.settings.name}, with arguments: ${route.settings.arguments}');
  }

  @override
  void didRemove(final Route<dynamic> route, final Route<dynamic>? previousRoute) {
    debugPrint('Removed: ${route.settings.name}, with arguments: ${route.settings.arguments}');
  }

  @override
  void didReplace({final Route<dynamic>? newRoute, final Route<dynamic>? oldRoute}) {
    debugPrint('Replaced: ${newRoute?.settings.name}, with arguments: ${newRoute?.settings.arguments}');
  }
}
