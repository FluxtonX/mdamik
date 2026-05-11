import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AllServicesView extends StatelessWidget {
  const AllServicesView({super.key});

  static const routeName = '/home/all-services';

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
          icon: const Icon(Icons.arrow_back_ios_new,
              color: Color(0xFFF28B22), size: 20),
        ),
        title: Text(
          l10n?.allServices ?? 'All Services',
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFCE6D3).withOpacity(0.3),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFFCE6D3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n?.allServicesTagline ?? 'Complete Construction Platform',
                    style: const TextStyle(
                        color: Color(0xFFF28B22),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    l10n?.allServicesDesc ??
                        'Access all 12 categories from one place',
                    style: const TextStyle(
                        color: Colors.black26, fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 0.85,
              children: [
                _ServiceGridItem(
                  icon: Icons.home_repair_service_outlined,
                  label: l10n?.svcConstruction ?? 'Construction',
                  desc: l10n?.svcConstructionDesc ?? 'Build your dream project',
                ),
                _ServiceGridItem(
                  icon: Icons.real_estate_agent_outlined,
                  label: l10n?.svcRealEstate ?? 'Real Estate',
                  desc: l10n?.svcRealEstateDesc ??
                      'Buy, sell, or rent properties',
                ),
                _ServiceGridItem(
                  icon: Icons.engineering_outlined,
                  label: l10n?.svcEngineering ?? 'Engineering',
                  desc: l10n?.svcEngineeringDesc ?? 'Design & planning',
                ),
                _ServiceGridItem(
                  icon: Icons.layers_outlined,
                  label: l10n?.svcMaterials ?? 'Materials',
                  desc: l10n?.svcMaterialsDesc ?? 'Construction supplies',
                ),
                _ServiceGridItem(
                  icon: Icons.construction_outlined,
                  label: l10n?.svcExcavation ?? 'Excavation',
                  desc: l10n?.svcExcavationDesc ?? 'Excavation services',
                ),
                _ServiceGridItem(
                  icon: Icons.engineering_outlined,
                  label: l10n?.svcLabor ?? 'Labor',
                  desc: l10n?.svcLaborDesc ?? 'Hire skilled workers',
                ),
                _ServiceGridItem(
                  icon: Icons.local_shipping_outlined,
                  label: l10n?.svcTransport ?? 'Transport',
                  desc: l10n?.svcTransportDesc ?? 'Logistics & shipping',
                ),
                _ServiceGridItem(
                  icon: Icons.settings_suggest_outlined,
                  label: l10n?.svcServices ?? 'Services',
                  desc: l10n?.svcServicesDesc ?? 'Operations support',
                ),
                _ServiceGridItem(
                  icon: Icons.assignment_outlined,
                  label: l10n?.svcManagement ?? 'Management',
                  desc: l10n?.svcManagementDesc ?? 'Project oversight',
                ),
                _ServiceGridItem(
                  icon: Icons.monetization_on_outlined,
                  label: l10n?.svcFinancial ?? 'Financial',
                  desc: l10n?.svcFinancialDesc ?? 'Budgeting & costs',
                ),
                _ServiceGridItem(
                  icon: Icons.account_balance_outlined,
                  label: l10n?.svcAccount ?? 'Account & System',
                  desc: l10n?.svcAccountDesc ?? 'Settings & verification',
                ),
                _ServiceGridItem(
                  icon: Icons.support_agent_outlined,
                  label: l10n?.svcSupport ?? 'Support',
                  desc: l10n?.svcSupportDesc ?? 'Help & customer support',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ServiceGridItem extends StatelessWidget {
  const _ServiceGridItem(
      {required this.icon, required this.label, required this.desc});

  final IconData icon;
  final String label;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFF28B22).withOpacity(0.12),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(icon, color: const Color(0xFFF58220), size: 28),
          ),
          const SizedBox(height: 12),
          Text(
            label,
            style:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            desc,
            style: const TextStyle(color: Colors.black45, fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
