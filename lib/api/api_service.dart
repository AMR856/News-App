import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:news_app/api/models/articles_response.dart';
import 'package:news_app/api/models/sources_response.dart';
import 'dart:convert';

abstract class APIService {
  static String apiKey = dotenv.get('API_KEY');
  static String baseURL = dotenv.get('BASE_URL');

  static Future<Either<String, SourcesResponse>> getSources(
    String? categoryId,
  ) async {
    final uri = Uri.https(baseURL, '/v2/top-headlines/sources', {
      'category': categoryId,
      'apiKey': apiKey,
    });

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return Right(SourcesResponse.fromJson(json));
      } else {
        return Left("Server error: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Network error: $e");
      return Left("Network error: $e");
    }
  }

  static Future<Either<String, ArticlesResponse>> getArticles(
    String? sourceId, [
    String? q,
  ]) async {
    bool doesHaveSources = false;
    bool doesHaveQ = false;
    if (sourceId != null && sourceId.trim().isNotEmpty) {
      doesHaveSources = true;
    }

    if (q != null && q.trim().isNotEmpty) {
      doesHaveQ = true;
    }

    String urlString = 'https://newsapi.org/v2/top-headlines?apiKey=$apiKey';
    if (doesHaveSources) {
      urlString = '$urlString&sources=${sourceId?.trim()}';
    }
    if (doesHaveQ) {
      urlString = '$urlString&q=${q?.trim()}';
    }
    final uri = Uri.parse(urlString);
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return Right(ArticlesResponse.fromJson(json));
      } else {
        return Left("Server error: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Network error: $e");
      return Left("Network error: $e");
    }
  }
}
