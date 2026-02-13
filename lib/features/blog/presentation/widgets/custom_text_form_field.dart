import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.onChanged,
    required this.onSaved,
    required this.hintText,
  });
  final void Function(String?)? onChanged, onSaved;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: hintText),
      onChanged: onChanged,
      onSaved: onSaved,
      maxLines: null,
      validator: (value) => value!.isEmpty ? 'Field is required' : null,
    );
  }
}
