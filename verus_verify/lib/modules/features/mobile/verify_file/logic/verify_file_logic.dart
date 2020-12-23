import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:verus_verify/domain/values/verification_status.dart';
import 'package:verus_verify/modules/features/mobile/verify_file/services/file_validator_service.dart';
import 'package:verus_verify/modules/features/mobile/verify_file/values/file_payload.dart';

class VerifyFileLogic extends ChangeNotifier {
  final Map<String, String> _inputItem = {};
  Future _verificationResult;
  VerificationStatus _verificationStatus;
  Map _result;
  bool _updateInput;

  Map<String, String> get inputs => _inputItem;
  Future get verificationResult => _verificationResult;
  VerificationStatus get verificationStatus => _verificationStatus;
  Map get result => _result;
  bool get updateInput => _updateInput;

  void setInput(String key, String value) {
    _inputItem[key] = value;
  }

  void setInputWithNotifier(String key, String value) {
    _inputItem[key] = value;
    notifyListeners();
  }

  void setVerificationStatus(VerificationStatus status) {
    _verificationStatus = status;
  }

  void verify(FileValidatorService service, FilePayload payload) {
    _verificationResult = service.validate(payload).then(
      _handleResponse,
      onError: _handleError
    );
  }

  void setUpdateInput(bool update) {
    _updateInput = update;
  }

  void _handleResponse(response) {
    _result = jsonDecode(response.body);
    notifyListeners();
  }

  void _handleError(e) {
    notifyListeners();
  }
}