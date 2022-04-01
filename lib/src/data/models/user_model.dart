import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;

  const UserModel({
    required this.id,
    required this.email,
    required this.name,
  });

  @override
  List<Object?> get props => [id, email, name];
}
