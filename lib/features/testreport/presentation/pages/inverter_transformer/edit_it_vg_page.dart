import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../data/models/equipment/IT/it_model.dart';
import '../../../data/models/equipment/IT/it_vg_model.dart';
import '../../providers/it_provider/it_provider.dart';
import '../../providers/it_provider/it_vg_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditItVgPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditItVgPage(this.args, {Key key}) : super(key: key);

  ItVgTestModel _itVgTestModel;

  final TextEditingController _Trno_Controller = TextEditingController();
  final TextEditingController _serialNo_Controller = TextEditingController();
  final TextEditingController _lv1_v1_Controller = TextEditingController();
  final TextEditingController _lv1_v2_Controller = TextEditingController();
  final TextEditingController _lv1_v3_Controller = TextEditingController();
  final TextEditingController _lv1_v4_Controller = TextEditingController();
  final TextEditingController _lv2_v1_Controller = TextEditingController();
  final TextEditingController _lv2_v2_Controller = TextEditingController();
  final TextEditingController _lv2_v3_Controller = TextEditingController();
  final TextEditingController _lv2_v4_Controller = TextEditingController();
  final TextEditingController _lv3_v1_Controller = TextEditingController();
  final TextEditingController _lv3_v2_Controller = TextEditingController();
  final TextEditingController _lv3_v3_Controller = TextEditingController();
  final TextEditingController _lv3_v4_Controller = TextEditingController();
  final TextEditingController _lv4_v1_Controller = TextEditingController();
  final TextEditingController _lv4_v2_Controller = TextEditingController();
  final TextEditingController _lv4_v3_Controller = TextEditingController();
  final TextEditingController _lv4_v4_Controller = TextEditingController();

  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Future<void> getReport() async {
    getX((ItVgProvider x) => x.getItVgByID(args['id']));
    _itVgTestModel = watchOnly((ItVgProvider x) => x.itVgModel);

    _Trno_Controller.text = args['TrNo'].toString();
    _serialNo_Controller.text = args['SerialNo'];
    _lv1_v1_Controller.text = _itVgTestModel.lv1_v1.toString();
    _lv1_v2_Controller.text = _itVgTestModel.lv1_v2.toString();
    _lv1_v3_Controller.text = _itVgTestModel.lv1_v3.toString();
    _lv1_v4_Controller.text = _itVgTestModel.lv1_v4.toString();

    _lv2_v1_Controller.text = _itVgTestModel.lv2_v1.toString();
    _lv2_v2_Controller.text = _itVgTestModel.lv2_v2.toString();
    _lv2_v3_Controller.text = _itVgTestModel.lv2_v3.toString();
    _lv2_v4_Controller.text = _itVgTestModel.lv2_v4.toString();
    _lv3_v1_Controller.text = _itVgTestModel.lv3_v1.toString();
    _lv3_v2_Controller.text = _itVgTestModel.lv3_v2.toString();
    _lv3_v3_Controller.text = _itVgTestModel.lv3_v3.toString();
    _lv3_v4_Controller.text = _itVgTestModel.lv3_v4.toString();
    _lv4_v1_Controller.text = _itVgTestModel.lv4_v1.toString();
    _lv4_v2_Controller.text = _itVgTestModel.lv4_v2.toString();
    _lv4_v3_Controller.text = _itVgTestModel.lv4_v3.toString();
    _lv4_v4_Controller.text = _itVgTestModel.lv4_v4.toString();
  }

  @override
  Widget build(BuildContext context) {
    final ItModel ntr1 = watchOnly((ItProvider x) => x.itModel);

    final ItVgTestModel ntr = watchOnly((ItVgProvider x) => x.itVgModel);
    getReport();
    var mob = const Text('Edit IT-Vg Details', style: TextStyle(fontSize: 15));
    var desk = const Text('Edit IT-Vg Details', style: TextStyle(fontSize: 20));

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
                  //add to remote database
                  var success_code = 201;
                  var success_code1 = 200;
                  var failed_code = 'Server Connection Lost';
                  if (checkVectoreGroup(ntr1)) {
                    _lv3_v1_Controller.text = "0.0";
                    _lv3_v2_Controller.text = '0.0';
                    _lv3_v3_Controller.text = "0.0";
                    _lv3_v4_Controller.text = "0.0";
                    _lv4_v1_Controller.text = "0.0";
                    _lv4_v2_Controller.text = '0.0';
                    _lv4_v3_Controller.text = "0.0";
                    _lv4_v4_Controller.text = "0.0";
                  }
                  //add to remote database
                  var url = Uri.parse('${Env.URL_PREFIX}/itVgTest/' +
                      ntr.databaseID.toString() +
                      '/');

                  Map<String, String> headers = {
                    "Content-type": "application/json",
                    "Authorization": "Bearer $acc_token",
                  };
                  print("***********");
                  print(args['trDatabaseID'].toString());

                  final Map payload = {
                    'trNo': args['trDatabaseID'].toString(),
                    'serialNo': ntr1.databaseID.toString(),
                    // 'serialNo': args['itDatabaseID'].toString(),
                    'equipmentUsed': selectedValueForEquipmentUse.toString(),
                    'lv1_v1': _lv1_v1_Controller.text.toString(),
                    'lv1_v2': _lv1_v2_Controller.text.toString(),
                    'lv1_v3': _lv1_v3_Controller.text.toString(),
                    'lv1_v4': _lv1_v4_Controller.text.toString(),
                    'lv2_v1': _lv2_v1_Controller.text.toString(),
                    'lv2_v2': _lv2_v2_Controller.text.toString(),
                    'lv2_v3': _lv2_v3_Controller.text.toString(),
                    'lv2_v4': _lv2_v4_Controller.text.toString(),
                    'lv3_v1': _lv3_v1_Controller.text.toString(),
                    'lv3_v2': _lv3_v1_Controller.text.toString(),
                    'lv3_v3': _lv3_v3_Controller.text.toString(),
                    'lv3_v4': _lv3_v4_Controller.text.toString(),
                    'lv4_v1': _lv4_v1_Controller.text.toString(),
                    'lv4_v2': _lv4_v2_Controller.text.toString(),
                    'lv4_v3': _lv4_v3_Controller.text.toString(),
                    'lv4_v4': _lv4_v4_Controller.text.toString(),
                    "updateDate": DateTime.now().toString(),
                  };
                  var response = await http.put(url,
                      body: jsonEncode(payload), headers: headers);

                  if (response.statusCode == success_code ||
                      response.statusCode == success_code1) {
                    print('Response status: ${response.statusCode}');
                    print('Response body: ${response.body}');
                    print('Stored successfully');

                    //add to local database
                    final ItVgTestModel itVgReportToLocal = ItVgTestModel(
                      trNo: int.parse(_Trno_Controller.text),
                      serialNo: _serialNo_Controller.text,
                      lv1_v1: double.parse(_lv1_v1_Controller.text),
                      lv1_v2: double.parse(_lv1_v2_Controller.text),
                      lv1_v3: double.parse(_lv1_v3_Controller.text),
                      lv1_v4: double.parse(_lv1_v4_Controller.text),
                      lv2_v1: double.parse(_lv2_v1_Controller.text),
                      lv2_v2: double.parse(_lv2_v2_Controller.text),
                      lv2_v3: double.parse(_lv2_v3_Controller.text),
                      lv2_v4: double.parse(_lv2_v4_Controller.text),
                      lv3_v1: double.parse(_lv3_v1_Controller.text),
                      lv3_v2: double.parse(_lv3_v2_Controller.text),
                      lv3_v3: double.parse(_lv3_v3_Controller.text),
                      lv3_v4: double.parse(_lv3_v4_Controller.text),
                      lv4_v1: double.parse(_lv4_v1_Controller.text),
                      lv4_v2: double.parse(_lv4_v2_Controller.text),
                      lv4_v3: double.parse(_lv4_v3_Controller.text),
                      lv4_v4: double.parse(_lv4_v4_Controller.text),
                      databaseID: ntr.databaseID,
                      equipmentUsed: selectedValueForEquipmentUse.toString(),
                      updateDate: DateTime.now(),
                    );
                    print("Added to local DB");
                    print(itVgReportToLocal);
                    getX((ItVgProvider x) =>
                        x.updateItVg(itVgReportToLocal, args['id']));

                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_IT_VG',
                        arguments: {
                          'id': args['id'],
                          'itRDatabaseID': ntr.databaseID,
                          'serialNo': args['serialNo'],
                          'itDatabaseID': args['itDatabaseID'],
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
    final ItModel ntr = watchOnly((ItProvider x) => x.itModel);

    return Form(
      key: _formKey,
      child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 400) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              elevation: 2,
              child: Column(children: [
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
                  controller: _Trno_Controller,
                  enabled: false,
                  textAlign: TextAlign.center,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'Test Report No',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
                TextFormField(
                  controller: _Trno_Controller,
                  // label : const Text('Test Report No.'),
                  enabled: false,
                  textAlign: TextAlign.center,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'Serial No',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
                TextFormField(
                  controller: _serialNo_Controller,
                  enabled: false,
                  textAlign: TextAlign.center,
                  // hintText: 'Serial No',
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 20, 150, 10),
                  child: EquipmentTypeList(),
                ),
                Text(
                  'LV1',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5),
                ),
                ntr.vectorGroup.contains('Dd0')
                    ? Card(
                        child: Column(children: [
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            '1U2w', _lv1_v1_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            '2w1W', _lv1_v2_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            '1W2w', _lv1_v3_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            '1W2v', _lv1_v4_Controller),
                      ]))
                    : Container(),
                ntr.vectorGroup.contains('Dd6')
                    ? Card(
                        child: Column(children: [
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            '2w1U', _lv1_v1_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            '1U1W', _lv1_v2_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            '1W2v', _lv1_v3_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            '1W2w', _lv1_v4_Controller),
                      ]))
                    : Container(),
                ntr.vectorGroup.contains('Yd1')
                    ? Card(
                        child: Column(children: [
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            '1U2v ', _lv1_v1_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            '2v1N', _lv1_v2_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            '1W2w ', _lv1_v3_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            '1V2w', _lv1_v4_Controller),
                      ]))
                    : Container(),
                ntr.vectorGroup.contains('Yd11')
                    ? Card(
                        child: Column(children: [
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            '1U2w  ', _lv1_v1_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            '2wN', _lv1_v2_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            '1V2v  ', _lv1_v3_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            '1W2v', _lv1_v4_Controller),
                      ]))
                    : Container(),
                Text(
                  'LV2',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5),
                ),
                ntr.vectorGroup.contains('Dd0')
                    ? Card(
                        child: Column(children: [
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            '1U3w', _lv2_v1_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            '3w1W', _lv2_v2_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            '1W3w', _lv2_v3_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            '1W3v', _lv2_v4_Controller),
                      ]))
                    : Container(),
                ntr.vectorGroup.contains('Dd6')
                    ? Card(
                        child: Column(children: [
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            '3w1U', _lv2_v1_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            '1U1W', _lv2_v2_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            '1W3v', _lv2_v3_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            '1W3w', _lv2_v4_Controller),
                      ]))
                    : Container(),
                ntr.vectorGroup.contains('Yd1')
                    ? Card(
                        child: Column(children: [
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            '1U3v', _lv2_v1_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            '3v1N', _lv2_v2_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            '1W3w', _lv2_v3_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            '1V3w', _lv2_v4_Controller),
                      ]))
                    : Container(),
                ntr.vectorGroup.contains('Yd11')
                    ? Card(
                        child: Column(children: [
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            '1U3w', _lv2_v1_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            '3wN', _lv2_v2_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            '1V3v', _lv2_v3_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            '1W3v', _lv2_v4_Controller),
                      ]))
                    : Container(),
                checkVectoreGroup(ntr)
                    ? Container()
                    : Card(
                        child: Column(
                        children: [
                          Text(
                            'LV3',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5),
                          ),
                          ntr.vectorGroup.contains('Dd0')
                              ? Card(
                                  child: Column(children: [
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      '1U4w', _lv3_v1_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      '4w1W', _lv3_v2_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      '1W4w', _lv3_v3_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      '1W4v', _lv3_v4_Controller),
                                ]))
                              : Container(),
                          ntr.vectorGroup.contains('Dd6')
                              ? Card(
                                  child: Column(children: [
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      '4w1U', _lv3_v1_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      '1U1W', _lv3_v2_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      '1W4v', _lv3_v3_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      '1W4w', _lv3_v4_Controller),
                                ]))
                              : Container(),
                          ntr.vectorGroup.contains('Yd1')
                              ? Card(
                                  child: Column(children: [
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      '1U4v ', _lv3_v1_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      '4v1N', _lv3_v2_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      '1W4w ', _lv3_v3_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      '1V4w', _lv3_v4_Controller),
                                ]))
                              : Container(),
                          ntr.vectorGroup.contains('Yd11')
                              ? Card(
                                  child: Column(children: [
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      '1U4w  ', _lv3_v1_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      '4wN', _lv3_v2_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      '1V4v  ', _lv3_v3_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      '1W4v', _lv3_v4_Controller),
                                ]))
                              : Container(),
                          Text(
                            'LV4',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5),
                          ),
                          ntr.vectorGroup.contains('Dd0')
                              ? Card(
                                  child: Column(children: [
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      '1U5w', _lv4_v1_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      '5w1W', _lv4_v2_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      '1W5w', _lv4_v3_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      '1W5v', _lv4_v4_Controller),
                                ]))
                              : Container(),
                          ntr.vectorGroup.contains('Dd6')
                              ? Card(
                                  child: Column(children: [
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      '5w1U', _lv4_v1_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      '1U1W', _lv4_v2_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      '1W5v', _lv4_v3_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      '1W5w', _lv4_v4_Controller),
                                ]))
                              : Container(),
                          ntr.vectorGroup.contains('Yd1')
                              ? Card(
                                  child: Column(children: [
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      '1U5v', _lv4_v1_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      '5v1N', _lv4_v2_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      '1W5w', _lv4_v3_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      '1V5w', _lv4_v4_Controller),
                                ]))
                              : Container(),
                          ntr.vectorGroup.contains('Yd11')
                              ? Card(
                                  child: Column(children: [
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      '1U5w', _lv4_v1_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      '5wN', _lv4_v2_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      '1V5v', _lv4_v3_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      '1W5v', _lv4_v4_Controller),
                                ]))
                              : Container(),
                        ],
                      ))
              ]),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              elevation: 2,
              child: Column(children: [
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
                  controller: _Trno_Controller,
                  enabled: false,
                  textAlign: TextAlign.center,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'Test Report No',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
                TextFormField(
                  controller: _Trno_Controller,
                  // label : const Text('Test Report No.'),
                  enabled: false,
                  textAlign: TextAlign.center,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'Serial No',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
                TextFormField(
                  controller: _serialNo_Controller,
                  enabled: false,
                  textAlign: TextAlign.center,
                  // hintText: 'Serial No',
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: EquipmentTypeList(),
                ),
                Text(
                  'LV1',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5),
                ),
                ntr.vectorGroup.contains('Dd0')
                    ? Card(
                        child: Column(children: [
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            '1U2w', _lv1_v1_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            '2w1W', _lv1_v2_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            '1W2w', _lv1_v3_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            '1W2v', _lv1_v4_Controller),
                      ]))
                    : Container(),
                ntr.vectorGroup.contains('Dd6')
                    ? Card(
                        child: Column(children: [
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            '2w1U', _lv1_v1_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            '1U1W', _lv1_v2_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            '1W2v', _lv1_v3_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            '1W2w', _lv1_v4_Controller),
                      ]))
                    : Container(),
                ntr.vectorGroup.contains('Yd1')
                    ? Card(
                        child: Column(children: [
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            '1U2v ', _lv1_v1_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            '2v1N', _lv1_v2_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            '1W2w ', _lv1_v3_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            '1V2w', _lv1_v4_Controller),
                      ]))
                    : Container(),
                ntr.vectorGroup.contains('Yd11')
                    ? Card(
                        child: Column(children: [
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            '1U2w  ', _lv1_v1_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            '2wN', _lv1_v2_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            '1V2v  ', _lv1_v3_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            '1W2v', _lv1_v4_Controller),
                      ]))
                    : Container(),
                Text(
                  'LV2',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5),
                ),
                ntr.vectorGroup.contains('Dd0')
                    ? Card(
                        child: Column(children: [
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            '1U3w', _lv2_v1_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            '3w1W', _lv2_v2_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            '1W3w', _lv2_v3_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            '1W3v', _lv2_v4_Controller),
                      ]))
                    : Container(),
                ntr.vectorGroup.contains('Dd6')
                    ? Card(
                        child: Column(children: [
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            '3w1U', _lv2_v1_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            '1U1W', _lv2_v2_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            '1W3v', _lv2_v3_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            '1W3w', _lv2_v4_Controller),
                      ]))
                    : Container(),
                ntr.vectorGroup.contains('Yd1')
                    ? Card(
                        child: Column(children: [
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            '1U3v', _lv2_v1_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            '3v1N', _lv2_v2_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            '1W3w', _lv2_v3_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            '1V3w', _lv2_v4_Controller),
                      ]))
                    : Container(),
                ntr.vectorGroup.contains('Yd11')
                    ? Card(
                        child: Column(children: [
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            '1U3w', _lv2_v1_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            '3wN', _lv2_v2_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            '1V3v', _lv2_v3_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            '1W3v', _lv2_v4_Controller),
                      ]))
                    : Container(),
                checkVectoreGroup(ntr)
                    ? Container()
                    : Card(
                        child: Column(
                        children: [
                          Text(
                            'LV3',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5),
                          ),
                          ntr.vectorGroup.contains('Dd0')
                              ? Card(
                                  child: Column(children: [
                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                      '1U4w', _lv3_v1_Controller),
                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                      '4w1W', _lv3_v2_Controller),
                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                      '1W4w', _lv3_v3_Controller),
                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                      '1W4v', _lv3_v4_Controller),
                                ]))
                              : Container(),
                          ntr.vectorGroup.contains('Dd6')
                              ? Card(
                                  child: Column(children: [
                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                      '4w1U', _lv3_v1_Controller),
                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                      '1U1W', _lv3_v2_Controller),
                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                      '1W4v', _lv3_v3_Controller),
                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                      '1W4w', _lv3_v4_Controller),
                                ]))
                              : Container(),
                          ntr.vectorGroup.contains('Yd1')
                              ? Card(
                                  child: Column(children: [
                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                      '1U4v ', _lv3_v1_Controller),
                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                      '4v1N', _lv3_v2_Controller),
                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                      '1W4w ', _lv3_v3_Controller),
                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                      '1V4w', _lv3_v4_Controller),
                                ]))
                              : Container(),
                          ntr.vectorGroup.contains('Yd11')
                              ? Card(
                                  child: Column(children: [
                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                      '1U4w  ', _lv3_v1_Controller),
                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                      '4wN', _lv3_v2_Controller),
                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                      '1V4v  ', _lv3_v3_Controller),
                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                      '1W4v', _lv3_v4_Controller),
                                ]))
                              : Container(),
                          Text(
                            'LV4',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5),
                          ),
                          ntr.vectorGroup.contains('Dd0')
                              ? Card(
                                  child: Column(children: [
                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                      '1U5w', _lv4_v1_Controller),
                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                      '5w1W', _lv4_v2_Controller),
                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                      '1W5w', _lv4_v3_Controller),
                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                      '1W5v', _lv4_v4_Controller),
                                ]))
                              : Container(),
                          ntr.vectorGroup.contains('Dd6')
                              ? Card(
                                  child: Column(children: [
                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                      '5w1U', _lv4_v1_Controller),
                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                      '1U1W', _lv4_v2_Controller),
                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                      '1W5v', _lv4_v3_Controller),
                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                      '1W5w', _lv4_v4_Controller),
                                ]))
                              : Container(),
                          ntr.vectorGroup.contains('Yd1')
                              ? Card(
                                  child: Column(children: [
                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                      '1U5v', _lv4_v1_Controller),
                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                      '5v1N', _lv4_v2_Controller),
                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                      '1W5w', _lv4_v3_Controller),
                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                      '1V5w', _lv4_v4_Controller),
                                ]))
                              : Container(),
                          ntr.vectorGroup.contains('Yd11')
                              ? Card(
                                  child: Column(children: [
                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                      '1U5w', _lv4_v1_Controller),
                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                      '5wN', _lv4_v2_Controller),
                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                      '1V5v', _lv4_v3_Controller),
                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                      '1W5v', _lv4_v4_Controller),
                                ]))
                              : Container(),
                        ],
                      ))
              ]),
            ),
          );
        }
      }),
    );
  }

  bool checkVectoreGroup(ItModel ntr) {
    return ntr.vectorGroup.toLowerCase() == 'dd0/dd0' ||
        ntr.vectorGroup.toLowerCase() == 'dd6/dd6' ||
        ntr.vectorGroup.toLowerCase() == 'yd1d1' ||
        ntr.vectorGroup.toLowerCase() == 'yd11d11';
  }
}
