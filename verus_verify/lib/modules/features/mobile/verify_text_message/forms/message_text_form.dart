import 'package:flutter/material.dart';
import 'package:verus_verify/modules/components/default_text_input_field.dart';
import 'package:verus_verify/modules/features/mobile/verify_text_message/services/message_form_service.dart';
import 'package:verus_verify/modules/features/mobile/verify_text_message/entities/message_input_type.dart';
import 'package:verus_verify/styles/default.dart';

class MessageTextForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  MessageTextForm(this.formKey);
  @override
  _MessageTextFormState createState() => _MessageTextFormState();
}

class _MessageTextFormState extends State<MessageTextForm> {
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
            flex: 2,
            child: DefaultTextInputField(
              title: "Message Text",
              controller: this._messageTextCtrl,
              style: this._inputStyle,
              maxLines: 15,
              minLines: 15,
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(nodeVerusId);
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Message or text is required';
                }
                this._saveInput(context, MessageInputType.message, value);
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
              maxLines: 5,
              minLines: 5,
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(nodeSignature);
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'VerusID or i-address is required';
                }
                this._saveInput(context, MessageInputType.id, value);
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
              maxLines: 5,
              minLines: 5,
              onEditingComplete: () {
                FocusScope.of(context).requestFocus(nodeSubmitButton);
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Verus Signature is required';
                }
                this._saveInput(context, MessageInputType.signature, value);
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
      text: _setInitialValue(context, MessageInputType.message)
    );
    _verusIdCtrl.value = _verusIdCtrl.value.copyWith(
      text: _setInitialValue(context, MessageInputType.id)
    );
    _signatureCtrl.value = _signatureCtrl.value.copyWith(
      text: _setInitialValue(context, MessageInputType.signature)
    );
  }

  void _saveInput(context, String key, String input) {
    MessageFormService.saveInput(context, key, input);
  }

  String _getInput(context, key) {
    return MessageFormService.getInput(context, key);
  }

  bool _isInUpdateMode(context) {
    return MessageFormService.isInUpdateMode(context) ?? false;
  }

  String _setInitialValue(context, String key) {
    return (_isInUpdateMode(context)) ? _getInput(context, key) : "";
  }
}
