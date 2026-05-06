import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ManagementDetailsView extends StatefulWidget {
  const ManagementDetailsView({super.key});

  static const routeName = '/management/details';

  @override
  State<ManagementDetailsView> createState() => _ManagementDetailsViewState();
}

class _ManagementDetailsViewState extends State<ManagementDetailsView> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    final List<String> tabs = [
      l10n?.tabOverview ?? 'Overview',
      l10n?.tabTimeline ?? 'Timeline',
      l10n?.tabTeam ?? 'Team',
      l10n?.tabBudget ?? 'Budget'
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFF1F1F4)),
              color: Colors.white,
            ),
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back,
                  color: Color(0xFFF28B22), size: 18),
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n?.residentialVilla ?? 'Residential Villa',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            Text(l10n?.housePhase1 ?? 'House • Phase 1',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.3),
                    fontSize: 11,
                    fontWeight: FontWeight.w500)),
          ],
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Overall Progress Banner with Gradient
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFF28B22), Color(0xFFFB8C00)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFF28B22).withOpacity(0.3),
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
                      Text(l10n?.overallProgress ?? 'Overall Progress',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500)),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF00B16A),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(l10n?.onTrack ?? 'On Track',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(text: '65'),
                        TextSpan(text: AppLocalizations.of(context)!.percentSymbol),
                      ],
                    ),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: const LinearProgressIndicator(
                      value: 0.65,
                      backgroundColor: Colors.white24,
                      color: Color(0xFFE5D87B),
                      minHeight: 8,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Quick Stats Row
            Row(
              children: [
                Expanded(
                    child: _DetailStatCard(
                        value: '\$55k',
                        label: l10n?.spent ?? 'Spent',
                        icon: Icons.attach_money)),
                const SizedBox(width: 12),
                Expanded(
                    child: _DetailStatCard(
                        value: '12',
                        label: l10n?.tabTeam ?? 'Team',
                        icon: Icons.people_outline)),
                const SizedBox(width: 12),
                Expanded(
                    child: _DetailStatCard(
                        value: '45',
                        label: l10n?.days ?? 'Days',
                        icon: Icons.calendar_today_outlined)),
              ],
            ),
            const SizedBox(height: 32),

            // Tabs
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: tabs.asMap().entries.map((entry) {
                  final isSelected = _selectedTab == entry.key;
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: InkWell(
                      onTap: () => setState(() => _selectedTab = entry.key),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFFF28B22) : Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                              color: isSelected
                                  ? const Color(0xFFF28B22)
                                  : const Color(0xFFF1F1F4)),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: const Color(0xFFF28B22).withOpacity(0.2),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  )
                                ]
                              : null,
                        ),
                        child: Text(
                          entry.value,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black26,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 32),

            // Current Milestone Card
            Container(
              padding: const EdgeInsets.all(24),
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
                      Text(l10n?.currentMilestone ?? 'Current Milestone',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(text: '75'),
                            TextSpan(text: AppLocalizations.of(context)!.percentSymbol),
                            const TextSpan(text: ' '),
                            TextSpan(text: AppLocalizations.of(context)!.completeWord),
                          ],
                        ),
                          style: const TextStyle(
                              color: Color(0xFFF28B22),
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(l10n?.foundationStructure ?? 'Foundation & Structure',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18)),
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
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today_outlined,
                          color: Colors.black26, size: 16),
                      const SizedBox(width: 8),
                      Text(l10n?.targetDate('May 15, 2026') ?? 'Target: May 15, 2026',
                          style: const TextStyle(
                              color: Colors.black26,
                              fontSize: 13,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Team Members Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(l10n?.teamMembers ?? 'Team Members',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                const Icon(Icons.chevron_right, color: Colors.black26),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const _AvatarCircle(label: 'M1'),
                const _AvatarCircle(label: 'M2'),
                const _AvatarCircle(label: 'M3'),
                const _AvatarCircle(label: 'M4'),
                const _AvatarCircle(label: 'M5'),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFCE6D3),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Center(
                    child: Text.rich(
                      TextSpan(children: [
                        const TextSpan(text: '+'),
                        const TextSpan(text: '7'),
                      ]),
                        style: TextStyle(
                            color: Color(0xFFF28B22),
                            fontSize: 12,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Pending Action Banner
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFFCE6D3).withOpacity(0.5),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFFCE6D3)),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.warning_amber_rounded,
                        color: Color(0xFFF28B22), size: 20),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(l10n?.pendingActionRequired ?? 'Pending Action Required',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Color(0xFFF28B22))),
                        const SizedBox(height: 4),
                        Text(
                            l10n?.materialDeliveryApproval ??
                                'Material delivery approval needed for next phase',
                            style: const TextStyle(
                                fontSize: 12, color: Colors.black54)),
                      ],
                    ),
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

class _DetailStatCard extends StatelessWidget {
  const _DetailStatCard(
      {required this.value, required this.label, required this.icon});

  final String value;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1F1F4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFFF28B22), size: 20),
          const SizedBox(height: 16),
          Text(value,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 4),
          Text(label,
              style: const TextStyle(
                  color: Colors.black26,
                  fontSize: 11,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

class _AvatarCircle extends StatelessWidget {
  const _AvatarCircle({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: -10),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFFF28B22),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Center(
        child: Text(label,
            style: const TextStyle(
                color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
