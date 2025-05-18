import 'package:flutter/material.dart';
import 'package:flutter_application_1/chat/presentation/chat_bubble.dart';
import 'package:flutter_application_1/chat/presentation/chat_provider.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Consumer<ChatProvider>(
                builder: (context, ChatProvider, child) {
                  //empty
                  if (ChatProvider.messages.isEmpty) {
                    return const Center(child: Text("Start Chatting"));
                  }
                  //chat messages
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final message = ChatProvider.messages[index];
                      return ChatBubble(message: message);
                    },
                    itemCount: ChatProvider.messages.length,
                  );
                },
              ),
            ),
            //loading indicator
            Consumer<ChatProvider>(
              builder: (context, ChatProvider, child) {
                if (ChatProvider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return const SizedBox.shrink();
              },
            ),

            //user input box
            Row(
              children: [
                Expanded(child: TextField(controller: _controller)),
                IconButton(
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      final chatProvider = context.read<ChatProvider>();
                      chatProvider.sendMessage(_controller.text);
                      _controller.clear();
                    }
                  },
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
