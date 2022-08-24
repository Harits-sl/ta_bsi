import 'package:equatable/equatable.dart';

class UserModuleModel extends Equatable {
  final String idUser;
  final String idModule;
  final bool isDone;

  const UserModuleModel({
    required this.idUser,
    required this.idModule,
    this.isDone = false,
  });

  factory UserModuleModel.fromSnapshot(Map<dynamic, dynamic> snapshot) {
    return UserModuleModel(
      idUser: snapshot['idUser'] ?? '',
      idModule: snapshot['idModule'] ?? '',
      isDone: snapshot['isDone'] ?? false,
    );
  }

  Map<dynamic, dynamic> toMap() {
    final Map<dynamic, dynamic> result = {};
    List list = [];

    for (var item in list) {
      result.addAll({item: isDone});
    }
    return result;
  }

  @override
  List<Object> get props => [idUser, idModule, isDone];
}
