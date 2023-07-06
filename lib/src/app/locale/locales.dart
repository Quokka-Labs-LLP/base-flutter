import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

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

  static AppLocalizations? of(final BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static final Map<String, AppLanguage> languagesSupported = {
    'en': AppLanguage("English", english()),
    'ar': AppLanguage("عربى", arabic()),
    'fr': AppLanguage("Français", french()),
  };

  static List<Locale> getSupportedLocales() {
   final List<Locale> toReturn = [];
    for ( final String langCode in languagesSupported.keys) {
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
  bool isSupported(final Locale locale) => [
        'en',
        'ar',
        'fr',
      ].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(final Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(final AppLocalizationsDelegate old) => false;
}
