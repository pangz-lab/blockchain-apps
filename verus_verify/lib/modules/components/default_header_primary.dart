import 'package:flutter/material.dart';

class DefaultHeaderPrimary extends StatelessWidget {
  DefaultHeaderPrimary({this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40),
      child: Text(this.title,
        style: Theme.of(context).textTheme.headline1
      ),
    );
  }
}