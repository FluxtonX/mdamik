import 'package:flutter/material.dart';
import 'package:mdamik/features/auth/presentation/widgets/auth_theme.dart';

import 'widgets/auth_scaffold.dart';
import 'widgets/primary_button.dart';

class AuthSuccessView extends StatelessWidget {
  const AuthSuccessView({super.key});

  static const routeName = '/auth/success';

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: 'مداميك',
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 24,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/images/success_illustration.png',
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 24),
            Text(
              'Change password successfully!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AuthTheme.orange,
                  ),
            ),
            const SizedBox(height: 12),
            Text(
              'You have successfully change password.\nPlease use the new password when Sign in.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black.withOpacity(0.6),
                    height: 1.5,
                  ),
            ),
            const SizedBox(height: 32),
            PrimaryButton(
              label: 'Ok',
              onPressed: () => Navigator.of(context)
                  .pushNamedAndRemoveUntil('/home/main', (r) => false),
            ),
          ],
        ),
      ),
    );
  }
}
