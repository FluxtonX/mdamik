import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/mvvm/view_model_builder.dart';
import 'home_view_model.dart';
import 'notifications_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>(
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (vm) => vm.fetchProfile(),
      builder: (context, vm, _) {
        final top = MediaQuery.paddingOf(context).top;
        final l10n = AppLocalizations.of(context);
        final profile = vm.profile;

        return Scaffold(
          backgroundColor: const Color(0xFFFBFBFB),
          body: SingleChildScrollView(
            padding: EdgeInsetsDirectional.only(
                top: top + 16, start: 16, end: 16, bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: const Color(0xFFF28B22),
                      child: Text(
                        profile?.ui.initials ?? l10n?.sampleInitials ?? 'JD',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(l10n?.goodMorning ?? 'Good morning',
                            style: const TextStyle(
                                color: Colors.black26, fontSize: 15)),
                        Text(
                          profile?.ui.name ?? l10n?.sampleName ?? 'John Doe',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                const Spacer(),
                IconButton(
                  onPressed: () => Navigator.of(context)
                      .pushNamed(NotificationsView.routeName),
                  icon: const Icon(Icons.notifications_none,
                      color: Color.fromARGB(255, 231, 141, 6)),
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Color(0xFFF1F1F4)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFFCE6D3).withOpacity(0.45),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: const Color(0xFFF1F1F4)),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: l10n?.searchHint ?? 'Search services, materials...',
                  hintStyle:
                      const TextStyle(color: Colors.black26, fontSize: 16),
                  prefixIcon: const Icon(Icons.search, color: Colors.black12),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Banner
            Container(
              width: double.infinity,
              height: 145,
              clipBehavior: Clip.hardEdge,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFF28B22), Color(0xFFE57E2E)],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            l10n?.limitedOffer ?? 'LIMITED OFFER',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          l10n?.bannerTitle ?? '20% Off Your First Project',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              height: 1.2),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          l10n?.bannerSubtitle ??
                              'Get started with our premium services',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 14),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFFF28B22),
                      elevation: 0,
                      minimumSize: const Size(80, 32),
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: Text(l10n?.claimNow ?? 'Claim Now',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Categories
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(l10n?.categories ?? 'Categories',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22)),
              ],
            ),
            const SizedBox(height: 8),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 10,
              childAspectRatio: 1.0,
              children: [
                _CategoryItem(
                  icon: Icons.home_repair_service_outlined,
                  label: l10n?.catConstruction ?? 'Construction',
                  onTap: () => Navigator.of(context).pushNamed('/construction'),
                ),
                _CategoryItem(
                  icon: Icons.real_estate_agent_outlined,
                  label: l10n?.catRealEstate ?? 'Real Estate',
                  onTap: () => Navigator.of(context).pushNamed('/real-estate'),
                ),
                _CategoryItem(
                  icon: Icons.engineering_outlined,
                  label: l10n?.catEngineering ?? 'Engineering',
                  onTap: () => Navigator.of(context).pushNamed('/engineering'),
                ),
                _CategoryItem(
                  icon: Icons.layers_outlined,
                  label: l10n?.catMaterials ?? 'Materials',
                  onTap: () => Navigator.of(context).pushNamed('/materials'),
                ),
                _CategoryItem(
                  icon: Icons.construction_outlined,
                  label: l10n?.catExcavation ?? 'Excavation',
                  onTap: () => Navigator.of(context).pushNamed('/excavation'),
                ),
                _CategoryItem(
                  icon: Icons.engineering_outlined,
                  label: l10n?.catLabor ?? 'Labor',
                  onTap: () => Navigator.of(context).pushNamed('/labor'),
                ),
                _CategoryItem(
                  icon: Icons.local_shipping_outlined,
                  label: l10n?.catTransport ?? 'Transport',
                  onTap: () => Navigator.of(context).pushNamed('/transport'),
                ),
                _CategoryItem(
                  icon: Icons.auto_awesome_outlined,
                  label: l10n?.svcServices ?? 'Services',
                  onTap: () => Navigator.of(context).pushNamed('/services'),
                ),
                _CategoryItem(
                  icon: Icons.assignment_outlined,
                  label: l10n?.management ?? 'Management',
                  onTap: () => Navigator.of(context).pushNamed('/management'),
                ),
                _CategoryItem(
                  icon: Icons.monetization_on_outlined,
                  label: l10n?.financialTitle ?? 'Financial',
                  onTap: () => Navigator.of(context).pushNamed('/financial'),
                ),
                _CategoryItem(
                  icon: Icons.account_balance_outlined,
                  label: l10n?.account ?? 'Account',
                  onTap: () => Navigator.of(context).pushNamed('/profile'),
                ),
                _CategoryItem(
                  icon: Icons.support_agent_outlined,
                  label: l10n?.support ?? 'Support',
                  onTap: () => Navigator.of(context).pushNamed('/profile/support'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
      },
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem(
      {required this.icon, required this.label, this.onTap});

  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0x26F58220),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFF28B22).withOpacity(0.12),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(icon, color: const Color(0xFFF58220), size: 36),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
