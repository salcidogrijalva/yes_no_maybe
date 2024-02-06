import 'package:flutter/material.dart';
import 'package:yes_no_maybe/config/helpers/get_answers.dart';
import 'package:yes_no_maybe/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();
  final getAnswer = GetYesNoAnswer();

  List<Message> messages = [
    Message(text: 'Wasaaaaaap', fromWho: Senders.own),
    Message(text: 'Un warzone o q?', fromWho: Senders.own)
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: Senders.own);
    messages.add(newMessage);

    if (text.endsWith('?')) {
      getMessage();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> getMessage() async {
    final receivedMessage = await getAnswer.getAnswer();
    messages.add(receivedMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  void moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut
    );
  }
}
