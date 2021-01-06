import 'package:flutter/material.dart';
import 'package:verus_verify/modules/components/default_appbar_primary.dart';
import 'package:verus_verify/modules/features/mobile/verify_text_message/text_message_post_input.dart';
import 'package:verus_verify/modules/features/mobile/verify_text_message/text_message_post_input_bottom_bar.dart';

class VerifyTextMessagePostInputScreen extends StatelessWidget {
  const VerifyTextMessagePostInputScreen({Key key}) : super(key: key);
  static const routeName = "/verify/textMessage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarPrimary(
        title: "Verification Result",
        onPressed: () {
          Navigator.popUntil(context, ModalRoute.withName("/"));
        },
      ),
      body: Center(
        child: TextMessagePostInput(),
      ), 
      bottomNavigationBar: TextMessagePostInputBottomAppBar(),
    );
  }
}