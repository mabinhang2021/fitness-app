import 'dart:convert';

import 'package:http/http.dart' as http;

class ClaudeApiService {
  //API constants
  static const String _baseUrl = 'https://api.claude.ai/v1';
  static const String _apiVersion = 'v1';
  static const String _model = 'claude -3-opus-20240229';
  static const int _maxTokens = 1024;

  //Store the Api key securely
  final String _apiKey;

  //Require API key
  ClaudeApiService({required String apiKey}) : _apiKey = apiKey;

  //begin
  //send message to claude and return the message
  //end

  Future<String> sendMessage(String content) async {
    //send message to claude and return the message
    try {
      //make post request to claude api
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: _getHeaders(),
        body: _getRequestBody(content),
      );
      //check if request was successful
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body); //parse json response
        return data['context'][0]['text']; //extract claude response
      }
      //handle unsuccessful response
      else {
        throw Exception(
          'Failed to get response from Claude: ${response.statusCode}',
        );
      }
    } catch (e) {
      //handle any error duringapi call
      throw Exception('API ERROR $e');
    }
  }

  //create required headers for claude API
  Map<String, String> _getHeaders() => {
    'Content-Type': 'application/json',
    'x-api-key': _apiKey,
    'anthropic-version': _apiVersion,
  };

  //format request body according to claude API specs
  String _getRequestBody(String context) => jsonEncode({
    'model': _model,
    'max_tokens': _maxTokens,
    'messages': [
      {'role': 'user', 'content': context},
    ],
  });
}
