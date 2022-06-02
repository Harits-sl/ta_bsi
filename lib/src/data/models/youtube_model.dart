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

  factory YoutubeModel.fromSnapshot(Map<dynamic, dynamic> snapshot) {
    return YoutubeModel(
      id: snapshot['id'] ?? '',
      idYoutube: snapshot['id_youtube'] ?? '',
      imageUrl: snapshot['image_url'] ?? '',
      title: snapshot['title'] ?? '',
    );
  }

  @override
  List<Object> get props => [id, idYoutube, imageUrl, title];
}
