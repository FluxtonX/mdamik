import 'package:flutter/material.dart';

class ChatConversationView extends StatelessWidget {
  const ChatConversationView({super.key});

  static const routeName = '/chat/conversation';

  @override
  Widget build(BuildContext context) {
    // For demonstration, use a flag to show empty or chat state.
    const bool isEmpty = false;

    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFFF28B22), size: 20),
        ),
        title: Row(
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundColor: Color(0xFFF28B22),
              child: Text('AH', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Ahmed Hassan', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14)),
                Text('Online', style: TextStyle(color: Colors.green.shade600, fontSize: 10, fontWeight: FontWeight.w500)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.call_outlined, color: Color(0xFFF28B22))),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert, color: Colors.black26)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: isEmpty
                ? const Center(
                    child: Text(
                      'No chat happen',
                      style: TextStyle(color: Colors.black26, fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  )
                : ListView(
                    padding: const EdgeInsets.all(20),
                    children: const [
                      _ChatBubble(
                        message: "Hi, I'm interested in your building services",
                        time: '10:30 AM',
                        isMe: true,
                      ),
                      _ChatBubble(
                        message: 'Hello! Thanks for reaching out. What type of project do you have in mind?',
                        time: '10:31 AM',
                        isMe: false,
                      ),
                      _ChatBubble(
                        message: 'I need a residential house, about 200m²',
                        time: '10:32 AM',
                        isMe: true,
                      ),
                      _ChatBubble(
                        message: 'Great! I can provide you with a detailed estimate. Do you have any specific material preferences?',
                        time: '10:33 AM',
                        isMe: false,
                      ),
                      _ChatBubble(
                        message: 'I prefer concrete and premium finishing',
                        time: '10:35 AM',
                        isMe: true,
                      ),
                      _ChatBubble(
                        message: "I'll send the estimate by tomorrow. The approximate cost for a 200m² house with premium finishing would be around \$29,000",
                        time: '10:38 AM',
                        isMe: false,
                      ),
                    ],
                  ),
          ),
          // Input Area
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 32),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFBFBFB),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        hintStyle: TextStyle(color: Colors.black12, fontSize: 14),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  width: 44,
                  height: 44,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF28B22),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.send, color: Colors.white, size: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatBubble extends StatelessWidget {
  const _ChatBubble({required this.message, required this.time, required this.isMe});

  final String message;
  final String time;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
            decoration: BoxDecoration(
              color: isMe ? const Color(0xFFF28B22) : Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(16),
                topRight: const Radius.circular(16),
                bottomLeft: Radius.circular(isMe ? 16 : 0),
                bottomRight: Radius.circular(isMe ? 0 : 16),
              ),
              boxShadow: [
                if (!isMe)
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
              ],
            ),
            child: Text(
              message,
              style: TextStyle(
                color: isMe ? Colors.white : Colors.black87,
                fontSize: 13,
                height: 1.4,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            time,
            style: const TextStyle(color: Colors.black26, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
