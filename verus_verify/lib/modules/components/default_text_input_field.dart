import 'package:flutter/material.dart';

class DefaultTextInputField extends StatelessWidget {
  DefaultTextInputField({
    this.title,
    this.initialValue,
    this.expands = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.validator,
    this.prefixIcon,
    this.focusNode,
    this.onSaved,
    this.onEditingComplete,
    this.controller,
    this.style,
    this.keyboardType = TextInputType.text,
  }) : assert(controller != null);

  final String title;
  final String initialValue;
  final bool expands;
  final int maxLines;
  final int minLines;
  final FormFieldValidator<String> validator;
  final Widget prefixIcon;
  final FocusNode focusNode;
  final FormFieldSetter<String> onSaved;
  final VoidCallback onEditingComplete;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.maxFinite,
      height: double.maxFinite,
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: TextFormField(
        autofocus: true,
        initialValue: this.initialValue,
        expands: this.expands,
        focusNode: this.focusNode,
        keyboardType: this.keyboardType,
        validator: this.validator,
        onSaved: this.onSaved,
        controller: this.controller,
        onEditingComplete: this.onEditingComplete,
        maxLines: (this.expands)? null : this.maxLines,
        minLines: (this.expands)? null : this.minLines,
        style: this.style,
        decoration: InputDecoration(
          labelText: this.title,
          prefixIcon: this.prefixIcon,
          suffixIcon: IconButton(
            onPressed: () => this.controller?.clear(),
            icon: Icon(Icons.clear_rounded),
          ),
          contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          // counterText: _counterText(),
        ),
      )
    );
  }
}