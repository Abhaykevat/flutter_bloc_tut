import 'dart:convert';
import 'package:http/http.dart' as http;
import 'post_model.dart';

class PostRepository {
  final String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Post>> fetchPosts() async {
    try {
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: {
          'User-Agent': 'Mozilla/5.0',
          'Accept': 'application/json',
        },
      );
      print('Status Code: ${response.statusCode}');
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => Post.fromJson(json)).toList();
      } else {
        throw Exception(
          'Failed to load posts. Status code: ${response.statusCode}, Reason: ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      throw Exception('Network error occurred: $e');
    }
  }
}
