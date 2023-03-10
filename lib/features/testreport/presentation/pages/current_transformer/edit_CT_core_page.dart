// ignore_for_file: missing_return, missing_required_param, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../data/models/equipment/CT/ct_core_model.dart';
import '../../providers/ct_provider/ct_core_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditCTcorePage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditCTcorePage(this.args, {Key key}) : super(key: key);

  CT_core_Model _ct_coreTestModel;
  final TextEditingController _ID_Controller = TextEditingController();
  final TextEditingController _coreNo_controller = TextEditingController();
  final TextEditingController _coreClass_controller = TextEditingController();
  final TextEditingController _burden_controller = TextEditingController();
  final TextEditingController _ctNo_controller = TextEditingController();

  Future<void> getReport() async {
    getX((CT_core_Provider x) => x.getCT_core_ById(args['id']));
    _ct_coreTestModel = watchOnly((CT_core_Provider x) => x.ct_core_Model);

    _ID_Controller.text = _ct_coreTestModel.id.toString();
    _coreNo_controller.text = _ct_coreTestModel.coreNo.toString();
    _coreClass_controller.text = _ct_coreTestModel.coreClass.toString();
    _burden_controller.text = _ct_coreTestModel.burden.toString();
    _ctNo_controller.text = args['CT_ID'].toString();
  }

  @override
  Widget build(BuildContext context) {
    final CT_core_Model ntr =
        watchOnly((CT_core_Provider x) => x.ct_core_Model);
    getReport();
    var mob =
        const Text('Edit CT-core Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Edit CT-core Details', style: TextStyle(fontSize: 20));

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
                  var url = Uri.parse('${Env.URL_PREFIX}/coreDetails/' +
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
                    'ctNo': args['ctDatabaseID'].toString(),
                    'coreNo': _coreNo_controller.text.toString(),
                    'coreClass': _coreClass_controller.text.toString(),
                    'burden': _burden_controller.text.toString(),
                  };
                  var response = await http.put(url,
                      body: jsonEncode(payload), headers: headers);

                  if (response.statusCode == success_code ||
                      response.statusCode == success_code1) {
                    print('Response status: ${response.statusCode}');
                    print('Response body: ${response.body}');
                    print('Stored successfully');

                    //add to local database
                    final CT_core_Model ctcoreReportToLocal = CT_core_Model(
                      ctNo: int.parse(_ctNo_controller.text),
                      burden: int.parse(_burden_controller.text),
                      coreClass: _coreClass_controller.text,
                      coreNo: int.parse(_coreNo_controller.text),
                      databaseID: ntr.databaseID,
                      updateDate: DateTime.now(),
                    );

                    getX((CT_core_Provider x) =>
                        x.updateCT_core(ctcoreReportToLocal, args['id']));

                    Navigator.popAndPushNamed(context, '/detail_CTcore',
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
                        'CTNO',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      )),
                  TextFormField(
                    controller: _ctNo_controller,
                    textAlign: TextAlign.center,
                    enabled: false,
                  ),
                  Divider(color: Colors.black, thickness: 1),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                    child: EquipmentTypeList(),
                  ),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'burden', _burden_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'coreClass', _coreClass_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'coreNo', _coreNo_controller),
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
                        'CTNO',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      )),
                  TextFormField(
                    controller: _ctNo_controller,
                    textAlign: TextAlign.center,
                    enabled: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: EquipmentTypeList(),
                  ),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'burden', _burden_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'coreClass', _coreClass_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'coreNo', _coreNo_controller),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
