import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DefaultButtonPrimary extends StatelessWidget {
  const DefaultButtonPrimary({
    this.title,
    this.icon,
    this.focusNode,
    this.onPressed,
    this.style,
    key
  }) : super(key: key);
  
  final VoidCallback onPressed;
  final ButtonStyle style;
  final String title;
  final IconData icon;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: ElevatedButton(
        focusNode: this.focusNode,
        style: this.style ?? Theme.of(context).elevatedButtonTheme.style,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(this.title ?? ""),
            SizedBox(width: 10.0),
            FaIcon(this.icon),
          ],
        ),
        onPressed : (this.onPressed) ?? () {  },
      ),
    );
  }
}