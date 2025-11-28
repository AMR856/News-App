import 'package:news_app/api/models/sources.dart';

class SourcesResponse {
  final String status;
  final List<Sources> sources;

  SourcesResponse({
    required this.status,
    required this.sources,
  });

  factory SourcesResponse.fromJson(Map<String, dynamic> json) {
    return SourcesResponse(
      status: json['status'] ?? "",
      sources: (json['sources'] as List<dynamic>? ?? [])
          .map((e) => Sources.fromJson(e))
          .toList(),
    );
  }
}
