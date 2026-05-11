import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SupportView extends StatelessWidget {
  const SupportView({super.key});

  static const routeName = '/profile/support';

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
        title: Text(l10n?.support ?? 'Support',
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Header
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFFF28B22),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n?.howCanWeHelp ?? 'How can we help?',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n?.searchHelpSubtitle ??
                        'Search our help center or contact support',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.search,
                            color: Colors.black.withOpacity(0.3), size: 20),
                        hintText: l10n?.searchHelpHint ??
                            'Search help articles, FAQs...',
                        hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.3), fontSize: 13),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            _SectionTitle(title: l10n?.quickActions ?? 'Quick Actions'),
            const SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.2,
              children: [
                _QuickActionItem(
                  icon: Icons.chat_bubble_outline,
                  title: l10n?.liveChat ?? 'Live Chat',
                  subtitle: l10n?.getInstantHelp ?? 'Get instant help',
                ),
                _QuickActionItem(
                  icon: Icons.assignment_outlined,
                  title: l10n?.createTicket ?? 'Create Ticket',
                  subtitle: l10n?.detailedSupport ?? 'Detailed support',
                ),
                _QuickActionItem(
                  icon: Icons.call_outlined,
                  title: l10n?.callSupport ?? 'Call Support',
                  subtitle: l10n?.callSupportHours ?? '9AM - 9PM daily',
                ),
                _QuickActionItem(
                  icon: Icons.help_outline,
                  title: l10n?.helpArticles ?? 'Help Articles',
                  subtitle: l10n?.selfServiceGuides ?? 'Self-service guides',
                ),
              ],
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _SectionTitle(title: l10n?.myTickets ?? 'My Tickets'),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    l10n?.viewAll ?? 'View All',
                    style: const TextStyle(
                        color: Color(0xFFF28B22),
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            _TicketItem(
              title: l10n?.paymentNotProcessed ?? 'Payment not processed',
              id: 'TKT-1847 • Today, 11:30 AM',
              status: l10n?.inProgress ?? 'In Progress',
              statusColor: const Color(0xFFF28B22),
            ),
            const SizedBox(height: 12),
            _TicketItem(
              title: l10n?.laborBookingIssue ?? 'Labor booking issue',
              id: 'TKT-1832 • Yesterday',
              status: l10n?.resolved ?? 'Resolved',
              statusColor: const Color(0xFF00B16A),
            ),
            const SizedBox(height: 32),
            _SectionTitle(title: l10n?.browseByTopic ?? 'Browse by Topic'),
            const SizedBox(height: 16),
            _TopicItem(
              title: l10n?.labor ?? 'Labor',
              count: 12,
              l10n: l10n,
            ),
            _TopicItem(
              title: l10n?.payments ?? 'Payments',
              count: 8,
              l10n: l10n,
            ),
            _TopicItem(
              title: l10n?.materials ?? 'Materials',
              count: 15,
              l10n: l10n,
            ),
            _TopicItem(
              title: l10n?.transport ?? 'Transport',
              count: 7,
              l10n: l10n,
            ),
            _TopicItem(
              title: l10n?.account ?? 'Account',
              count: 10,
              l10n: l10n,
              isLast: true,
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFFFCE6D3).withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n?.cantFindWhatYouNeed ?? "Can't find what you need?",
                    style: const TextStyle(
                        color: Color(0xFF8B4513),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    l10n?.supportTeamAvailable ??
                        'Our support team is here to help 24/7',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF28B22),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        l10n?.contactSupportTeam ?? 'Contact Support Team',
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        onTap: (index) {},
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFF28B22),
        unselectedItemColor: Colors.black26,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        unselectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            label: l10n?.navHome ?? 'Home',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.business_center_outlined),
            label: l10n?.navProjects ?? 'Projects',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.chat_bubble_outline),
            label: l10n?.navChat ?? 'Chat',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline),
            label: l10n?.navProfile ?? 'Profile',
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }
}

class _QuickActionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _QuickActionItem({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0x26F58220),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
            child: Icon(icon, color: const Color(0xFFF58220), size: 20),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black.withOpacity(0.3),
                fontSize: 10,
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class _TicketItem extends StatelessWidget {
  final String title;
  final String id;
  final String status;
  final Color statusColor;

  const _TicketItem({
    required this.title,
    required this.id,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1F1F4)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),
                const SizedBox(height: 4),
                Text(
                  id,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.3),
                      fontSize: 11,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Icon(Icons.access_time, color: statusColor, size: 12),
                const SizedBox(width: 4),
                Text(
                  status,
                  style: TextStyle(
                      color: statusColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TopicItem extends StatelessWidget {
  final String title;
  final int count;
  final AppLocalizations? l10n;
  final bool isLast;

  const _TopicItem({
    required this.title,
    required this.count,
    this.l10n,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: isLast ? 0 : 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1F1F4)),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const Spacer(),
          Text(
            l10n?.articlesCount(count.toString()) ?? '$count articles',
            style: TextStyle(
                color: Colors.black.withOpacity(0.3),
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.circle, color: Color(0xFFF28B22), size: 8),
        ],
      ),
    );
  }
}
