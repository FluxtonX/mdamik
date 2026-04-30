import 'package:flutter/material.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    // For demonstration, if projects are empty, show screen 4, otherwise screen 5.
    // I will implement Screen 5 (Management) as requested.
    const bool isEmpty = false;

    if (isEmpty) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('My Projects', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          centerTitle: false,
        ),
        body: Center(
          child: Container(
            width: 120,
            height: 120,
            decoration: const BoxDecoration(
              color: Color(0xFFF28B22),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.add, color: Colors.white, size: 60),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFFF28B22), size: 20),
        ),
        title: const Text('Management', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF28B22),
                borderRadius: BorderRadius.circular(12),
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
            // Stats Row
            Row(
              children: const [
                Expanded(child: _StatCard(value: '3', label: 'Active Projects', icon: Icons.trending_up)),
                SizedBox(width: 12),
                Expanded(child: _StatCard(value: '\$465k', label: 'Total Spent', icon: Icons.monetization_on_outlined)),
                SizedBox(width: 12),
                Expanded(child: _StatCard(value: '85', label: 'Team Members', icon: Icons.people_outline)),
              ],
            ),
            const SizedBox(height: 32),

            // Active Projects Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Active Projects', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                TextButton(
                  onPressed: () {},
                  child: const Text('See All', style: TextStyle(color: Color(0xFFF28B22), fontSize: 12, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Project List
            const _ActiveProjectCard(
              title: 'Residential Villa - Phase 1',
              type: 'House',
              progress: 0.65,
              budget: '\$85,000',
              spent: '\$55,250',
              teamCount: 12,
              status: 'On Track',
              statusColor: Color(0xFF00B16A),
            ),
            const SizedBox(height: 16),
            const _ActiveProjectCard(
              title: 'Commercial Complex',
              type: 'Building',
              progress: 0.45,
              budget: '\$220,000',
              spent: '\$112,000',
              teamCount: 28,
              status: 'Delayed',
              statusColor: Color(0xFFFB8C00),
            ),
            const SizedBox(height: 16),
            const _ActiveProjectCard(
              title: 'Road Construction - Highway',
              type: 'Roads',
              progress: 0.85,
              budget: '\$350,000',
              spent: '\$297,500',
              teamCount: 45,
              status: 'On Track',
              statusColor: Color(0xFF00B16A),
            ),
            const SizedBox(height: 24),

            // Attention Banner
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFFCE6D3).withOpacity(0.5),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFFCE6D3)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info_outline, color: Color(0xFFF28B22), size: 24),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('1 Project Requires Attention', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFFF28B22))),
                        SizedBox(height: 4),
                        Text('Commercial Complex is 5 days behind schedule', style: TextStyle(fontSize: 11, color: Colors.black54)),
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
  const _StatCard({required this.value, required this.label, required this.icon});

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
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFFCE6D3).withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color(0xFFF28B22), size: 18),
          ),
          const SizedBox(height: 16),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.black26, fontSize: 9, fontWeight: FontWeight.bold)),
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
  });

  final String title;
  final String type;
  final double progress;
  final String budget;
  final String spent;
  final int teamCount;
  final String status;
  final Color statusColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed('/projects/management-details'),
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
                Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15))),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Container(width: 6, height: 6, decoration: BoxDecoration(color: statusColor, shape: BoxShape.circle)),
                      const SizedBox(width: 6),
                      Text(status, style: TextStyle(color: statusColor, fontSize: 10, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(type, style: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 12, fontWeight: FontWeight.w500)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Progress', style: TextStyle(color: Colors.black26, fontSize: 12, fontWeight: FontWeight.w500)),
                Text('${(progress * 100).toInt()}%', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
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
                    const Text('Budget', style: TextStyle(color: Colors.black26, fontSize: 10, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 4),
                    Text(budget, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  ],
                ),
                const SizedBox(width: 32),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Spent', style: TextStyle(color: Colors.black26, fontSize: 10, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 4),
                    Text(spent, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(Icons.people_outline, color: Colors.black.withOpacity(0.3), size: 16),
                    const SizedBox(width: 6),
                    Text('$teamCount', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
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
