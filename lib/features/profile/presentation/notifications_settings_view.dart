import 'package:flutter/material.dart';

class NotificationsSettingsView extends StatefulWidget {
  const NotificationsSettingsView({super.key});

  static const routeName = '/profile/notifications';

  @override
  State<NotificationsSettingsView> createState() =>
      _NotificationsSettingsViewState();
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
        title: const Text('Notifications',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PUSH NOTIFICATIONS
            _buildSectionTitle('PUSH NOTIFICATIONS'),
            _NotificationToggle(
              icon: Icons.notifications_none_outlined,
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
              icon: Icons.chat_bubble_outline,
              title: 'Labor Availability',
              subtitle: 'When saved workers become available',
              value: _laborAvailability,
              onChanged: (v) => setState(() => _laborAvailability = v),
            ),
            _NotificationToggle(
              icon: Icons.notifications_none_outlined,
              title: 'Price Drop Alerts',
              subtitle: 'Saved materials on sale',
              value: _priceDropAlerts,
              onChanged: (v) => setState(() => _priceDropAlerts = v),
            ),
            const SizedBox(height: 32),

            // REPORTS & SUMMARIES
            _buildSectionTitle('REPORTS & SUMMARIES'),
            _NotificationToggleSimple(
              title: 'Weekly Project Summary',
              value: _weeklyProjectSummary,
              onChanged: (v) => setState(() => _weeklyProjectSummary = v),
            ),
            _NotificationToggleSimple(
              title: 'Platform Announcements',
              value: _platformAnnouncements,
              onChanged: (v) => setState(() => _platformAnnouncements = v),
            ),
            const SizedBox(height: 32),

            // DELIVERY METHOD
            _buildSectionTitle('DELIVERY METHOD'),
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
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(title,
          style: TextStyle(
              color: Colors.black.withOpacity(0.3),
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2)),
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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1F1F4)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFFCE6D3).withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFFF28B22), size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15)),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(subtitle!,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.3),
                          fontSize: 12,
                          fontWeight: FontWeight.w500)),
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

class _NotificationToggleSimple extends StatelessWidget {
  const _NotificationToggleSimple({
    required this.title,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1F1F4)),
      ),
      child: Row(
        children: [
          Expanded(
              child: Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15))),
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
