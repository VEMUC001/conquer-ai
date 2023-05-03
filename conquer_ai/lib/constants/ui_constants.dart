import 'package:conquer_ai/theme/pallete.dart';
import 'package:flutter/material.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      title: const Text(
        "Conquer",
        style: TextStyle(color: Pallete.whiteColor, fontSize: 30.0),
      ),
      centerTitle: true,
    );
  }
}
