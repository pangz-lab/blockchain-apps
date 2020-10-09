import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'views/cores/main/dashboard/dashboard_view.dart';
import 'views/cores/main/home/home_view.dart';
import 'views/cores/main/worker/worker_list_view.dart';
import 'views/cores/main/worker/worker_registration_view.dart';
import 'views/cores/main/worker/worker_status.dart';
import 'views/cores/main/worker/worker_update_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appTitle = 'Drawer Demo';

  @override
  void initState() {
    super.initState();
    _setScreenSize();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: appTitle, initialRoute: '/', 
    // return CupertinoApp(title: appTitle, initialRoute: '/', 
    // routes: {
    //   HomeView.routeName: (context) => DashboardView(),
    //   DashboardView.routeName: (context) => DashboardView(),
    //   WorkerListView.routeName: (context) => WorkerListView(),
    //   WorkerRegistrationView.routeName: (context) => WorkerRegistrationView(),
    //   WorkerStatus.routeName: (context) => WorkerStatus(),
    // },
    
    
    onGenerateRoute: (RouteSettings settings) {
      CupertinoPageRoute route;
      switch (settings.name) {
        case HomeView.routeName:
          route = CupertinoPageRoute(builder: (_) => HomeView(), settings: settings);
          break;
        case DashboardView.routeName :
          route = CupertinoPageRoute(builder: (_) => DashboardView(), settings: settings);
          break;
        case WorkerListView.routeName :
          route = CupertinoPageRoute(builder: (_) => WorkerListView(), settings: settings);
          break;
        case WorkerRegistrationView.routeName :
          route = CupertinoPageRoute(builder: (_) => WorkerRegistrationView(), settings: settings);
          break;
        case WorkerUpdateView.routeName :
          route = CupertinoPageRoute(builder: (_) => WorkerUpdateView(), settings: settings);
          break;
        case WorkerStatus.routeName :
          route = CupertinoPageRoute(builder: (_) => WorkerStatus(), settings: settings);
          break;
      }
      return route;
    });
  }

  _setScreenSize() async {
    var size = await DesktopWindow.getWindowSize();
    Size defaultWindowSize = Size(920, 760);
    await DesktopWindow.setMaxWindowSize(Size(size.width, size.height));
    await DesktopWindow.setMinWindowSize(defaultWindowSize);
    await DesktopWindow.setWindowSize(defaultWindowSize);
  }
}
