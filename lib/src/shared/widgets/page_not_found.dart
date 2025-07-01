import 'package:flutter/material.dart';

import 'common_title_text.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});

  @override
  Widget build(final BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CommonTitleText(text: 'Page not found!', fontSize: 30,),
      ),
    );
  }
}
