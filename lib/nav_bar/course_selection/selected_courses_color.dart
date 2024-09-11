import 'package:flutter/material.dart';

enum SelectedCourseColor {
  primaryColor,
  secondaryColor,
  tertiaryColor,
  quaternaryColor,
  quinaryColor,
  senaryColor,
  septenaryColor,
  octonaryColor,
  nonaryColor,
  denaryColor,
}

extension SelectedCourseColorExtension on SelectedCourseColor {
  Color get selectedColor {
    switch (this) {
      case SelectedCourseColor.primaryColor:
        return const Color(0xFFBD002D);
      case SelectedCourseColor.secondaryColor:
        return const Color(0xFF3100BD);
      case SelectedCourseColor.tertiaryColor:
        return const Color(0xFF8BBD00);
      case SelectedCourseColor.quaternaryColor:
        return const Color(0xFF00BD90);
      case SelectedCourseColor.quinaryColor:
        return const Color(0xFFBD9000);
      case SelectedCourseColor.senaryColor:
        return const Color(0xFF00BD31);
      case SelectedCourseColor.septenaryColor:
        return const Color(0xFF002DBD);
      case SelectedCourseColor.octonaryColor:
        return const Color(0xFFF0B700);
      case SelectedCourseColor.nonaryColor:
        return const Color(0xFFBD008C);
      case SelectedCourseColor.denaryColor:
        return const Color(0xFF00BD31);
    }
  }
}