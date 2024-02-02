import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF5C11D4);
const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.red,
  Colors.orange,
  Colors.pink,
  Colors.teal,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
            'Selected theme must be between 0 and ${_colorThemes.length}');

  ThemeData theme() {
    return ThemeData(colorSchemeSeed: _colorThemes[selectedColor]);
  }
}
