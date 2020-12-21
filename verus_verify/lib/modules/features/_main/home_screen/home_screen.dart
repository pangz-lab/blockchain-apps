// import 'dart:convert';
// import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:verus_verisig/modules/components/default_button_primary.dart';
import 'package:verus_verisig/modules/features/_main/verify_file_screen/verify_file_screen.dart';
import 'package:verus_verisig/modules/features/_main/verify_hash_screen/verify_hash_screen.dart';
import 'package:verus_verisig/modules/features/_main/verify_text_message_screen/verify_text_message_screen.dart';

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
          Expanded(
            flex: 1,
            child: DefaultButtonPrimary(
              key: Key("menuMessageText"),
              title: "Message/Text",
              icon: FontAwesomeIcons.spellCheck,
              onPressed : () {
                Navigator.pushNamed(context, VerifyTextMessageScreen.routeName);
              }
            ),
          ),
          Expanded(
            flex: 1,
            child: DefaultButtonPrimary(
              key: Key("menuFile"),
              title: "File",
              icon: FontAwesomeIcons.fileAlt,
              onPressed : () {
                Navigator.pushNamed(context, VerifyFileScreen.routeName);
              }
            ),
          ),
          Expanded(
            flex: 1,
            child: DefaultButtonPrimary(
              key: Key("menuHash"),
              title: "Hash",
              icon: FontAwesomeIcons.hashtag,
              onPressed : () {
                Navigator.pushNamed(context, VerifyHashScreen.routeName);
              }
            ),
          ),
        ],
      )
      
    );
  }
}