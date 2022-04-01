import 'package:equatable/equatable.dart';

class YoutubeModel extends Equatable {
  final String id;
  final String idYoutube;
  final String imageUrl;
  final String title;

  const YoutubeModel({
    required this.id,
    required this.idYoutube,
    required this.imageUrl,
    required this.title,
  });

  factory YoutubeModel.fromJson(Map<String, dynamic> json) {
    return YoutubeModel(
      id: json['id'] ?? '',
      idYoutube: json['id_youtube'] ?? '',
      imageUrl: json['image_url'] ?? '',
      title: json['title'] ?? '',
    );
  }

  @override
  List<Object> get props => [id, idYoutube, imageUrl, title];
}
