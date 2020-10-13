import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pooler_manager/views/components/forms/form_dropdown_field.dart';
import 'package:pooler_manager/views/components/forms/form_text_field.dart';
import 'package:pooler_manager/views/core/main/worker/worker_list_view.dart';
import 'package:pooler_manager/views/defaults/app_card_thin.dart';

class HellminerWorkerUpdateForm extends StatefulWidget {
  @override
  _HellminerWorkerUpdateFormState createState() =>
    _HellminerWorkerUpdateFormState();
}

class _HellminerWorkerUpdateFormState
    extends State<HellminerWorkerUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> _poolSelection = [
    '--SELECT-SERVER--',
    'na.luckpool.net',
    'eu.luckpool.net',
    'ap.luckpool.net',
  ];
  final snackBar = SnackBar(
    content: Text('Update Successful'),
  );

  @override
  Widget build(BuildContext context) {
    return AppCardThin(
      child: Column(
        children: [
          Text("Update Worker"),
          SizedBox(
            height: 40,
          ),
          _content(context),
        ],
      ),
    );
  }

  _content(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FormTextField(label: 'Worker Name'),
            SizedBox(
              height: 20,
            ),
            FormDropDownField(
              label: 'Server',
              defaultValue: 0,
              listValue: _poolSelection
            ),
            SizedBox(
              height: 20,
            ),
            FormTextField(label: 'Wallet Address'),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                  flex: 3,
                  child: FormTextField(
                    label: 'Port',
                    keyboardType: TextInputType.number
                  )
                ),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                  flex: 2,
                  child: FormDropDownField(
                    label: 'CPU',
                    listValue: ["1", "2", "3", "4", "5", "6", "7", "8"],
                    defaultValue: 0),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            FormDropDownField(
              label: 'Mode',
              listValue: ["--SELECT-MODE--", "Regular", "Hybrid", "Hybrid Static Diff"],
              defaultValue: 0
            ),
            SizedBox(
              height: 60,
            ),
            _nextButton(context)
          ],
        ),
      ),
    );
  }

  _nextButton(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 50,
      child: ElevatedButton(child: Text("Update"), onPressed: () {
        Navigator.pushReplacementNamed(
          context, WorkerListView.routeName);
      })
    );
  }
}
