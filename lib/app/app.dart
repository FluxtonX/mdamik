import 'package:flutter/material.dart';

import '../features/auth/presentation/auth_login_view.dart';
import '../features/auth/presentation/auth_otp_view.dart';
import '../features/auth/presentation/auth_register_view.dart';
import '../features/auth/presentation/auth_reset_password_view.dart';
import '../features/auth/presentation/auth_success_view.dart';
import '../features/splash/presentation/splash_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MDAMIK',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: null,
      ),
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (_) => const SplashView(),
        AuthLoginView.routeName: (_) => const AuthLoginView(),
        AuthOtpView.routeName: (_) => const AuthOtpView(),
        AuthRegisterView.routeName: (_) => const AuthRegisterView(),
        AuthResetPasswordView.routeName: (_) => const AuthResetPasswordView(),
        AuthSuccessView.routeName: (_) => const AuthSuccessView(),
      },
    );
  }
}

