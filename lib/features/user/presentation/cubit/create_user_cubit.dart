import 'dart:io';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/usecase/create_user_use_case.dart';
import '../../domain/usecase/update_user_use_case.dart';
import '../../../auth/data/models/user_model.dart';

part 'create_user_state.dart';

class CreateUserCubit extends Cubit<CreateUserInitial> {
  final CreateUserUseCase createUserUseCase;
  final UpdateUserUseCase updateUserUseCase;
  final ImagePicker _picker = ImagePicker();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController roleController = TextEditingController();
  final TextEditingController mainPhoneController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController motherNameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController nationalIdController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController governorateController = TextEditingController();
  final TextEditingController secondaryPhoneController =
      TextEditingController();

  CreateUserCubit({
    required this.createUserUseCase,
    required this.updateUserUseCase,
  }) : super(CreateUserInitial());

  void initializeForEdit(User user) {
    firstNameController.text = user.firstName ?? '';
    lastNameController.text = user.lastName ?? '';
    emailController.text = user.email ?? '';
    roleController.text =
        user.roleName ?? ''; // Note: roleName might handle ID if needed
    mainPhoneController.text = user.mainPhone ?? '';
    fatherNameController.text = user.fatherName ?? '';
    motherNameController.text = user.motherName ?? '';
    genderController.text = user.gender ?? '';
    birthDateController.text = user.birthDate ?? '';
    addressController.text = user.address ?? '';
    nationalIdController.text = user.nationalId ?? '';
    countryController.text = user.country ?? '';
    governorateController.text = user.governorate ?? '';
    secondaryPhoneController.text = user.secondaryPhone ?? '';

    // Password fields are left empty for edit

    emit(state.copyWith(
      isEditing: true,
      originalUser: user,
      profileImageUrl: user.profilePicture,
      idImageUrl: user.idPicture,
      // passportImageUrl: user.passportPicture, // Assuming User model has this if needed
    ));
  }

  Future<void> pickImage({
    required String imageType,
    required ImageSource source,
  }) async {
    final xFile = await _picker.pickImage(source: source, imageQuality: 85);
    if (xFile != null) {
      switch (imageType) {
        case 'profile':
          emit(state.copyWith(profileImage: File(xFile.path)));
          break;
        case 'id':
          emit(state.copyWith(idImage: File(xFile.path)));
          break;
        case 'passport':
          emit(state.copyWith(passportImage: File(xFile.path)));
          break;
      }
    }
  }

  Future<void> setImage(File image, {required String imageType}) async {
    switch (imageType) {
      case 'profile':
        emit(state.copyWith(profileImage: image));
        break;
      case 'id':
        emit(state.copyWith(idImage: image));
        break;
      case 'passport':
        emit(state.copyWith(passportImage: image));
        break;
    }
  }

  Future<void> submitForm() async {
    emit(state.copyWith(isLoading: true, error: null, isSuccess: false));

    final data = {
      'first_name': firstNameController.text,
      'last_name': lastNameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'confirm_password': confirmPasswordController.text,
      'role': '9',
      'main_phone': mainPhoneController.text,
      'father_name': fatherNameController.text,
      'mother_name': motherNameController.text,
      'gender': genderController.text,
      'birth_date': birthDateController.text,
      'address': addressController.text,
      'national_id': nationalIdController.text,
      'country': countryController.text,
      'governorate': governorateController.text,
      'secondary_phone': secondaryPhoneController.text,
      'profile_picture': state.profileImage,
      'id_picture': state.idImage,
      'passport_picture': state.passportImage,
    };

    final Either<Failure, void> result;

    if (state.isEditing && state.originalUser != null) {
      result = await updateUserUseCase(UpdateUserParams(
        id: state.originalUser!.userId!,
        userData: data,
      ));
    } else {
      result = await createUserUseCase(data);
    }

    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (_) => emit(state.copyWith(isLoading: false, isSuccess: true)),
    );
  }

  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    roleController.dispose();
    mainPhoneController.dispose();
    fatherNameController.dispose();
    motherNameController.dispose();
    genderController.dispose();
    birthDateController.dispose();
    addressController.dispose();
    nationalIdController.dispose();
    countryController.dispose();
    governorateController.dispose();
    secondaryPhoneController.dispose();
    return super.close();
  }
}
