import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../data/models/equipment/IT/it_model.dart';
import '../../../data/models/equipment/IT/it_r_model.dart';
import '../../providers/it_provider/it_provider.dart';
import '../../providers/it_provider/it_r_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditItRPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditItRPage(this.args, {Key key}) : super(key: key);

  ItRTestModel _itRTestModel;

  final TextEditingController _Trno_Controller = TextEditingController();
  final TextEditingController _serialNo_Controller = TextEditingController();

  final TextEditingController _tapPosition_Controller = TextEditingController();

  final TextEditingController _hv_uv_Controller = TextEditingController();
  final TextEditingController _hv_vw_Controller = TextEditingController();
  final TextEditingController _hv_wu_Controller = TextEditingController();
  final TextEditingController _lv1_uv_Controller = TextEditingController();
  final TextEditingController _lv1_vw_Controller = TextEditingController();
  final TextEditingController _lv1_wu_Controller = TextEditingController();
  final TextEditingController _lv2_uv_Controller = TextEditingController();
  final TextEditingController _lv2_vw_Controller = TextEditingController();
  final TextEditingController _lv2_wu_Controller = TextEditingController();
  final TextEditingController _lv3_uv_Controller = TextEditingController();
  final TextEditingController _lv3_vw_Controller = TextEditingController();
  final TextEditingController _lv3_wu_Controller = TextEditingController();
  final TextEditingController _lv4_uv_Controller = TextEditingController();
  final TextEditingController _lv4_vw_Controller = TextEditingController();
  final TextEditingController _lv4_wu_Controller = TextEditingController();

  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Future<void> getReport() async {
    getX((ItRProvider x) => x.getItRByID(args['id']));
    _itRTestModel = watchOnly((ItRProvider x) => x.itRModel);

    _Trno_Controller.text = args['TrNo'].toString();
    _serialNo_Controller.text = args['SerialNo'];
    _tapPosition_Controller.text = _itRTestModel.tapPosition;
    _hv_uv_Controller.text = _itRTestModel.hv_uv.toString();
    _hv_vw_Controller.text = _itRTestModel.hv_vw.toString();
    _hv_wu_Controller.text = _itRTestModel.hv_wu.toString();
    _lv1_uv_Controller.text = _itRTestModel.lv1_uv.toString();
    _lv1_vw_Controller.text = _itRTestModel.lv1_vw.toString();
    _lv1_wu_Controller.text = _itRTestModel.lv1_wu.toString();
    _lv2_uv_Controller.text = _itRTestModel.lv2_uv.toString();
    _lv2_vw_Controller.text = _itRTestModel.lv2_vw.toString();
    _lv2_wu_Controller.text = _itRTestModel.lv2_wu.toString();
    _lv3_uv_Controller.text = _itRTestModel.lv3_uv.toString();
    _lv3_vw_Controller.text = _itRTestModel.lv3_vw.toString();
    _lv3_wu_Controller.text = _itRTestModel.lv3_wu.toString();
    _lv4_uv_Controller.text = _itRTestModel.lv4_uv.toString();
    _lv4_vw_Controller.text = _itRTestModel.lv4_vw.toString();
    _lv4_wu_Controller.text = _itRTestModel.lv4_wu.toString();
  }

  @override
  Widget build(BuildContext context) {
    final ItModel ntr1 = watchOnly((ItProvider x) => x.itModel);

    final ItRTestModel ntr = watchOnly((ItRProvider x) => x.itRModel);
    getReport();
    var mob = const Text('Edit IT-R Details', style: TextStyle(fontSize: 15));
    var desk = const Text('Edit IT-R Details', style: TextStyle(fontSize: 20));

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
                    _lv3_uv_Controller.text = "0.0";
                    _lv3_vw_Controller.text = '0.0';
                    _lv3_wu_Controller.text = "0.0";
                    _lv4_uv_Controller.text = "0.0";
                    _lv4_vw_Controller.text = '0.0';
                    _lv4_wu_Controller.text = "0.0";
                  }
                  //add to remote database
                  var url = Uri.parse('${Env.URL_PREFIX}/itRTest/' +
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
                    'tapPosition': _tapPosition_Controller.text,
                    'hv_uv': _hv_uv_Controller.text.toString(),
                    'hv_vw': _hv_vw_Controller.text.toString(),
                    'hv_wu': _hv_wu_Controller.text.toString(),
                    'lv1_uv': _lv1_uv_Controller.text.toString(),
                    'lv1_vw': _lv1_vw_Controller.text.toString(),
                    'lv1_wu': _lv1_wu_Controller.text.toString(),
                    'lv2_uv': _lv2_uv_Controller.text.toString(),
                    'lv2_vw': _lv2_vw_Controller.text.toString(),
                    'lv2_wu': _lv2_wu_Controller.text.toString(),
                    'lv3_uv': _lv3_uv_Controller.text.toString(),
                    'lv3_vw': _lv3_vw_Controller.text.toString(),
                    'lv3_wu': _lv3_wu_Controller.text.toString(),
                    'lv4_uv': _lv4_uv_Controller.text.toString(),
                    'lv4_vw': _lv4_vw_Controller.text.toString(),
                    'lv4_wu': _lv4_wu_Controller.text.toString(),
                    "updateDate": DateTime.now().toString(),
                  };
                  var response = await http.put(url,
                      body: jsonEncode(payload), headers: headers);

                  if (response.statusCode == success_code ||
                      response.statusCode == success_code1) {
                    print('Response status: ${response.statusCode}');
                    print('Response body: ${response.body}');
                    print('Stored successfully');
                    print(double.parse(_hv_vw_Controller.text));

                    //add to local database
                    final ItRTestModel itRReportToLocal = ItRTestModel(
                      trNo: int.parse(_Trno_Controller.text),
                      serialNo: _serialNo_Controller.text,
                      tapPosition: _tapPosition_Controller.text,
                      hv_uv: double.parse(_hv_uv_Controller.text),
                      hv_vw: double.parse(_hv_vw_Controller.text),
                      hv_wu: double.parse(_hv_wu_Controller.text),
                      lv1_uv: double.parse(_lv1_uv_Controller.text),
                      lv1_vw: double.parse(_lv1_vw_Controller.text),
                      lv1_wu: double.parse(_lv1_wu_Controller.text),
                      lv2_uv: double.parse(_lv2_uv_Controller.text),
                      lv2_vw: double.parse(_lv2_vw_Controller.text),
                      lv2_wu: double.parse(_lv2_wu_Controller.text),
                      lv3_uv: double.parse(_lv3_uv_Controller.text),
                      lv3_vw: double.parse(_lv3_vw_Controller.text),
                      lv3_wu: double.parse(_lv3_wu_Controller.text),
                      lv4_uv: double.parse(_lv4_uv_Controller.text),
                      lv4_vw: double.parse(_lv4_vw_Controller.text),
                      lv4_wu: double.parse(_lv4_wu_Controller.text),
                      databaseID: ntr.databaseID,
                      equipmentUsed: selectedValueForEquipmentUse.toString(),
                      updateDate: DateTime.now(),
                    );
                    print("Added to local DB");
                    print(itRReportToLocal);
                    getX((ItRProvider x) =>
                        x.updateItR(itRReportToLocal, args['id']));

                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_IT_R',
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
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Tap Position', _tapPosition_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Applied Voltage HV Side (V)-U-V', _hv_uv_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Applied Voltage HV Side (V)-V-W', _hv_vw_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Applied Voltage HV Side (V)-W-U', _hv_wu_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Measured Voltage LV1 Side (V) -U-V', _lv1_uv_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Measured Voltage LV1 Side (V) -V-W', _lv1_vw_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Measured Voltage LV1 Side (V) -W-U', _lv1_wu_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Measured Voltage LV2 Side (V) -U-V', _lv2_uv_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Measured Voltage LV2 Side (V) -V-W', _lv2_vw_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Measured Voltage LV2 Side (V) -W-U', _lv2_wu_Controller),
                checkVectoreGroup(ntr)
                    ? Container()
                    : Card(
                        child: Column(
                        children: [
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'Measured Voltage LV3 Side (V) -U-V',
                              _lv3_uv_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'Measured Voltage LV3 Side (V) -V-W',
                              _lv3_vw_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'Measured Voltage LV3 Side (V) -W-U',
                              _lv3_wu_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'Measured Voltage LV4 Side (V) -U-V',
                              _lv4_uv_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'Measured Voltage LV4 Side (V) -V-W',
                              _lv4_vw_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'Measured Voltage LV4 Side (V) -W-U',
                              _lv4_wu_Controller),
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
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Tap Position', _tapPosition_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Applied Voltage HV Side (V)-U-V', _hv_uv_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Applied Voltage HV Side (V)-V-W', _hv_vw_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Applied Voltage HV Side (V)-W-U', _hv_wu_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Measured Voltage LV1 Side (V) -U-V', _lv1_uv_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Measured Voltage LV1 Side (V) -V-W', _lv1_vw_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Measured Voltage LV1 Side (V) -W-U', _lv1_wu_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Measured Voltage LV2 Side (V) -U-V', _lv2_uv_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Measured Voltage LV2 Side (V) -V-W', _lv2_vw_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Measured Voltage LV2 Side (V) -W-U', _lv2_wu_Controller),
                checkVectoreGroup(ntr)
                    ? Container()
                    : Card(
                        child: Column(
                        children: [
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'Measured Voltage LV3 Side (V) -U-V',
                              _lv3_uv_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'Measured Voltage LV3 Side (V) -V-W',
                              _lv3_vw_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'Measured Voltage LV3 Side (V) -W-U',
                              _lv3_wu_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'Measured Voltage LV4 Side (V) -U-V',
                              _lv4_uv_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'Measured Voltage LV4 Side (V) -V-W',
                              _lv4_vw_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'Measured Voltage LV4 Side (V) -W-U',
                              _lv4_wu_Controller),
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
