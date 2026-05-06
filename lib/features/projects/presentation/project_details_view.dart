import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProjectDetailsView extends StatelessWidget {
  const ProjectDetailsView({super.key});

  static const routeName = '/projects/details';

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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n?.residentialVilla ?? 'Residential Villa', style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
            Text(l10n?.housePhase1 ?? 'House • Phase 1', style: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 12, fontWeight: FontWeight.w500)),
          ],
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Overall Progress Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFF28B22), Color(0xFFE57E2E)],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFF28B22).withOpacity(0.2),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(l10n?.overallProgress ?? 'Overall Progress', style: const TextStyle(color: Colors.white70, fontSize: 12)),
                          const SizedBox(height: 4),
                          Text.rich(
                            TextSpan(children: [
                              const TextSpan(text: '65'),
                              TextSpan(text: AppLocalizations.of(context)!.percentSymbol),
                            ]),
                            style: const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF00B16A),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(l10n?.onTrack ?? 'On Track', style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: const LinearProgressIndicator(
                      value: 0.65,
                      backgroundColor: Colors.white24,
                      color: Colors.white,
                      minHeight: 8,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Stats Row
            Row(
              children: [
                Expanded(child: _DetailStatItem(label: l10n?.spent ?? 'Spent', value: '\$55k', icon: Icons.monetization_on_outlined)),
                const SizedBox(width: 12),
                Expanded(child: _DetailStatItem(label: l10n?.tabTeam ?? 'Team', value: '12', icon: Icons.people_outline)),
                const SizedBox(width: 12),
                Expanded(child: _DetailStatItem(label: l10n?.days ?? 'Days', value: '45', icon: Icons.calendar_today_outlined)),
              ],
            ),
            const SizedBox(height: 32),

            // Current Phase Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFF1F1F4)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(l10n?.currentMilestone ?? 'Current Milestone', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                      Text.rich(
                        TextSpan(children: [
                          const TextSpan(text: '75'),
                          TextSpan(text: AppLocalizations.of(context)!.percentSymbol),
                          const TextSpan(text: ' '),
                          TextSpan(text: AppLocalizations.of(context)!.completeWord),
                        ]),
                        style: const TextStyle(color: Color(0xFFF28B22), fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(l10n?.foundationStructure ?? 'Foundation & Structure', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: const LinearProgressIndicator(
                      value: 0.75,
                      backgroundColor: Color(0xFFF1F1F4),
                      color: Color(0xFFF28B22),
                      minHeight: 6,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today_outlined, color: Colors.black26, size: 14),
                      const SizedBox(width: 8),
                      Text(l10n?.targetDate('May 15, 2026') ?? 'Target: May 15, 2026', style: const TextStyle(color: Colors.black26, fontSize: 12, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF28B22),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      elevation: 0,
                    ),
                    child: Text(l10n?.tabOverview ?? 'Overview', style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFFF28B22),
                      side: const BorderSide(color: Color(0xFFF28B22)),
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    child: Text(l10n?.tabTimeline ?? 'Timeline', style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailStatItem extends StatelessWidget {
  const _DetailStatItem({required this.label, required this.value, required this.icon});

  final String label;
  final String value;
  final IconData icon;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFFF28B22), size: 18),
          const SizedBox(height: 12),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.black26, fontSize: 10, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
