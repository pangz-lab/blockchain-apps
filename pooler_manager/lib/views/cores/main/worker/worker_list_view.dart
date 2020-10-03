import 'package:flutter/material.dart';
import 'package:pooler_manager/views/app/app_scaffold.dart';
import 'package:pooler_manager/views/components/worker_list_tile_item.dart';
import 'package:pooler_manager/views/cores/forms/worker/new_worker_registration_form.dart';
import 'package:pooler_manager/views/cores/main/worker/worker_registration_view.dart';

class WorkerListView extends StatelessWidget {
  WorkerListView({Key key}) : super(key: key);
  static final routeName = '/worker';
  final List<String> items = List<String>.generate(50, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text('Workers'),
        actions: [
          FittedBox(
            child: RaisedButton(
              child: Text('Add'),
              onPressed: () {
                _nextPage(context);
              },
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Card(
        margin: EdgeInsets.all(40),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ListView.builder(
            padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return WorkerListTileItem(
                title: Text('Miner Rig ${items[index]}'),
                subTitle: Text('Last run - 3 days ago'),
              );
            },
          ),
        ),
      ),
    );
  }

  _nextPage(BuildContext context) {
    Navigator.pushNamed(
      context, WorkerRegistrationView.routeName,
      arguments: WorkerRegistrationScreenArguments(
        body: NewWorkerRegistrationForm()
      )
    );
  }
}
