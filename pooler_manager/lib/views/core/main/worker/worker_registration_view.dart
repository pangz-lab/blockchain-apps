import 'package:flutter/material.dart';
import 'package:pooler_manager/interfaces/routes/screen_arguments_interface.dart';

class WorkerRegistrationView extends StatelessWidget {
  WorkerRegistrationView({Key key}) : super(key: key);
  static const routeName = '/worker/add';
  @override
  Widget build(BuildContext context) {
    final ScreenArgumentsInterface args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Worker Registration'),
      ),
      body: args.body,
    );
  }
}
