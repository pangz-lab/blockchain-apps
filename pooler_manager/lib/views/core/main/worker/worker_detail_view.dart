import 'package:flutter/material.dart';
import 'package:pooler_manager/interfaces/routes/screen_arguments_interface.dart';

class WorkerDetailView extends StatelessWidget {
  WorkerDetailView({Key key}) : super(key: key);
  static const routeName = '/worker/detail';
  @override
  Widget build(BuildContext context) {
    final ScreenArgumentsInterface args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Worker Detail'),
      ),
      body: args.body,
    );
  }
}