import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  const LabelText({
    Key? key,
    required this.text,
    required this.isRequired,
  }) : super(key: key);

  final String text;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: text,
              style: const TextStyle(
                fontFamily: 'bodyfont',
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w400,
                height: 1.25,
              ),
            ),
            if (isRequired) ...[
              const TextSpan(
                text: ' *',
                style: TextStyle(
                  fontFamily: 'bodyfont',
                  fontSize: 20,
                  color: Colors.red,
                  height: 0.8,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
