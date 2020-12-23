// import 'dart:convert';
// import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:verus_verify/modules/components/default_button_primary.dart';
import 'package:verus_verify/modules/features/_main/verify_file_screen/verify_file_screen.dart';
import 'package:verus_verify/modules/features/_main/verify_hash_screen/verify_hash_screen.dart';
import 'package:verus_verify/modules/features/_main/verify_text_message_screen/verify_text_message_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      // width: 400.0,
      // height: 80.0,
      // padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Column(
        children: [
          // Expanded(
          //   child: 
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  child: Text("🥐",
                    style: Theme.of(context).textTheme.headline1
                  ),
                ),
                FlatButton(
                  onPressed : () {
                    Navigator.pushNamed(context, VerifyTextMessageScreen.routeName);
                  },
                  child: Text(
                    " Message/Text",
                    style: Theme.of(context).textTheme.bodyText2
                  )
                )
              ],
            ),
          // ),
          DefaultButtonPrimary(
            key: Key("menuMessageText"),
            title: "Message/Text 🥐",
            icon: FontAwesomeIcons.spellCheck,
            onPressed : () {
              Navigator.pushNamed(context, VerifyTextMessageScreen.routeName);
            }
          ),
          DefaultButtonPrimary(
            key: Key("menuFile"),
            title: "📑 File",
            icon: FontAwesomeIcons.fileAlt,
            onPressed : () {
              Navigator.pushNamed(context, VerifyFileScreen.routeName);
            }
          ),
          DefaultButtonPrimary(
            key: Key("menuHash"),
            title: "Hash",
            icon: FontAwesomeIcons.hashtag,
            onPressed : () {
              Navigator.pushNamed(context, VerifyHashScreen.routeName);
            }
          ),
        ],
      )
      
    );
  }
}