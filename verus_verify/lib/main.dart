import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:verus_verify/modules/features/_main/home_screen/home_screen.dart';
import 'package:verus_verify/modules/features/_main/verify_file_screen/verify_file_post_input_screen.dart';
import 'package:verus_verify/modules/features/_main/verify_file_screen/verify_file_screen.dart';
import 'package:verus_verify/modules/features/_main/verify_hash_screen/verify_hash_post_input_screen.dart';
import 'package:verus_verify/modules/features/_main/verify_hash_screen/verify_hash_screen.dart';
import 'package:verus_verify/modules/features/_main/verify_text_message_screen/verify_text_message_post_input_screen.dart';
import 'package:verus_verify/modules/features/_main/verify_text_message_screen/verify_text_message_screen.dart';
import 'package:verus_verify/modules/features/mobile/verify_file/logic/verify_file_logic.dart';
import 'package:verus_verify/modules/features/mobile/verify_hash/logic/verify_hash_logic.dart';
import 'package:verus_verify/modules/features/mobile/verify_text_message/logic/verify_text_message_logic.dart';
import 'package:verus_verify/themes/default.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

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
      title: 'Verus Verify',
      theme: ThemeDefault.apply,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verus Verify'),
        actions: [
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {
              return SimpleDialog(
                title: const Text('Select assignment'),
                children: <Widget>[
                  SimpleDialogOption(
                    // onPressed: () { Navigator.pop(context, Department.treasury); },
                    child: const Text('Treasury department'),
                  ),
                  SimpleDialogOption(
                    // onPressed: () { Navigator.pop(context, Department.state); },
                    child: const Text('State department'),
                  ),
                ],
              );
            },
          )
        ],
      ),
      body: Center(
        child: HomeScreen()
      ),
    );
  }
}
