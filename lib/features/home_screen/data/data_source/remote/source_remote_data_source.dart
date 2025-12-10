
import 'package:news_app/features/home_screen/data/models/sources_response.dart';

abstract class SourceRemoteDataSource {
  Future<SourcesResponse> getSources(String? categoryId);
}