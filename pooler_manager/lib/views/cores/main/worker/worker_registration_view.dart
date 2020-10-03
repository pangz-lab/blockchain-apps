import 'package:flutter/material.dart';

class WorkerRegistrationView extends StatelessWidget {
  WorkerRegistrationView({Key key}) : super(key: key);
  static final routeName = '/worker/add';
  @override
  Widget build(BuildContext context) {
    final WorkerRegistrationScreenArguments args =
      ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Worker Registration'),
      ),
      // body: NewWorkerRegistrationForm(),
      body: args.body,
    );
  }
}

class WorkerRegistrationScreenArguments {
  final Widget body;
  WorkerRegistrationScreenArguments({this.body});
}
