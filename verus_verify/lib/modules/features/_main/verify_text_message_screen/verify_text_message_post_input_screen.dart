import 'package:flutter/material.dart';
import 'package:verus_verisig/modules/features/mobile/verify_text_message/text_message_post_input.dart';
import 'package:verus_verisig/modules/features/mobile/verify_text_message/text_message_post_input_bottom_bar.dart';

class VerifyTextMessagePostInputScreen extends StatelessWidget {
  const VerifyTextMessagePostInputScreen({Key key}) : super(key: key);
  static const routeName = "/verify/textMessage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: const Text('Verify Message/Text')),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {_navigateHome(context); }
        ),
      ),
      body: Center(
        child: TextMessagePostInput(),
      ), 
      bottomNavigationBar: TextMessagePostInputBottomAppBar(),
    );
  }

  void _navigateHome(context) {
    Navigator.pop(context);
  }
}