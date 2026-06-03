import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'admin_dashboard_view.dart';
import 'admin_manage_view.dart';
import 'admin_requests_view.dart';
import 'admin_finance_view.dart';
import 'admin_profile_view.dart';

class AdminMainNavView extends StatefulWidget {
  const AdminMainNavView({super.key});

  static const routeName = '/admin/main';

  @override
  State<AdminMainNavView> createState() => _AdminMainNavViewState();
}

class _AdminMainNavViewState extends State<AdminMainNavView> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    AdminDashboardView(),
    AdminManageView(),
    AdminRequestsView(),
    AdminFinanceView(),
    AdminProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: _screens,
        ),
        bottomNavigationBar: _AdminBottomNav(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
        ),
      ),
    );
  }
}

// ── Bottom Nav ─────────────────────────────────────────────────────────────────

class _AdminBottomNav extends StatelessWidget {
  const _AdminBottomNav({
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  static const _items = [
    _NavItem(icon: Icons.dashboard_outlined, activeIcon: Icons.dashboard_rounded, label: 'Dashboard'),
    _NavItem(icon: Icons.manage_accounts_outlined, activeIcon: Icons.manage_accounts_rounded, label: 'Manage'),
    _NavItem(icon: Icons.inbox_outlined, activeIcon: Icons.inbox_rounded, label: 'Requests'),
    _NavItem(icon: Icons.account_balance_wallet_outlined, activeIcon: Icons.account_balance_wallet_rounded, label: 'Finance'),
    _NavItem(icon: Icons.person_outline, activeIcon: Icons.person_rounded, label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 24,
            offset: const Offset(0, -6),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            bottom: bottom > 0 ? 0 : 10,
            left: 8,
            right: 8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_items.length, (i) {
              final item = _items[i];
              final isActive = currentIndex == i;

              return GestureDetector(
                onTap: () => onTap(i),
                behavior: HitTestBehavior.opaque,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: isActive
                        ? const Color(0xFFE8711A).withOpacity(0.12)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Requests tab gets a badge
                      i == 2
                          ? Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Icon(
                                  isActive ? item.activeIcon : item.icon,
                                  color: isActive
                                      ? const Color(0xFFE8711A)
                                      : const Color(0xFFB0B0B0),
                                  size: 24,
                                ),
                                Positioned(
                                  top: -4,
                                  right: -6,
                                  child: Container(
                                    width: 16,
                                    height: 16,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFE74C3C),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '47',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 8,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Icon(
                              isActive ? item.activeIcon : item.icon,
                              color: isActive
                                  ? const Color(0xFFE8711A)
                                  : const Color(0xFFB0B0B0),
                              size: 24,
                            ),
                      const SizedBox(height: 4),
                      AnimatedDefaultTextStyle(
                        duration: const Duration(milliseconds: 200),
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: isActive
                              ? FontWeight.w700
                              : FontWeight.w500,
                          color: isActive
                              ? const Color(0xFFE8711A)
                              : const Color(0xFFB0B0B0),
                        ),
                        child: Text(item.label),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });

  final IconData icon;
  final IconData activeIcon;
  final String label;
}
