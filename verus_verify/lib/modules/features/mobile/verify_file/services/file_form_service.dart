
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verus_verisig/domain/values/verification_status.dart';
import 'package:verus_verisig/modules/features/_main/verify_file_screen/verify_file_post_input_screen.dart';
import 'package:verus_verisig/modules/features/mobile/verify_file/entities/file_input_type.dart';
import 'package:verus_verisig/modules/features/mobile/verify_file/logic/verify_file_logic.dart';
import 'package:verus_verisig/modules/features/mobile/verify_file/services/file_validator_service.dart';
import 'package:verus_verisig/modules/features/mobile/verify_file/values/file_payload.dart';

class FileFormService {
  
  static String getInput(context, key) {
    return Provider.of<VerifyFileLogic>(context, listen:false).inputs[key];
  }
  
  static void saveInput(context, String key, String input) {
    Provider.of<VerifyFileLogic>(context, listen: false).setInput(key, input);
  }

  static void setUpdateMode(context, update) {
    Provider.of<VerifyFileLogic>(context, listen: false).setUpdateInput(update);
  }

  static bool isInUpdateMode(context) {
    return Provider.of<VerifyFileLogic>(context, listen: false).updateInput;
  }

  static void submit(context) {
    Navigator.popAndPushNamed(context, VerifyFilePostInputScreen.routeName);
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
    var provider = Provider.of<VerifyFileLogic>(context, listen: false);
    var _inputs = provider.inputs;
    provider.setVerificationStatus(VerificationStatus.payloadPreparation);
    provider.verify(
      FileValidatorService(),
      FilePayload(
        file: _inputs[FileInputType.file],
        hash: _inputs[FileInputType.hash],
        id: _inputs[FileInputType.id],
        signature: _inputs[FileInputType.signature],
      )
    );
    provider.setVerificationStatus(VerificationStatus.payloadSent);
  }
}