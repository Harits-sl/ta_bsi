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

  factory ModuleModel.fromSnapshot(Map<dynamic, dynamic> snapshot) {
    return ModuleModel(
      id: snapshot['id'] ?? '',
      modul: snapshot['modul'] ?? '',
      level: snapshot['level'] ?? '',
      materiKelas: snapshot['materi_kelas'] ?? [],
    );
  }

  @override
  List<Object> get props => [id, modul, level, materiKelas];
}
