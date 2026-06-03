// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

// import 'app/app.dart';
// import 'core/localization/locale_provider.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   final localeProvider = LocaleProvider();
//   await localeProvider.loadSavedLocale();

//   runApp(App(localeProvider: localeProvider));
// }

import 'package:flutter/material.dart';
import 'package:mdamik/features/admin/presentation/admin_login_view.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdminLoginView(),
    ),
  );
}
