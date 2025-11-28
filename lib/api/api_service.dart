import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/api/models/sources_response.dart';
import 'dart:convert';

abstract class APIService {
  static String apiKey = dotenv.get('API_KEY');
  static String baseURL = dotenv.get('BASE_URL');

  static Future<SourcesResponse?> getSources(String? categoryId) async {
    final uri = Uri.https(baseURL, '/v2/top-headlines/sources', {
      'category': categoryId,
      'apiKey': apiKey,
    });
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return SourcesResponse.fromJson(data);
    } else {
      debugPrint('Error: ${response.statusCode}');
      debugPrint(response.body);
      return null;
    }
  }
}