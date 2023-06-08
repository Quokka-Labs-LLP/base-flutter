import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'dart:async';
import 'languages/arabic.dart';
import 'languages/english.dart';
import 'languages/french.dart';

class AppLanguage {
  final String name;
  final Map<String, String> values;

  AppLanguage(this.name, this.values);
}

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static final Map<String, AppLanguage> languagesSupported = {
    'en': AppLanguage("English", english()),
    'ar': AppLanguage("عربى", arabic()),
    'fr': AppLanguage("Français", french()),
  };

  static List<Locale> getSupportedLocales() {
    List<Locale> toReturn = [];
    for (String langCode in languagesSupported.keys) {
      toReturn.add(Locale(langCode));
    }
    return toReturn;
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': english(),
    'ar': arabic(),
    'fr': french(),
  };

  String? get phoneText {
    return _localizedValues[locale.languageCode]!['phoneText'];
  }

  String? get continueText {
    return _localizedValues[locale.languageCode]!['continueText'];
  }

  String? get signIn {
    return _localizedValues[locale.languageCode]!['signIn'];
  }

  String? get phoneHint {
    return _localizedValues[locale.languageCode]!['phoneHint'];
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => [
        'en',
        'ar',
        'fr',
      ].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
