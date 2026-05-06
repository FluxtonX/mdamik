import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PaymentMethodsView extends StatelessWidget {
  const PaymentMethodsView({super.key});

  static const routeName = '/profile/payment-methods';

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
        title: Text(l10n?.paymentMethods ?? 'Payment Methods',
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionHeader(
              title: l10n?.savedCards ?? 'Saved Cards',
              actionLabel: l10n?.addCard ?? 'Add Card',
              onActionTap: () {},
            ),
            const SizedBox(height: 16),
            // Primary Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFF28B22), Color(0xFFE57A10)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFF28B22).withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.credit_card, color: Colors.white, size: 32),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          l10n?.primary ?? 'PRIMARY',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Text(
                    l10n?.maskedCardPrimary ?? '••••  ••••  ••••  4532',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(l10n?.cardholderName ?? 'John Doe',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                      Text(l10n?.cardExpiry ?? '12/26',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Other Card
            _PaymentItem(
              icon: Icons.credit_card,
              title: l10n?.maskedCardOther ?? '•••• 8821',
              subtitle: l10n?.expires0927 ?? 'Expires 09/27',
              actionLabel: l10n?.remove ?? 'Remove',
              onActionTap: () {},
            ),
            const SizedBox(height: 32),
            _SectionHeader(title: l10n?.mobilePayment ?? 'Mobile Payment'),
            const SizedBox(height: 16),
            _PaymentItem(
              icon: Icons.account_balance_wallet_outlined,
              title: l10n?.myFawry ?? 'MyFawry',
              subtitle: l10n?.myFawryPhone ?? '+249 300 1234567',
              badge: l10n?.linked ?? 'LINKED',
              onTap: () {},
            ),
            const SizedBox(height: 32),
            _SectionHeader(title: l10n?.bankAccount ?? 'Bank Account'),
            const SizedBox(height: 16),
            _PaymentItem(
              icon: Icons.account_balance_outlined,
              title: l10n?.bangkokBank ?? 'Bangkok Bank',
              subtitle: l10n?.forDirectTransfers ?? 'For direct transfers',
              actionIcon: Icons.add,
              onTap: () {},
              onActionTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        onTap: (index) {},
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFF28B22),
        unselectedItemColor: Colors.black26,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        unselectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            label: l10n?.navHome ?? 'Home',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.business_center_outlined),
            label: l10n?.navProjects ?? 'Projects',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.chat_bubble_outline),
            label: l10n?.navChat ?? 'Chat',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline),
            label: l10n?.navProfile ?? 'Profile',
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String? actionLabel;
  final VoidCallback? onActionTap;

  const _SectionHeader({
    required this.title,
    this.actionLabel,
    this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        if (actionLabel != null)
          InkWell(
            onTap: onActionTap,
            child: Row(
              children: [
                const Icon(Icons.add, color: Color(0xFFF28B22), size: 16),
                const SizedBox(width: 4),
                Text(
                  actionLabel!,
                  style: const TextStyle(
                      color: Color(0xFFF28B22),
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _PaymentItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String? actionLabel;
  final IconData? actionIcon;
  final String? badge;
  final VoidCallback? onTap;
  final VoidCallback? onActionTap;

  const _PaymentItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.actionLabel,
    this.actionIcon,
    this.badge,
    this.onTap,
    this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
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
              child: Icon(icon, color: const Color(0xFFF28B22), size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.3),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            if (badge != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6F7F0),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  badge!,
                  style: const TextStyle(
                      color: Color(0xFF00B16A),
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                ),
              ),
            if (actionLabel != null)
              TextButton(
                onPressed: onActionTap,
                child: Text(
                  actionLabel!,
                  style: const TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ),
            if (actionIcon != null)
              IconButton(
                onPressed: onActionTap,
                icon: Icon(actionIcon, color: const Color(0xFFF28B22), size: 20),
              ),
          ],
        ),
      ),
    );
  }
}
