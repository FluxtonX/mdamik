import 'package:flutter/material.dart';
import 'widgets/professional_card.dart';

class ProfessionalListView extends StatelessWidget {
  const ProfessionalListView({super.key});

  static const routeName = '/engineering/professionals';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final title = args['title'] as String;
    final subtitle = args['subtitle'] as String;
    final professionals = args['professionals'] as List<Map<String, dynamic>>;

    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFFF28B22), size: 20),
        ),
        title: Text(title, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFF1F1F4)),
              ),
              child: const Icon(Icons.tune, color: Color(0xFFF28B22), size: 18),
            ),
          ),
          const SizedBox(width: 8),
        ],
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subtitle,
              style: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 13, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFCE6D3).withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFF28B22).withOpacity(0.1)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text('All professionals are verified', style: TextStyle(color: Color(0xFFF28B22), fontWeight: FontWeight.bold, fontSize: 13)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Licensed engineers with proven track records',
                    style: TextStyle(color: Colors.black.withOpacity(0.4), fontSize: 11, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ...professionals.map((p) => ProfessionalCard(
                  initials: p['initials'],
                  name: p['name'],
                  title: p['title'],
                  price: p['price'],
                  rating: p['rating'],
                  reviews: p['reviews'],
                  experience: p['experience'],
                  projects: p['projects'],
                )),
            const SizedBox(height: 16),
            _NeedHelpFooter(),
          ],
        ),
      ),
    );
  }
}

class _NeedHelpFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Need help choosing?', style: TextStyle(color: Color(0xFFE57E2E), fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: 8),
        Text(
          'Our team can recommend the best professional for your specific needs',
          style: TextStyle(color: Colors.black.withOpacity(0.4), fontSize: 12, height: 1.5),
        ),
        const SizedBox(height: 12),
        InkWell(
          onTap: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.support_agent, color: Color(0xFFF28B22), size: 18),
              SizedBox(width: 8),
              Text('Talk to an Advisor', style: TextStyle(color: Color(0xFFF28B22), fontWeight: FontWeight.bold, fontSize: 13)),
            ],
          ),
        ),
      ],
    );
  }
}
