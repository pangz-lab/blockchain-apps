import 'package:flutter/material.dart';
import 'package:pooler_manager/views/defaults/app_drawer.dart';

class AppScaffold extends StatelessWidget {
  AppScaffold(
      {this.body,
      this.appBar,
      this.floatingActionButton,
      this.floatingActionButtonLocation});
  final Widget body;
  final Widget appBar;
  final FloatingActionButton floatingActionButton;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: this.appBar,
      body: this.body,
      floatingActionButton: this.floatingActionButton,
      floatingActionButtonLocation: this.floatingActionButtonLocation,
    );
  }
}
