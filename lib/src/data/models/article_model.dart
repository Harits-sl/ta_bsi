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

  factory ArticleModel.fromSnapshot(Map<dynamic, dynamic> snapshot) {
    return ArticleModel(
      id: snapshot['id'] ?? '',
      imageUrl: snapshot['image_url'] ?? '',
      title: snapshot['title'] ?? '',
      publisher: snapshot['publisher'] ?? '',
      article: snapshot['article'] ?? '',
      link: snapshot['link'] ?? '',
    );
  }

  @override
  List<Object> get props => [id, imageUrl, title, publisher, article, link];
}
