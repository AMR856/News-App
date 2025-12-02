class ArticleSource {
  ArticleSource({required this.id, required this.name});

  ArticleSource.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? '',
        name = json['name'] ?? '';

  final String id;
  final String name;

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
