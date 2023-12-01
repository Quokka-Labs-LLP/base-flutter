import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../constants/color_constants.dart';
import '../widgets/common_title_text.dart';
import 'internet_checker_bloc.dart';

class Utils {
  static Utils instance = Utils();

  void showToast(
    final String? msg, {
    final bool isError = false,
    final bool isLongToast = false,
    final bool onTop = false,
    final bool isSnackBar = false,
  }) {
    Fluttertoast.showToast(
      msg: msg ?? '',
      toastLength: isLongToast ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
      gravity: isSnackBar
          ? ToastGravity.SNACKBAR
          : onTop
              ? ToastGravity.TOP
              : ToastGravity.BOTTOM,
      timeInSecForIosWeb: isLongToast ? 10 : 3,
      backgroundColor: isError ? Colors.red : Colors.green,
      textColor: ColorConst.white,
      fontSize: 16,
      webBgColor: isError
          ? "linear-gradient(to right, #f21616, #f24e4e)"
          : "linear-gradient(to right, #00b09b, #96c93d)",
      webShowClose: true,
    );
  }

  final internetLostSnackBar = SnackBar(
    duration: const Duration(hours: 1),
    content: const CommonTitleText(
      text: 'No Internet Connection',
      fontSize: 16,
      fontColor: Colors.white,
    ),
    action: SnackBarAction(
      label: 'Check Again',
      textColor: Colors.green,
      onPressed: () {
        InternetCheckerBloc.bloc.add(CheckInternetConnectionEvent());
      },
    ),
    padding: const EdgeInsets.all(5),
  );
}
