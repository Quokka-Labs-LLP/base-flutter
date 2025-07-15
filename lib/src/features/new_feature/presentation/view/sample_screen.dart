import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/locale/locales.dart';
import '../../../../app/router/route_args.dart';
import '../../../../app/theme/bloc/theme_bloc.dart';
import '../../../../app/theme/bloc/theme_event.dart';
import '../../../../shared/constants/route_constants.dart';
import '../../../../shared/widgets/common_button.dart';
import '../../../../shared/widgets/common_title_text.dart';

class SampleScreen extends StatefulWidget {
  const SampleScreen({super.key});

  @override
  State<SampleScreen> createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {

  @override
  Widget build(final BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final isDark = context.watch<ThemeBloc>().state.themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Theme with BLoC'),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.wb_sunny : Icons.nightlight_round),
            onPressed: () {
              context.read<ThemeBloc>().add(ToggleThemeEvent());
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonTitleText(
              text: local.signIn ?? '',
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CommonButton(
                onTap: () {
                  /// MARK: use this to make it rootView without passing any data.
                  // context.goNamed(RouteConst.dashboardScreen.substring(1));
                  /// MARK: use this to make it rootView with passing some data.
                  // context.goNamed(RouteConst.dashboardScreen.substring(1), extra: 'Login_Success');
                  /// MARK: use this to navigate with passing some data.
                  context.push('/${RouteConst.dashboardScreen}', extra: SampleWidgetArgs("Login_Success"));
                },
                btnText: 'Click Me',
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
