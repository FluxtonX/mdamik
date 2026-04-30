import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new,
              color: Color(0xFFF28B22), size: 20),
        ),
        title: Text(l10n?.accountSettings ?? 'Account & Settings',
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFF1F1F4)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF28B22),
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text('JD',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('John Doe',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),
                            const SizedBox(height: 4),
                            Text(
                              'Client • Member since\nJan 2026',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.3),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(l10n?.edit ?? 'Edit',
                            style: const TextStyle(
                                color: Color(0xFFF28B22),
                                fontWeight: FontWeight.bold,
                                fontSize: 13)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(l10n?.verificationProgress ?? 'Verification Progress',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.4),
                              fontSize: 12,
                              fontWeight: FontWeight.w500)),
                      Text(l10n?.completedOf6 ?? '3/6 Completed',
                          style: const TextStyle(
                              color: Color(0xFFF28B22),
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: const LinearProgressIndicator(
                      value: 0.5,
                      backgroundColor: Color(0xFFF1F1F4),
                      color: Color(0xFFF28B22),
                      minHeight: 6,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Verification Banner
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F1E4).withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n?.completeVerification ?? 'Complete Your Verification',
                      style: const TextStyle(
                          color: Color(0xFFE57E2E),
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                  const SizedBox(height: 6),
                  Text(
                      l10n?.verificationSubtitle ??
                          'Unlock advanced features and build trust',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.3),
                          fontSize: 11,
                          fontWeight: FontWeight.w500)),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _VerificationChip(label: l10n?.phone ?? 'Phone'),
                      const SizedBox(width: 12),
                      _VerificationChip(label: l10n?.email ?? 'Email'),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _VerificationChip(
                          label: l10n?.national ?? 'National'),
                      const SizedBox(width: 12),
                      _VerificationChip(
                          label: l10n?.business ?? 'Business'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            Text(l10n?.account ?? 'ACCOUNT',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.3),
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1)),
            const SizedBox(height: 16),
            _SettingsItem(
                icon: Icons.person_outline,
                label: l10n?.profileInformation ?? 'Profile Information',
                onTap: () => Navigator.of(context)
                    .pushNamed('/profile/information')),
            _SettingsItem(
                icon: Icons.verified_user_outlined,
                label: l10n?.verificationStatus ?? 'Verification Status'),
            _SettingsItem(
                icon: Icons.lock_outline,
                label: l10n?.securityPrivacy ?? 'Security & Privacy',
                onTap: () =>
                    Navigator.of(context).pushNamed('/profile/security')),
            const SizedBox(height: 32),

            Text(l10n?.preferences ?? 'PREFERENCES',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.3),
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1)),
            const SizedBox(height: 16),
            _SettingsItem(
                icon: Icons.notifications_none_outlined,
                label: l10n?.notificationsSettings ?? 'Notifications',
                onTap: () => Navigator.of(context)
                    .pushNamed('/profile/notifications')),
            _SettingsItem(
                icon: Icons.language_outlined,
                label: l10n?.languageRegion ?? 'Language & Region'),
            _SettingsItem(
                icon: Icons.credit_card_outlined,
                label: l10n?.paymentMethods ?? 'Payment Methods'),
            const SizedBox(height: 32),

            Text(l10n?.support ?? 'SUPPORT',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.3),
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1)),
            const SizedBox(height: 16),
            _SettingsItem(
                icon: Icons.help_outline,
                label: l10n?.helpSupport ?? 'Help & Support'),
            const SizedBox(height: 8),

            // Log Out
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFF1F1F4)),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.logout,
                        color: Colors.red, size: 18),
                  ),
                  const SizedBox(width: 16),
                  Text(l10n?.logOut ?? 'Log Out',
                      style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _VerificationChip extends StatelessWidget {
  const _VerificationChip({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1F1F4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle,
              color: Color(0xFF00B16A), size: 14),
          const SizedBox(width: 8),
          Text(label,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.3),
                  fontSize: 11,
                  fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

class _SettingsItem extends StatelessWidget {
  const _SettingsItem(
      {required this.icon, required this.label, this.onTap});
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFF1F1F4)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFFCE6D3).withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: const Color(0xFFF28B22), size: 18),
            ),
            const SizedBox(width: 16),
            Expanded(
                child: Text(label,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14))),
            const Icon(Icons.chevron_right,
                color: Color(0xFFF28B22), size: 20),
          ],
        ),
      ),
    );
  }
}
