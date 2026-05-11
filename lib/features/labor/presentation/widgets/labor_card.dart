import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum LaborStatus { availableNow, availableSoon, busy }

class LaborCard extends StatelessWidget {
  const LaborCard({
    super.key,
    required this.initials,
    required this.name,
    required this.skill,
    required this.rate,
    required this.rating,
    required this.reviews,
    required this.distance,
    required this.status,
    required this.experience,
    required this.jobs,
  });

  final String initials;
  final String name;
  final String skill;
  final String rate;
  final double rating;
  final int reviews;
  final String distance;
  final LaborStatus status;
  final int experience;
  final int jobs;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    Color statusColor;
    String statusText;
    IconData statusIcon;

    switch (status) {
      case LaborStatus.availableNow:
        statusColor = const Color(0xFFE0F2F1);
        statusText = l10n?.availableNow ?? 'Available Now';
        statusIcon = Icons.bolt;
        break;
      case LaborStatus.availableSoon:
        statusColor = const Color(0xFFFFF3E0);
        statusText = l10n?.availableSoon ?? 'Available Soon';
        statusIcon = Icons.access_time;
        break;
      case LaborStatus.busy:
        statusColor = const Color(0xFFFFEBEE);
        statusText = l10n?.busy ?? 'Busy';
        statusIcon = Icons.block;
        break;
    }

    final statusTextColor = status == LaborStatus.availableNow
        ? const Color(0xFF26A69A)
        : status == LaborStatus.availableSoon
            ? const Color(0xFFFB8C00)
            : const Color(0xFFE53935);

    final isBusy = status == LaborStatus.busy;

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
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFF28B22),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    initials,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                        const SizedBox(width: 4),
                        const Icon(Icons.verified, color: Color(0xFFF28B22), size: 14),
                        const Spacer(),
                        Text(rate, style: const TextStyle(color: Color(0xFFF28B22), fontWeight: FontWeight.bold, fontSize: 20)),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(skill, style: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 16, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 14),
                        const SizedBox(width: 4),
                        Text(rating.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                        const SizedBox(width: 4),
                        Text.rich(
                          TextSpan(children: [
                            const TextSpan(text: '('),
                            TextSpan(text: reviews.toString()),
                            const TextSpan(text: ')'),
                          ]),
                          style: TextStyle(color: Colors.black.withOpacity(0.2), fontSize: 14),
                        ),
                        const SizedBox(width: 8),
                        Container(width: 4, height: 4, decoration: const BoxDecoration(color: Colors.black12, shape: BoxShape.circle)),
                        const SizedBox(width: 8),
                        Text.rich(
                          TextSpan(children: [
                            TextSpan(text: distance),
                            const TextSpan(text: ' '),
                            TextSpan(text: l10n?.away ?? 'away'),
                          ]),
                          style: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 15, fontWeight: FontWeight.w500),
                        ),
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
              color: statusColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Icon(statusIcon, color: statusTextColor, size: 16),
                const SizedBox(width: 8),
                Text(
                  statusText,
                  style: TextStyle(color: statusTextColor, fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const Spacer(),
                Text(
                  '$experience ${l10n?.experienceYears ?? 'years exp'} • $jobs ${l10n?.jobsDone ?? 'jobs'}',
                  style: TextStyle(color: statusTextColor.withOpacity(0.6), fontSize: 14, fontWeight: FontWeight.w500),
                ),
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
                    children: [
                      const Icon(Icons.chat_bubble_outline, size: 16),
                      const SizedBox(width: 8),
                      Text(l10n?.chat ?? 'Chat', style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: isBusy ? null : () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isBusy ? const Color(0xFFFCE6D3) : const Color(0xFFF28B22),
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: const Color(0xFFFCE6D3),
                    disabledForegroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 44),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                  ),
                  child: Text(l10n?.hireNow ?? 'Hire Now', style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
