import 'package:flutter/material.dart';

class FormDropDownField extends StatefulWidget {
  FormDropDownField({this.label, this.listValue, this.defaultValue});
  final String label;
  final int defaultValue;
  final List<String> listValue;

  @override
  _FormDropDownFieldState createState() => _FormDropDownFieldState();
}

class _FormDropDownFieldState extends State<FormDropDownField> {
  String _default;

  @override
  void initState() {
    _default = widget.listValue[widget.defaultValue];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: widget.label,
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(5))
        )
      ),
      value: _default,
      items: widget.listValue.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
      onChanged: (String newValue) {
        setState(() {
          _default = newValue;
        });
      },
    );
  }
}
