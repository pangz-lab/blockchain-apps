import 'package:flutter/material.dart';
import 'package:verus_verify/modules/components/default_appbar_primary.dart';
import 'package:verus_verify/modules/components/default_button_primary.dart';
import 'package:verus_verify/modules/features/mobile/verify_file/forms/file_form.dart';
import 'package:verus_verify/modules/features/mobile/verify_file/services/file_form_service.dart';
import 'package:verus_verify/modules/features/mobile/verify_file/entities/file_input_type.dart';

class VerifyFileScreen extends StatelessWidget {
  VerifyFileScreen({Key key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  static const routeName = "/input/file";

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
              if (_formKey.currentState.validate() && _fileIsSelected(context)) {
                this._submit(context);
              } else {
                this._showInputIncompleteMessage(context);
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

  bool _fileIsSelected(context) {
    return (FileFormService.getInput(context, FileInputType.file) != null);
  }
}