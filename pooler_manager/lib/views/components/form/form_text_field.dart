import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  FormTextField({this.label, this.keyboardType});
  final TextInputType keyboardType;
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(5))
        )
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}
