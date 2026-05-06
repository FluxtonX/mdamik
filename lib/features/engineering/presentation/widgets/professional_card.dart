import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'hire_professional_dialogs.dart';

class ProfessionalCard extends StatelessWidget {
  const ProfessionalCard({
    super.key,
    required this.initials,
    required this.name,
    required this.title,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.experience,
    required this.projects,
  });

  final String initials;
  final String name;
  final String title;
  final String price;
  final double rating;
  final int reviews;
  final int experience;
  final int projects;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
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
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFFF28B22),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    initials,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
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
                        Text(name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                        const SizedBox(width: 4),
                        const Icon(Icons.verified,
                            color: Color(0xFFF28B22), size: 14),
                        const Spacer(),
                        Text(price,
                            style: const TextStyle(
                                color: Color(0xFFF28B22),
                                fontWeight: FontWeight.bold,
                                fontSize: 15)),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(title,
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.3),
                            fontSize: 12,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 14),
                        const SizedBox(width: 4),
                        Text(rating.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12)),
                        const SizedBox(width: 4),
                        Text.rich(
                          TextSpan(children: [
                            const TextSpan(text: '('),
                            TextSpan(text: reviews.toString()),
                            const TextSpan(text: ')'),
                          ]),
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.2),
                                fontSize: 11)),
                        const SizedBox(width: 8),
                        Container(
                            width: 4,
                            height: 4,
                            decoration: const BoxDecoration(
                                color: Colors.black12, shape: BoxShape.circle)),
                        const SizedBox(width: 8),
                        Text.rich(
                          TextSpan(children: [
                            TextSpan(text: experience.toString()),
                            const TextSpan(text: ' '),
                            TextSpan(text: l10n.years),
                          ]),
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.3),
                                fontSize: 12,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text.rich(
                      TextSpan(children: [
                        TextSpan(text: projects.toString()),
                        const TextSpan(text: ' '),
                        TextSpan(text: l10n.jobsDone),
                      ]),
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.3),
                            fontSize: 12,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.chat_bubble_outline, size: 16),
                  label: Text(l10n.chat,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFFF28B22),
                    side: const BorderSide(color: Color(0xFFF28B22)),
                    minimumSize: const Size(double.infinity, 44),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => HireProfessionalFlow.show(context, {
                    'initials': initials,
                    'name': name,
                    'title': title,
                    'price': price,
                  }),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF28B22),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 44),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 0,
                  ),
                  child: Text(l10n.hireNow,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
