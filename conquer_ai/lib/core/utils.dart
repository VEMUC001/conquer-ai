import 'dart:math';

import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

/// Generates a positive random integer uniformly distributed on the range from [min], inclusive, to [max], exclusive.
int nextRandomInRange(int min, int max) => min + Random().nextInt(max - min);
