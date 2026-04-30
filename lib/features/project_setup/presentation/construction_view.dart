import 'package:flutter/material.dart';
import 'project_setup_view.dart';

class ConstructionView extends StatelessWidget {
  const ConstructionView({super.key});

  static const routeName = '/construction';

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
        title: const Text('Construction', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select your project type to get started',
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
                _ConstructionTypeCard(
                  icon: Icons.home_outlined,
                  label: 'Houses',
                  onTap: () => Navigator.of(context).pushNamed(ProjectSetupView.routeName),
                ),
                _ConstructionTypeCard(
                  icon: Icons.business_outlined,
                  label: 'Apartment',
                  onTap: () => Navigator.of(context).pushNamed(ProjectSetupView.routeName),
                ),
                _ConstructionTypeCard(
                  icon: Icons.apartment_outlined,
                  label: 'Building',
                  onTap: () => Navigator.of(context).pushNamed(ProjectSetupView.routeName),
                ),
                _ConstructionTypeCard(
                  icon: Icons.factory_outlined,
                  label: 'Factory',
                  onTap: () => Navigator.of(context).pushNamed(ProjectSetupView.routeName),
                ),
                _ConstructionTypeCard(
                  icon: Icons.storefront_outlined,
                  label: 'Shop',
                  onTap: () => Navigator.of(context).pushNamed(ProjectSetupView.routeName),
                ),
                _ConstructionTypeCard(
                  icon: Icons.edit_road_outlined,
                  label: 'Roads',
                  onTap: () => Navigator.of(context).pushNamed(ProjectSetupView.routeName),
                ),
                _ConstructionTypeCard(
                  icon: Icons.park_outlined,
                  label: 'Gardens',
                  onTap: () => Navigator.of(context).pushNamed(ProjectSetupView.routeName),
                ),
                _ConstructionTypeCard(
                  icon: Icons.warehouse_outlined,
                  label: 'Warehouse',
                  onTap: () => Navigator.of(context).pushNamed(ProjectSetupView.routeName),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ConstructionTypeCard extends StatelessWidget {
  const _ConstructionTypeCard({required this.icon, required this.label, required this.onTap});

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFF1F1F4)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFFCE6D3).withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: const Color(0xFFF28B22), size: 28),
            ),
            const SizedBox(height: 12),
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
