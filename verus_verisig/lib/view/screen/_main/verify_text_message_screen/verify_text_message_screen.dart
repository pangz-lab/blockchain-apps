import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:verus_verisig/view/screen/mobile/forms/verify_text_message_form/verify_text_message_form.dart';
import 'package:verus_verisig/infrastructure/services/http_service/http_service.dart';

class VerifyTextMessageScreen extends StatelessWidget {
  const VerifyTextMessageScreen({Key key}) : super(key: key);
  static const routeName = "/verify/textMessage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Message/Text'),
      ),
      body: Center(
        child: VerifyTextMessageForm(),
      )
    );
  }

  sendRequest() async {
    final http.Response response = await HttpService.sendPost(
      url: 'https://verus.io/api/verusSignatureMessage',
      headers: <String,String> {
        "authority" : "verus.io",
        // "user-agent" : "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.193 Safari/537.36 Edg/86.0.622.68",
        "content-type" : "application/json",
        "accept": "*/*",
        "origin" : "https://verus.io",
        "sec-fetch-site" : "same-origin",
        "sec-fetch-mode" : "cors",
        "sec-fetch-dest" : "empty",
        "referer" :" https://verus.io/verify-signatures",
        "accept-language" : "en-US,en;q=0.9",
      },
      body: jsonEncode(<String, String>{
        'Identity': 'Idnetity',
        'Message': 'Message',
        'Signature': 'Signature',
      })
    );
  }
}