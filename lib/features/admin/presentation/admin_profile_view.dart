import 'package:flutter/material.dart';

class AdminProfileView extends StatelessWidget {
  const AdminProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F4F0),
      body: CustomScrollView(
        slivers: [
          // Orange Header Curve
          SliverToBoxAdapter(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Curved Orange Background
                ClipPath(
                  clipper: _HeaderClipper(),
                  child: Container(
                    height: 280,
                    width: double.infinity,
                    color: const Color(0xFFE8711A),
                  ),
                ),
                
                // Content over the orange background
                Positioned.fill(
                  child: Column(
                    children: [
                      SizedBox(height: top + 16),
                      // Avatar
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.person_outline,
                          color: Color(0xFFE8711A),
                          size: 40,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Admin',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'admin@example.com',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Super Admin',
                          style: TextStyle(
                            color: Color(0xFFE8711A),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Menu Items
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 100),
            sliver: SliverList(
              delegate: SliverChildListDelegate(const [
                _ProfileMenuItemCard(
                  icon: Icons.person_outline,
                  title: 'Admin Profile',
                  subtitle: 'View and edit your profile',
                ),
                SizedBox(height: 12),
                _ProfileMenuItemCard(
                  icon: Icons.shield_outlined,
                  title: 'Roles & Permissions',
                  subtitle: 'Manage admin access',
                ),
                SizedBox(height: 12),
                _ProfileMenuItemCard(
                  icon: Icons.notifications_none_outlined,
                  title: 'Notification Settings',
                  subtitle: 'Configure alerts',
                ),
                SizedBox(height: 12),
                _ProfileMenuItemCard(
                  icon: Icons.language_outlined,
                  title: 'Language & Region',
                  subtitle: 'App preferences',
                ),
                SizedBox(height: 24),
                _ProfileMenuItemCard(
                  icon: Icons.logout_rounded,
                  title: 'Logout',
                  subtitle: 'Sign out from admin panel',
                  isLogout: true,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Profile Menu Item Card ────────────────────────────────────────────────────

class _ProfileMenuItemCard extends StatelessWidget {
  const _ProfileMenuItemCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.isLogout = false,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final bool isLogout;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isLogout) {
          Navigator.of(context).pushReplacementNamed('/admin/login');
        }
      },
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
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: isLogout
                    ? const Color(0xFFFDEBEB) // Light red for logout
                    : const Color(0xFFE8711A), // Orange for others
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: isLogout ? const Color(0xFFE20000) : Colors.white,
                size: 22,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isLogout
                          ? const Color(0xFFE20000) // Red text for logout
                          : const Color(0xFF1A1A1A), // Dark text for others
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
          ],
        ),
      ),
    );
  }
}

// ── Custom Clipper for Header ──────────────────────────────────────────────────

class _HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 40);
    
    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
