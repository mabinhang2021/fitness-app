import 'package:flutter/material.dart';
import 'package:flutter_application_1/chat/data/claude_api_service.dart';
import 'package:flutter_application_1/chat/model/message.dart';


class ChatProvider with ChangeNotifier {
  //claude api service
  final _apiServiece = ClaudeApiService(apiKey: "apiKey");

  //message and loading
  final List<Message> _messages = [];
  bool _isLoading = false;

  //getters
  List<Message> get messages => _messages;
  bool get isLoading => _isLoading;

  //Send message
  Future<void> sendMessage(String content) async {
    //prevent empty sends
    if (content.trim().isEmpty) return;
    //add user message
    final userMessage = Message(
      content: content,
      isUser: true,
      timestamp: DateTime.now(),
    );
    //add user message to chat
    _messages.add(userMessage);
    //update ui
    notifyListeners();
    //start loading
    _isLoading = true;
    notifyListeners();
    //send message to claude and receive response
    try {
      final response = await _apiServiece.sendMessage(content);
      //response message from ai
      final responseMessage = Message(
        content: response,
        isUser: false,
        timestamp: DateTime.now(),
      );
      //add response message to chat
      _messages.add(responseMessage);
    } catch (e) {
      //error message
      final errorMessage = Message(
        content: "sorry",
        isUser: false,
        timestamp: DateTime.now(),
      );
      //add error message to chat
      _messages.add(errorMessage);
    }
    //finished loading
    _isLoading = false;
    notifyListeners();
  }
}
