import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verus_verify/modules/components/default_button_primary.dart';
import 'package:verus_verify/modules/features/_main/verify_hash_screen/verify_hash_screen.dart';
import 'package:verus_verify/modules/features/mobile/verify_hash/logic/verify_hash_logic.dart';
import 'package:verus_verify/modules/features/mobile/verify_hash/services/hash_form_service.dart';

class HashPostInputBottomAppBar extends StatefulWidget {
  @override
  _HashPostInputBottomAppBarState createState() => _HashPostInputBottomAppBarState();
}

class _HashPostInputBottomAppBarState extends State<HashPostInputBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<VerifyHashLogic>(
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
              title: 'Update Input Data',
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
    HashFormService.setUpdateMode(context, update);
  }

  void _editScreen(context) {
    Navigator.popAndPushNamed(
      context,
      VerifyHashScreen.routeName
    );
  }

  void _showProcessOngoingMessage(context) {
    HashFormService.showMessageSnackBar(
      context,
      'Verification is ongoing. Please wait...'
    );
  }
}