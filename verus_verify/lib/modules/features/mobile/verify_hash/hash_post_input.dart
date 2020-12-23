import 'package:flutter/material.dart';
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
        Expanded(flex: 1, child: _lineItemTitle(context, "Hash")),
        Expanded(flex: 3, child: _lineItem(context, _getInput(context, HashInputType.hash), 4)),
        Expanded(flex: 1, child: _lineItemTitle(context, "VerusID/i-address")),
        Expanded(flex: 3, child: _lineItem(context, _getInput(context, HashInputType.id), 4)),
        Expanded(flex: 1, child: _lineItemTitle(context, "Signature")),
        Expanded(flex: 3, child: _lineItem(context, _getInput(context, HashInputType.signature), 4)),
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
    return HashFormService.getInput(context, key);
  }
}
  
