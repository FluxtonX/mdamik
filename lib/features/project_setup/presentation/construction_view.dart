import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'project_setup_view.dart';

class ConstructionView extends StatelessWidget {
  const ConstructionView({super.key});

  static const routeName = '/construction';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F2F7),
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFEEEEEE)),
            ),
            child: const Icon(Icons.arrow_back_ios_new,
                color: Color(0xFFF58220), size: 18),
          ),
        ),
        title: Text(
          l10n.constructionTitle,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.selectProjectTypeDesc,
              style: const TextStyle(
                  color: Colors.black38,
                  fontSize: 17,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 14,
              crossAxisSpacing: 14,
              childAspectRatio: 0.95,
              children: [
                _ConstructionTypeCard(
                  icon: Icons.home_outlined,
                  label: l10n.typeHouses,
                  onTap: () => Navigator.of(context)
                      .pushNamed(ProjectSetupView.routeName),
                ),
                _ConstructionTypeCard(
                  icon: Icons.apartment_outlined,
                  label: l10n.typeApartment,
                  onTap: () => Navigator.of(context)
                      .pushNamed(ProjectSetupView.routeName),
                ),
                _ConstructionTypeCard(
                  icon: Icons.business_outlined,
                  label: l10n.typeBuilding,
                  onTap: () => Navigator.of(context)
                      .pushNamed(ProjectSetupView.routeName),
                ),
                _ConstructionTypeCard(
                  icon: Icons.factory_outlined,
                  label: l10n.typeFactory,
                  onTap: () => Navigator.of(context)
                      .pushNamed(ProjectSetupView.routeName),
                ),
                _ConstructionTypeCard(
                  icon: Icons.storefront_outlined,
                  label: l10n.typeShop,
                  onTap: () => Navigator.of(context)
                      .pushNamed(ProjectSetupView.routeName),
                ),
                _ConstructionTypeCard(
                  icon: Icons.edit_road_outlined,
                  label: l10n.typeRoads,
                  onTap: () => Navigator.of(context)
                      .pushNamed(ProjectSetupView.routeName),
                ),
                _ConstructionTypeCard(
                  icon: Icons.park_outlined,
                  label: l10n.typeGardens,
                  onTap: () => Navigator.of(context)
                      .pushNamed(ProjectSetupView.routeName),
                ),
                _ConstructionTypeCard(
                  icon: Icons.warehouse_outlined,
                  label: l10n.typeWarehouse,
                  onTap: () => Navigator.of(context)
                      .pushNamed(ProjectSetupView.routeName),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _ConstructionTypeCard extends StatelessWidget {
  const _ConstructionTypeCard({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  // #F5822026 → color #F58220 with alpha 0x26 (~15% opacity)
  static const _iconBg = Color(0x26F58220);
  static const _iconColor = Color(0xFFF58220);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: _iconBg,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: _iconBg,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, color: _iconColor, size: 40),
            ),
            const SizedBox(height: 14),
            Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
