// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:conquer_ai/theme/theme.dart';

// ignore: must_be_immutable
class GoalTextField extends StatefulWidget {
  final TextEditingController controller;
  final String titleText;
  final Icon? icon;
  bool cardColorContainer;

  GoalTextField({
    Key? key,
    required this.controller,
    required this.titleText,
    required this.icon,
    this.cardColorContainer = false,
  }) : super(key: key);

  @override
  State<GoalTextField> createState() => _GoalTextFieldState();
}

class _GoalTextFieldState extends State<GoalTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            widget.titleText,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        buildTextField(),
      ],
    );
  }

  Widget buildTextField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: widget.controller,
      style: const TextStyle(fontSize: 14, color: Pallete.whiteColor),
      decoration: InputDecoration(
        suffixIcon: widget.icon,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Pallete.blueColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Pallete.greyColor,
          ),
        ),
        contentPadding: const EdgeInsets.all(16),
      ),
    );
  }
}
