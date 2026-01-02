part of 'create_user_cubit.dart';

@immutable
abstract class CreateUserState {}

class CreateUserInitial extends CreateUserState {
  final File? profileImage;
  final File? idImage;
  final bool isLoading;
  final String? error;
  final bool isSuccess;

  // Form Fields
  final String fullName;
  final String fatherName;
  final String motherName;
  final String birthDate;
  final String address;
  final String nationalId;
  final String country;
  final String province;
  final String phone1;
  final String phone2;
  final String email;
  final String role;

  CreateUserInitial({
    this.profileImage,
    this.idImage,
    this.isLoading = false,
    this.error,
    this.isSuccess = false,
    this.fullName = '',
    this.fatherName = '',
    this.motherName = '',
    this.birthDate = '',
    this.address = '',
    this.nationalId = '',
    this.country = '',
    this.province = '',
    this.phone1 = '',
    this.phone2 = '',
    this.email = '',
    this.role = '',
  });

  CreateUserInitial copyWith({
    File? profileImage,
    File? idImage,
    bool? isLoading,
    String? error,
    bool? isSuccess,
    String? fullName,
    String? fatherName,
    String? motherName,
    String? birthDate,
    String? address,
    String? nationalId,
    String? country,
    String? province,
    String? phone1,
    String? phone2,
    String? email,
    String? role,
  }) {
    return CreateUserInitial(
      profileImage: profileImage ?? this.profileImage,
      idImage: idImage ?? this.idImage,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      isSuccess: isSuccess ?? this.isSuccess,
      fullName: fullName ?? this.fullName,
      fatherName: fatherName ?? this.fatherName,
      motherName: motherName ?? this.motherName,
      birthDate: birthDate ?? this.birthDate,
      address: address ?? this.address,
      nationalId: nationalId ?? this.nationalId,
      country: country ?? this.country,
      province: province ?? this.province,
      phone1: phone1 ?? this.phone1,
      phone2: phone2 ?? this.phone2,
      email: email ?? this.email,
      role: role ?? this.role,
    );
  }
}
