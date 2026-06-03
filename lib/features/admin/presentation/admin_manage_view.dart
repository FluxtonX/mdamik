import 'package:flutter/material.dart';

class AdminManageView extends StatelessWidget {
  const AdminManageView({super.key});

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F4F0),
      body: CustomScrollView(
        slivers: [
          // White Header
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.only(
                top: top + 16,
                left: 20,
                right: 20,
                bottom: 24,
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF5F4F0),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Color(0xFF1A1A1A),
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Manage',
                          style: TextStyle(
                            color: Color(0xFF1A1A1A),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Control all platform modules',
                          style: TextStyle(
                            color: Color(0xFF8A8A8A),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Grid
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 100),
            sliver: SliverGrid(
              delegate: SliverChildListDelegate([
                _ManageModuleCard(
                  title: 'Construction',
                  subtitle: '28 projects',
                  icon: Icons.engineering_outlined,
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed('/admin/manage/construction');
                  },
                ),
                const _ManageModuleCard(
                  title: 'Real Estate',
                  subtitle: '156 listings',
                  icon: Icons.home_work_outlined,
                ),
                const _ManageModuleCard(
                  title: 'Engineering',
                  subtitle: '45 engineers',
                  icon: Icons.architecture_outlined,
                ),
                const _ManageModuleCard(
                  title: 'Materials',
                  subtitle: '240 products',
                  icon: Icons.inventory_2_outlined,
                ),
                const _ManageModuleCard(
                  title: 'Labor',
                  subtitle: '86 workers',
                  icon: Icons.people_outline,
                ),
                const _ManageModuleCard(
                  title: 'Excavation',
                  subtitle: '12 providers',
                  icon: Icons.construction_outlined,
                ),
                const _ManageModuleCard(
                  title: 'Transport',
                  subtitle: '32 vehicles',
                  icon: Icons.local_shipping_outlined,
                ),
                const _ManageModuleCard(
                  title: 'Services',
                  subtitle: '18 services',
                  icon: Icons.build_outlined,
                ),
                const _ManageModuleCard(
                  title: 'Management',
                  subtitle: '28 projects',
                  icon: Icons.business_center_outlined,
                ),
                const _ManageModuleCard(
                  title: 'Financial',
                  subtitle: '\$45.2K',
                  icon: Icons.attach_money,
                ),
                const _ManageModuleCard(
                  title: 'Account',
                  subtitle: '8 admins',
                  icon: Icons.settings_outlined,
                ),
                const _ManageModuleCard(
                  title: 'Support',
                  subtitle: '12 tickets',
                  icon: Icons.headset_mic_outlined,
                ),
              ]),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ManageModuleCard extends StatelessWidget {
  const _ManageModuleCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFFE8711A),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: Colors.white, size: 22),
            ),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF8A8A8A),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
