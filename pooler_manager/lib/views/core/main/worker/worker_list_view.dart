import 'package:flutter/material.dart';
import 'package:pooler_manager/interfaces/routes/screen_arguments_interface.dart';
import 'package:pooler_manager/interfaces/views/action_button_interface.dart';
import 'package:pooler_manager/views/defaults/app_scaffold.dart';
import 'package:pooler_manager/views/core/main/worker/components/worker_list_tile_item.dart';
import 'package:pooler_manager/views/core/main/worker/forms/common/new_worker_registration_form.dart';
import 'package:pooler_manager/views/core/main/worker/forms/hellminer_worker/hellminer_worker_update_form.dart';
import 'package:pooler_manager/views/core/main/worker/forms/hellminer_worker/hellminer_worker_view_form.dart';
import 'package:pooler_manager/views/core/main/worker/worker_detail_view.dart';
import 'package:pooler_manager/views/core/main/worker/worker_registration_view.dart';
import 'package:pooler_manager/views/core/main/worker/worker_update_view.dart';

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
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 50),
          child: ListView.builder(
            padding: EdgeInsets.fromLTRB(30, 50, 30, 50),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return WorkerListTileItem(
                onTap: () {_showDetail(context);},
                title: Text('Miner Rig ${items[index]}'),
                itemButtonActions: _actions(context),
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

  _showDetail(BuildContext context) {     
    Navigator.pushNamed(
      context, WorkerDetailView.routeName,
      arguments: ScreenArgumentsInterface(
        body:HellminerWorkerViewForm()
      )
    );    
  }

  ActionButtonInterface _actions(BuildContext context) {
    return ActionButtonInterface(
      update: () {
        print('update');
        Navigator.pushNamed(
          context, WorkerUpdateView.routeName,
          arguments: ScreenArgumentsInterface(
            body: HellminerWorkerUpdateForm()
          )
        );
      },
      run: () { print('run');},
      delete: () { print('delete');}
    );
  }
}
