import 'package:flutter/material.dart';
import 'chat_conversation_view.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    // For demonstration, use a flag to show empty or list state.
    const bool isEmpty = false;

    if (isEmpty) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Messages', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24)),
          centerTitle: false,
        ),
        body: const Center(
          child: Text(
            'No Messages',
            style: TextStyle(color: Colors.black26, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Messages', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24)),
        centerTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _ChatListItem(
            initials: 'AH',
            color: const Color(0xFFF28B22),
            name: 'Ahmed Hassan',
            message: "I'll send the estimate by tomorrow",
            time: '2m ago',
            unreadCount: 2,
            onTap: () => Navigator.of(context).pushNamed(ChatConversationView.routeName),
          ),
          const SizedBox(height: 12),
          _ChatListItem(
            initials: 'MA',
            color: const Color(0xFF4A90E2),
            name: 'Mohammed Ali',
            message: 'The wiring is complete',
            time: '1h ago',
            onTap: () => Navigator.of(context).pushNamed(ChatConversationView.routeName),
          ),
          const SizedBox(height: 12),
          _ChatListItem(
            initials: 'MS',
            color: const Color(0xFF50E3C2),
            name: 'Support مداميك',
            message: 'Your project has been approved!',
            time: '3h ago',
            unreadCount: 1,
            onTap: () => Navigator.of(context).pushNamed(ChatConversationView.routeName),
          ),
        ],
      ),
    );
  }
}

class _ChatListItem extends StatelessWidget {
  const _ChatListItem({
    required this.initials,
    required this.color,
    required this.name,
    required this.message,
    required this.time,
    this.unreadCount = 0,
    required this.onTap,
  });

  final String initials;
  final Color color;
  final String name;
  final String message;
  final String time;
  final int unreadCount;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F1F4)),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              initials,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(time, style: const TextStyle(color: Colors.black26, fontSize: 11)),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.black54, fontSize: 13),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (unreadCount > 0)
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Color(0xFFF28B22),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    unreadCount.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
