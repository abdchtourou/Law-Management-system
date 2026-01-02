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
  const CreateUserScreen({super.key});

  Future<void> _showImageSourceSheet(
      BuildContext context, bool isProfile) async {
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
      cubit.pickImage(isProfile: isProfile, source: source);
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
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('User created successfully')),
              );
              Navigator.pop(context);
            } else if (state.error != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error!)),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LabeledTextField(
                    label: l10n.translate('employeeName'),
                    hint: l10n.translate('nameHint'),
                    onChanged: cubit.updateFullName,
                  ),
                  gap(),
                  LabeledTextField(
                    label: l10n.translate('fatherName'),
                    hint: l10n.translate('nameHint'),
                    onChanged: cubit.updateFatherName,
                  ),
                  gap(),
                  LabeledTextField(
                    label: l10n.translate('motherName'),
                    hint: l10n.translate('nameHint'),
                    onChanged: cubit.updateMotherName,
                  ),
                  gap(),
                  LabeledTextField(
                    label: l10n.translate('birthDate'),
                    hint: l10n.translate('birthDateHint'),
                    onChanged: cubit.updateBirthDate,
                  ),
                  gap(),
                  LabeledTextField(
                    label: l10n.translate('address'),
                    hint: '', // Add hint if needed
                    onChanged: cubit.updateAddress,
                  ),
                  gap(),
                  LabeledTextField(
                    label: l10n.translate('nationalId'),
                    hint: l10n.translate('nationalIdHint'),
                    keyboardType: TextInputType.number,
                    onChanged: cubit.updateNationalId,
                  ),
                  gap(),
                  LabeledTextField(
                    label: l10n.translate('country'),
                    hint: '',
                    onChanged: cubit.updateCountry,
                  ),
                  gap(),
                  LabeledTextField(
                    label: l10n.translate('province'),
                    hint: '',
                    onChanged: cubit.updateProvince,
                  ),
                  gap(),
                  LabeledTextField(
                    label: l10n.translate('phone1'),
                    hint: l10n.translate('nationalIdHint'),
                    keyboardType: TextInputType.phone,
                    onChanged: cubit.updatePhone1,
                  ),
                  gap(),
                  LabeledTextField(
                    label: l10n.translate('phone2'),
                    hint: l10n.translate('nationalIdHint'),
                    keyboardType: TextInputType.phone,
                    onChanged: cubit.updatePhone2,
                  ),
                  gap(),
                  LabeledTextField(
                    label: l10n.translate('email'),
                    hint: l10n.translate('emailHint'),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: cubit.updateEmail,
                  ),
                  gap(),
                  LabeledFakeDropdown(
                    label: l10n.translate('role'),
                    value: state.role.isEmpty ? '...' : state.role,
                    // TODO: add picker for role if needed
                  ),
                  gap(16),
                  LabeledImageSlot(
                    label: l10n.translate('profileImage'),
                    file: state.profileImage,
                    onTap: () => _showImageSourceSheet(context, true),
                  ),
                  gap(16),
                  LabeledImageSlot(
                    label: l10n.translate('idImage'),
                    file: state.idImage,
                    onTap: () => _showImageSourceSheet(context, false),
                  ),
                  gap(24),
                  Center(
                    child: SizedBox(
                      width: 180,
                      height: 44,
                      child: ElevatedButton.icon(
                        onPressed: state.isLoading ? null : cubit.createUser,
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
                            : const Icon(Icons.person_add_alt_1, size: 18),
                        label: Text(
                          l10n.translate('createUserBtn'),
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
            );
          },
        ),
      ),
    );
  }
}
