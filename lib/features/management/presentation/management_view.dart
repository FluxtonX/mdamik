import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'management_details_view.dart';

class ManagementView extends StatelessWidget {
  const ManagementView({super.key});

  static const routeName = '/management';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
        ),
        title: Text(l10n?.management ?? 'Management',
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFFF28B22),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add, color: Colors.white, size: 20),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    child: _StatCard(
                        value: '3',
                        label: l10n?.activeProjects ?? 'Active Projects',
                        icon: Icons.trending_up)),
                const SizedBox(width: 12),
                Expanded(
                    child: _StatCard(
                        value: '\$45k',
                        label: l10n?.totalSpent ?? 'Total Spent',
                        icon: Icons.attach_money)),
                const SizedBox(width: 12),
                Expanded(
                    child: _StatCard(
                        value: '85',
                        label: l10n?.teamMembers ?? 'Team Members',
                        icon: Icons.people_outline)),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(l10n?.activeProjects ?? 'Active Projects',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18)),
                TextButton(
                  onPressed: () {},
                  child: Text(l10n?.seeAll ?? 'See All',
                      style: const TextStyle(
                          color: Color(0xFFF28B22),
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            _ActiveProjectCard(
              title: 'Residential Villa - Phase 1',
              type: 'House',
              progress: 0.65,
              budget: '\$85,000',
              spent: '\$55,250',
              teamCount: 12,
              status: l10n?.onTrack ?? 'On Track',
              statusColor: const Color(0xFF00B16A),
              onTap: () {
                Navigator.of(context)
                    .pushNamed(ManagementDetailsView.routeName);
              },
            ),
            const SizedBox(height: 16),
            _ActiveProjectCard(
              title: 'Commercial Complex',
              type: 'Building',
              progress: 0.45,
              budget: '\$220,000',
              spent: '\$112,000',
              teamCount: 28,
              status: l10n?.delayed ?? 'Delayed',
              statusColor: const Color(0xFFFB8C00),
              onTap: () {},
            ),
            const SizedBox(height: 16),
            _ActiveProjectCard(
              title: 'Road Construction - Highway',
              type: 'Roads',
              progress: 0.85,
              budget: '\$350,000',
              spent: '\$297,500',
              teamCount: 45,
              status: l10n?.onTrack ?? 'On Track',
              statusColor: const Color(0xFF00B16A),
              onTap: () {},
            ),
            const SizedBox(height: 24),
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
                    child: const Icon(Icons.info_outline,
                        color: Color(0xFFF28B22), size: 20),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            l10n?.projectAttentionBanner ??
                                '1 Project Requires Attention',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Color(0xFFF28B22))),
                        const SizedBox(height: 4),
                        Text(
                            l10n?.projectAttentionDesc ??
                                'Commercial Complex is 5 days behind schedule',
                            style: const TextStyle(
                                fontSize: 11, color: Colors.black54)),
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

class _StatCard extends StatelessWidget {
  const _StatCard(
      {required this.value, required this.label, required this.icon});
  final String value;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0x26F58220),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
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
            child: Icon(icon, color: const Color(0xFFF58220), size: 18),
          ),
          const SizedBox(height: 16),
          Text(value,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 4),
          Text(label,
              style: const TextStyle(
                  color: Colors.black26,
                  fontSize: 10,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class _ActiveProjectCard extends StatelessWidget {
  const _ActiveProjectCard({
    required this.title,
    required this.type,
    required this.progress,
    required this.budget,
    required this.spent,
    required this.teamCount,
    required this.status,
    required this.statusColor,
    required this.onTap,
  });

  final String title;
  final String type;
  final double progress;
  final String budget;
  final String spent;
  final int teamCount;
  final String status;
  final Color statusColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
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
                Expanded(
                    child: Text(title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15))),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                              color: statusColor, shape: BoxShape.circle)),
                      const SizedBox(width: 6),
                      Text(status,
                          style: TextStyle(
                              color: statusColor,
                              fontSize: 10,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(type,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.3),
                    fontSize: 12,
                    fontWeight: FontWeight.w500)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(l10n?.progress ?? 'Progress',
                    style: const TextStyle(
                        color: Colors.black26,
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: ((progress * 100).toInt()).toString()),
                      TextSpan(
                          text: AppLocalizations.of(context)!.percentSymbol),
                    ],
                  ),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: const Color(0xFFF1F1F4),
                color: const Color(0xFFF28B22),
                minHeight: 6,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n?.budget ?? 'Budget',
                        style: const TextStyle(
                            color: Colors.black26,
                            fontSize: 10,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(height: 4),
                    Text(budget,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13)),
                  ],
                ),
                const SizedBox(width: 32),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n?.spent ?? 'Spent',
                        style: const TextStyle(
                            color: Colors.black26,
                            fontSize: 10,
                            fontWeight: FontWeight.w500)),
                    const SizedBox(height: 4),
                    Text(spent,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13)),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(Icons.people_outline,
                        color: Colors.black.withOpacity(0.3), size: 16),
                    const SizedBox(width: 6),
                    Text(teamCount.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
