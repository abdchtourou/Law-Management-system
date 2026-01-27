part of 'create_client_cubit.dart';

@immutable
class CreateClientState {
  final File? profileImage;
  final File? idImage;
  final File? passportImage;
  final bool isLoading;
  final bool isSuccess;
  final String? error;

  const CreateClientState({
    this.profileImage,
    this.idImage,
    this.passportImage,
    this.isLoading = false,
    this.isSuccess = false,
    this.error,
  });

  CreateClientState copyWith({
    File? profileImage,
    File? idImage,
    File? passportImage,
    bool? isLoading,
    bool? isSuccess,
    String? error,
  }) {
    return CreateClientState(
      profileImage: profileImage ?? this.profileImage,
      idImage: idImage ?? this.idImage,
      passportImage: passportImage ?? this.passportImage,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error,
    );
  }
}

class CreateClientInitial extends CreateClientState {
  const CreateClientInitial();
}
