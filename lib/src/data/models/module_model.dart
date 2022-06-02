import 'package:equatable/equatable.dart';

class ModuleModel extends Equatable {
  final String id;
  final String modul;
  final String level;
  final List materiKelas;

  const ModuleModel({
    required this.id,
    required this.modul,
    required this.level,
    required this.materiKelas,
  });

  factory ModuleModel.fromJson(Map<String, dynamic> json) {
    return ModuleModel(
      id: json['id'] ?? '',
      modul: json['modul'] ?? '',
      level: json['level'] ?? '',
      materiKelas: json['materi_kelas'] ?? [],
    );
  }

  @override
  List<Object> get props => [id, modul, level, materiKelas];
}
