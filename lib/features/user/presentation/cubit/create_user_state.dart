part of 'create_user_cubit.dart';

@immutable
abstract class CreateUserState {}

class CreateUserInitial extends CreateUserState {
  final File? profileImage;
  final File? idImage;
  final File? passportImage;

  // Edit mode fields
  final bool isEditing;
  final User? originalUser;
  final String? profileImageUrl;
  final String? idImageUrl;
  final String? passportImageUrl;

  final bool isLoading;
  final String? error;
  final bool isSuccess;

  CreateUserInitial({
    this.profileImage,
    this.idImage,
    this.passportImage,
    this.isEditing = false,
    this.originalUser,
    this.profileImageUrl,
    this.idImageUrl,
    this.passportImageUrl,
    this.isLoading = false,
    this.error,
    this.isSuccess = false,
  });

  CreateUserInitial copyWith({
    File? profileImage,
    File? idImage,
    File? passportImage,
    bool? isEditing,
    User? originalUser,
    String? profileImageUrl,
    String? idImageUrl,
    String? passportImageUrl,
    bool? isLoading,
    String? error,
    bool? isSuccess,
  }) {
    return CreateUserInitial(
      profileImage: profileImage ?? this.profileImage,
      idImage: idImage ?? this.idImage,
      passportImage: passportImage ?? this.passportImage,
      isEditing: isEditing ?? this.isEditing,
      originalUser: originalUser ?? this.originalUser,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      idImageUrl: idImageUrl ?? this.idImageUrl,
      passportImageUrl: passportImageUrl ?? this.passportImageUrl,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}
