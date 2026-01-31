import 'package:flutter/material.dart';

String formatTaskDate(DateTime date) {
  final day = date.day.toString().padLeft(2, '0');
  final month = date.month.toString().padLeft(2, '0');
  final year = date.year.toString();
  return '$day-$month-$year';
}

class TaskFormLabel extends StatelessWidget {
  final String text;

  const TaskFormLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
        ),
      ),
    );
  }
}

class TaskFormInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? initialValue;
  final String hint;
  final int maxLines;
  final bool readOnly;
  final VoidCallback? onTap;
  final Widget? suffixIcon;

  const TaskFormInput({
    super.key,
    this.controller,
    this.initialValue,
    required this.hint,
    this.maxLines = 1,
    this.readOnly = false,
    this.onTap,
    this.suffixIcon,
  }) : assert(
          controller != null || initialValue != null,
          'Controller or initialValue must be provided.',
        );

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: const BorderSide(color: Color(0xFFBFC9D6)),
    );

    final effectiveInitialValue =
        controller == null ? (initialValue ?? '') : null;

    return TextFormField(
      key: controller == null ? ValueKey(effectiveInitialValue) : null,
      controller: controller,
      initialValue: effectiveInitialValue,
      maxLines: maxLines,
      readOnly: readOnly,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFF9AA6B2)),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: const BorderSide(color: Color(0xFF0B6F8A), width: 1.2),
        ),
        suffixIcon: suffixIcon,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      ),
    );
  }
}

class TaskPrimaryButton extends StatelessWidget {
  final String text;
  final bool enabled;
  final bool loading;
  final VoidCallback onPressed;

  const TaskPrimaryButton({
    super.key,
    required this.text,
    required this.enabled,
    required this.loading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ElevatedButton(
        onPressed: enabled && !loading ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          disabledBackgroundColor: Colors.black.withOpacity(0.35),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 18),
        ),
        child: loading
            ? const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.add, size: 18, color: Colors.white),
                ],
              ),
      ),
    );
  }
}

class TaskCreationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  const TaskCreationAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.5,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
        onPressed: () => Navigator.of(context).maybePop(),
      ),
      title: Text(
        title,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AttachmentsBox extends StatelessWidget {
  final VoidCallback onTap;

  const AttachmentsBox({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFF2F2F2),
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(6),
        child: Container(
          height: 68,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: const Color(0xFFBFC9D6)),
          ),
          child: const Center(
            child: Icon(Icons.description_outlined, color: Color(0xFF6B7785)),
          ),
        ),
      ),
    );
  }
}
