import 'package:flutter/material.dart';
import 'package:pooler_manager/interfaces/routes/screen_arguments_interface.dart';
import 'package:pooler_manager/interfaces/views/action_button_interface.dart';
import 'package:pooler_manager/views/defaults/app_card_standard.dart';
import 'package:pooler_manager/views/defaults/app_scaffold.dart';
import 'package:pooler_manager/views/core/main/process/components/process_list_tile_item.dart';
import 'package:pooler_manager/views/core/main/process/process_status_view.dart';
import 'package:pooler_manager/views/core/main/worker/forms/hellminer_worker/hellminer_worker_update_form.dart';
import 'package:pooler_manager/views/core/main/worker/worker_update_view.dart';

class ProcessListView extends StatelessWidget {
  ProcessListView({Key key}) : super(key: key);
  static const routeName = '/process';
  final List<String> items = List<String>.generate(50, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text('Process'),
        actions: [
          // FittedBox(
          //   child: RaisedButton(
          //     child: Text('Add'),
          //     onPressed: () {
          //       _nextPage(context);
          //     },
          //   ),
          // ),
          // SizedBox(
          //   width: 10,
          // )
        ],
      ),
      body: AppCardStandard(
        child: ListView.builder(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ProcessListTileItem(
              onTap: () {_showStatus(context);},
              title: Text('Miner Rig ${items[index]}'),
              subTitle: Text('Last run - 3 days ago'),
              itemButtonActions: _buttonActions(context),
            );
          },
        ),
      ),
    );
  }

  _showStatus(BuildContext context) {     
    Navigator.pushNamed(
      context, ProcessStatusView.routeName,
    );    
  }

  ActionButtonInterface _buttonActions(BuildContext context) {
    return ActionButtonInterface(
      view: () {
        print('view');
      },
      update: () {
        print('update');
        Navigator.pushNamed(context, WorkerUpdateView.routeName,
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
