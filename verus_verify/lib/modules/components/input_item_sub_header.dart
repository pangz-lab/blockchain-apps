import 'package:flutter/material.dart';

class InputItemSubHeader extends StatelessWidget {
  InputItemSubHeader({this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
      child : Text(
        this.title,
        style: Theme.of(context).textTheme.headline2,
        textAlign: TextAlign.center,
      ),
    );
  }
}