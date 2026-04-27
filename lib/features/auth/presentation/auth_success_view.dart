import 'package:flutter/material.dart';

import 'widgets/auth_scaffold.dart';
import 'widgets/primary_button.dart';

class AuthSuccessView extends StatelessWidget {
  const AuthSuccessView({super.key});

  static const routeName = '/auth/success';

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: 'Auth',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(18),
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
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.04),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  alignment: Alignment.center,
                  child: Icon(Icons.verified_rounded,
                      size: 64, color: Colors.green.shade600),
                ),
                const SizedBox(height: 14),
                Text(
                  'Account created successfully',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Your account is ready. You can continue to the app.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.black.withOpacity(0.6)),
                ),
                const SizedBox(height: 16),
                PrimaryButton(
                  label: 'Continue',
                  onPressed: () => Navigator.of(context)
                      .pushNamedAndRemoveUntil('/auth/login', (r) => false),
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

