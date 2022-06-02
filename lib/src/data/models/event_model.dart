import 'package:equatable/equatable.dart';

class EventModel extends Equatable {
  final String id;
  final String imageUrl;
  final String fullImageUrl;
  final String title;
  final String description;
  final String fullDescription;
  final String linkRegister;

  const EventModel({
    required this.id,
    required this.imageUrl,
    required this.fullImageUrl,
    required this.title,
    required this.description,
    required this.fullDescription,
    required this.linkRegister,
  });

  factory EventModel.fromSnapshot(Map<dynamic, dynamic> snapshot) {
    return EventModel(
      id: snapshot['id'] ?? '',
      imageUrl: snapshot['image_url'] ?? '',
      fullImageUrl: snapshot['full_image_url'] ?? '',
      title: snapshot['title'] ?? '',
      description: snapshot['description'] ?? '',
      fullDescription: snapshot['full_description'] ?? '',
      linkRegister: snapshot['link_register'] ?? '',
    );
  }

  @override
  List<Object> get props => [
        id,
        imageUrl,
        fullImageUrl,
        title,
        description,
        fullDescription,
        linkRegister
      ];
}
