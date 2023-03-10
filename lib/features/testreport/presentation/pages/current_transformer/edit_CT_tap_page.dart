// ignore_for_file: missing_return, missing_required_param, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../data/models/equipment/CT/ct_tap_model.dart';
import '../../providers/ct_provider/ct_tap_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditCTcoretapPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditCTcoretapPage(this.args, {Key key}) : super(key: key);

  CT_tap_Model _ct_core_tapTestModel;
  final TextEditingController _ID_Controller = TextEditingController();
  final TextEditingController _tapName_controller = TextEditingController();
  final TextEditingController _ratio_controller = TextEditingController();
  final TextEditingController _kneePointVoltage_controller =
      TextEditingController();
  final TextEditingController _leakageCurrent_controller =
      TextEditingController();
  final TextEditingController _coreRef_controller = TextEditingController();

  Future<void> getReport() async {
    getX((CT_tap_Provider x) => x.getCT_tap_ById(args['id']));
    _ct_core_tapTestModel = watchOnly((CT_tap_Provider x) => x.ct_tap_Model);

    _ID_Controller.text = _ct_core_tapTestModel.id.toString();
    _tapName_controller.text = _ct_core_tapTestModel.tapName.toString();
    _ratio_controller.text = _ct_core_tapTestModel.ratio.toString();
    _kneePointVoltage_controller.text =
        _ct_core_tapTestModel.kneePointVoltage.toString();
    _leakageCurrent_controller.text =
        _ct_core_tapTestModel.leakageCurrent.toString();
    _coreRef_controller.text = _ct_core_tapTestModel.coreRef.toString();
  }

  @override
  Widget build(BuildContext context) {
    final CT_tap_Model ntr = watchOnly((CT_tap_Provider x) => x.ct_tap_Model);
    getReport();
    var mob =
        const Text('Edit CT-core-tap Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Edit CT-core-tap Details', style: TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
                  //add to remote database
                  var success_code = 201;
                  var success_code1 = 200;
                  var failed_code = 'Server Connection Lost';
                  //add to remote database
                  var url = Uri.parse('${Env.URL_PREFIX}/tapDetails/' +
                      ntr.databaseID.toString() +
                      '/');

                  Map<String, String> headers = {
                    "Content-type": "application/json",
                    "Authorization": "Bearer $acc_token",
                  };
                  print("***********");
                  print(args['trDatabaseID'].toString());

                  print(url);

                  final Map payload = {
                    'coreRef': args['ctcoreDatabaseID'].toString(),
                    'tapName': _tapName_controller.text.toString(),
                    'ratio': _ratio_controller.text.toString(),
                    'kneePointVoltage':
                        _kneePointVoltage_controller.text.toString(),
                    'leakageCurrent':
                        _leakageCurrent_controller.text.toString(),
                  };
                  var response = await http.put(url,
                      body: jsonEncode(payload), headers: headers);

                  if (response.statusCode == success_code ||
                      response.statusCode == success_code1) {
                    print('Response status: ${response.statusCode}');
                    print('Response body: ${response.body}');
                    print('Stored successfully');

                    //add to local database
                    final CT_tap_Model ctcoretapReportToLocal = CT_tap_Model(
                      coreRef: int.parse(_coreRef_controller.text),
                      kneePointVoltage:
                          int.parse(_kneePointVoltage_controller.text),
                      leakageCurrent:
                          int.parse(_leakageCurrent_controller.text),
                      ratio: int.parse(_ratio_controller.text),
                      tapName: _tapName_controller.text.toString(),
                      updateDate: DateTime.now(),
                      databaseID: ntr.databaseID,
                    );

                    getX((CT_tap_Provider x) =>
                        x.updateCT_tap(ctcoretapReportToLocal, args['id']));

                    Navigator.popAndPushNamed(context, '/detail_CTcoretap',
                        arguments: {
                          'id': args['id'],
                          'CT_ID': args['CT_ID'],
                          'trDatabaseID': args['trDatabaseID'],
                        });
                  } else {
                    failed_code;
                    print('Failed Response status: ${response.statusCode}');
                    print('Failed Response body: ${response.body}');
                    print('Unsuccessfully');
                  }
                }
              },
              icon: const Icon(Icons.save)),
        ],
      ),
      // body: SingleChildScrollView(child: build_body()),
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
              elevation: 2,
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text('ID',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5))),
                  TextFormField(
                      controller: _ID_Controller,
                      enabled: false,
                      textAlign: TextAlign.center),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(150, 10, 150, 10),
                      child: Text(
                        'coreRef',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      )),
                  TextFormField(
                    controller: _coreRef_controller,
                    textAlign: TextAlign.center,
                    enabled: false,
                  ),
                  Divider(color: Colors.black, thickness: 1),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                    child: EquipmentTypeList(),
                  ),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'kvp', _kneePointVoltage_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'leakageCurrent', _leakageCurrent_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'ratio', _ratio_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'tapName', _tapName_controller),
                ],
              ),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              elevation: 2,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      'ID',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5),
                    ),
                  ),
                  TextFormField(
                    controller: _ID_Controller,
                    enabled: false,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        'coreRef',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      )),
                  TextFormField(
                    controller: _coreRef_controller,
                    textAlign: TextAlign.center,
                    enabled: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: EquipmentTypeList(),
                  ),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'kvp', _kneePointVoltage_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'leakageCurrent', _leakageCurrent_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'ratio', _ratio_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'tapName', _tapName_controller),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
