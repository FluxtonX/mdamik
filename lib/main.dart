import 'package:flutter/material.dart';

import 'app/app.dart';
import 'core/localization/locale_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final localeProvider = LocaleProvider();
  await localeProvider.loadSavedLocale();

  runApp(App(localeProvider: localeProvider));
}
