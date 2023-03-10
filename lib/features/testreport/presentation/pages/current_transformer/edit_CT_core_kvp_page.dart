// ignore_for_file: missing_return, missing_required_param, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../data/models/equipment/CT/ct_core_kvp_model.dart';
import '../../providers/ct_provider/ct_core_kvp_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditCTkvpPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditCTkvpPage(this.args, {Key key}) : super(key: key);

  CTcoreKVPModel _ctkvpTestModel;
  final TextEditingController _ID_Controller = TextEditingController();
  final TextEditingController _Trno_Controller = TextEditingController();
  final TextEditingController _serialNo_Controller = TextEditingController();
  final TextEditingController _R_35_Controller = TextEditingController();
  final TextEditingController _R_70_Controller = TextEditingController();
  final TextEditingController _R_105_Controller = TextEditingController();
  final TextEditingController _R_140_Controller = TextEditingController();
  final TextEditingController _R_175_Controller = TextEditingController();
  final TextEditingController _R_210_Controller = TextEditingController();
  final TextEditingController _R_245_Controller = TextEditingController();
  final TextEditingController _R_280_Controller = TextEditingController();
  final TextEditingController _R_315_Controller = TextEditingController();
  final TextEditingController _R_350_Controller = TextEditingController();
  final TextEditingController _R_385_Controller = TextEditingController();
  final TextEditingController _Y_35_Controller = TextEditingController();
  final TextEditingController _Y_70_Controller = TextEditingController();
  final TextEditingController _Y_105_Controller = TextEditingController();
  final TextEditingController _Y_140_Controller = TextEditingController();
  final TextEditingController _Y_175_Controller = TextEditingController();
  final TextEditingController _Y_210_Controller = TextEditingController();
  final TextEditingController _Y_245_Controller = TextEditingController();
  final TextEditingController _Y_280_Controller = TextEditingController();
  final TextEditingController _Y_315_Controller = TextEditingController();
  final TextEditingController _Y_350_Controller = TextEditingController();
  final TextEditingController _Y_385_Controller = TextEditingController();
  final TextEditingController _B_35_Controller = TextEditingController();
  final TextEditingController _B_70_Controller = TextEditingController();
  final TextEditingController _B_105_Controller = TextEditingController();
  final TextEditingController _B_140_Controller = TextEditingController();
  final TextEditingController _B_175_Controller = TextEditingController();
  final TextEditingController _B_210_Controller = TextEditingController();
  final TextEditingController _B_245_Controller = TextEditingController();
  final TextEditingController _B_280_Controller = TextEditingController();
  final TextEditingController _B_315_Controller = TextEditingController();
  final TextEditingController _B_350_Controller = TextEditingController();
  final TextEditingController _B_385_Controller = TextEditingController();
  final TextEditingController _equipmentUsed_Controller =
      TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Future<void> getReport() async {
    getX((CTcoreKVPProvider x) => x.getCTcoreKVP_ById(args['id']));
    _ctkvpTestModel = watchOnly((CTcoreKVPProvider x) => x.ctcoreKVP_Model);

    _ID_Controller.text = _ctkvpTestModel.id.toString();
    _Trno_Controller.text = _ctkvpTestModel.trNo.toString();
    _serialNo_Controller.text = _ctkvpTestModel.serialNo.toString();
    _equipmentUsed_Controller.text = _ctkvpTestModel.equipmentUsed.toString();
    _R_35_Controller.text = _ctkvpTestModel.R_35.toString();
    _R_70_Controller.text = _ctkvpTestModel.R_70.toString();
    _R_105_Controller.text = _ctkvpTestModel.R_105.toString();
    _R_140_Controller.text = _ctkvpTestModel.R_140.toString();
    _R_175_Controller.text = _ctkvpTestModel.R_175.toString();
    _R_210_Controller.text = _ctkvpTestModel.R_210.toString();
    _R_245_Controller.text = _ctkvpTestModel.R_245.toString();
    _R_280_Controller.text = _ctkvpTestModel.R_280.toString();
    _R_315_Controller.text = _ctkvpTestModel.R_315.toString();
    _R_350_Controller.text = _ctkvpTestModel.R_350.toString();
    _R_385_Controller.text = _ctkvpTestModel.R_385.toString();
    _Y_35_Controller.text = _ctkvpTestModel.Y_35.toString();
    _Y_70_Controller.text = _ctkvpTestModel.Y_70.toString();
    _Y_105_Controller.text = _ctkvpTestModel.Y_105.toString();
    _Y_140_Controller.text = _ctkvpTestModel.Y_140.toString();
    _Y_175_Controller.text = _ctkvpTestModel.Y_175.toString();
    _Y_210_Controller.text = _ctkvpTestModel.Y_210.toString();
    _Y_245_Controller.text = _ctkvpTestModel.Y_245.toString();
    _Y_280_Controller.text = _ctkvpTestModel.Y_280.toString();
    _Y_315_Controller.text = _ctkvpTestModel.Y_315.toString();
    _Y_350_Controller.text = _ctkvpTestModel.Y_350.toString();
    _Y_385_Controller.text = _ctkvpTestModel.Y_385.toString();
    _B_35_Controller.text = _ctkvpTestModel.B_35.toString();
    _B_70_Controller.text = _ctkvpTestModel.B_70.toString();
    _B_105_Controller.text = _ctkvpTestModel.B_105.toString();
    _B_140_Controller.text = _ctkvpTestModel.B_140.toString();
    _B_175_Controller.text = _ctkvpTestModel.B_175.toString();
    _B_210_Controller.text = _ctkvpTestModel.B_210.toString();
    _B_245_Controller.text = _ctkvpTestModel.B_245.toString();
    _B_280_Controller.text = _ctkvpTestModel.B_280.toString();
    _B_315_Controller.text = _ctkvpTestModel.B_315.toString();
    _B_350_Controller.text = _ctkvpTestModel.B_350.toString();
    _B_385_Controller.text = _ctkvpTestModel.B_385.toString();
  }

  @override
  Widget build(BuildContext context) {
    final CTcoreKVPModel ntr =
        watchOnly((CTcoreKVPProvider x) => x.ctcoreKVP_Model);
    getReport();
    var mob = const Text('Edit CT-kvp Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Edit CT-kvp Details', style: TextStyle(fontSize: 20));

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
                  var url = Uri.parse('${Env.URL_PREFIX}/ctCoreKpvTest/' +
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
                    'trNo': args['trDatabaseID'].toString(),
                    'serialNo': args['CT_ID'].toString(),
                    'equipmentUsed': selectedValueForEquipmentUse.toString(),
                    'R_35': _R_35_Controller.text.toString(),
                    'R_70': _R_70_Controller.text.toString(),
                    'R_105': _R_105_Controller.text.toString(),
                    'R_140': _R_140_Controller.text.toString(),
                    'R_175': _R_175_Controller.text.toString(),
                    'R_210': _R_210_Controller.text.toString(),
                    'R_245': _R_245_Controller.text.toString(),
                    'R_280': _R_280_Controller.text.toString(),
                    'R_315': _R_315_Controller.text.toString(),
                    'R_350': _R_350_Controller.text.toString(),
                    'R_385': _R_385_Controller.text.toString(),
                    'Y_35': _Y_35_Controller.text.toString(),
                    'Y_70': _Y_70_Controller.text.toString(),
                    'Y_105': _Y_105_Controller.text.toString(),
                    'Y_140': _Y_140_Controller.text.toString(),
                    'Y_175': _Y_175_Controller.text.toString(),
                    'Y_210': _Y_210_Controller.text.toString(),
                    'Y_245': _Y_245_Controller.text.toString(),
                    'Y_280': _Y_280_Controller.text.toString(),
                    'Y_315': _Y_315_Controller.text.toString(),
                    'Y_350': _Y_350_Controller.text.toString(),
                    'Y_385': _Y_385_Controller.text.toString(),
                    'B_35': _B_35_Controller.text.toString(),
                    'B_70': _B_70_Controller.text.toString(),
                    'B_105': _B_105_Controller.text.toString(),
                    'B_140': _B_140_Controller.text.toString(),
                    'B_175': _B_175_Controller.text.toString(),
                    'B_210': _B_210_Controller.text.toString(),
                    'B_245': _B_245_Controller.text.toString(),
                    'B_280': _B_280_Controller.text.toString(),
                    'B_315': _B_315_Controller.text.toString(),
                    'B_350': _B_350_Controller.text.toString(),
                    'B_385': _B_385_Controller.text.toString(),
                    'updateDate': DateTime.now().toString(),
                  };
                  var response = await http.put(url,
                      body: jsonEncode(payload), headers: headers);

                  if (response.statusCode == success_code ||
                      response.statusCode == success_code1) {
                    print('Response status: ${response.statusCode}');
                    print('Response body: ${response.body}');
                    print('Stored successfully');

                    //add to local database
                    final CTcoreKVPModel ctkvpReportToLocal = CTcoreKVPModel(
                      trNo: int.parse(_Trno_Controller.text),
                      serialNo: _serialNo_Controller.text,
                      R_35: double.parse(_R_35_Controller.text),
                      R_70: double.parse(_R_70_Controller.text),
                      R_105: double.parse(_R_105_Controller.text),
                      R_140: double.parse(_R_140_Controller.text),
                      R_175: double.parse(_R_175_Controller.text),
                      R_210: double.parse(_R_210_Controller.text),
                      R_245: double.parse(_R_245_Controller.text),
                      R_280: double.parse(_R_280_Controller.text),
                      R_315: double.parse(_R_315_Controller.text),
                      R_350: double.parse(_R_350_Controller.text),
                      R_385: double.parse(_R_385_Controller.text),
                      Y_35: double.parse(_Y_35_Controller.text),
                      Y_70: double.parse(_Y_70_Controller.text),
                      Y_105: double.parse(_Y_105_Controller.text),
                      Y_140: double.parse(_Y_140_Controller.text),
                      Y_175: double.parse(_Y_175_Controller.text),
                      Y_210: double.parse(_Y_210_Controller.text),
                      Y_245: double.parse(_Y_245_Controller.text),
                      Y_280: double.parse(_Y_280_Controller.text),
                      Y_315: double.parse(_Y_315_Controller.text),
                      Y_350: double.parse(_Y_350_Controller.text),
                      Y_385: double.parse(_Y_385_Controller.text),
                      B_35: double.parse(_B_35_Controller.text),
                      B_70: double.parse(_B_70_Controller.text),
                      B_105: double.parse(_B_105_Controller.text),
                      B_140: double.parse(_B_140_Controller.text),
                      B_175: double.parse(_B_175_Controller.text),
                      B_210: double.parse(_B_210_Controller.text),
                      B_245: double.parse(_B_245_Controller.text),
                      B_280: double.parse(_B_280_Controller.text),
                      B_315: double.parse(_B_315_Controller.text),
                      B_350: double.parse(_B_350_Controller.text),
                      B_385: double.parse(_B_385_Controller.text),
                      equipmentUsed: selectedValueForEquipmentUse.toString(),
                      databaseID: ntr.databaseID,
                      updateDate: DateTime.now(),
                    );

                    getX((CTcoreKVPProvider x) =>
                        x.updateCTcoreKVP(ctkvpReportToLocal, args['id']));

                    Navigator.popAndPushNamed(context, '/detail_CTcoreKVP',
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
                      padding: EdgeInsets.fromLTRB(150, 10, 150, 10),
                      child: Text(
                        'Trno',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      )),
                  TextFormField(
                    controller: _Trno_Controller,
                    textAlign: TextAlign.center,
                    enabled: false,
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(150, 10, 150, 10),
                      child: Text(
                        'serialNo',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      )),
                  TextFormField(
                    controller: _serialNo_Controller,
                    textAlign: TextAlign.center,
                    enabled: false,
                  ),
                  Divider(color: Colors.black, thickness: 1),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                    child: EquipmentTypeList(),
                  ),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'R_35', _R_35_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'R_70', _R_70_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'R_105', _R_105_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'R_140', _R_140_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'R_175', _R_175_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'R_210', _R_210_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'R_245', _R_245_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'R_280', _R_280_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'R_315', _R_315_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'R_350', _R_350_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'R_385', _R_385_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Y_35', _Y_35_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Y_70', _Y_70_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Y_105', _Y_105_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Y_140', _Y_140_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Y_175', _Y_175_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Y_210', _Y_210_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Y_245', _Y_245_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Y_280', _Y_280_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Y_315', _Y_315_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Y_350', _Y_350_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Y_385', _Y_385_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'B_35', _B_35_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'B_70', _B_70_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'B_105', _B_105_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'B_140', _B_140_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'B_175', _B_175_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'B_210', _B_210_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'B_245', _B_245_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'B_280', _B_280_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'B_315', _B_315_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'B_350', _B_350_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'B_385', _B_385_Controller),
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
                        'TrNo',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      )),
                  TextFormField(
                    controller: _Trno_Controller,
                    textAlign: TextAlign.center,
                    enabled: false,
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        'serialNo',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      )),
                  TextFormField(
                    controller: _serialNo_Controller,
                    textAlign: TextAlign.center,
                    enabled: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: EquipmentTypeList(),
                  ),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'R_35', _R_35_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'R_70', _R_70_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'R_105', _R_105_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'R_140', _R_140_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'R_175', _R_175_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'R_210', _R_210_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'R_245', _R_245_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'R_280', _R_280_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'R_315', _R_315_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'R_350', _R_350_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'R_385', _R_385_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'Y_35', _Y_35_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'Y_70', _Y_70_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'Y_105', _Y_105_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'Y_140', _Y_140_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'Y_175', _Y_175_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'Y_210', _Y_210_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'Y_245', _Y_245_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'Y_280', _Y_280_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'Y_315', _Y_315_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'Y_350', _Y_350_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'Y_385', _Y_385_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'B_35', _B_35_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'B_70', _B_70_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'B_105', _B_105_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'B_140', _B_140_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'B_175', _B_175_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'B_210', _B_210_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'B_245', _B_245_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'B_280', _B_280_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'B_315', _B_315_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'B_350', _B_350_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'B_385', _B_385_Controller),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
