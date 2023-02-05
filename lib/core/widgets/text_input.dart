import 'package:find_pet/core/themes/ui/app_colors.dart';
import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  const TextInput({super.key, this.hintText});

  final String? hintText;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  final _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _inputController,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        hintText: widget.hintText ?? '',
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: AppColors.colorNeutral_600,
          width: 2,
        )),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.colorDarkBlue_800,
          ),
        ),
      ),
    );
  }
}
