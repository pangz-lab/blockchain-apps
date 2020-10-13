import 'package:flutter/material.dart';

class AppCardThin extends StatelessWidget {
  AppCardThin({this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Card(
          margin: EdgeInsets.all(40),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: this.child
          )
        )
      )
    );
  }
}