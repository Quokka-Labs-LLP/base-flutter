import 'package:base_architecture/src/shared/widgets/common_title_text.dart';
import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CommonTitleText(text: 'Page not found!', fontSize: 30,),
      ),
    );
  }
}
