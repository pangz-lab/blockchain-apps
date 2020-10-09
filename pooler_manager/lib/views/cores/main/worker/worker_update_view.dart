import 'package:flutter/material.dart';

class WorkerUpdateView extends StatelessWidget {
  WorkerUpdateView({Key key}) : super(key: key);
  static const routeName = '/worker/edit';
  @override
  Widget build(BuildContext context) {
    final WorkerUpdateScreenArguments args =
      ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Worker Update'),
      ),
      body: args.body,
    );
  }
}

class WorkerUpdateScreenArguments {
  final Widget body;
  WorkerUpdateScreenArguments({this.body});
}
