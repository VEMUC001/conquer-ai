import 'package:conquer_ai/theme/pallete.dart';
import 'package:flutter/material.dart';

class UIConstants {
  static AppBar appBar() {
    return AppBar(
      title: const Text(
        "Conquer",
        style: TextStyle(color: Pallete.whiteColor, fontSize: 22.0),
      ),
      centerTitle: true,
    );
  }

  static AppBar appBarWithSettings() {
    return AppBar(
      title: const Text(
        "Conquer",
        style: TextStyle(color: Pallete.whiteColor, fontSize: 22.0),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.settings,
            color: Pallete.greyColor,
          ),
        ),
      ],
    );
  }

  static AppBar appBarNoTitle() {
    return AppBar();
  }

  static TextStyle homeBodyTextStyle() => const TextStyle(
        color: Pallete.backgroundColor,
        fontSize: 14.0,
      );

  static TextStyle homeTitleTextStyle() => const TextStyle(
        color: Pallete.darkGreyColor,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      );
}
