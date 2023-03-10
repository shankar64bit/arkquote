// ignore_for_file: missing_return, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/env.sample.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/ee_provider/ee_test_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/EE/ee_test_model.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';
import '../dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class AddEETestPage extends StatelessWidget with GetItMixin {
  Map args = {};

  AddEETestPage(this.args, {Key key}) : super(key: key);

  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _locNOController = TextEditingController();

  final TextEditingController _eeNamecontroller = TextEditingController();
  final TextEditingController _resistValuecontroller = TextEditingController();

  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  setTrNo() {
    _nOcontroller.text = args['trNo'].toString();
    _locNOController.text = args['EE_LOC_ID'].toString();
  }

  @override
  Widget build(BuildContext context) {
    setTrNo();
    int id;
    var acc_token = sl<GoogleSignInController>().ACCESS_TOKEN;
    var ref_token = sl<GoogleSignInController>().REFRESH_TOKEN;
    var mob = const Text('Add Earth Electrode Test Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('Add Earth Electrode Test Details',
        style: TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // ignore: missing_return
        title: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 400) {
            return desk;
          } else {
            return mob;
          }
        }),
        actions: [
          IconButton(
              onPressed: () async {
                if (!_formKey.currentState.validate()) {
                  print('Incomplete Validation');
                } else if (_formKey.currentState.validate()) {
                  print(
                      'Form Validation Success [No error validation found-OK]');
                  // loading to add details to remote server & local server
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  );
                  //add to remote database
                  var url = Uri.parse('${Env.URL_PREFIX}/eeTest/');
                  var response = await http.post(url, body: {
                    'trNo': args['trDatabaseID'].toString(),
                    'locNo': args['eeLocDatabaseID'].toString(),
                    'resistanceValue': _resistValuecontroller.text.toString(),
                    'eeName': _eeNamecontroller.text.toString(),
                    'equipmentUsed': selectedValueForEquipmentUse.toString(),
                  }, headers: {
                    'Authorization': 'Bearer $acc_token',
                  });

                  ///////////////////////////////Status-Code-Condition///////////////////
                  var success_code = 200;
                  var success_code_2 = 201;
                  var failed_code = 'Server Connection Lost';

                  if (response.statusCode == success_code ||
                      response.statusCode == success_code_2) {
                    print('Response status: ${response.statusCode}');
                    print('Response body: ${response.body}');
                    print('Stored successfully');

                    //add to local database
                    final EETestModel eeTestReportToLocal = EETestModel(
                      trNo: int.parse(_nOcontroller.text),
                      locNo: args['EE_LOC_ID'],
                      resistanceValue:
                          double.parse(_resistValuecontroller.text),
                      eeName: _eeNamecontroller.text,
                      EquipmentType: selectedValueForEquipmentUse.toString(),
                      databaseID: json.decode(response.body)['id'],
                    );

                    getX(
                        (EETestProvider x) => x.addEETest(eeTestReportToLocal));
                    watchOnly((EETestProvider x) => {});
                    print("EE Test added");
                    Navigator.of(context).pop();

                    // ignore: use_build_context_synchronously
                    Navigator.popAndPushNamed(context, '/detail_EE_LOC',
                        arguments: {
                          'id': args['EE_LOC_ID'],
                          'trDatabaseID': args['trDatabaseID'],
                          'EE_ID': args['eeDatabaseID'],
                          'trNo': args['trNo'],
                        });
                  } else {
                    failed_code;
                    print(
                        'Failed code Response status: ${response.statusCode}');
                    print('Failed code Response body: ${response.body}');
                  }
                }
              },
              icon: const Icon(Icons.save)),
        ],
      ),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ConstrainedBox(
                        constraints: BoxConstraints(
                            minHeight: 0, minWidth: 0, maxWidth: 700),
                        child: build_body(context)),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  build_body(BuildContext context) {
    return Form(
      key: _formKey,
      child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 400) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              elevation: 5,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'Test Report No',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
                TextFormField(
                  controller: _nOcontroller,
                  textAlign: TextAlign.center,
                  enabled: false,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'Location No',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
                TextFormField(
                  controller: _locNOController,
                  textAlign: TextAlign.center,
                  enabled: false,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 20, 150, 10),
                  child: EquipmentTypeList(),
                ),
                simplifiedFor_Diplay_for_all_PC_alphanum(
                    'Earth Electrode Name', _eeNamecontroller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Resistance Value (Ω)', _resistValuecontroller),
              ]),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              elevation: 5,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'Test Report No',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
                TextFormField(
                  controller: _nOcontroller,
                  textAlign: TextAlign.center,
                  enabled: false,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'Location No',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
                TextFormField(
                  controller: _locNOController,
                  textAlign: TextAlign.center,
                  enabled: false,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child: EquipmentTypeList(),
                ),
                simplifiedFor_Display_for_all_Mobile_alphanum(
                    'Earth Electrode Name', _eeNamecontroller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Resistance Value (Ω)', _resistValuecontroller),
              ]),
            ),
          );
        }
      }),
    );
  }
}
