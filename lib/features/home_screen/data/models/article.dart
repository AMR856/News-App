import 'package:news_app/features/home_screen/data/models/article_source.dart';
import 'package:news_app/features/home_screen/domain/entites/article_entity.dart';

class Article {
  Article({
    required this.source,
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  Article.fromJson(Map<String, dynamic> json)
    : source = json['source'] != null
          ? ArticleSource.fromJson(json['source'])
          : ArticleSource(id: '', name: ''),
      author = json['author'],
      title = json['title'] ?? '',
      description = json['description'],
      url = json['url'] ?? '',
      urlToImage = json['urlToImage'],
      publishedAt = json['publishedAt'] ?? '',
      content = json['content'];

  final ArticleSource source;
  final String? author;
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;
  final String publishedAt;
  final String? content;

  ArticleEntity toArticleEntity() => ArticleEntity(
    author: author,
    title: title,
    url: url,
    urlToImage: urlToImage,
    publishedAt: publishedAt,
  );
}
