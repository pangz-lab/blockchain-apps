// import 'dart:convert';
// import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:verus_verisig/modules/components/default_button_primary.dart';
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
              // onPressed : () async {
                  
              //   final http.Response response = await HttpService.sendPost(
              //     url: 'https://verus.io/api/verusSignatureMessage',
              //     headers: <String,String> {
              //       "authority" : "verus.io",
              //       // "user-agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36 Edg/86.0.622.68",
              //       "content-type" : "application/json",
              //       "accept": "*/*",
              //       "origin" : "https://verus.io",
              //       "sec-fetch-site" : "same-origin",
              //       "sec-fetch-mode" : "cors",
              //       "sec-fetch-dest" : "empty",
              //       "referer" :" https://verus.io/verify-signatures",
              //       "accept-language" : "en-US,en;q=0.9",
              //     },
              //     body: jsonEncode(<String, String>{
              //       'Identity': 'Idnetity',
              //       'Message': 'Message',
              //       'Signature': 'Signature',
              //     })
              //   );
              //   if (response.statusCode == 200) {
              //     // If the server did return a 201 CREATED response,
              //     // then parse the JSON.
              //     print("Response received!");
              //     print(jsonDecode(response.body));
              //   } else {
              //     // If the server did not return a 201 CREATED response,
              //     // then throw an exception.
              //     throw Exception('Failed to load album');
              //   }
              // },
            ),
          ),
          Expanded(
            flex: 1,
            child: DefaultButtonPrimary(
              key: Key("menuFile"),
              title: "File",
              icon: FontAwesomeIcons.fileAlt,
              onPressed : (){},
            ),
          ),
          Expanded(
            flex: 1,
            child: DefaultButtonPrimary(
              key: Key("menuHash"),
              title: "Hash",
              icon: FontAwesomeIcons.hashtag,
              onPressed : (){},
            ),
          ),
        ],
      )
      
    );
  }
}