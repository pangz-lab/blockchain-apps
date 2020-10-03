import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  DrawerItem({this.title, this.icon, this.onTap});
  final String title;
  final IconData icon;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(this.icon),
      title: Text(this.title),
      onTap: this.onTap,
    );
  }
}
