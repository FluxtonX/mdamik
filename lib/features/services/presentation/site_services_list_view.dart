import 'package:flutter/material.dart';

class SiteServicesListView extends StatefulWidget {
  const SiteServicesListView({super.key});

  static const routeName = '/services/list';

  @override
  State<SiteServicesListView> createState() => _SiteServicesListViewState();
}

class _SiteServicesListViewState extends State<SiteServicesListView> {
  bool _isOneTime = true;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final title = args['title'] as String;

    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFFF28B22), size: 20),
        ),
        title: const Text('Site Services', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Service Type Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFF28B22),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Service Type', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text('Choose how you need the service', style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 11)),
                  const SizedBox(height: 16),
                  Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () => setState(() => _isOneTime = true),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: _isOneTime ? const Color(0xFFE5D87B) : Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'One-Time',
                                style: TextStyle(
                                  color: _isOneTime ? const Color(0xFF8B7722) : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () => setState(() => _isOneTime = false),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: !_isOneTime ? const Color(0xFFE5D87B) : Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'Recurring',
                                style: TextStyle(
                                  color: !_isOneTime ? const Color(0xFF8B7722) : Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Start Date
            const Text('Start Date', style: TextStyle(color: Color(0xFFE57E2E), fontWeight: FontWeight.bold, fontSize: 12)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFF1F1F4)),
              ),
              child: Row(
                children: const [
                  Icon(Icons.calendar_today_outlined, color: Color(0xFFF28B22), size: 16),
                  SizedBox(width: 12),
                  Text('dd/mm/yyyy', style: TextStyle(color: Colors.black12, fontSize: 14)),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Service Providers Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Service Providers', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                Text('4 available', style: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 12)),
              ],
            ),
            const SizedBox(height: 16),

            // Providers List
            _ServiceProviderCard(
              name: 'Clean Services',
              service: title,
              price: '\$150/day',
              rating: 4.9,
              reviews: 234,
              experience: 8,
              distance: '2.3 km',
              jobs: 456,
              initials: 'CS',
            ),
            _ServiceProviderCard(
              name: 'Secure Guard',
              service: 'Security Services',
              price: '\$200/day',
              rating: 4.9,
              reviews: 234,
              experience: 8,
              distance: '2.3 km',
              jobs: 456,
              initials: 'SC',
            ),
            _ServiceProviderCard(
              name: 'Power Setup',
              service: 'Utility Setup',
              price: '\$200/day',
              rating: 4.9,
              reviews: 234,
              experience: 8,
              distance: '2.3 km',
              jobs: 456,
              initials: 'PS',
            ),
            _ServiceProviderCard(
              name: 'Safety Care',
              service: 'Utility Setup',
              price: '\$120/day',
              rating: 4.9,
              reviews: 234,
              experience: 5,
              distance: '2.3 km',
              jobs: 23,
              initials: 'SI',
            ),

            const SizedBox(height: 32),
            // Bundle Banner
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

class _ServiceProviderCard extends StatelessWidget {
  const _ServiceProviderCard({
    required this.name,
    required this.service,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.experience,
    required this.distance,
    required this.jobs,
    required this.initials,
  });

  final String name;
  final String service;
  final String price;
  final double rating;
  final int reviews;
  final int experience;
  final String distance;
  final int jobs;
  final String initials;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1F1F4)),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  color: const Color(0xFFF28B22),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    initials,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                        const SizedBox(width: 4),
                        const Icon(Icons.verified, color: Color(0xFFF28B22), size: 14),
                        const Spacer(),
                        Text(price, style: const TextStyle(color: Color(0xFFF28B22), fontWeight: FontWeight.bold, fontSize: 15)),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(service, style: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 11, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 14),
                        const SizedBox(width: 4),
                        Text(rating.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                        const SizedBox(width: 4),
                        Text('($reviews)', style: TextStyle(color: Colors.black.withOpacity(0.2), fontSize: 11)),
                        const SizedBox(width: 8),
                        Container(width: 4, height: 4, decoration: const BoxDecoration(color: Colors.black12, shape: BoxShape.circle)),
                        const SizedBox(width: 8),
                        Text('$experience years', style: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 12, fontWeight: FontWeight.w500)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined, color: Colors.black.withOpacity(0.3), size: 12),
                        const SizedBox(width: 4),
                        Text(distance, style: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 11, fontWeight: FontWeight.w500)),
                        const SizedBox(width: 8),
                        Container(width: 4, height: 4, decoration: const BoxDecoration(color: Colors.black12, shape: BoxShape.circle)),
                        const SizedBox(width: 8),
                        Text('$jobs jobs', style: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 11, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFE0F2F1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: const [
                Icon(Icons.bolt, color: Color(0xFF26A69A), size: 16),
                SizedBox(width: 8),
                Text('Available Now', style: TextStyle(color: Color(0xFF26A69A), fontWeight: FontWeight.bold, fontSize: 12)),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFFF28B22),
                    side: const BorderSide(color: Color(0xFFF28B22)),
                    minimumSize: const Size(double.infinity, 44),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.chat_bubble_outline, size: 16),
                      SizedBox(width: 8),
                      Text('Chat', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF28B22),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 44),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                  ),
                  child: const Text('Hire Now', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
