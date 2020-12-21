import 'package:flutter/material.dart';
import 'package:verus_verisig/styles/default.dart';
import 'package:verus_verisig/modules/features/mobile/verify_file/entities/file_input_type.dart';
import 'package:verus_verisig/modules/features/mobile/verify_file/file_verification_result.dart';
import 'package:verus_verisig/modules/features/mobile/verify_file/services/file_form_service.dart';

class FilePostInput extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        Flexible(flex: 3, child: FileVerificationResult()),
        Divider(),
        Expanded(flex: 1, child: _lineItemTitle(context, "File")),
        Expanded(flex: 3, child: _lineItem(context, _getInput(context, FileInputType.file), 4)),
        Expanded(flex: 1, child: _lineItemTitle(context, "VerusID/i-address")),
        Expanded(flex: 3, child: _lineItem(context, _getInput(context, FileInputType.id), 4)),
        Expanded(flex: 1, child: _lineItemTitle(context, "Signature")),
        Expanded(flex: 3, child: _lineItem(context, _getInput(context, FileInputType.signature), 4)),
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
    return FileFormService.getInput(context, key);
  }
}
  
