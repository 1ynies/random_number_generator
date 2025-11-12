import 'package:flutter/material.dart';

class GenerateButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final double? elevation;

  const GenerateButtonWidget({
    super.key, // Added key for better practice
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.elevation = 4.0, // Default elevation for Android
  });

  @override
  Widget build(BuildContext context) {
    // Determine the text/icon color based on the background color's brightness
    final Color? foregroundColor = backgroundColor != null
        ? ThemeData.estimateBrightnessForColor(backgroundColor!) == Brightness.light
            ? Colors.black
            : Colors.white
        : null; // Use default if no background color is provided

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        // Set the background color
        backgroundColor: backgroundColor,

        // Set the foreground (text/icon) color for contrast
        foregroundColor: foregroundColor,

        // Apply elevation
        elevation: elevation,

        // Add padding
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

        // Set a minimum size for the button to look consistent
        minimumSize: const Size(120, 48),

        // Optional: Define button shape
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}