import 'package:equatable/equatable.dart';

class DetailModuleModel extends Equatable {
  final String id;
  final String namaMateri;
  final String materi;

  const DetailModuleModel({
    required this.id,
    required this.namaMateri,
    required this.materi,
  });

  factory DetailModuleModel.fromSnapshot(Map<dynamic, dynamic> snapshot) {
    return DetailModuleModel(
      id: snapshot['id'] ?? '',
      namaMateri: snapshot['nama_materi'] ?? '',
      materi: snapshot['materi'] ?? '',
    );
  }

  clear() {
    return const DetailModuleModel(
      id: '',
      namaMateri: '',
      materi: '',
    );
  }

  @override
  List<Object> get props => [id, namaMateri, materi];
}
