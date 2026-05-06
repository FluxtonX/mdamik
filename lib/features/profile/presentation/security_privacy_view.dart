import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SecurityPrivacyView extends StatefulWidget {
  const SecurityPrivacyView({super.key});

  static const routeName = '/profile/security';

  @override
  State<SecurityPrivacyView> createState() => _SecurityPrivacyViewState();
}

class _SecurityPrivacyViewState extends State<SecurityPrivacyView> {
  bool _is2FAEnabled = true;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFF1F1F4)),
              color: Colors.white,
            ),
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back,
                  color: Color(0xFFF28B22), size: 18),
            ),
          ),
        ),
        title: Text(l10n?.securityPrivacyTitle ?? 'Security & Privacy',
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Password Section
            Text(l10n?.passwordSection ?? 'Password',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 20),

            _buildPasswordField(
                l10n?.currentPassword ?? 'Current Password',
                l10n?.enterCurrentPassword ?? 'Enter current password',
                showVisibilityToggle: true),
            const SizedBox(height: 20),
            _buildPasswordField(l10n?.newPasswordLabel ?? 'New Password',
                l10n?.enterNewPassword ?? 'Enter new password'),
            const SizedBox(height: 20),
            _buildPasswordField(
                l10n?.confirmNewPasswordLabel ?? 'Confirm New Password',
                l10n?.confirmNewPasswordHint ?? 'Confirm new password'),
            const SizedBox(height: 32),

            // Two-Factor Authentication
            Text(l10n?.twoFactorAuthentication ?? 'Two-Factor Authentication',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFF1F1F4)),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFCE6D3).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.smartphone,
                        color: Color(0xFFF28B22), size: 20),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(l10n?.twoFaViaSms ?? '2FA via SMS',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                        const SizedBox(height: 2),
                        Text(l10n?.extraSecurityLayer ?? 'Extra security layer',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.3),
                                fontSize: 12,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ),
                  Switch(
                    value: _is2FAEnabled,
                    onChanged: (v) => setState(() => _is2FAEnabled = v),
                    activeColor: Colors.white,
                    activeTrackColor: const Color(0xFFF28B22),
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: const Color(0xFFF1F1F4),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Active Sessions
            Text(l10n?.activeSessions ?? 'Active Sessions',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 16),

            _buildSessionItem(
              icon: Icons.phone_iphone,
              name: l10n?.deviceIphone14Pro ?? 'iPhone 14 Pro',
              details: l10n?.sessionActiveNow ?? 'New York, USA • Active now',
              isActive: true,
            ),
            _buildSessionItem(
              icon: Icons.laptop_mac,
              name: l10n?.deviceMacbookPro ?? 'MacBook Pro',
              details: l10n?.sessionTwoHoursAgo ?? 'New York, USA • 2 hours ago',
              onRevoke: () {},
            ),
            const SizedBox(height: 40),

            // Save Security Settings
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF28B22),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 60),
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 0,
              ),
              child: Text(l10n?.saveSecuritySettings ?? 'Save Security Settings',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField(String label, String hint,
      {bool showVisibilityToggle = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                color: Color(0xFFF28B22),
                fontWeight: FontWeight.bold,
                fontSize: 12)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFF1F1F4)),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle:
                        TextStyle(color: Colors.black.withOpacity(0.2), fontSize: 14),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
              if (showVisibilityToggle)
                Icon(Icons.visibility_outlined,
                    color: Colors.black.withOpacity(0.2), size: 20),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSessionItem({
    required IconData icon,
    required String name,
    required String details,
    bool isActive = false,
    VoidCallback? onRevoke,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1F1F4)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFFCE6D3).withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFFF28B22), size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 2),
                Text(details,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.3),
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          if (isActive)
            Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                  color: Color(0xFF00B16A), shape: BoxShape.circle),
            )
          else if (onRevoke != null)
            TextButton(
              onPressed: onRevoke,
              child: Text(AppLocalizations.of(context)?.revoke ?? 'Revoke',
                  style: const TextStyle(
                      color: Colors.redAccent,
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
            ),
        ],
      ),
    );
  }
}
