import 'package:flutter/material.dart';
import 'widgets/agent_card.dart';

class PropertyDetailsView extends StatefulWidget {
  const PropertyDetailsView({super.key});

  static const routeName = '/real-estate/details';

  @override
  State<PropertyDetailsView> createState() => _PropertyDetailsViewState();
}

class _PropertyDetailsViewState extends State<PropertyDetailsView> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image Header
                  Stack(
                    children: [
                      Image.asset(
                        'assets/images/property_villa.png',
                        height: 350,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: MediaQuery.paddingOf(context).top + 10,
                        left: 20,
                        right: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _HeaderIcon(
                              icon: Icons.arrow_back_ios_new,
                              onTap: () => Navigator.of(context).pop(),
                            ),
                            Row(
                              children: [
                                _HeaderIcon(icon: Icons.share_outlined, onTap: () {}),
                                const SizedBox(width: 12),
                                _HeaderIcon(
                                  icon: _isFavorite ? Icons.favorite : Icons.favorite_border,
                                  iconColor: _isFavorite ? Colors.red : const Color(0xFFF28B22),
                                  onTap: () => setState(() => _isFavorite = !_isFavorite),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Modern Villa',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFCE6D3).withOpacity(0.5),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: const [
                                  Icon(Icons.star, color: Colors.amber, size: 14),
                                  SizedBox(width: 4),
                                  Text('4.8', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.location_on_outlined, color: Colors.black26, size: 16),
                            const SizedBox(width: 4),
                            Text(
                              'Beverly Hills, CA',
                              style: TextStyle(color: Colors.black.withOpacity(0.3), fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          '\$450,000',
                          style: TextStyle(color: Color(0xFFF28B22), fontSize: 28, fontWeight: FontWeight.w900),
                        ),
                        const SizedBox(height: 24),

                        // Stats Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            _StatItem(icon: Icons.king_bed_outlined, label: '4', subLabel: 'Beds'),
                            _StatItem(icon: Icons.bathtub_outlined, label: '3', subLabel: 'Baths'),
                            _StatItem(icon: Icons.square_foot_outlined, label: '3200', subLabel: 'Sqft'),
                            _StatItem(icon: Icons.calendar_today_outlined, label: '2021', subLabel: 'Built'),
                          ],
                        ),
                        const SizedBox(height: 32),

                        // Tabs
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(bottom: BorderSide(color: Color(0xFFF1F1F4))),
                          ),
                          child: TabBar(
                            controller: _tabController,
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.black26,
                            indicatorColor: const Color(0xFFF28B22),
                            indicatorWeight: 3,
                            labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                            tabs: const [
                              Tab(text: 'Overview'),
                              Tab(text: 'Features'),
                              Tab(text: 'Agent'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Tab Content
                        SizedBox(
                          height: 300, // Fixed height for tab content scroll area
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              _buildOverview(),
                              _buildFeatures(),
                              _buildAgent(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Footer Actions
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 40, top: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -4)),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black,
                      side: const BorderSide(color: Color(0xFFF1F1F4)),
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    ),
                    child: const Text('Schedule Tour', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF28B22),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      elevation: 4,
                      shadowColor: const Color(0xFFF28B22).withOpacity(0.4),
                    ),
                    child: const Text('Make Offer', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Description', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 12),
        Text(
          'Beautiful modern villa located in the heart of Beverly Hills. This stunning property features contemporary architecture, high-end finishes, and luxurious amenities. Perfect for those seeking elegance and comfort.',
          style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 14, height: 1.6),
        ),
      ],
    );
  }

  Widget _buildFeatures() {
    final features = [
      'Smart home technology',
      'Gourmet kitchen with premium appliances',
      'Master suite with spa-like bathroom',
      'Private backyard with pool',
      '2-car garage',
      'Central air conditioning',
      'Hardwood floors throughout',
      'Energy efficient windows',
    ];

    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: features.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        return Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 20),
            const SizedBox(width: 12),
            Text(
              features[index],
              style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        );
      },
    );
  }

  Widget _buildAgent() {
    return const AgentCard(
      name: 'Sarah Johnson',
      title: 'Senior Real Estate Agent',
      initials: 'SJ',
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({required this.icon, required this.onTap, this.iconColor});

  final IconData icon;
  final VoidCallback onTap;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10),
          ],
        ),
        child: Icon(icon, color: iconColor ?? const Color(0xFFF28B22), size: 20),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({required this.icon, required this.label, required this.subLabel});

  final IconData icon;
  final String label;
  final String subLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F1F4)),
      ),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xFFF28B22), size: 24),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 2),
          Text(subLabel, style: const TextStyle(color: Colors.black26, fontSize: 11)),
        ],
      ),
    );
  }
}
