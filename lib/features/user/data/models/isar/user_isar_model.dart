import 'package:isar/isar.dart';
import '../../../../auth/data/models/user_model.dart';

part 'user_isar_model.g.dart';

@collection
class UserIsarModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  int? userId;
  int? userAuthId;
  int? role;
  String? roleName;
  String? firstName;
  String? lastName;
  String? fatherName;
  String? motherName;
  String? fullName;
  String? gender;
  String? birthDate;
  int? age;
  String? address;
  String? nationalId;
  String? country;
  String? governorate;
  String? mainPhone;
  String? secondaryPhone;
  String? email;
  String? profilePicture;
  String? idPicture;
  String? passportPicture;
  bool? isActive;
  String? lastLogin;
  String? createdAt;
  String? updatedAt;
  int? createdBy;
  String? createdByName;

  // Default constructor required by Isar
  UserIsarModel();

  // Constructor from Entity (User)
  UserIsarModel.fromEntity(User user) {
    userId = user.userId;
    userAuthId = user.userAuthId;
    role = user.role;
    roleName = user.roleName;
    firstName = user.firstName;
    lastName = user.lastName;
    fatherName = user.fatherName;
    motherName = user.motherName;
    fullName = user.fullName;
    gender = user.gender;
    birthDate = user.birthDate;
    age = user.age;
    address = user.address;
    nationalId = user.nationalId;
    country = user.country;
    governorate = user.governorate;
    mainPhone = user.mainPhone;
    secondaryPhone = user.secondaryPhone;
    email = user.email;
    profilePicture = user.profilePicture;
    idPicture = user.idPicture;
    passportPicture = user.passportPicture;
    isActive = user.isActive;
    lastLogin = user.lastLogin;
    createdAt = user.createdAt;
    updatedAt = user.updatedAt;
    createdBy = user.createdBy;
    createdByName = user.createdByName;
  }

  // Convert to Entity
  User toEntity() {
    return User(
      userId: userId,
      userAuthId: userAuthId,
      role: role,
      roleName: roleName,
      firstName: firstName,
      lastName: lastName,
      fatherName: fatherName,
      motherName: motherName,
      fullName: fullName,
      gender: gender,
      birthDate: birthDate,
      age: age,
      address: address,
      nationalId: nationalId,
      country: country,
      governorate: governorate,
      mainPhone: mainPhone,
      secondaryPhone: secondaryPhone,
      email: email,
      profilePicture: profilePicture,
      idPicture: idPicture,
      passportPicture: passportPicture,
      isActive: isActive,
      lastLogin: lastLogin,
      createdAt: createdAt,
      updatedAt: updatedAt,
      createdBy: createdBy,
      createdByName: createdByName,
    );
  }
}
