import 'package:equatable/equatable.dart';

class ArticleModel extends Equatable {
  final String id;
  final String imageUrl;
  final String title;
  final String publisher;
  final String article;
  final String link;

  const ArticleModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.publisher,
    required this.article,
    required this.link,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['id'] ?? '',
      imageUrl: json['image_url'] ?? '',
      title: json['title'] ?? '',
      publisher: json['publisher'] ?? '',
      article: json['article'] ?? '',
      link: json['link'] ?? '',
    );
  }

  @override
  List<Object> get props => [id, imageUrl, title, publisher, article, link];
}
