import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verus_verify/modules/components/default_button_primary.dart';
import 'package:verus_verify/modules/features/_main/verify_file_screen/verify_file_screen.dart';
import 'package:verus_verify/modules/features/mobile/verify_file/logic/verify_file_logic.dart';
import 'package:verus_verify/modules/features/mobile/verify_file/services/file_form_service.dart';

class FilePostInputBottomAppBar extends StatefulWidget {
  @override
  _FilePostInputBottomAppBarState createState() => _FilePostInputBottomAppBarState();
}

class _FilePostInputBottomAppBarState extends State<FilePostInputBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<VerifyFileLogic>(
      builder: (context, _obj, child) {
        return FutureBuilder(
          future: _obj.verificationResult,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            bool _enableButton = false;
            
            if(snapshot.connectionState == ConnectionState.done) {
              _enableButton = true;
            }
            return _bottomBar(_enableButton);
          }
        );
      }
    );
  }

  Widget _bottomBar(enableButton) {
    return BottomAppBar(
      elevation: 0.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buttonWrapper(
            DefaultButtonPrimary(
              title: 'Update Input',
              icon: Icons.edit,
              onPressed: (enableButton) ? () {
                _setUpdateInput(context, true);
                _editScreen(context);
              } : () { _showProcessOngoingMessage(context); },
            ),
            const EdgeInsets.fromLTRB(16, 16, 16, 2)
          ),
          _buttonWrapper(
            DefaultButtonPrimary(
              title: 'Verify Another Signature',
              icon: Icons.replay_circle_filled,
              onPressed: (enableButton) ? () {
                _editScreen(context);
              } : () { _showProcessOngoingMessage(context); },
            ),
            const EdgeInsets.fromLTRB(16, 2, 16, 16)
          )
        ],
      ),
    );
  }

  Widget _buttonWrapper(
    DefaultButtonPrimary button,
    EdgeInsets padding
  ) {
    return Row(
      children: [
        Expanded(
          child: 
          Padding(
            padding: padding,
            child: button,
          ),
        ),
      ]
    );
  }

  void _setUpdateInput(context, bool update) {
    FileFormService.setUpdateMode(context, update);
  }

  void _editScreen(context) {
    Navigator.popAndPushNamed(
      context,
      VerifyFileScreen.routeName
    );
  }

  void _showProcessOngoingMessage(context) {
    FileFormService.showMessageSnackBar(
      context,
      'Verification is ongoing. Please wait...'
    );
  }
}