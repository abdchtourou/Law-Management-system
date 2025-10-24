import 'package:equatable/equatable.dart';

/// User entity representing the authenticated user
/// This is part of the domain layer and should not depend on any external packages
/// except for equatable for value comparison
class UserEntity extends Equatable {
  final String id;
  final String email;
  final String name;
  final String? avatar;
  final DateTime createdAt;

  const UserEntity({
    required this.id,
    required this.email,
    required this.name,
    this.avatar,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, email, name, avatar, createdAt];
}
