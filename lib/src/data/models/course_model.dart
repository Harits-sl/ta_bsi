import 'package:equatable/equatable.dart';

class CourseModel extends Equatable {
  final String id;
  final String course;
  final String imageUrl;
  final String description;
  final int manyLesson;

  const CourseModel({
    required this.id,
    required this.course,
    required this.imageUrl,
    required this.description,
    required this.manyLesson,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'] ?? '',
      course: json['course'] ?? '',
      imageUrl: json['image_url'] ?? '',
      description: json['description'] ?? '',
      manyLesson: json['many_lesson'] ?? 0,
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      course,
      imageUrl,
      description,
      manyLesson,
    ];
  }
}
