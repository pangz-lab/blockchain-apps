import 'package:flutter/material.dart';

class AppCardStandard extends StatelessWidget {
  AppCardStandard({this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(100, 40, 100, 40),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 50, 30, 50),
        child: this.child
      )
    );
  }
}