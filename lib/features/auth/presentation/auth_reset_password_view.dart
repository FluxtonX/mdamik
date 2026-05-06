import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'widgets/auth_scaffold.dart';
import 'widgets/auth_text_field.dart';
import 'widgets/primary_button.dart';

class AuthResetPasswordView extends StatefulWidget {
  const AuthResetPasswordView({super.key});

  static const routeName = '/auth/reset-password';

  @override
  State<AuthResetPasswordView> createState() => _AuthResetPasswordViewState();
}

class _AuthResetPasswordViewState extends State<AuthResetPasswordView> {
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return AuthScaffold(
      title: l10n?.appName ?? 'مداميك',
      headerTitle: l10n?.changePassword ?? 'Change Password',
      showBack: true,
      backgroundImageAsset: 'assets/images/construction_login_bg.png',
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
            AuthTextField(
              hintText: l10n?.typeYourNewPassword ?? 'Type your new password',
              obscureText: _obscureNew,
              prefixIcon: Icons.lock_outline,
              suffixIcon: IconButton(
                onPressed: () => setState(() => _obscureNew = !_obscureNew),
                icon: Icon(
                  _obscureNew ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  color: Colors.black.withOpacity(0.4),
                  size: 20,
                ),
              ),
            ),
            const SizedBox(height: 16),
            AuthTextField(
              hintText:
                  l10n?.confirmYourNewPassword ?? 'Confirm your new password',
              obscureText: _obscureConfirm,
              prefixIcon: Icons.lock_outline,
              suffixIcon: IconButton(
                onPressed: () => setState(() => _obscureConfirm = !_obscureConfirm),
                icon: Icon(
                  _obscureConfirm ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  color: Colors.black.withOpacity(0.4),
                  size: 20,
                ),
              ),
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              label: l10n?.changePassword ?? 'Change Password',
              onPressed: () =>
                  Navigator.of(context).pushNamed('/auth/success'),
            ),
          ],
        ),
      ),
    );
  }
}

