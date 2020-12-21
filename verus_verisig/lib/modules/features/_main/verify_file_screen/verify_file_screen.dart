import 'package:flutter/material.dart';
import 'package:verus_verisig/modules/components/default_button_primary.dart';
import 'package:verus_verisig/modules/features/mobile/verify_file/forms/file_form.dart';
import 'package:verus_verisig/modules/features/mobile/verify_file/services/file_form_service.dart';

class VerifyFileScreen extends StatelessWidget {
  VerifyFileScreen({Key key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  static const routeName = "/input/file";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Verify File')),
      ),
      body: Center(
        child: FileForm(_formKey),
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
    FileFormService.submit(context);
    FileFormService.verify(context);
    FileFormService.setUpdateMode(context, false);
  }
  
  void _showInputIncompleteMessage(context) {
    FileFormService.showMessageSnackBar(
      context,
      'Please complete the form input'
    );
  }
}