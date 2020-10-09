import 'package:flutter/material.dart';
import 'package:pooler_manager/interfaces/routes/screen_arguments_interface.dart';
import 'package:pooler_manager/interfaces/views/vurd_action_interface.dart';
import 'package:pooler_manager/views/app/app_scaffold.dart';
import 'package:pooler_manager/views/components/worker_list_tile_item.dart';
import 'package:pooler_manager/views/cores/forms/hellminer_worker/hellminer_worker_update_form.dart';
import 'package:pooler_manager/views/cores/forms/worker/new_worker_registration_form.dart';
import 'package:pooler_manager/views/cores/main/worker/worker_registration_view.dart';
import 'package:pooler_manager/views/cores/main/worker/worker_status.dart';
import 'package:pooler_manager/views/cores/main/worker/worker_update_view.dart';

class WorkerListView extends StatelessWidget {
  WorkerListView({Key key}) : super(key: key);
  static const routeName = '/worker';
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
        margin: EdgeInsets.fromLTRB(100, 40, 100, 40),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return WorkerListTileItem(
                onTap: () {_showStatus(context);},
                title: Text('Miner Rig ${items[index]}'),
                subTitle: Text('Last run - 3 days ago'),
                itemButtonActions: _vurdActions(context),
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
      arguments: ScreenArgumentsInterface(
        body: NewWorkerRegistrationForm()
      )
    );
  }

  _showStatus(BuildContext context) {     
    Navigator.pushNamed(
      context, WorkerStatus.routeName,
    );    
  }

  VurdActionInterface _vurdActions(BuildContext context) {
    return VurdActionInterface(
      view: () {
        print('view');
      },
      update: () {
        print('update');
        Navigator.pushNamed(context, WorkerUpdateView.routeName,
          arguments: WorkerUpdateScreenArguments(
            body: HellminerWorkerUpdateForm()
          )
        );
      },
      run: () { print('run');},
      delete: () { print('delete');}
    );
  }
}
