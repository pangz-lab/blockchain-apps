import 'package:flutter/material.dart';
import 'package:verus_verify/modules/components/default_appbar_primary.dart';
import 'package:verus_verify/modules/components/default_button_primary.dart';
import 'package:verus_verify/modules/features/mobile/verify_text_message/forms/message_text_form.dart';
import 'package:verus_verify/modules/features/mobile/verify_text_message/services/message_form_service.dart';

class VerifyTextMessageScreen extends StatelessWidget {
  VerifyTextMessageScreen({Key key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  static const routeName = "/input/textMessage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarPrimary(
        title: "Verification Data",
        onPressed: () {
          Navigator.pop(context);
        },
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