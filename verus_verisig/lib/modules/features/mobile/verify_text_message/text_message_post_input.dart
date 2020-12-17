import 'package:flutter/material.dart';
import 'package:verus_verisig/modules/features/mobile/verify_text_message/services/message_form_service.dart';
import 'package:verus_verisig/modules/features/mobile/verify_text_message/entities/message_input_type.dart';
import 'package:verus_verisig/modules/features/mobile/verify_text_message/verification_result.dart';
import 'package:verus_verisig/styles/default.dart';

class TextMessagePostInput extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        Expanded(flex: 1, child: _lineItemTitle(context, "Message/Text")),
        Expanded(flex: 4, child: _lineItem(context, _getInput(context, MessageInputType.message), 7)),
        Expanded(flex: 1, child: _lineItemTitle(context, "VerusID/i-address")),
        Expanded(flex: 2, child: _lineItem(context, _getInput(context, MessageInputType.id), 3)),
        Expanded(flex: 1, child: _lineItemTitle(context, "Signature")),
        Expanded(flex: 2, child: _lineItem(context, _getInput(context, MessageInputType.signature), 3)),
        Flexible(flex: 3, child: VerificationResult()),
      ],
    );
  }

  Widget _lineItemTitle(context, String title) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 10, 30, 0),
      child : Text(
        title,
        style: Theme.of(context).textTheme.headline2,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _lineItem(context, String input, int maxLines) {
      return Container(
        width: double.maxFinite,
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
        decoration: StyleDefault.boxDecoration1,
        child : Text(
          input,
          style: Theme.of(context).textTheme.bodyText2,
          overflow: TextOverflow.ellipsis,
          maxLines: maxLines,
        ),
      );
    }
  
  String _getInput(context, key) {
    return MessageFormService.getInput(context, key);
  }
}
  
