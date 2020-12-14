import 'package:flutter/material.dart';

abstract class TextThemes {
  // Titles
  static TextStyle mainTitleStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1.copyWith(
          color: Colors.grey[200],
          fontSize: 30,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.5,
        );
  }

  static TextStyle subTitleStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1.copyWith(
          color: Colors.grey[400],
          fontSize: 22,
          fontWeight: FontWeight.normal,
          letterSpacing: 2.5,
        );
  }

  // Market Index Card
  static TextStyle indexCardMain(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1.copyWith(
          color: Colors.grey[200],
          fontSize: 22,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.5,
        );
  }

  static TextStyle indexCardSmall(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1.copyWith(
          color: Colors.grey[200],
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        );
  }

  static TextStyle indexCardBig(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1.copyWith(
          color: Colors.grey[200].withOpacity(0.8),
          fontSize: 26,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        );
  }

  // Data Sheet
  static TextStyle dataSheetTitleStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1.copyWith(
          color: Colors.grey[200],
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        );
  }

  static TextStyle dataSheetvaluesStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1.copyWith(
          color: Colors.grey[200],
          fontSize: 18,
          fontWeight: FontWeight.normal,
          letterSpacing: 1.2,
        );
  }

  // Button Text Styles
  static TextStyle primaryButtonStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyText1.copyWith(
          color: Colors.grey[200],
          fontSize: 20,
          fontWeight: FontWeight.normal,
          letterSpacing: 2,
        );
  }
}
