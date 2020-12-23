import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:verus_verify/modules/features/mobile/verify_file/entities/file_input_type.dart';
import 'package:verus_verify/modules/features/mobile/verify_file/services/file_form_service.dart';

class FileSelector extends StatefulWidget {
  @override
  _FileSelectorState createState() => _FileSelectorState();
}

class _FileSelectorState extends State<FileSelector> {
  String _textContent = "Select a file";

  @override
  void initState() {
    _setInitialValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.maxFinite,
      height: double.maxFinite,
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: SizedBox.expand(
        child: ElevatedButton(
          child: Text(_textContent),
          onPressed: () {_pressed(context);},
        ),
      )
    );
  }

  _pressed(context) async {
    FilePickerResult result = await FilePicker.platform.pickFiles();

    if(result != null) {
      Hash hasher = sha256;
      String filePath = result.files.single.path;
      String fileName = result.files.single.name;

      File input = File(filePath);
      var value = await hasher.bind(input.openRead()).first;
      var _hash = value.toString();

      _saveDetail(context, fileName, _hash);
      print("Hash value");
      print(value);

      setState(() {
        _textContent = fileName + '\n' + _hash;
      });
      
    } else {
      print("Cancelled!");
    }
  }

  void _setInitialValue() {
    _textContent = (FileFormService.isInUpdateMode(context) ?? false) ? 
      _prepareButtonText(context) : "Select a file";
  }

  void _saveDetail(context, filename, hash) {
    FileFormService.saveDetail(context, fileName: filename, hash: hash);
  }

  String _prepareButtonText(context) {
    return FileFormService.getInput(
      context,
      FileInputType.file) + '\n' + FileFormService.getInput(
        context,
        FileInputType.hash
      );
  }
}