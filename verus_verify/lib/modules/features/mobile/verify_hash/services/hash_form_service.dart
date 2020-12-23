
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verus_verify/domain/values/verification_status.dart';
import 'package:verus_verify/modules/features/_main/verify_hash_screen/verify_hash_post_input_screen.dart';
import 'package:verus_verify/modules/features/mobile/verify_hash/entities/hash_input_type.dart';
import 'package:verus_verify/modules/features/mobile/verify_hash/logic/verify_hash_logic.dart';
import 'package:verus_verify/modules/features/mobile/verify_hash/services/hash_validator_service.dart';
import 'package:verus_verify/modules/features/mobile/verify_hash/values/hash_payload.dart';

class HashFormService {
  
  static String getInput(context, key) {
    return Provider.of<VerifyHashLogic>(context, listen:false).inputs[key];
  }
  
  static void saveInput(context, String key, String input) {
    Provider.of<VerifyHashLogic>(context, listen: false).setInput(key, input);
  }

  static void setUpdateMode(context, update) {
    Provider.of<VerifyHashLogic>(context, listen: false).setUpdateInput(update);
  }

  static bool isInUpdateMode(context) {
    return Provider.of<VerifyHashLogic>(context, listen: false).updateInput;
  }

  static void submit(context) {
    Navigator.popAndPushNamed(context, VerifyHashPostInputScreen.routeName);
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
    var provider = Provider.of<VerifyHashLogic>(context, listen: false);
    var _inputs = provider.inputs;
    provider.setVerificationStatus(VerificationStatus.payloadPreparation);
    provider.verify(
      HashValidatorService(),
      HashPayload(
        hash: _inputs[HashInputType.hash],
        id: _inputs[HashInputType.id],
        signature: _inputs[HashInputType.signature],
      )
    );
    provider.setVerificationStatus(VerificationStatus.payloadSent);
  }
}