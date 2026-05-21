import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'professional_list_view.dart';

class EngineeringView extends StatelessWidget {
  const EngineeringView({super.key});

  static const routeName = '/engineering';

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
        title: Text(l10n?.engineeringTitle ?? 'Engineering',
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24)),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
            l10n?.engineeringHelp ?? 'What do you need help with?',
            style: TextStyle(
                color: Colors.black.withOpacity(0.3),
                fontSize: 17,
                fontWeight: FontWeight.w500),
          ),
            const SizedBox(height: 24),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.2,
              children: [
                _EngineeringServiceCard(
                  icon: Icons.architecture_outlined,
                  label: l10n?.engDesignPlanning ?? 'Design & Planning',
                  onTap: () => Navigator.of(context).pushNamed(
                    ProfessionalListView.routeName,
                    arguments: {
                      'title': 'Design & Planning',
                      'subtitle': 'Professional architectural drawings and blueprints for your project',
                      'professionals': _designProfessionals,
                    },
                  ),
                ),
                _EngineeringServiceCard(
                  icon: Icons.attach_money_outlined,
                  label: l10n?.engCostEstimation ?? 'Cost Estimation',
                  onTap: () => Navigator.of(context).pushNamed(
                    ProfessionalListView.routeName,
                    arguments: {
                      'title': 'Cost Estimation',
                      'subtitle': 'Detailed project cost breakdown and budget planning',
                      'professionals': _costProfessionals,
                    },
                  ),
                ),
                _EngineeringServiceCard(
                  icon: Icons.visibility_outlined,
                  label: l10n?.engSupervision ?? 'Supervision',
                  onTap: () => Navigator.of(context).pushNamed(
                    ProfessionalListView.routeName,
                    arguments: {
                      'title': 'Site Supervision',
                      'subtitle': 'On-site construction oversight and quality control',
                      'professionals': _supervisionProfessionals,
                    },
                  ),
                ),
                _EngineeringServiceCard(
                  icon: Icons.forum_outlined,
                  label: l10n?.engConsultation ?? 'Consultation',
                  onTap: () => Navigator.of(context).pushNamed(
                    ProfessionalListView.routeName,
                    arguments: {
                      'title': 'Expert Consultation',
                      'subtitle': 'Professional advice and technical guidance',
                      'professionals': _consultationProfessionals,
                    },
                  ),
                ),
                _EngineeringServiceCard(
                  icon: Icons.engineering_outlined,
                  label: l10n?.engExecution ?? 'Execution / PM',
                  onTap: () => Navigator.of(context).pushNamed(
                    ProfessionalListView.routeName,
                    arguments: {
                      'title': 'Project Execution / PM',
                      'subtitle': 'Full project management from start to finish',
                      'professionals': _executionProfessionals,
                    },
                  ),
                ),
                _EngineeringServiceCard(
                  icon: Icons.inventory_2_outlined,
                  label: l10n?.engTurnkey ?? 'Turnkey Projects',
                  onTap: () => Navigator.of(context).pushNamed(
                    ProfessionalListView.routeName,
                    arguments: {
                      'title': 'Turnkey Projects',
                      'subtitle': 'Complete end-to-end solution - we handle everything',
                      'professionals': _turnkeyProfessionals,
                    },
                  ),
                ),
                _EngineeringServiceCard(
                  icon: Icons.palette_outlined,
                  label: l10n?.engFinishing ?? 'Finishing Design',
                  onTap: () => Navigator.of(context).pushNamed(
                    ProfessionalListView.routeName,
                    arguments: {
                      'title': 'Finishing & Interior Design',
                      'subtitle': 'Interior design and finishing touches',
                      'professionals': _finishingProfessionals,
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F1E4).withOpacity(0.5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n?.needHelpDeciding ?? 'Need help deciding?',
                      style: const TextStyle(
                          color: Color(0xFFE57E2E),
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                  const SizedBox(height: 8),
                  Text(
                    l10n?.needHelpDesc ??
                        'Our assistant can guide you to the right service based on your needs.',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 16,
                        height: 1.5),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF28B22),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(100, 36),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 0,
                    ),
                    child: Text(
                        l10n?.talkToAssistant ?? 'Talk to Assistant',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
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

class _EngineeringServiceCard extends StatelessWidget {
  const _EngineeringServiceCard({required this.icon, required this.label, required this.onTap});

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
                    color: const Color(0xFFF58220).withOpacity(0.12),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(icon, color: const Color(0xFFF58220), size: 32),
            ),
            const SizedBox(height: 12),
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> _designProfessionals = [
  {
    'initials': 'AA',
    'name': 'Ahmed Ali',
    'title': 'Architect',
    'price': '\$120/project',
    'rating': 4.9,
    'reviews': 156,
    'experience': 12,
    'projects': 89,
  },
  {
    'initials': 'SK',
    'name': 'Sarah Khan',
    'title': 'Structural Engineer',
    'price': '\$100/project',
    'rating': 4.8,
    'reviews': 142,
    'experience': 10,
    'projects': 76,
  },
  {
    'initials': 'OF',
    'name': 'Omar Farooq',
    'title': 'Interior Designer',
    'price': '\$90/project',
    'rating': 4.7,
    'reviews': 98,
    'experience': 8,
    'projects': 54,
  },
];

final List<Map<String, dynamic>> _costProfessionals = [
  {
    'initials': 'HR',
    'name': 'Hassan Raza',
    'title': 'Quantity Surveyor',
    'price': '\$80/project',
    'rating': 4.9,
    'reviews': 178,
    'experience': 15,
    'projects': 112,
  },
  {
    'initials': 'FM',
    'name': 'Fatima Malik',
    'title': 'Cost Estimator',
    'price': '\$75/project',
    'rating': 4.8,
    'reviews': 142,
    'experience': 9,
    'projects': 87,
  },
];

final List<Map<String, dynamic>> _supervisionProfessionals = [
  {
    'initials': 'IK',
    'name': 'Imran Khan',
    'title': 'Site Engineer',
    'price': '\$2,500/project',
    'rating': 4.9,
    'reviews': 201,
    'experience': 14,
    'projects': 145,
  },
  {
    'initials': 'ZA',
    'name': 'Zainab Ali',
    'title': 'Cost Estimator',
    'price': '\$2,200/project',
    'rating': 4.8,
    'reviews': 142,
    'experience': 9,
    'projects': 87,
  },
];

final List<Map<String, dynamic>> _consultationProfessionals = [
  {
    'initials': 'kA',
    'name': 'Dr. Kamran Ali',
    'title': 'Structural Consultant',
    'price': '\$150/hour',
    'rating': 5.0,
    'reviews': 89,
    'experience': 20,
    'projects': 156,
  },
  {
    'initials': 'EA',
    'name': 'Eng. Ayesha',
    'title': 'Cost Estimator',
    'price': '\$2120/hour',
    'rating': 4.9,
    'reviews': 124,
    'experience': 13,
    'projects': 92,
  },
];

final List<Map<String, dynamic>> _executionProfessionals = [
  {
    'initials': 'Ik',
    'name': 'Ali Haider',
    'title': 'Project Manager',
    'price': '\$5,000/Project',
    'rating': 5.0,
    'reviews': 89,
    'experience': 16,
    'projects': 134,
  },
  {
    'initials': 'SZ',
    'name': 'Samina Zar',
    'title': 'Construction Manager',
    'price': '\$4,500/hour',
    'rating': 4.8,
    'reviews': 156,
    'experience': 12,
    'projects': 89,
  },
];

final List<Map<String, dynamic>> _turnkeyProfessionals = [
  {
    'initials': 'BS',
    'name': 'BuildPro Solutions',
    'title': 'Turnkey Contractor',
    'price': 'Custom',
    'rating': 4.9,
    'reviews': 234,
    'experience': 18,
    'projects': 167,
  },
  {
    'initials': 'PB',
    'name': 'Prime Build',
    'title': 'Full Service',
    'price': 'Custom Quote',
    'rating': 4.8,
    'reviews': 198,
    'experience': 15,
    'projects': 134,
  },
];

final List<Map<String, dynamic>> _finishingProfessionals = [
  {
    'initials': 'HT',
    'name': 'Hina Tariq',
    'title': 'Interior Designer',
    'price': '\$95/project',
    'rating': 4.9,
    'reviews': 167,
    'experience': 11,
    'projects': 98,
  },
  {
    'initials': 'BY',
    'name': 'Bilal Yousuf',
    'title': 'Finishing Specialist',
    'price': '\$85/project',
    'rating': 4.8,
    'reviews': 143,
    'experience': 9,
    'projects': 76,
  },
];
