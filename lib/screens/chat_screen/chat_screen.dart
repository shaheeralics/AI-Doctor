import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];

  void _sendMessage(String message) {
    if (message.trim().isEmpty) return;
    setState(() {
      _messages.add({'isUser': true, 'text': message});
    });
    _controller.clear();

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _messages.add({
          'isUser': false,
          'text': "I'm AI Doctor. How can I help you with your symptoms?"
        });
      });
    });
  }

  Widget _buildMessageBubble(Map<String, dynamic> msg) {
    final isUser = msg['isUser'];
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color:
              isUser ? Colors.lightBlueAccent.withOpacity(0.3) : Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Text(
          msg['text'],
          style: TextStyle(
            fontSize: 15,
            color: isUser ? Colors.black : Colors.black87,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/ai_avatar.png'),
              radius: 16,
            ),
            SizedBox(width: 10),
            Text('AI Doctor'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.video_call),
            onPressed: () {
              // TODO: Implement video call logic
            },
          ),
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {
              // TODO: Implement voice call logic
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[_messages.length - 1 - index];
                return _buildMessageBubble(msg);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.attach_file),
                  onPressed: () {
                    // TODO: Handle attachments
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.mic),
                  onPressed: () {
                    // TODO: Handle voice message recording
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Type your message...',
                      border: InputBorder.none,
                    ),
                    onSubmitted: _sendMessage,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () => _sendMessage(_controller.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
