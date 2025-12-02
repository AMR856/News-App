import 'package:flutter/material.dart';
import 'package:news_app/api/models/sources_response.dart';
import 'package:news_app/repostories/sources_repository.dart';

class SourcesViewModel extends ChangeNotifier {
  final SourcesRepository repository;

  SourcesViewModel({required this.repository});

  bool isLoading = false;
  String? errorMessage;
  SourcesResponse? sourcesResponse;

  Future<void> getSources(String? categoryId) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    final result = await repository.fetchSources(categoryId);

    result.fold(
          (error) => errorMessage = error,
          (data) => sourcesResponse = data,
    );

    isLoading = false;
    notifyListeners();
  }
}
