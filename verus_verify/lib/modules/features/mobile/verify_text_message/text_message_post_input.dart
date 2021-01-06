import 'package:flutter/material.dart';
import 'package:verus_verify/modules/components/input_item_sub_display.dart';
import 'package:verus_verify/modules/components/input_item_sub_header.dart';
import 'package:verus_verify/modules/features/mobile/verify_text_message/services/message_form_service.dart';
import 'package:verus_verify/modules/features/mobile/verify_text_message/entities/message_input_type.dart';
import 'package:verus_verify/modules/features/mobile/verify_text_message/text_message_verification_result.dart';
import 'package:verus_verify/styles/default.dart';

class TextMessagePostInput extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        Flexible(flex: 3, child: TextMessageVerificationResult()),
        Divider(),
        Expanded(flex: 1, child: InputItemSubHeader(title: "Message/Text")),
        Expanded(flex: 4, child: InputItemSubDisplay(text: _getInput(context, MessageInputType.message), maxLine: 7)),
        Expanded(flex: 1, child: InputItemSubHeader(title: "VerusID/i-address")),
        Expanded(flex: 2, child: InputItemSubDisplay(text: _getInput(context, MessageInputType.id), maxLine: 3)),
        Expanded(flex: 1, child: InputItemSubHeader(title: "Signature")),
        Expanded(flex: 2, child: InputItemSubDisplay(text: _getInput(context, MessageInputType.signature), maxLine: 3)),
      ],
    );
  }
  
  String _getInput(context, key) {
    return MessageFormService.getInput(context, key);
  }
}
  
