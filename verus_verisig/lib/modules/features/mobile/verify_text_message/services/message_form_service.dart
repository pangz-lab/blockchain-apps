
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verus_verisig/domain/values/verification_status.dart';
import 'package:verus_verisig/modules/features/_main/verify_text_message_screen/verify_text_message_post_input_screen.dart';
import 'package:verus_verisig/modules/features/mobile/verify_text_message/logic/verify_text_message_logic.dart';
import 'package:verus_verisig/modules/features/mobile/verify_text_message/services/message_validator_service.dart';
import 'package:verus_verisig/modules/features/mobile/verify_text_message/entities/message_input_type.dart';
import 'package:verus_verisig/modules/features/mobile/verify_text_message/values/text_message_payload.dart';

class MessageFormService {
  
  static String getInput(context, key) {
    return Provider.of<VerifyTextMessageLogic>(context, listen:false).inputs[key];
  }
  
  static void saveInput(context, String key, String input) {
    Provider.of<VerifyTextMessageLogic>(context, listen: false).setInput(key, input);
  }

  static void setUpdateMode(context, update) {
    Provider.of<VerifyTextMessageLogic>(context, listen: false).setUpdateInput(update);
  }

  static bool isInUpdateMode(context) {
    return Provider.of<VerifyTextMessageLogic>(context, listen: false).updateInput;
  }

  static void submit(context) {
    Navigator.popAndPushNamed(context, VerifyTextMessagePostInputScreen.routeName);
  }

  static void showMessageSnackBar(context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 1),
      )
    );
  }

  static void verify(BuildContext context) {
    var provider = Provider.of<VerifyTextMessageLogic>(context, listen: false);
    var _inputs = provider.inputs;
    provider.setVerificationStatus(VerificationStatus.payloadPreparation);
    provider.verify(
      MessageValidatorService(),
      TextMessagePayload(
        message: _inputs[MessageInputType.message],
        id: _inputs[MessageInputType.id],
        signature: _inputs[MessageInputType.signature],
      )
    );
    provider.setVerificationStatus(VerificationStatus.payloadSent);
  }
}