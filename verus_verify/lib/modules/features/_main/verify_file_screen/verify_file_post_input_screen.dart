import 'package:flutter/material.dart';
import 'package:verus_verify/modules/features/mobile/verify_file/file_post_input.dart';
import 'package:verus_verify/modules/features/mobile/verify_file/file_post_input_bottom_bar.dart';

class VerifyFilePostInputScreen extends StatelessWidget {
  const VerifyFilePostInputScreen({Key key}) : super(key: key);
  static const routeName = "/verify/file";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: const Text('Verify File')),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {_navigateHome(context); }
        ),
      ),
      body: Center(
        child: FilePostInput(),
      ), 
      bottomNavigationBar: FilePostInputBottomAppBar(),
    );
  }

  void _navigateHome(context) {
    Navigator.pop(context);
  }
}