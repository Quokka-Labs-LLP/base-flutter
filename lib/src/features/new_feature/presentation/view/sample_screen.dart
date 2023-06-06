import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/constants/route_constants.dart';

class SampleScreen extends StatefulWidget {
  const SampleScreen({Key? key}) : super(key: key);

  @override
  State<SampleScreen> createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sample Screen',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: () {
                /// MARK: use this to make it rootView without passing any data.
                // context.goNamed(RouteConst.dashboardScreen.substring(1));
                /// MARK: use this to make it rootView with passing some data.
                // context.goNamed(RouteConst.dashboardScreen.substring(1), extra: 'Login_Success');
                /// MARK: use this to navigate with passing some data.
                context.push(RouteConst.dashboardScreen, extra: 'Login_Success');
              }, child: const Text(
                'Login',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),),
            )
          ],
        ),
      ),
    );
  }
}
