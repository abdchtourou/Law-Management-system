import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/labeled_text_field.dart';
import '../../../../core/widgets/labled_image_slot.dart';
import '../cubit/create_client_cubit.dart';

class CreateClientScreen extends StatelessWidget {
  const CreateClientScreen({super.key});

  Future<void> _pickImage(BuildContext context,
      {required String imageType}) async {
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('المعرض'),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
            ListTile(
              leading: const Icon(Icons.photo_camera_outlined),
              title: const Text('الكاميرا'),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
          ],
        ),
      ),
    );
    if (source != null) {
      context.read<CreateClientCubit>().pickImage(
            imageType: imageType,
            source: source,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateClientCubit>();
    Widget gap([double h = 12]) => SizedBox(height: h.h);

    return BlocListener<CreateClientCubit, CreateClientState>(
      listener: (context, state) {
        if (state.isSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('تم إنشاء العميل بنجاح'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context);
        } else if (state.error != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error!),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'إنشاء عميل',
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LabeledTextField(
                  label: 'النوع',
                  hint: 'شخص - شركة',
                  controller: cubit.clientTypeController,
                ),
                gap(),
                LabeledTextField(
                  label: 'الاسم الأول',
                  hint: 'محمد',
                  controller: cubit.firstNameController,
                ),
                gap(),
                LabeledTextField(
                  label: 'اسم العائلة',
                  hint: 'سعيد',
                  controller: cubit.lastNameController,
                ),
                gap(),
                LabeledTextField(
                  label: 'اسم الأب',
                  hint: 'أحمد',
                  controller: cubit.fatherNameController,
                ),
                gap(),
                LabeledTextField(
                  label: 'اسم الأم',
                  hint: 'فاطمة',
                  controller: cubit.motherNameController,
                ),
                gap(),
                LabeledTextField(
                  label: 'التولد',
                  hint: 'يوم/شهر/سنة',
                  controller: cubit.birthDateController,
                ),
                gap(),
                LabeledTextField(
                  label: 'العنوان',
                  hint: 'دمشق',
                  controller: cubit.addressController,
                ),
                gap(),
                LabeledTextField(
                  label: 'الرقم الوطني',
                  hint: '956513513515',
                  keyboardType: TextInputType.number,
                  controller: cubit.nationalIdController,
                ),
                gap(),
                LabeledTextField(
                  label: 'رقم تواصل',
                  hint: '956513513515',
                  keyboardType: TextInputType.phone,
                  controller: cubit.phoneNumberController,
                ),
                gap(),
                LabeledTextField(
                  label: 'البريد الالكتروني',
                  hint: 'example@email.com',
                  keyboardType: TextInputType.emailAddress,
                  controller: cubit.emailController,
                ),
                gap(),
                LabeledTextField(
                  label: 'ملاحظات',
                  hint: 'ملاحظات إضافية',
                  maxLines: 3,
                  controller: cubit.notesController,
                ),
                gap(16),
                BlocBuilder<CreateClientCubit, CreateClientState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        LabeledImageSlot(
                          label: 'صورة شخصية',
                          file: state.profileImage,
                          onTap: () =>
                              _pickImage(context, imageType: 'profile'),
                        ),
                        gap(16),
                        LabeledImageSlot(
                          label: 'صورة الهوية',
                          file: state.idImage,
                          onTap: () => _pickImage(context, imageType: 'id'),
                        ),
                        gap(16),
                        LabeledImageSlot(
                          label: 'صورة جواز سفر (اختياري)',
                          file: state.passportImage,
                          onTap: () =>
                              _pickImage(context, imageType: 'passport'),
                        ),
                      ],
                    );
                  },
                ),
                gap(24),
                BlocBuilder<CreateClientCubit, CreateClientState>(
                  builder: (context, state) {
                    return Center(
                      child: SizedBox(
                        width: 180,
                        height: 44,
                        child: ElevatedButton.icon(
                          onPressed: state.isLoading
                              ? null
                              : () => cubit.createClient(),
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
                            state.isLoading ? 'جاري الإنشاء...' : 'إنشاء عميل',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
