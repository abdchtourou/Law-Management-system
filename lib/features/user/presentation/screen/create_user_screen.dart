import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lms/core/utils/app_localizations.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/labeled_text_field.dart';
import '../../../../core/widgets/labled_dropdown.dart';
import '../../../../core/widgets/labled_image_slot.dart';
import '../cubit/create_user_cubit.dart';

class CreateUserScreen extends StatelessWidget {
  CreateUserScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _showImageSourceSheet(
      BuildContext context, String imageType) async {
    final cubit = context.read<CreateUserCubit>();
    final l10n = AppLocalizations.of(context)!;

    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: Text(l10n.translate('gallery')),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
            ListTile(
              leading: const Icon(Icons.photo_camera_outlined),
              title: Text(l10n.translate('camera')),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
          ],
        ),
      ),
    );
    if (source != null) {
      cubit.pickImage(imageType: imageType, source: source);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final cubit = context.read<CreateUserCubit>();

    Widget gap([double h = 12]) => SizedBox(height: h);

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.translate('createUserTitle'),
      ),
      body: SafeArea(
        child: BlocConsumer<CreateUserCubit, CreateUserInitial>(
          listener: (context, state) {
            if (state.isSuccess) {
              final message = state.isEditing
                  ? 'User updated successfully'
                  : 'User created successfully';
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message)),
              );
            } else if (state.error != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error!)),
              );
            }
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    LabeledTextField(
                      label: 'First Name',
                      hint: 'Enter first name',
                      controller: cubit.firstNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'First Name is required';
                        }
                        return null;
                      },
                    ),
                    gap(),
                    LabeledTextField(
                      label: 'Last Name',
                      hint: 'Enter last name',
                      controller: cubit.lastNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Last Name is required';
                        }
                        return null;
                      },
                    ),
                    gap(),
                    LabeledTextField(
                      label: l10n.translate('email'),
                      hint: l10n.translate('emailHint'),
                      keyboardType: TextInputType.emailAddress,
                      controller: cubit.emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        final emailRegex =
                            RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                        if (!emailRegex.hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    gap(),
                    LabeledTextField(
                      label: 'Password',
                      hint: 'Enter password',
                      obscureText: true,
                      controller: cubit.passwordController,
                      validator: (value) {
                        if (state.isEditing &&
                            (value == null || value.isEmpty)) {
                          return null;
                        }
                        if (!state.isEditing &&
                            (value == null || value.isEmpty)) {
                          return 'Password is required';
                        }
                        if (value != null &&
                            value.isNotEmpty &&
                            value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    gap(),
                    LabeledTextField(
                      label: 'Confirm Password',
                      hint: 'Confirm password',
                      obscureText: true,
                      controller: cubit.confirmPasswordController,
                      validator: (value) {
                        if (state.isEditing &&
                            (value == null || value.isEmpty)) {
                          return null;
                        }
                        if (!state.isEditing &&
                            (value == null || value.isEmpty)) {
                          return 'Confirm Password is required';
                        }
                        if (value != cubit.passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                    gap(),
                    LabeledFakeDropdown(
                      label: l10n.translate('role'),
                      value: cubit.roleController.text.isEmpty
                          ? '...'
                          : cubit.roleController.text,
                      // TODO: add picker for role if needed
                    ),
                    gap(),
                    LabeledTextField(
                      label: 'Main Phone',
                      hint: 'Enter main phone',
                      keyboardType: TextInputType.phone,
                      controller: cubit.mainPhoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Main Phone is required';
                        }
                        return null;
                      },
                    ),
                    gap(),
                    LabeledTextField(
                      label: l10n.translate('fatherName'),
                      hint: l10n.translate('nameHint'),
                      controller: cubit.fatherNameController,
                    ),
                    gap(),
                    LabeledTextField(
                      label: l10n.translate('motherName'),
                      hint: l10n.translate('nameHint'),
                      controller: cubit.motherNameController,
                    ),
                    gap(),
                    LabeledTextField(
                      label: 'Gender',
                      hint: 'Enter gender',
                      controller: cubit.genderController,
                    ),
                    gap(),
                    LabeledTextField(
                      label: l10n.translate('birthDate'),
                      hint: l10n.translate('birthDateHint'),
                      controller: cubit.birthDateController,
                    ),
                    gap(),
                    LabeledTextField(
                      label: l10n.translate('address'),
                      hint: '',
                      controller: cubit.addressController,
                    ),
                    gap(),
                    LabeledTextField(
                      label: l10n.translate('nationalId'),
                      hint: l10n.translate('nationalIdHint'),
                      keyboardType: TextInputType.number,
                      controller: cubit.nationalIdController,
                    ),
                    gap(),
                    LabeledTextField(
                      label: l10n.translate('country'),
                      hint: '',
                      controller: cubit.countryController,
                    ),
                    gap(),
                    LabeledTextField(
                      label: 'Governorate',
                      hint: 'Enter governorate',
                      controller: cubit.governorateController,
                    ),
                    gap(),
                    LabeledTextField(
                      label: 'Secondary Phone',
                      hint: 'Enter secondary phone',
                      keyboardType: TextInputType.phone,
                      controller: cubit.secondaryPhoneController,
                    ),
                    gap(16),
                    LabeledImageSlot(
                      label: l10n.translate('profileImage'),
                      file: state.profileImage,
                      imageUrl: state.profileImageUrl,
                      onTap: () => _showImageSourceSheet(context, 'profile'),
                    ),
                    gap(16),
                    LabeledImageSlot(
                      label: l10n.translate('idImage'),
                      file: state.idImage,
                      imageUrl: state.idImageUrl,
                      onTap: () => _showImageSourceSheet(context, 'id'),
                    ),
                    gap(16),
                    LabeledImageSlot(
                      label: 'Passport Picture',
                      file: state.passportImage,
                      imageUrl: state.passportImageUrl,
                      onTap: () => _showImageSourceSheet(context, 'passport'),
                    ),
                    gap(24),
                    Center(
                      child: SizedBox(
                        width: 180,
                        height: 44,
                        child: ElevatedButton.icon(
                          onPressed: state.isLoading
                              ? null
                              : () {
                                  if (_formKey.currentState!.validate()) {
                                    final hasProfileImage =
                                        state.profileImage != null ||
                                            (state.isEditing &&
                                                state.profileImageUrl != null &&
                                                state.profileImageUrl!
                                                    .isNotEmpty);

                                    if (!hasProfileImage) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Profile image is required')),
                                      );
                                      return;
                                    }
                                    cubit.submitForm();
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Please fill all required fields')),
                                    );
                                  }
                                },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 0,
                          ),
                          icon: state.isLoading
                              ? const SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : Icon(
                                  state.isEditing
                                      ? Icons.save_as_outlined
                                      : Icons.person_add_alt_1,
                                  size: 18),
                          label: Text(
                            state.isEditing
                                ? 'تحديث البيانات' // Localize later or use if available
                                : l10n.translate('createUserBtn'),
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
