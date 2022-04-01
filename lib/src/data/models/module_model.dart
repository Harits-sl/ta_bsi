import 'package:equatable/equatable.dart';

class ModuleModel extends Equatable {
  final String id;
  final String namaMateri;
  final String materi;

  const ModuleModel({
    required this.id,
    required this.namaMateri,
    required this.materi,
  });

  factory ModuleModel.fromJson(Map<String, dynamic> json) {
    return ModuleModel(
      id: json['id'] ?? '',
      namaMateri: json['nama_materi'] ?? '',
      materi: json['materi'] ?? '',
    );
  }

  @override
  List<Object> get props => [id, namaMateri, materi];
}
