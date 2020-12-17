import 'package:flutter/material.dart';
import 'package:verus_verisig/modules/components/default_button_primary.dart';
import 'package:verus_verisig/modules/features/mobile/verify_text_message/forms/message_text_form.dart';
import 'package:verus_verisig/modules/features/mobile/verify_text_message/services/message_form_service.dart';

class VerifyTextMessageScreen extends StatelessWidget {
  VerifyTextMessageScreen({Key key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  static const routeName = "/input/textMessage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Verify Message/Text')),
      ),
      body: Center(
        child: MessageTextForm(_formKey),
      ), 
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: DefaultButtonPrimary(
            title: 'Submit',
            icon: Icons.send,
            onPressed: () {
              if (!_formKey.currentState.validate()) {
                this._showInputIncompleteMessage(context);
              } else {
                this._submit(context);
              }
            },
          ),
        ),
      ),
    );
  }

  void _submit(context) {
    MessageFormService.submit(context);
    MessageFormService.verify(context);
    MessageFormService.setUpdateMode(context, false);
  }
  
  void _showInputIncompleteMessage(context) {
    MessageFormService.showMessageSnackBar(
      context,
      'Please complete the form input'
    );
  }
}