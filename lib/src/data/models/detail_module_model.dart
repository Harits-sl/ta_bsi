import 'package:equatable/equatable.dart';

class DetailModuleModel extends Equatable {
  final String id;
  final String namaMateri;
  final String imageUrl;
  final String materi;

  const DetailModuleModel({
    required this.id,
    required this.namaMateri,
    required this.imageUrl,
    required this.materi,
  });

  factory DetailModuleModel.fromJson(Map<String, dynamic> json) {
    return DetailModuleModel(
      id: json['id'] ?? '',
      namaMateri: json['nama_materi'] ?? '',
      imageUrl: json['image_url'] ?? '',
      materi: json['materi'] ?? '',
    );
  }

  @override
  List<Object> get props => [id, namaMateri, imageUrl, materi];
}
