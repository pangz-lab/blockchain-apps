import 'package:flutter/material.dart';
import 'package:verus_verify/styles/default.dart';

class InputItemSubDisplay extends StatelessWidget {

  InputItemSubDisplay({this.text, this.maxLine});

  final String text;
  final int maxLine;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: StyleDefault.boxDecoration1,
      child : Text(
        this.text,
        style: Theme.of(context).textTheme.subtitle1,
        overflow: TextOverflow.ellipsis,
        maxLines: this.maxLine,
      ),
    );
  }
}