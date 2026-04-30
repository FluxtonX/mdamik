import 'package:flutter/material.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  static const routeName = '/services';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFFF28B22), size: 20),
        ),
        title: const Text('Services', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Essential site operations support',
              style: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 13, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 24),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.9,
              children: [
                _ServiceCard(
                  icon: Icons.auto_awesome_outlined,
                  title: 'Site Cleaning',
                  subtitle: 'During & post-construction cleanup',
                  onTap: () => Navigator.of(context).pushNamed(
                    '/services/list',
                    arguments: {'title': 'Site Cleaning'},
                  ),
                ),
                _ServiceCard(
                  icon: Icons.shield_outlined,
                  title: 'Security',
                  subtitle: '24/7 guards & CCTV setup',
                  onTap: () => Navigator.of(context).pushNamed(
                    '/services/list',
                    arguments: {'title': 'Security Services'},
                  ),
                ),
                _ServiceCard(
                  icon: Icons.bolt_outlined,
                  title: 'Utility Setup',
                  subtitle: 'Electricity, water & internet',
                  onTap: () => Navigator.of(context).pushNamed(
                    '/services/list',
                    arguments: {'title': 'Utility Setup'},
                  ),
                ),
                _ServiceCard(
                  icon: Icons.fact_check_outlined,
                  title: 'Safety &\nCompliance',
                  subtitle: 'HSE inspections & audits',
                  onTap: () => Navigator.of(context).pushNamed(
                    '/services/list',
                    arguments: {'title': 'Safety & Compliance'},
                  ),
                ),
                _ServiceCard(
                  icon: Icons.opacity_outlined,
                  title: 'Sanitation',
                  subtitle: 'Portable toilets & hygiene',
                  onTap: () => Navigator.of(context).pushNamed(
                    '/services/list',
                    arguments: {'title': 'Sanitation Services'},
                  ),
                ),
                _ServiceCard(
                  icon: Icons.fence_outlined,
                  title: 'Site Setup',
                  subtitle: 'Hoarding, fencing & signage',
                  onTap: () => Navigator.of(context).pushNamed(
                    '/services/list',
                    arguments: {'title': 'Site Setup'},
                  ),
                ),
                _ServiceCard(
                  icon: Icons.eco_outlined,
                  title: 'Environmental',
                  subtitle: 'Dust control & restoration',
                  onTap: () => Navigator.of(context).pushNamed(
                    '/services/list',
                    arguments: {'title': 'Environmental Services'},
                  ),
                ),
                _ServiceCard(
                  icon: Icons.camera_alt_outlined,
                  title: 'Documentation',
                  subtitle: 'Drone surveys & photography',
                  onTap: () => Navigator.of(context).pushNamed(
                    '/services/list',
                    arguments: {'title': 'Documentation Services'},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F1E4).withOpacity(0.5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Bundle Services & Save', style: TextStyle(color: Color(0xFFE57E2E), fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(height: 8),
                  Text(
                    'Book multiple services together for better rates',
                    style: TextStyle(color: Colors.black.withOpacity(0.4), fontSize: 12, height: 1.5),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF28B22),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(120, 40),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      elevation: 0,
                    ),
                    child: const Text('View Bundles', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
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

class _ServiceCard extends StatelessWidget {
  const _ServiceCard({required this.icon, required this.title, required this.subtitle, required this.onTap});

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFF1F1F4)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFFCE6D3).withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: const Color(0xFFF28B22), size: 24),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black.withOpacity(0.2), fontSize: 9, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
