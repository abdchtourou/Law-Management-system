class UserModel {
  String? message;
  User? user;
  Tokens? tokens;

  UserModel({this.message, this.user, this.tokens});

  UserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != String ? User.fromJson(json['user']) : null;
    tokens =
    json['tokens'] != String ? Tokens.fromJson(json['tokens']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (user != String) {
      data['user'] = user!.toJson();
    }
    if (tokens != String) {
      data['tokens'] = tokens!.toJson();
    }
    return data;
  }
}

class User {
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
  String? createdBy;
  String? createdByName;

  User(
      {this.userId,
        this.userAuthId,
        this.role,
        this.roleName,
        this.firstName,
        this.lastName,
        this.fatherName,
        this.motherName,
        this.fullName,
        this.gender,
        this.birthDate,
        this.age,
        this.address,
        this.nationalId,
        this.country,
        this.governorate,
        this.mainPhone,
        this.secondaryPhone,
        this.email,
        this.profilePicture,
        this.idPicture,
        this.passportPicture,
        this.isActive,
        this.lastLogin,
        this.createdAt,
        this.updatedAt,
        this.createdBy,
        this.createdByName});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userAuthId = json['user_auth_id'];
    role = json['role'];
    roleName = json['role_name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fatherName = json['father_name'];
    motherName = json['mother_name'];
    fullName = json['full_name'];
    gender = json['gender'];
    birthDate = json['birth_date'];
    age = json['age'];
    address = json['address'];
    nationalId = json['national_id'];
    country = json['country'];
    governorate = json['governorate'];
    mainPhone = json['main_phone'];
    secondaryPhone = json['secondary_phone'];
    email = json['email'];
    profilePicture = json['profile_picture'];
    idPicture = json['id_picture'];
    passportPicture = json['passport_picture'];
    isActive = json['is_active'];
    lastLogin = json['last_login'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy = json['created_by'];
    createdByName = json['created_by_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['user_auth_id'] = userAuthId;
    data['role'] = role;
    data['role_name'] = roleName;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['father_name'] = fatherName;
    data['mother_name'] = motherName;
    data['full_name'] = fullName;
    data['gender'] = gender;
    data['birth_date'] = birthDate;
    data['age'] = age;
    data['address'] = address;
    data['national_id'] = nationalId;
    data['country'] = country;
    data['governorate'] = governorate;
    data['main_phone'] = mainPhone;
    data['secondary_phone'] = secondaryPhone;
    data['email'] = email;
    data['profile_picture'] = profilePicture;
    data['id_picture'] = idPicture;
    data['passport_picture'] = passportPicture;
    data['is_active'] = isActive;
    data['last_login'] = lastLogin;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['created_by'] = createdBy;
    data['created_by_name'] = createdByName;
    return data;
  }
}

class Tokens {
  String? refresh;
  String? access;

  Tokens({this.refresh, this.access});

  Tokens.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    access = json['access'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['refresh'] = refresh;
    data['access'] = access;
    return data;
  }
}
