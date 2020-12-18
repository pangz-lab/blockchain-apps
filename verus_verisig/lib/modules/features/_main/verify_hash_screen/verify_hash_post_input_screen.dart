import 'package:flutter/material.dart';
import 'package:verus_verisig/modules/features/mobile/verify_hash/hash_post_input_bottom_bar.dart';
import 'package:verus_verisig/modules/features/mobile/verify_hash/hash_post_input.dart';

class VerifyHashPostInputScreen extends StatelessWidget {
  const VerifyHashPostInputScreen({Key key}) : super(key: key);
  static const routeName = "/verify/hash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: const Text('Verify Hash')),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {_navigateHome(context); }
        ),
      ),
      body: Center(
        child: HashPostInput(),
      ), 
      bottomNavigationBar: HashPostInputBottomAppBar(),
    );
  }

  void _navigateHome(context) {
    Navigator.pop(context);
  }
}