import 'package:flutter/material.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  static const routeName = '/home/notifications';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFFF28B22), size: 20),
        ),
        title: const Text('Notifications', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _NotificationItem(
            title: 'Payment Received',
            desc: 'Your payment of \$1,200 for Custom Home Build project has been confirmed',
            time: '2 hours ago',
            icon: Icons.check_circle_outline,
            isImportant: true,
          ),
          SizedBox(height: 16),
          _NotificationItem(
            title: 'New Message from Ahmed Ali',
            desc: "Hi! I've reviewed your requirements and can start next week...",
            time: '5 hours ago',
            icon: Icons.chat_bubble_outline,
            isImportant: true,
            hasUnread: true,
          ),
          SizedBox(height: 16),
          _NotificationItem(
            title: 'Project Milestone Due',
            desc: 'Design approval needed for Apartment Complex project',
            time: 'Yesterday',
            icon: Icons.access_time,
          ),
          SizedBox(height: 16),
          _NotificationItem(
            title: 'Special Offer Available',
            desc: 'Get 15% off on all engineering services this week',
            time: '2 days ago',
            icon: Icons.local_offer_outlined,
          ),
        ],
      ),
    );
  }
}

class _NotificationItem extends StatelessWidget {
  const _NotificationItem({
    required this.title,
    required this.desc,
    required this.time,
    required this.icon,
    this.isImportant = false,
    this.hasUnread = false,
  });

  final String title;
  final String desc;
  final String time;
  final IconData icon;
  final bool isImportant;
  final bool hasUnread;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isImportant ? const Color(0xFFF28B22) : const Color(0xFFF1F1F4),
          width: isImportant ? 1.2 : 1.0,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFFCE6D3).withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: const Color(0xFFF28B22), size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                    if (hasUnread)
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(color: Color(0xFFF28B22), shape: BoxShape.circle),
                      ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  desc,
                  style: const TextStyle(color: Colors.black54, fontSize: 12, height: 1.4),
                ),
                const SizedBox(height: 8),
                Text(
                  time,
                  style: const TextStyle(color: Colors.black26, fontSize: 10, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
