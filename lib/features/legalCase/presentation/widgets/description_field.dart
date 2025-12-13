
import 'package:flutter/material.dart';

class DescriptionField extends StatefulWidget {
  const DescriptionField({super.key});

  @override
  State<DescriptionField> createState() => _DescriptionFieldState();
}

class _DescriptionFieldState extends State<DescriptionField> {
  final _controller = TextEditingController();
  final int _maxLength = 200;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // Arabic
      child: Stack(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 200,
              maxHeight: 200, // force TextField height
            ),
            child: TextField(
              controller: _controller,
              maxLines: null,
              expands: true,
              textAlignVertical: TextAlignVertical.top, // <<< ADD THIS
              maxLength: _maxLength,
              buildCounter: (_, {required currentLength, maxLength, required isFocused}) =>
              const SizedBox.shrink(),
              decoration: InputDecoration(
                hintText: "النص المقترح",
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.fromLTRB(16, 22, 16, 16),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFFD0D6DC)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFFD0D6DC)),
                ),
              ),
              onChanged: (_) => setState(() {}),
            )
            ,
          ),

          // counter top-left
          Positioned(
            top: 10,
            left: 12,
            child: Text(
              '$_maxLength/${_controller.text.length}',
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
