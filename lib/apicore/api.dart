// lib/services/post_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:postsapp/models/post.dart';

class PostService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Post.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<List<Post>> searchPosts(String query) async {
    final response = await http.get(Uri.parse('$baseUrl?title_like=$query'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Post.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
