import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'views/core/main/dashboard/dashboard_view.dart';
import 'views/core/main/home/home_view.dart';
import 'views/core/main/process/process_list_view.dart';
import 'views/core/main/process/process_status_view.dart';
import 'views/core/main/worker/worker_detail_view.dart';
import 'views/core/main/worker/worker_list_view.dart';
import 'views/core/main/worker/worker_registration_view.dart';
import 'views/core/main/worker/worker_update_view.dart';

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
          route = _setScreenRoute(HomeView(), settings);
          break;
        case DashboardView.routeName :
          route = _setScreenRoute(DashboardView(), settings);
          break;
        case WorkerListView.routeName :
          route = _setScreenRoute(WorkerListView(), settings);
          break;
        case WorkerRegistrationView.routeName :
          route = _setScreenRoute(WorkerRegistrationView(), settings);
          break;
        case WorkerUpdateView.routeName :
          route = _setScreenRoute(WorkerUpdateView(), settings);
          break;
        case WorkerDetailView.routeName :
          route = _setScreenRoute(WorkerDetailView(), settings);
          break;
        case ProcessStatusView.routeName :
          route = _setScreenRoute(ProcessStatusView(), settings);
          break;
        case ProcessListView.routeName :
          route = _setScreenRoute(ProcessListView(), settings);
          break;
      }
      return route;
    });
  }

  _setScreenRoute(Widget screen,RouteSettings settings) {
    return CupertinoPageRoute(builder: (_) => screen, settings: settings);
  }

  _setScreenSize() async {
    var size = await DesktopWindow.getWindowSize();
    Size defaultWindowSize = Size(920, 760);
    await DesktopWindow.setMaxWindowSize(Size(size.width, size.height));
    await DesktopWindow.setMinWindowSize(defaultWindowSize);
    await DesktopWindow.setWindowSize(defaultWindowSize);
  }
}
