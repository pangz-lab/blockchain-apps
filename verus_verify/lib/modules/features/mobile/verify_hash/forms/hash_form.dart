import 'package:flutter/material.dart';
import 'package:verus_verisig/modules/components/default_text_input_field.dart';
import 'package:verus_verisig/modules/features/mobile/verify_hash/entities/hash_input_type.dart';
import 'package:verus_verisig/modules/features/mobile/verify_hash/services/hash_form_service.dart';
import 'package:verus_verisig/styles/default.dart';

class HashForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  HashForm(this.formKey);
  @override
  _HashFormState createState() => _HashFormState();
}

class _HashFormState extends State<HashForm> {
  final _messageTextCtrl = TextEditingController();
  final _verusIdCtrl = TextEditingController();
  final _signatureCtrl = TextEditingController();
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
    _messageTextCtrl.dispose();
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
            child: DefaultTextInputField(
              title: "Hash",
              controller: this._messageTextCtrl,
              style: this._inputStyle,
              maxLines: 10,
              minLines: 10,
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(nodeVerusId);
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Hash is required';
                }
                this._saveInput(context, HashInputType.hash, value);
                return null;
              },
            ),
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
                this._saveInput(context, HashInputType.id, value);
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
                this._saveInput(context, HashInputType.signature, value);
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }

  void _setupTextFieldsValue() {
    _messageTextCtrl.value = _messageTextCtrl.value.copyWith(
      text: _setInitialValue(context, HashInputType.hash)
    );
    _verusIdCtrl.value = _verusIdCtrl.value.copyWith(
      text: _setInitialValue(context, HashInputType.id)
    );
    _signatureCtrl.value = _signatureCtrl.value.copyWith(
      text: _setInitialValue(context, HashInputType.signature)
    );
  }

  void _saveInput(context, String key, String input) {
    HashFormService.saveInput(context, key, input);
  }

  String _getInput(context, key) {
    return HashFormService.getInput(context, key);
  }

  bool _isInUpdateMode(context) {
    return HashFormService.isInUpdateMode(context) ?? false;
  }

  String _setInitialValue(context, String key) {
    return (_isInUpdateMode(context)) ? _getInput(context, key) : "";
  }
}
