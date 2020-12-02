import 'package:flutter/material.dart';

class DefaultTextInputField extends StatelessWidget {
  DefaultTextInputField({
    this.title,
    this.expands = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.validator,
    this.prefixIcon,
    this.focusNode,
    this.onSaved,
    this.onEditingComplete,
    this.controller,
    this.keyboardType = TextInputType.text
  }) : assert(controller != null);

  final String title;
  final bool expands;
  final int maxLines;
  final int minLines;
  final Function validator;
  final Widget prefixIcon;
  final FocusNode focusNode;
  final Function onSaved;
  final Function onEditingComplete;
  final TextInputType keyboardType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 400.0,
      height: 150.0,
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: TextFormField(
        autofocus: true,
        expands: this.expands,
        focusNode: this.focusNode,
        keyboardType: this.keyboardType,
        validator: this.validator,
        onSaved: this.onSaved,
        controller: this.controller,
        onEditingComplete: this.onEditingComplete,
        maxLines: (this.expands)? null : this.maxLines,
        minLines: (this.expands)? null : this.minLines,
        style: TextStyle( 
          fontSize: 30.0,
        ),
        decoration: InputDecoration(
          labelText: this.title,
          prefixIcon: this.prefixIcon,
          suffixIcon: IconButton(
            onPressed: () => this.controller.clear(),
            icon: Icon(Icons.clear_rounded),
          ),
          contentPadding: EdgeInsets.fromLTRB(15, 15, 15, 15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))
          ),
          counterText: '0 characters',
        ),
      )
    );
  }
}