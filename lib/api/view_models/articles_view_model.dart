import 'package:flutter/material.dart';
import 'package:news_app/api/models/articles_response.dart';
import 'package:news_app/repostories/articles_repository.dart';

class ArticlesViewModel extends ChangeNotifier {
  final ArticlesRepository repository;

  ArticlesViewModel({required this.repository});

  bool isLoading = false;
  String? errorMessage;
  ArticlesResponse? articlesResponse;

  Future<void> getArticles(String? sourceId, String? query) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    final result = await repository.fetchArticles(sourceId, query);

    result.fold(
          (error) => errorMessage = error,
          (data) => articlesResponse = data,
    );

    isLoading = false;
    notifyListeners();
  }
}