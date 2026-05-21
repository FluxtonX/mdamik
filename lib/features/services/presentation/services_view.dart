import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  static const routeName = '/services';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFFF28B22), size: 20),
        ),
        title: Text(l10n?.services ?? 'Services', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n?.essentialSiteOps ?? 'Essential site operations support',
              style: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 13, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 24),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.1,
              children: [
                _ServiceCard(
                  icon: Icons.auto_awesome_outlined,
                  title: l10n?.siteCleaning ?? 'Site Cleaning',
                  onTap: () => Navigator.of(context).pushNamed(
                    '/services/list',
                    arguments: {'title': l10n?.siteCleaning ?? 'Site Cleaning'},
                  ),
                ),
                _ServiceCard(
                  icon: Icons.shield_outlined,
                  title: l10n?.security ?? 'Security',
                  onTap: () => Navigator.of(context).pushNamed(
                    '/services/list',
                    arguments: {'title': l10n?.security ?? 'Security Services'},
                  ),
                ),
                _ServiceCard(
                  icon: Icons.bolt_outlined,
                  title: l10n?.utilitySetup ?? 'Utility Setup',
                  onTap: () => Navigator.of(context).pushNamed(
                    '/services/list',
                    arguments: {'title': l10n?.utilitySetup ?? 'Utility Setup'},
                  ),
                ),
                _ServiceCard(
                  icon: Icons.fact_check_outlined,
                  title: l10n?.safetyCompliance ?? 'Safety &\nCompliance',
                  onTap: () => Navigator.of(context).pushNamed(
                    '/services/list',
                    arguments: {'title': l10n?.safetyCompliance ?? 'Safety & Compliance'},
                  ),
                ),
                _ServiceCard(
                  icon: Icons.opacity_outlined,
                  title: l10n?.sanitation ?? 'Sanitation',
                  onTap: () => Navigator.of(context).pushNamed(
                    '/services/list',
                    arguments: {'title': l10n?.sanitation ?? 'Sanitation Services'},
                  ),
                ),
                _ServiceCard(
                  icon: Icons.fence_outlined,
                  title: l10n?.siteSetup ?? 'Site Setup',
                  onTap: () => Navigator.of(context).pushNamed(
                    '/services/list',
                    arguments: {'title': l10n?.siteSetup ?? 'Site Setup'},
                  ),
                ),
                _ServiceCard(
                  icon: Icons.eco_outlined,
                  title: l10n?.environmental ?? 'Environmental',
                  onTap: () => Navigator.of(context).pushNamed(
                    '/services/list',
                    arguments: {'title': l10n?.environmental ?? 'Environmental Services'},
                  ),
                ),
                _ServiceCard(
                  icon: Icons.camera_alt_outlined,
                  title: l10n?.documentation ?? 'Documentation',
                  onTap: () => Navigator.of(context).pushNamed(
                    '/services/list',
                    arguments: {'title': l10n?.documentation ?? 'Documentation Services'},
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
                  Text(l10n?.bundleServices ?? 'Bundle Services & Save', style: const TextStyle(color: Color(0xFFE57E2E), fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(height: 8),
                  Text(
                    l10n?.bundleServicesDesc ?? 'Book multiple services together for better rates',
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
                    child: Text(l10n?.viewBundles ?? 'View Bundles', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
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
  const _ServiceCard({required this.icon, required this.title, required this.onTap});

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0x26F58220),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFF58220).withOpacity(0.12),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(icon, color: const Color(0xFFF58220), size: 24),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
