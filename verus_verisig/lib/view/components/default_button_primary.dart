import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DefaultButtonPrimary extends StatelessWidget {
  const DefaultButtonPrimary({
    this.title,
    this.icon,
    this.focusNode,
    this.onPressed,
    key
  }) : super(key: key);
  
  final Function onPressed;
  final String title;
  final IconData icon;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: ElevatedButton(
        focusNode: this.focusNode,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)
          ),
          textStyle: TextStyle(fontSize: 20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(this.title),
            SizedBox(width: 10.0),
            FaIcon(this.icon),
          ],
        ),
        onPressed: this.onPressed
      ),
    );
  }
}