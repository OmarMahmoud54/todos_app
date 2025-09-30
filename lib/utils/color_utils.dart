import 'package:flutter/material.dart';

class ColorUtils {
  static const List<int> availableColors = [
    0xFF2196F3, // Blue
    0xFFF44336, // Red
    0xFF4CAF50, // Green
    0xFFFF9800, // Orange
    0xFF9C27B0, // Purple
    0xFF009688, // Teal
    0xFFE91E63, // Pink
    0xFF3F51B5, // Indigo
    0xFFFFC107, // Amber
    0xFF00BCD4, // Cyan
    0xFF795548, // Brown
    0xFF607D8B, // Blue Grey
  ];

  static List<Color> get colorList {
    return availableColors.map((colorValue) => Color(colorValue)).toList();
  }

  static Color getRandomColor() {
    final randomIndex = DateTime.now().millisecond % availableColors.length;
    return Color(availableColors[randomIndex]);
  }

  static String getColorName(int colorValue) {
    switch (colorValue) {
      case 0xFF2196F3:
        return 'Blue';
      case 0xFFF44336:
        return 'Red';
      case 0xFF4CAF50:
        return 'Green';
      case 0xFFFF9800:
        return 'Orange';
      case 0xFF9C27B0:
        return 'Purple';
      case 0xFF009688:
        return 'Teal';
      case 0xFFE91E63:
        return 'Pink';
      case 0xFF3F51B5:
        return 'Indigo';
      case 0xFFFFC107:
        return 'Amber';
      case 0xFF00BCD4:
        return 'Cyan';
      case 0xFF795548:
        return 'Brown';
      case 0xFF607D8B:
        return 'Blue Grey';
      default:
        return 'Custom';
    }
  }

  static bool isLightColor(int colorValue) {
    final color = Color(colorValue);
    final luminance = color.computeLuminance();
    return luminance > 0.5;
  }

  static Color getContrastingTextColor(int colorValue) {
    return isLightColor(colorValue) ? Colors.black : Colors.white;
  }
}
