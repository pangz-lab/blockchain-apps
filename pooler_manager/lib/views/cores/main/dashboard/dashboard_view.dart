import 'package:flutter/material.dart';
import 'package:pooler_manager/views/app/app_scaffold.dart';

class DashboardView extends StatelessWidget {
  static final routeName = '/dashboard';
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Center(child: Text('My Page!')),
    );
  }
}
