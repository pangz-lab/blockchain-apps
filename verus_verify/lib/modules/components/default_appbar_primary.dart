import 'package:flutter/material.dart';

class DefaultAppBarPrimary extends StatelessWidget with PreferredSizeWidget {
  DefaultAppBarPrimary({this.title, this.onPressed});

  final String title;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(this.title),
      leading: IconButton(
        icon: Icon(Icons.home),
        onPressed: this.onPressed
      ),
    );
  }

  Size get preferredSize => Size.fromHeight(60.0);
}