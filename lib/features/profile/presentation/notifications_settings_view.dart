import 'package:flutter/material.dart';

class NotificationsSettingsView extends StatefulWidget {
  const NotificationsSettingsView({super.key});

  static const routeName = '/profile/notifications';

  @override
  State<NotificationsSettingsView> createState() => _NotificationsSettingsViewState();
}

class _NotificationsSettingsViewState extends State<NotificationsSettingsView> {
  bool _projectUpdates = true;
  bool _paymentAlerts = true;
  bool _laborAvailability = false;
  bool _priceDropAlerts = true;
  bool _weeklyProjectSummary = true;
  bool _platformAnnouncements = false;
  bool _emailNotifications = true;
  bool _smsNotifications = false;

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PUSH NOTIFICATIONS
            Text('PUSH NOTIFICATIONS', style: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1)),
            const SizedBox(height: 16),
            _NotificationToggle(
              icon: Icons.folder_outlined,
              title: 'Project Updates',
              subtitle: 'Milestone changes, daily reports',
              value: _projectUpdates,
              onChanged: (v) => setState(() => _projectUpdates = v),
            ),
            _NotificationToggle(
              icon: Icons.monetization_on_outlined,
              title: 'Payment Alerts',
              subtitle: 'Invoice due, payment received',
              value: _paymentAlerts,
              onChanged: (v) => setState(() => _paymentAlerts = v),
            ),
            _NotificationToggle(
              icon: Icons.people_outline,
              title: 'Labor Availability',
              subtitle: 'When saved workers become available',
              value: _laborAvailability,
              onChanged: (v) => setState(() => _laborAvailability = v),
            ),
            _NotificationToggle(
              icon: Icons.local_offer_outlined,
              title: 'Price Drop Alerts',
              subtitle: 'Saved materials on sale',
              value: _priceDropAlerts,
              onChanged: (v) => setState(() => _priceDropAlerts = v),
            ),
            const SizedBox(height: 32),

            // REPORTS & SUMMARIES
            Text('REPORTS & SUMMARIES', style: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1)),
            const SizedBox(height: 16),
            _NotificationToggle(
              icon: Icons.summarize_outlined,
              title: 'Weekly Project Summary',
              value: _weeklyProjectSummary,
              onChanged: (v) => setState(() => _weeklyProjectSummary = v),
            ),
            _NotificationToggle(
              icon: Icons.campaign_outlined,
              title: 'Platform Announcements',
              value: _platformAnnouncements,
              onChanged: (v) => setState(() => _platformAnnouncements = v),
            ),
            const SizedBox(height: 32),

            // DELIVERY METHOD
            Text('DELIVERY METHOD', style: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1)),
            const SizedBox(height: 16),
            _NotificationToggle(
              icon: Icons.email_outlined,
              title: 'Email Notifications',
              value: _emailNotifications,
              onChanged: (v) => setState(() => _emailNotifications = v),
            ),
            _NotificationToggle(
              icon: Icons.chat_bubble_outline,
              title: 'SMS Notifications',
              value: _smsNotifications,
              onChanged: (v) => setState(() => _smsNotifications = v),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationToggle extends StatelessWidget {
  const _NotificationToggle({
    required this.icon,
    required this.title,
    this.subtitle,
    required this.value,
    required this.onChanged,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F1F4)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFFCE6D3).withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color(0xFFF28B22), size: 18),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(subtitle!, style: TextStyle(color: Colors.black.withOpacity(0.25), fontSize: 10, fontWeight: FontWeight.w500)),
                ],
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.white,
            activeTrackColor: const Color(0xFFF28B22),
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: const Color(0xFFF1F1F4),
          ),
        ],
      ),
    );
  }
}
