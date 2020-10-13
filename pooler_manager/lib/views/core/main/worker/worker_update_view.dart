import 'package:flutter/material.dart';
import 'package:pooler_manager/interfaces/routes/screen_arguments_interface.dart';

class WorkerUpdateView extends StatelessWidget {
  WorkerUpdateView({Key key}) : super(key: key);
  static const routeName = '/worker/edit';
  @override
  Widget build(BuildContext context) {
    final ScreenArgumentsInterface args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Worker Update'),
      ),
      body: args.body,
    );
  }
}
