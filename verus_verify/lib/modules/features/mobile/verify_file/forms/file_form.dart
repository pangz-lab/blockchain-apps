
import 'package:flutter/material.dart';
import 'package:verus_verify/styles/default.dart';
import 'package:verus_verify/modules/components/default_text_input_field.dart';
import 'package:verus_verify/modules/features/mobile/verify_file/entities/file_input_type.dart';
import 'package:verus_verify/modules/features/mobile/verify_file/services/file_form_service.dart';
import 'package:verus_verify/modules/features/mobile/verify_file/file_selector.dart';

class FileForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  FileForm(this.formKey);
  @override
  _FileFormState createState() => _FileFormState();
}

class _FileFormState extends State<FileForm> {
  final _fileTextCtrl = TextEditingController();
  final _verusIdCtrl = TextEditingController();
  final _signatureCtrl = TextEditingController();
  FocusNode nodeFile = FocusNode();
  FocusNode nodeVerusId = FocusNode();
  FocusNode nodeSignature = FocusNode();
  FocusNode nodeSubmitButton = FocusNode();
  TextStyle _inputStyle = StyleDefault.inputStyle1;

  @override
  void initState() {
    _setupTextFieldsValue();
    super.initState();
  }

  @override
  void dispose() {
    _fileTextCtrl.dispose();
    _verusIdCtrl.dispose();
    _signatureCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          Flexible(
            flex: 1,
            child: FileSelector()
          ),
          Flexible(
            flex: 1,
            child: DefaultTextInputField(
              title: "VerusId/i-Address",
              focusNode: nodeVerusId,
              controller: this._verusIdCtrl,
              style: this._inputStyle,
              maxLines: 10,
              minLines: 10,
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(nodeSignature);
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'VerusID or i-address is required';
                }
                this._saveInput(context, FileInputType.id, value);
                return null;
              },
            ),
          ),
          Flexible(
            flex:1,
            child: DefaultTextInputField(
              title: "Signature",
              focusNode: nodeSignature,
              controller: this._signatureCtrl,
              style: this._inputStyle,
              maxLines: 10,
              minLines: 10,
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(nodeSubmitButton);
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Verus Signature is required';
                }
                this._saveInput(context, FileInputType.signature, value);
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }

  void _setupTextFieldsValue() {
    _verusIdCtrl.value = _verusIdCtrl.value.copyWith(
      text: _setInitialValue(context, FileInputType.id)
    );
    _signatureCtrl.value = _signatureCtrl.value.copyWith(
      text: _setInitialValue(context, FileInputType.signature)
    );
  }

  void _saveInput(context, String key, String input) {
    FileFormService.saveInput(context, key, input);
  }

  void _resetInput(context) {
    FileFormService.resetInput(context);
  }

  String _getInput(context, key) {
    return FileFormService.getInput(context, key);
  }

  bool _isInUpdateMode(context) {
    return FileFormService.isInUpdateMode(context) ?? false;
  }

  String _setInitialValue(context, String key) {
    if(_isInUpdateMode(context)) {
      return _getInput(context, key);
    } else {
      _resetInput(context);
      return "";
    }
  }
}
