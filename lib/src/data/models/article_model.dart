import 'package:equatable/equatable.dart';

class ArticleModel extends Equatable {
  final String id;
  final String imageUrl;
  final String title;
  final String publisher;

  const ArticleModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.publisher,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['id'] ?? '',
      imageUrl: json['image_url'] ?? '',
      title: json['title'] ?? '',
      publisher: json['publisher'] ?? '',
    );
  }

  @override
  List<Object> get props => [id, imageUrl, title, publisher];
}
