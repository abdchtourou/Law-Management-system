import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import '../../domain/usecase/create_user_use_case.dart';

part 'create_user_state.dart';

class CreateUserCubit extends Cubit<CreateUserInitial> {
  final CreateUserUseCase createUserUseCase;
  final ImagePicker _picker = ImagePicker();

  CreateUserCubit({required this.createUserUseCase})
      : super(CreateUserInitial());

  Future<void> pickImage(
      {required bool isProfile, required ImageSource source}) async {
    final xFile = await _picker.pickImage(source: source, imageQuality: 85);
    if (xFile != null) {
      if (isProfile) {
        emit(state.copyWith(profileImage: File(xFile.path)));
      } else {
        emit(state.copyWith(idImage: File(xFile.path)));
      }
    }
  }

  Future<void> setImage(File image, {required bool isProfile}) async {
    if (isProfile) {
      emit(state.copyWith(profileImage: image));
    } else {
      emit(state.copyWith(idImage: image));
    }
  }

  void updateFullName(String value) => emit(state.copyWith(fullName: value));
  void updateFatherName(String value) =>
      emit(state.copyWith(fatherName: value));
  void updateMotherName(String value) =>
      emit(state.copyWith(motherName: value));
  void updateBirthDate(String value) => emit(state.copyWith(birthDate: value));
  void updateAddress(String value) => emit(state.copyWith(address: value));
  void updateNationalId(String value) =>
      emit(state.copyWith(nationalId: value));
  void updateCountry(String value) => emit(state.copyWith(country: value));
  void updateProvince(String value) => emit(state.copyWith(province: value));
  void updatePhone1(String value) => emit(state.copyWith(phone1: value));
  void updatePhone2(String value) => emit(state.copyWith(phone2: value));
  void updateEmail(String value) => emit(state.copyWith(email: value));
  void updateRole(String value) => emit(state.copyWith(role: value));

  Future<void> createUser() async {
    emit(state.copyWith(isLoading: true, error: null, isSuccess: false));

    final userData = {
      'full_name': state.fullName,
      'father_name': state.fatherName,
      'mother_name': state.motherName,
      'birth_date': state.birthDate,
      'address': state.address,
      'national_id': state.nationalId,
      'country': state.country,
      'province': state.province,
      'phone_1': state.phone1,
      'phone_2': state.phone2,
      'email': state.email,
      'role': state.role,
    };

    final result = await createUserUseCase(userData);

    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (_) => emit(state.copyWith(isLoading: false, isSuccess: true)),
    );
  }
}
