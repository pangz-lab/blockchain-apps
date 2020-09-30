import 'package:custom_navigation_drawer/custom_navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ScreenSelector()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<NavigationModel> _items = [
    NavigationModel(
        title: "Dashboard", icon: Icons.insert_chart, route: SecondRoute('1')),
    NavigationModel(
        title: "Process", icon: Icons.loop, route: SecondRoute('2')),
    NavigationModel(
        title: "Setting", icon: Icons.settings, route: SecondRoute('3')),
    NavigationModel(
        title: "Connection",
        icon: Icons.queue_play_next,
        route: SecondRoute('4')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: drawerBackgroundColor,
          title: Text(
            "Collapsing Navigation Drawer/Sidebar",
          ),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              color: selectedColor,
              child: ScreenContainer(),
            ),
            CollapsingNavigationDrawer(
              navigationItems: _items,
              selector: context.watch<ScreenSelector>(),
            )
          ],
        ));
  }
}

class SecondRoute extends StatelessWidget {
  SecondRoute(this.pNum);
  final String pNum;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route " + pNum),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            context.read<ScreenSelector>().setScreen(FirstdRoute('Test'));
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

class FirstdRoute extends StatelessWidget {
  FirstdRoute(this.pNum);
  final String pNum;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Route " + pNum),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // // Navigate back to first route when tapped.
            // Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

class ScreenContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(90, 10, 15, 0),
        child: Center(child: context.watch<ScreenSelector>().selectedScreen));
  }
}

class ScreenSelector with ChangeNotifier {
  Widget _selectedScreen;
  Widget get selectedScreen => _selectedScreen;

  void setScreen(Widget screen) {
    _selectedScreen = screen;
    notifyListeners();
  }
}
