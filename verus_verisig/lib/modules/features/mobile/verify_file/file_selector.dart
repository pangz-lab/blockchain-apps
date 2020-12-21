import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FileSelector extends StatefulWidget {
  @override
  _FileSelectorState createState() => _FileSelectorState();
}

class _FileSelectorState extends State<FileSelector> {
  Widget _textContent;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.maxFinite,
      height: double.maxFinite,
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: SizedBox.expand(
        child: ElevatedButton(
          child: _textContent,
          onPressed: () async {
            FilePickerResult result = await FilePicker.platform.pickFiles();
            if(result != null) {
              Hash hasher = sha256;
              String fileName = result.files.single.path;
              File input = File(fileName);
              var value = await hasher.bind(input.openRead()).first;
              _textContent = Text(fileName + '\n' + value.toString());
              print(value);
            } else {
              print("Cancelled!");
            }
          },
        ),
      )
    );
  }
}