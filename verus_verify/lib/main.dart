import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verus_verisig/modules/features/_main/home_screen/home_screen.dart';
import 'package:verus_verisig/modules/features/_main/verify_file_screen/verify_file_post_input_screen.dart';
import 'package:verus_verisig/modules/features/_main/verify_file_screen/verify_file_screen.dart';
import 'package:verus_verisig/modules/features/_main/verify_hash_screen/verify_hash_post_input_screen.dart';
import 'package:verus_verisig/modules/features/_main/verify_hash_screen/verify_hash_screen.dart';
import 'package:verus_verisig/modules/features/_main/verify_text_message_screen/verify_text_message_post_input_screen.dart';
import 'package:verus_verisig/modules/features/_main/verify_text_message_screen/verify_text_message_screen.dart';
import 'package:verus_verisig/modules/features/mobile/verify_file/logic/verify_file_logic.dart';
import 'package:verus_verisig/modules/features/mobile/verify_hash/logic/verify_hash_logic.dart';
import 'package:verus_verisig/modules/features/mobile/verify_text_message/logic/verify_text_message_logic.dart';
import 'package:verus_verisig/themes/default.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider( create: (context) => VerifyTextMessageLogic()),
        ChangeNotifierProvider( create: (context) => VerifyHashLogic()),
        ChangeNotifierProvider( create: (context) => VerifyFileLogic()),
      ],
      child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeDefault.apply,
      // home: MyStatefulWidget(),
      initialRoute: '/',
      routes: {
        '/' : (context) => BaseScreen(),
        VerifyTextMessageScreen.routeName : (context) => VerifyTextMessageScreen(),
        VerifyTextMessagePostInputScreen.routeName : (context) => VerifyTextMessagePostInputScreen(),
        VerifyHashScreen.routeName : (context) => VerifyHashScreen(),
        VerifyHashPostInputScreen.routeName : (context) => VerifyHashPostInputScreen(),
        VerifyFileScreen.routeName : (context) => VerifyFileScreen(),
        VerifyFilePostInputScreen.routeName : (context) => VerifyFilePostInputScreen(),
      },
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class BaseScreen extends StatefulWidget {
  BaseScreen({Key key}) : super(key: key);

  @override
  _BaseScreentState createState() => _BaseScreentState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _BaseScreentState extends State<BaseScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verus VeriSig'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
