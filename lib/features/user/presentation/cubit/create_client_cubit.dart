import 'dart:io';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import '../../domain/usecase/create_client_use_case.dart';

part 'create_client_state.dart';

class CreateClientCubit extends Cubit<CreateClientState> {
  final CreateClientUseCase createClientUseCase;
  final ImagePicker _picker = ImagePicker();

  // Text Controllers for all 11 fields
  final TextEditingController clientTypeController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController motherNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController nationalIdController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  CreateClientCubit({required this.createClientUseCase})
      : super(const CreateClientInitial());

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

  Future<void> createClient() async {
    emit(state.copyWith(isLoading: true, error: null, isSuccess: false));

    final result = await createClientUseCase({
      'client_type': clientTypeController.text,
      'first_name': firstNameController.text,
      'father_name': fatherNameController.text,
      'mother_name': motherNameController.text,
      'last_name': lastNameController.text,
      'national_id': nationalIdController.text,
      'birth_date': birthDateController.text,
      'phone_number': phoneNumberController.text,
      'address': addressController.text,
      'email': emailController.text,
      'notes': notesController.text,
      'profile_picture': state.profileImage,
      'id_picture': state.idImage,
      'passport_picture': state.passportImage,
    });

    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (_) => emit(state.copyWith(isLoading: false, isSuccess: true)),
    );
  }

  @override
  Future<void> close() {
    clientTypeController.dispose();
    firstNameController.dispose();
    fatherNameController.dispose();
    motherNameController.dispose();
    lastNameController.dispose();
    nationalIdController.dispose();
    birthDateController.dispose();
    phoneNumberController.dispose();
    addressController.dispose();
    emailController.dispose();
    notesController.dispose();
    return super.close();
  }
}
