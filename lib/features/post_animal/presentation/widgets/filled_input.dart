import 'package:find_pet/core/themes/ui/app_colors.dart';
import 'package:flutter/material.dart';

class FilledInput extends StatelessWidget {
  const FilledInput({
    Key? key,
    required this.controller,
    required this.hint,
    this.validator,
    this.maxLines,
    this.onEditingComplete,
  }) : super(key: key);

  final TextEditingController controller;
  final String hint;
  final String? Function(String?)? validator;
  final int? maxLines;
  final Function()? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onEditingComplete: onEditingComplete,
      maxLines: maxLines,
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      validator: validator,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 13.5, horizontal: 18),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.colorBlueInfo_500,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              14,
            ),
          ),
        ),
        hintText: hint,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(14),
          ),
        ),
      ),
    );
  }
}
