import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_maybe/domain/entities/message.dart';
import 'package:yes_no_maybe/presentation/providers/chat_provider.dart';
import 'package:yes_no_maybe/presentation/widgets/chat/others_message_bubbles.dart';
import 'package:yes_no_maybe/presentation/widgets/chat/own_message_bubbles.dart';
import 'package:yes_no_maybe/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Padding(
          padding: EdgeInsets.all(5.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://avatarfiles.alphacoders.com/113/113760.jpg'),
          ),
        ),
        title: const Text('Friend'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.scrollController,
                itemCount: chatProvider.messages.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messages[index];
                  
                  return (message.fromWho == Senders.others)
                    ? OthersMessageBubble(message: message,)
                    : OwnMessageBubble(message: message,);
                },
              )
            ),
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),
            )
          ],
        ),
      ),
    );
  }
}
