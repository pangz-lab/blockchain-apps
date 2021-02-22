import 'package:flutter/material.dart';
import 'package:verus_verify/modules/components/default_appbar_primary.dart';
import 'package:verus_verify/modules/features/mobile/verify_hash/hash_post_input_bottom_bar.dart';
import 'package:verus_verify/modules/features/mobile/verify_hash/hash_post_input.dart';

class VerifyHashPostInputScreen extends StatelessWidget {
  const VerifyHashPostInputScreen({Key key}) : super(key: key);
  static const routeName = "/verify/hash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarPrimary(
        title: "Verification Result",
        onPressed: () {
          Navigator.popUntil(context, ModalRoute.withName("/"));
        },
      ),
      body: Center(
        child: HashPostInput(),
      ), 
      bottomNavigationBar: HashPostInputBottomAppBar(),
    );
  }

  // void _navigateHome(context) {
  //   Navigator.pop(context);
  // }
}