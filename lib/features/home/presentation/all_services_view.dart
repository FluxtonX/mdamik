import 'package:flutter/material.dart';

class AllServicesView extends StatelessWidget {
  const AllServicesView({super.key});

  static const routeName = '/home/all-services';

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
        title: const Text(
          'All Services',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Complete Construction Platform',
                    style: TextStyle(color: Color(0xFFF28B22), fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Access all 12 categories from one place',
                    style: TextStyle(color: Colors.black26, fontSize: 12),
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
              children: const [
                _ServiceGridItem(
                  icon: Icons.home_repair_service_outlined,
                  label: 'Construction',
                  desc: 'Build your dream project',
                ),
                _ServiceGridItem(
                  icon: Icons.real_estate_agent_outlined,
                  label: 'Real Estate',
                  desc: 'Buy, sell, or rent properties',
                ),
                _ServiceGridItem(
                  icon: Icons.engineering_outlined,
                  label: 'Engineering',
                  desc: 'Design & planning',
                ),
                _ServiceGridItem(
                  icon: Icons.layers_outlined,
                  label: 'Materials',
                  desc: 'Construction supplies',
                ),
                _ServiceGridItem(
                  icon: Icons.construction_outlined,
                  label: 'Excavation',
                  desc: 'Excavation services',
                ),
                _ServiceGridItem(
                  icon: Icons.engineering_outlined,
                  label: 'Labor',
                  desc: 'Hire skilled workers',
                ),
                _ServiceGridItem(
                  icon: Icons.local_shipping_outlined,
                  label: 'Transport',
                  desc: 'Logistics & shipping',
                ),
                _ServiceGridItem(
                  icon: Icons.settings_suggest_outlined,
                  label: 'Services',
                  desc: 'Operations support',
                ),
                _ServiceGridItem(
                  icon: Icons.assignment_outlined,
                  label: 'Management',
                  desc: 'Project oversight',
                ),
                _ServiceGridItem(
                  icon: Icons.monetization_on_outlined,
                  label: 'Financial',
                  desc: 'Budgeting & costs',
                ),
                _ServiceGridItem(
                  icon: Icons.account_balance_outlined,
                  label: 'Account & System',
                  desc: 'Settings & verification',
                ),
                _ServiceGridItem(
                  icon: Icons.support_agent_outlined,
                  label: 'Support',
                  desc: 'Help & customer support',
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
  const _ServiceGridItem({required this.icon, required this.label, required this.desc});

  final IconData icon;
  final String label;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color(0xFFF28B22), size: 28),
          ),
          const SizedBox(height: 12),
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            desc,
            style: const TextStyle(color: Colors.black26, fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
