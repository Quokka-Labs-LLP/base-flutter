import 'package:flutter/material.dart';

void printMessage(final String text){
  debugPrint('\x1B[34m$text\x1B[0m');
}

void printWarning(final String text) {
  debugPrint('\x1B[33m$text\x1B[0m');
}

void printError(final String text) {
  debugPrint('\x1B[31m$text\x1B[0m');
}
