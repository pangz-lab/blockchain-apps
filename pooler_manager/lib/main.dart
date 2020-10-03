import 'package:flutter/material.dart';
import 'views/cores/main/dashboard/dashboard_view.dart';
import 'views/cores/main/worker/worker_list_view.dart';
import 'views/cores/main/worker/worker_registration_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final appTitle = 'Drawer Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: appTitle, initialRoute: '/', routes: {
      '/': (context) => WorkerListView(),
      '/dashboard': (context) => DashboardView(),
      '/worker': (context) => WorkerListView(),
      '/worker/add': (context) => WorkerRegistrationView(),
    });
  }
}
