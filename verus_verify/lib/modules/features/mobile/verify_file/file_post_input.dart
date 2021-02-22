import 'package:flutter/material.dart';
import 'package:verus_verify/modules/components/input_item_sub_display.dart';
import 'package:verus_verify/modules/components/input_item_sub_header.dart';
// import 'package:verus_verify/styles/default.dart';
import 'package:verus_verify/modules/features/mobile/verify_file/entities/file_input_type.dart';
import 'package:verus_verify/modules/features/mobile/verify_file/file_verification_result.dart';
import 'package:verus_verify/modules/features/mobile/verify_file/services/file_form_service.dart';

class FilePostInput extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        Flexible(flex: 3, child: FileVerificationResult()),
        Divider(),
        Expanded(flex: 1, child: InputItemSubHeader(title: "File")),
        Expanded(flex: 2, child: InputItemSubDisplay(text: _getInput(context, FileInputType.file), maxLine: 2)),
        Expanded(flex: 1, child: InputItemSubHeader(title: "Hash")),
        Expanded(flex: 3, child: InputItemSubDisplay(text: _getInput(context, FileInputType.hash), maxLine: 3)),
        Expanded(flex: 1, child: InputItemSubHeader(title: "VerusID/i-address")),
        Expanded(flex: 2, child: InputItemSubDisplay(text:  _getInput(context, FileInputType.id), maxLine: 2)),
        Expanded(flex: 1, child: InputItemSubHeader(title: "Signature")),
        Expanded(flex: 2, child: InputItemSubDisplay(text: _getInput(context, FileInputType.signature), maxLine: 2)),
      ],
    );
  }
  
  String _getInput(context, key) {
    return FileFormService.getInput(context, key);
  }
}
  
