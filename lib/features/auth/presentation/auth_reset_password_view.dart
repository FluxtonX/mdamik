import 'package:flutter/material.dart';

import 'widgets/auth_scaffold.dart';
import 'widgets/auth_text_field.dart';
import 'widgets/primary_button.dart';

class AuthResetPasswordView extends StatelessWidget {
  const AuthResetPasswordView({super.key});

  static const routeName = '/auth/reset-password';

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: 'Auth',
      showBack: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  'Reset password',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 12),
                const AuthTextField(
                  hintText: 'New password',
                  obscureText: true,
                  prefixIcon: Icons.lock_outline,
                ),
                const SizedBox(height: 10),
                const AuthTextField(
                  hintText: 'Confirm password',
                  obscureText: true,
                  prefixIcon: Icons.lock_outline,
                ),
                const SizedBox(height: 14),
                PrimaryButton(
                  label: 'Update Password',
                  onPressed: () =>
                      Navigator.of(context).pushNamed('/auth/success'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

