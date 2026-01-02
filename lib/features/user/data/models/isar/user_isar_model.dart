import 'package:isar/isar.dart';
import '../../../../auth/data/models/user_model.dart';

part 'user_isar_model.g.dart';

@collection
class UserIsarModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  int? userId;
  int? userAuthId;
  String? fullName;
  String? roleName;
  String? email;
  String? mainPhone;
  bool? isActive;
  String? lastActive;
  String? createdAt;

  // Default constructor required by Isar
  UserIsarModel();

  // Constructor from Entity (User)
  UserIsarModel.fromEntity(User user) {
    userId = user.userId;
    userAuthId = user.userAuthId;
    fullName = user.fullName;
    roleName = user.roleName;
    email = user.email;
    mainPhone = user.mainPhone;
    isActive = user.isActive;
    createdAt = user.createdAt;
    lastActive=user.lastLogin;
  }

  // Convert to Entity
  User toEntity() {
    return User(
      userId: userId,
      userAuthId: userAuthId,
      fullName: fullName,
      roleName: roleName,
      email: email,
      mainPhone: mainPhone,
      isActive: isActive,
      createdAt: createdAt,
      lastLogin: lastActive
    );
  }
}
