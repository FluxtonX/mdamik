import 'package:flutter/material.dart';

class AdminDashboardView extends StatelessWidget {
  const AdminDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F4F0),
      body: CustomScrollView(
        slivers: [
          // Header
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                top: top + 16,
                left: 20,
                right: 20,
                bottom: 48, // Extra bottom padding for overlapping cards
              ),
              decoration: const BoxDecoration(
                color: Color(0xFFE8711A),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(32),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Welcome Admin',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Monday, June 1, 2026',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.notifications_outlined,
                          color: Color(0xFFE8711A),
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.person_outline,
                          color: Color(0xFFE8711A),
                          size: 20,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),

          // Stats Grid (Overlapping header slightly)
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            sliver: SliverToBoxAdapter(
              child: Transform.translate(
                offset: const Offset(0, -30),
                child: GridView.count(
                  padding: EdgeInsets.zero,
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.45,
                  children: const [
                    _StatCard(
                      icon: Icons.check_circle_outline,
                      iconColor: Color(0xFFE8711A),
                      value: '12',
                      label: 'Pending Approvals',
                    ),
                    _StatCard(
                      icon: Icons.business_center_outlined,
                      iconColor: Color(0xFFE8711A),
                      value: '28',
                      label: 'Active Projects',
                    ),
                    _StatCard(
                      icon: Icons.shopping_cart_outlined,
                      iconColor: Color(0xFFE8711A),
                      value: '45',
                      label: "Today's Orders",
                    ),
                    _StatCard(
                      icon: Icons.attach_money,
                      iconColor: Color(0xFFE8711A),
                      value: '\$8.5K',
                      label: 'Revenue',
                      change: '+12%',
                    ),
                    _StatCard(
                      icon: Icons.warning_amber_rounded,
                      iconColor: Color(0xFFE8711A),
                      value: '8',
                      label: 'Open Tickets',
                    ),
                    _StatCard(
                      icon: Icons.people_outline,
                      iconColor: Color(0xFFE8711A),
                      value: '15',
                      label: 'New Registrations',
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Alerts
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alerts',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  SizedBox(height: 12),
                  _AlertCard(
                    icon: Icons.error_outline,
                    text: '3 laborers awaiting verification',
                    color: Color(0xFFE8711A),
                    bgColor: Color(0xFFFDF6F1),
                  ),
                  SizedBox(height: 10),
                  _AlertCard(
                    icon: Icons.info_outline,
                    text: '5 material orders pending',
                    color: Color(0xFF4A90E2),
                    bgColor: Color(0xFFF1F6FD),
                  ),
                  SizedBox(height: 10),
                  _AlertCard(
                    icon: Icons.cancel_outlined,
                    text: '2 support tickets urgent',
                    color: Color(0xFFE74C3C),
                    bgColor: Color(0xFFFDF1F1),
                  ),
                  SizedBox(height: 10),
                  _AlertCard(
                    icon: Icons.error_outline,
                    text: '1 refund request pending',
                    color: Color(0xFFE8711A),
                    bgColor: Color(0xFFFDF6F1),
                  ),
                ],
              ),
            ),
          ),

          // Quick Actions
          const SliverPadding(
            padding: EdgeInsets.fromLTRB(16, 24, 16, 0),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Quick Actions',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: _QuickActionButton(label: 'Add Material')),
                      SizedBox(width: 12),
                      Expanded(child: _QuickActionButton(label: 'Approve Provider')),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: _QuickActionButton(label: 'Add Real Estate')),
                      SizedBox(width: 12),
                      Expanded(child: _QuickActionButton(label: 'Create Service')),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Recent Activity
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 100),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Recent Activity',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Column(
                      children: [
                        _ActivityRow(
                          title: 'Cement price updated',
                          time: '2 hours ago',
                          isLast: false,
                        ),
                        _ActivityRow(
                          title: 'Ahmed Hassan approved as labor',
                          time: '3 hours ago',
                          isLast: false,
                        ),
                        _ActivityRow(
                          title: 'Villa listing rejected',
                          time: '5 hours ago',
                          isLast: false,
                        ),
                        _ActivityRow(
                          title: 'Payment refund processed',
                          time: '6 hours ago',
                          isLast: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Stat Card ─────────────────────────────────────────────────────────────────

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.label,
    this.change,
  });

  final IconData icon;
  final Color iconColor;
  final String value;
  final String label;
  final String? change;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: iconColor, size: 24),
              if (change != null)
                Text(
                  change!,
                  style: const TextStyle(
                    color: Color(0xFF27AE60),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF8A8A8A),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Alert Card ────────────────────────────────────────────────────────────────

class _AlertCard extends StatelessWidget {
  const _AlertCard({
    required this.icon,
    required this.text,
    required this.color,
    required this.bgColor,
  });

  final IconData icon;
  final String text;
  final Color color;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: color.withOpacity(0.9), // Text slightly darker/matching icon
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Quick Action Button ───────────────────────────────────────────────────────

class _QuickActionButton extends StatelessWidget {
  const _QuickActionButton({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF1A1A1A),
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

// ── Activity Row ──────────────────────────────────────────────────────────────

class _ActivityRow extends StatelessWidget {
  const _ActivityRow({
    required this.title,
    required this.time,
    required this.isLast,
  });

  final String title;
  final String time;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF8A8A8A),
                      ),
                    ),
                  ],
                ),
              ),
              const Text(
                'Admin',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFFB0B0B0),
                ),
              ),
            ],
          ),
        ),
        if (!isLast)
          Divider(
            height: 1,
            color: Colors.black.withOpacity(0.05),
          ),
      ],
    );
  }
}
