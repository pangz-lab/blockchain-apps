import 'package:flutter/material.dart';
import 'package:verus_verify/modules/components/default_appbar_primary.dart';
import 'package:verus_verify/modules/components/default_button_primary.dart';
import 'package:verus_verify/modules/features/mobile/verify_hash/forms/hash_form.dart';
import 'package:verus_verify/modules/features/mobile/verify_hash/services/hash_form_service.dart';

class VerifyHashScreen extends StatelessWidget {
  VerifyHashScreen({Key key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  static const routeName = "/input/hash";

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
        child: HashForm(_formKey),
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
    HashFormService.submit(context);
    HashFormService.verify(context);
    HashFormService.setUpdateMode(context, false);
  }
  
  void _showInputIncompleteMessage(context) {
    HashFormService.showMessageSnackBar(
      context,
      'Please complete the form input'
    );
  }
}