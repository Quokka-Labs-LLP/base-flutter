import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/locale/locales.dart';
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

    return Scaffold(
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
                  context.push('/${RouteConst.dashboardScreen}', extra: 'Login_Success');
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
