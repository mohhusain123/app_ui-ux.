import 'dart:convert';
import 'package:http/http.dart' as http;

class AiService {
  static const String _apiKey =
      'YOUR_OPENAI_API_KEY'; // Replace with your API key
  static const String _baseUrl = 'https://api.openai.com/v1/chat/completions';

  Future<String> getAiResponse(String message) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_apiKey',
        },
        body: jsonEncode({
          'model': 'gpt-3.5-turbo',
          'messages': [
            {'role': 'user', 'content': message},
          ],
          'max_tokens': 150,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['choices'][0]['message']['content'];
      } else {
        return 'Error: ${response.statusCode}';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }
}
