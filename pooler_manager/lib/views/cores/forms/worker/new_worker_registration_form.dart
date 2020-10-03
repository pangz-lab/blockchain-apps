import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pooler_manager/views/components/form/form_dropdown_field.dart';
import 'package:pooler_manager/views/components/form/form_text_field.dart';
import 'package:pooler_manager/views/cores/forms/worker_registration/hellminer_worker_registration_form.dart';
import 'package:pooler_manager/views/cores/main/worker/worker_registration_view.dart';

class NewWorkerRegistrationForm extends StatefulWidget {
  @override
  _NewWorkerRegistrationFormState createState() =>
      _NewWorkerRegistrationFormState();
}

class _NewWorkerRegistrationFormState extends State<NewWorkerRegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> _poolSelection = [
    '--SELECT-MINER--',
    'HELLMINER',
    'NHEQMINER',
    'CCMINER',
    'SILENT_ARMY'
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(40),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Text("Add New Worker"),
              SizedBox(
                height: 40,
              ),
              _content(),
            ],
          ),
        )
      )
    );
  }

  _content() {
    return SizedBox(
      width: 400,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FormTextField(
              label: 'Name',
              keyboardType: TextInputType.name
            ),
            SizedBox(
              height: 20,
            ),
            FormDropDownField(
              label: 'Miner',
              defaultValue: 0,
              listValue: _poolSelection,
            ),
            SizedBox(
              height: 20,
            ),
            _nextButton()
          ],
        ),
      ),
    );
  }

  _nextButton() {
    return SizedBox(
      width: 400,
      height: 50,
      child: ElevatedButton(
        child: Text("Next"),
        onPressed: () {
          Navigator.pushNamed(context, WorkerRegistrationView.routeName,
            arguments: WorkerRegistrationScreenArguments(
              body: HellminerWorkerRegistrationForm()
            )
          );
        }
      )
    );
  }
}
