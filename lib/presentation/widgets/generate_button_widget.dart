import 'package:flutter/material.dart';
import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';


class GenerateButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final double? elevation;

  const GenerateButtonWidget({
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.elevation = 4.0, // Default elevation for Android
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
       style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
          elevation: elevation,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),

        child: Text(
          text,
          style: const TextStyle(color: Colors.white),

        ),);
  }
}
