import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputWidget extends StatelessWidget {
  final String labelText;
  final Function(String) onChanged;
  final TextEditingController? controller;

  const InputWidget({
    super.key,
    required this.labelText,
    required this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      maxLines: 1,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelStyle: const TextStyle(
          color: Colors.blue,
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}
