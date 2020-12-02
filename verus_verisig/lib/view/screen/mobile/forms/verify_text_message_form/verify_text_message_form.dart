import 'package:flutter/material.dart';
import 'package:verus_verisig/view/components/default_button_primary.dart';
import 'package:verus_verisig/view/components/default_text_input_field.dart';

class VerifyTextMessageForm extends StatefulWidget {
  @override
  _VerifyTextMessageFormState createState() => _VerifyTextMessageFormState();
}

class _VerifyTextMessageFormState extends State<VerifyTextMessageForm> {
  final _messageTextCtrl = TextEditingController();
  final _verusIdCtrl = TextEditingController();
  final _signatureCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  FocusNode nodeVerusId = FocusNode();
  FocusNode nodeSignature = FocusNode();
  FocusNode nodeSubmitButton = FocusNode();

  @override
  void dispose() {
    _messageTextCtrl.dispose();
    _verusIdCtrl.dispose();
    _signatureCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            DefaultTextInputField(
              title: "Message Text",
              controller: this._messageTextCtrl,
              maxLines: 15,
              minLines: 5,
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(nodeVerusId);
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Message or text is required';
                }
                return null;
              },
            ),
            DefaultTextInputField(
              focusNode: nodeVerusId,
              title: "VerusId/i-Address",
              controller: this._verusIdCtrl,
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(nodeSignature);
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'VerusID or i-address is required.';
                }
                return null;
              },
            ),
            DefaultTextInputField(
              focusNode: nodeSignature,
              title: "Signature",
              controller: this._signatureCtrl,
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(nodeSubmitButton);
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Verus Signature is required.';
                }
                return null;
              },
            ),
            DefaultButtonPrimary(
              title: 'Submit',
              icon: Icons.send,
              focusNode: nodeSubmitButton,
              onPressed: () {
                if (!_formKey.currentState.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Complete form input')));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
