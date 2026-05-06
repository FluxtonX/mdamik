import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'all_services_view.dart';
import 'notifications_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      body: SingleChildScrollView(
        padding:
            EdgeInsetsDirectional.only(top: top + 16, start: 16, end: 16, bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xFFF28B22),
                  child: Text(l10n?.sampleInitials ?? 'JD',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n?.goodMorning ?? 'Good morning',
                        style: const TextStyle(
                            color: Colors.black26, fontSize: 12)),
                    Text(l10n?.sampleName ?? 'John Doe',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.of(context)
                      .pushNamed(NotificationsView.routeName),
                  icon: const Icon(Icons.notifications_none,
                      color: Colors.black26),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Color(0xFFF1F1F4)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: const Color(0xFFF1F1F4)),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: l10n?.searchHint ?? 'Search services, materials...',
                  hintStyle:
                      const TextStyle(color: Colors.black12, fontSize: 14),
                  prefixIcon:
                      const Icon(Icons.search, color: Colors.black12),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFF28B22), Color(0xFFE57E2E)],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      l10n?.limitedOffer ?? 'LIMITED OFFER',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n?.bannerTitle ?? '20% Off Your First\nProject',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    l10n?.bannerSubtitle ??
                        'Get started with our premium services',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.8), fontSize: 12),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFFF28B22),
                      elevation: 0,
                      minimumSize: const Size(100, 36),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: Text(l10n?.claimNow ?? 'Claim Now',
                        style:
                            const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Categories
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(l10n?.categories ?? 'Categories',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18)),
                TextButton(
                  onPressed: () => Navigator.of(context)
                      .pushNamed(AllServicesView.routeName),
                  child: Text(l10n?.seeAll ?? 'See all',
                      style: const TextStyle(color: Color(0xFFF28B22))),
                ),
              ],
            ),
            const SizedBox(height: 8),
            GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 8,
              children: [
                _CategoryItem(
                  icon: Icons.home_repair_service_outlined,
                  label: l10n?.catConstruction ?? 'Construction',
                  onTap: () =>
                      Navigator.of(context).pushNamed('/construction'),
                ),
                _CategoryItem(
                  icon: Icons.real_estate_agent_outlined,
                  label: l10n?.catRealEstate ?? 'Real Estate',
                  onTap: () =>
                      Navigator.of(context).pushNamed('/real-estate'),
                ),
                _CategoryItem(
                  icon: Icons.engineering_outlined,
                  label: l10n?.catEngineering ?? 'Engineering',
                  onTap: () =>
                      Navigator.of(context).pushNamed('/engineering'),
                ),
                _CategoryItem(
                  icon: Icons.layers_outlined,
                  label: l10n?.catMaterials ?? 'Materials',
                  onTap: () =>
                      Navigator.of(context).pushNamed('/materials'),
                ),
                _CategoryItem(
                  icon: Icons.construction_outlined,
                  label: l10n?.catExcavation ?? 'Excavation',
                  onTap: () =>
                      Navigator.of(context).pushNamed('/excavation'),
                ),
                _CategoryItem(
                  icon: Icons.engineering_outlined,
                  label: l10n?.catLabor ?? 'Labor',
                  onTap: () => Navigator.of(context).pushNamed('/labor'),
                ),
                _CategoryItem(
                  icon: Icons.local_shipping_outlined,
                  label: l10n?.catTransport ?? 'Transport',
                  onTap: () =>
                      Navigator.of(context).pushNamed('/transport'),
                ),
                _CategoryItem(
                  icon: Icons.more_horiz,
                  label: l10n?.catMore ?? 'More',
                  onTap: () => Navigator.of(context).pushNamed('/services'),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Featured Projects
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(l10n?.featuredProjects ?? 'Featured Projects',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18)),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.black26,
                  size: 20,
                  textDirection: Directionality.of(context),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _ProjectCard(
                    title: l10n?.projectCustomHome ?? 'Custom Home Build',
                    price: l10n?.projectCustomHomePrice ?? 'From \$45,000',
                    imagePath: 'assets/images/project_home_build.png',
                  ),
                  const SizedBox(width: 16),
                  _ProjectCard(
                    title: l10n?.projectApartment ?? 'Apartment Complex',
                    price:
                        l10n?.projectApartmentPrice ?? 'From \$120,000',
                    imagePath: 'assets/images/project_apartment.png',
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

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({required this.icon, required this.label, this.onTap});

  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFFCE6D3).withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFFF28B22), size: 24),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Colors.black87),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard(
      {required this.title, required this.price, required this.imagePath});

  final String title;
  final String price;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
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
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(imagePath,
                height: 110, width: 160, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 13)),
                const SizedBox(height: 4),
                Text(price,
                    style: const TextStyle(
                        color: Color(0xFFF28B22),
                        fontSize: 11,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
