// import 'dart:convert';
// import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:verus_verify/modules/features/_main/verify_file_screen/verify_file_screen.dart';
import 'package:verus_verify/modules/features/_main/verify_hash_screen/verify_hash_screen.dart';
import 'package:verus_verify/modules/features/_main/verify_text_message_screen/verify_text_message_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          SizedBox(height: 100.0),
          Divider(),
          _menuItem(
            context,
            prefix: "🔠",
            title: "Message/Text",
            onPressed: () {
              Navigator.pushNamed(context, VerifyTextMessageScreen.routeName);
            }
          ),
          Divider(),
          _menuItem(
            context,
            prefix: "📑",
            title: "File",
            onPressed: () {
              Navigator.pushNamed(context, VerifyFileScreen.routeName);
            }
          ),
          Divider(),
          _menuItem(
            context,
            prefix: "#️⃣",
            title: "Hash",
            onPressed: () {
              Navigator.pushNamed(context, VerifyHashScreen.routeName);
            }
          ),
          Divider(),
        ],
      )
      
    );
  }

  Widget _menuItem(context, {String prefix, String title, Function onPressed}) {
    return ListTile(
      // leading: const Icon(Icons.flight_land),
      leading: Text(
        prefix,
        style: Theme.of(context).textTheme.headline3
      ),
      trailing: Icon(
        Icons.arrow_right_rounded,
        size: 50.0,
        color: Colors.black45,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline3
      ),
      onTap: () {
        onPressed();
      }
    );
    // return Row(
    //   children: [
    //     Expanded(
    //       flex: 1,
    //       child: Container(
    //         child: Center(
    //           child: Text(
    //             prefix,
    //             style: Theme.of(context).textTheme.headline3
    //           ),
    //         ),
    //       ),
    //     ),
    //     Expanded(
    //       flex: 3,
    //       child: FlatButton(
    //         onPressed : () {
    //           onPressed();
    //         },
    //         child: Text(
    //           title,
    //           style: Theme.of(context).textTheme.headline3
    //         )
    //       ),
    //     ),
    //     Expanded(
    //       flex: 1,
    //       child: Icon(
    //         Icons.arrow_right_rounded,
    //         size: 50.0,
    //         color: Colors.black45,
    //       )
    //     )
    //   ],
    // );
  }
}