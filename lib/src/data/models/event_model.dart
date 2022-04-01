import 'package:equatable/equatable.dart';

class EventModel extends Equatable {
  final String id;
  final String imageUrl;
  final String title;
  final String description;

  const EventModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'] ?? '',
      imageUrl: json['image_url'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
    );
  }

  @override
  List<Object> get props => [id, imageUrl, title, description];
}
