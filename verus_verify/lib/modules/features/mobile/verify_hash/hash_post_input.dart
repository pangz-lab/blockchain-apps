import 'package:flutter/material.dart';
import 'package:verus_verify/modules/components/input_item_sub_display.dart';
import 'package:verus_verify/modules/components/input_item_sub_header.dart';
import 'package:verus_verify/modules/features/mobile/verify_hash/entities/hash_input_type.dart';
import 'package:verus_verify/modules/features/mobile/verify_hash/hash_verification_result.dart';
import 'package:verus_verify/modules/features/mobile/verify_hash/services/hash_form_service.dart';
import 'package:verus_verify/styles/default.dart';

class HashPostInput extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        Flexible(flex: 3, child: HashVerificationResult()),
        Divider(),
        Expanded(flex: 1, child: InputItemSubHeader(title: "Hash")),
        Expanded(flex: 3, child: InputItemSubDisplay(text: _getInput(context, HashInputType.hash), maxLine: 4)),
        Expanded(flex: 1, child: InputItemSubHeader(title: "VerusID/i-address")),
        Expanded(flex: 3, child: InputItemSubDisplay(text: _getInput(context, HashInputType.id), maxLine: 4)),
        Expanded(flex: 1, child: InputItemSubHeader(title: "Signature")),
        Expanded(flex: 3, child: InputItemSubDisplay(text: _getInput(context, HashInputType.signature), maxLine: 4)),
      ],
    );
  }
  
  String _getInput(context, key) {
    return HashFormService.getInput(context, key);
  }
}
  
