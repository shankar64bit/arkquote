import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../data/models/equipment/IT/it_mb_model.dart';
import '../../../data/models/equipment/IT/it_model.dart';
import '../../providers/it_provider/it_mb_provider.dart';
import '../../providers/it_provider/it_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditItMbPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditItMbPage(this.args, {Key key}) : super(key: key);

  ItMbTestModel _itMbTestModel;

  final TextEditingController _Trno_Controller = TextEditingController();
  final TextEditingController _serialNo_Controller = TextEditingController();

  final TextEditingController _r_hv_uv_Controller = TextEditingController();
  final TextEditingController _r_hv_vw_Controller = TextEditingController();
  final TextEditingController _r_hv_wu_Controller = TextEditingController();
  final TextEditingController _r_lv1_uv_Controller = TextEditingController();
  final TextEditingController _r_lv1_vw_Controller = TextEditingController();
  final TextEditingController _r_lv1_wu_Controller = TextEditingController();
  final TextEditingController _r_lv2_uv_Controller = TextEditingController();
  final TextEditingController _r_lv2_vw_Controller = TextEditingController();
  final TextEditingController _r_lv2_wu_Controller = TextEditingController();
  final TextEditingController _r_lv3_uv_Controller = TextEditingController();
  final TextEditingController _r_lv3_vw_Controller = TextEditingController();
  final TextEditingController _r_lv3_wu_Controller = TextEditingController();
  final TextEditingController _r_lv4_uv_Controller = TextEditingController();
  final TextEditingController _r_lv4_vw_Controller = TextEditingController();
  final TextEditingController _r_lv4_wu_Controller = TextEditingController();

  final TextEditingController _y_hv_uv_Controller = TextEditingController();
  final TextEditingController _y_hv_vw_Controller = TextEditingController();
  final TextEditingController _y_hv_wu_Controller = TextEditingController();
  final TextEditingController _y_lv1_uv_Controller = TextEditingController();
  final TextEditingController _y_lv1_vw_Controller = TextEditingController();
  final TextEditingController _y_lv1_wu_Controller = TextEditingController();
  final TextEditingController _y_lv2_uv_Controller = TextEditingController();
  final TextEditingController _y_lv2_vw_Controller = TextEditingController();
  final TextEditingController _y_lv2_wu_Controller = TextEditingController();
  final TextEditingController _y_lv3_uv_Controller = TextEditingController();
  final TextEditingController _y_lv3_vw_Controller = TextEditingController();
  final TextEditingController _y_lv3_wu_Controller = TextEditingController();
  final TextEditingController _y_lv4_uv_Controller = TextEditingController();
  final TextEditingController _y_lv4_vw_Controller = TextEditingController();
  final TextEditingController _y_lv4_wu_Controller = TextEditingController();

  final TextEditingController _b_hv_uv_Controller = TextEditingController();
  final TextEditingController _b_hv_vw_Controller = TextEditingController();
  final TextEditingController _b_hv_wu_Controller = TextEditingController();
  final TextEditingController _b_lv1_uv_Controller = TextEditingController();
  final TextEditingController _b_lv1_vw_Controller = TextEditingController();
  final TextEditingController _b_lv1_wu_Controller = TextEditingController();
  final TextEditingController _b_lv2_uv_Controller = TextEditingController();
  final TextEditingController _b_lv2_vw_Controller = TextEditingController();
  final TextEditingController _b_lv2_wu_Controller = TextEditingController();
  final TextEditingController _b_lv3_uv_Controller = TextEditingController();
  final TextEditingController _b_lv3_vw_Controller = TextEditingController();
  final TextEditingController _b_lv3_wu_Controller = TextEditingController();
  final TextEditingController _b_lv4_uv_Controller = TextEditingController();
  final TextEditingController _b_lv4_vw_Controller = TextEditingController();
  final TextEditingController _b_lv4_wu_Controller = TextEditingController();

  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Future<void> getReport() async {
    getX((ItMbProvider x) => x.getItMbByID(args['id']));
    _itMbTestModel = watchOnly((ItMbProvider x) => x.itMbModel);

    _Trno_Controller.text = args['TrNo'].toString();
    _serialNo_Controller.text = args['SerialNo'];
    _r_hv_uv_Controller.text = _itMbTestModel.r_hv_uv.toString();
    _r_hv_vw_Controller.text = _itMbTestModel.r_hv_vw.toString();
    _r_hv_wu_Controller.text = _itMbTestModel.r_hv_wu.toString();
    _r_lv1_uv_Controller.text = _itMbTestModel.r_lv1_uv.toString();
    _r_lv1_vw_Controller.text = _itMbTestModel.r_lv1_vw.toString();
    _r_lv1_wu_Controller.text = _itMbTestModel.r_lv1_wu.toString();
    _r_lv2_uv_Controller.text = _itMbTestModel.r_lv2_uv.toString();
    _r_lv2_vw_Controller.text = _itMbTestModel.r_lv2_vw.toString();
    _r_lv2_wu_Controller.text = _itMbTestModel.r_lv2_wu.toString();
    _r_lv3_uv_Controller.text = _itMbTestModel.r_lv3_uv.toString();
    _r_lv3_vw_Controller.text = _itMbTestModel.r_lv3_vw.toString();
    _r_lv3_wu_Controller.text = _itMbTestModel.r_lv3_wu.toString();
    _r_lv4_uv_Controller.text = _itMbTestModel.r_lv4_uv.toString();
    _r_lv4_vw_Controller.text = _itMbTestModel.r_lv4_vw.toString();
    _r_lv4_wu_Controller.text = _itMbTestModel.r_lv4_wu.toString();

    _y_hv_uv_Controller.text = _itMbTestModel.y_hv_uv.toString();
    _y_hv_vw_Controller.text = _itMbTestModel.y_hv_vw.toString();
    _y_hv_wu_Controller.text = _itMbTestModel.y_hv_wu.toString();
    _y_lv1_uv_Controller.text = _itMbTestModel.y_lv1_uv.toString();
    _y_lv1_vw_Controller.text = _itMbTestModel.y_lv1_vw.toString();
    _y_lv1_wu_Controller.text = _itMbTestModel.y_lv1_wu.toString();
    _y_lv2_uv_Controller.text = _itMbTestModel.y_lv2_uv.toString();
    _y_lv2_vw_Controller.text = _itMbTestModel.y_lv2_vw.toString();
    _y_lv2_wu_Controller.text = _itMbTestModel.y_lv2_wu.toString();
    _y_lv3_uv_Controller.text = _itMbTestModel.y_lv3_uv.toString();
    _y_lv3_vw_Controller.text = _itMbTestModel.y_lv3_vw.toString();
    _y_lv3_wu_Controller.text = _itMbTestModel.y_lv3_wu.toString();
    _y_lv4_uv_Controller.text = _itMbTestModel.y_lv4_uv.toString();
    _y_lv4_vw_Controller.text = _itMbTestModel.y_lv4_vw.toString();
    _y_lv4_wu_Controller.text = _itMbTestModel.y_lv4_wu.toString();

    _b_hv_uv_Controller.text = _itMbTestModel.b_hv_uv.toString();
    _b_hv_vw_Controller.text = _itMbTestModel.b_hv_vw.toString();
    _b_hv_wu_Controller.text = _itMbTestModel.b_hv_wu.toString();
    _b_lv1_uv_Controller.text = _itMbTestModel.b_lv1_uv.toString();
    _b_lv1_vw_Controller.text = _itMbTestModel.b_lv1_vw.toString();
    _b_lv1_wu_Controller.text = _itMbTestModel.b_lv1_wu.toString();
    _b_lv2_uv_Controller.text = _itMbTestModel.b_lv2_uv.toString();
    _b_lv2_vw_Controller.text = _itMbTestModel.b_lv2_vw.toString();
    _b_lv2_wu_Controller.text = _itMbTestModel.b_lv2_wu.toString();
    _b_lv3_uv_Controller.text = _itMbTestModel.b_lv3_uv.toString();
    _b_lv3_vw_Controller.text = _itMbTestModel.b_lv3_vw.toString();
    _b_lv3_wu_Controller.text = _itMbTestModel.b_lv3_wu.toString();
    _b_lv4_uv_Controller.text = _itMbTestModel.b_lv4_uv.toString();
    _b_lv4_vw_Controller.text = _itMbTestModel.b_lv4_vw.toString();
    _b_lv4_wu_Controller.text = _itMbTestModel.b_lv4_wu.toString();
  }

  @override
  Widget build(BuildContext context) {
    final ItModel ntr1 = watchOnly((ItProvider x) => x.itModel);

    final ItMbTestModel ntr = watchOnly((ItMbProvider x) => x.itMbModel);
    getReport();
    var mob = const Text('Edit IT-Mb Details', style: TextStyle(fontSize: 15));
    var desk = const Text('Edit IT-Mb Details', style: TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // ignore: missing_yeturn
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
                    _r_lv3_uv_Controller.text = "0.0";
                    _r_lv3_vw_Controller.text = '0.0';
                    _r_lv3_wu_Controller.text = "0.0";
                    _r_lv4_uv_Controller.text = "0.0";
                    _r_lv4_vw_Controller.text = '0.0';
                    _r_lv4_wu_Controller.text = "0.0";
                    _y_lv3_uv_Controller.text = "0.0";
                    _y_lv3_vw_Controller.text = '0.0';
                    _y_lv3_wu_Controller.text = "0.0";
                    _y_lv4_uv_Controller.text = "0.0";
                    _y_lv4_vw_Controller.text = '0.0';
                    _y_lv4_wu_Controller.text = "0.0";
                    _b_lv3_uv_Controller.text = "0.0";
                    _b_lv3_vw_Controller.text = '0.0';
                    _b_lv3_wu_Controller.text = "0.0";
                    _b_lv4_uv_Controller.text = "0.0";
                    _b_lv4_vw_Controller.text = '0.0';
                    _b_lv4_wu_Controller.text = "0.0";
                  }
                  //add to remote database
                  var url = Uri.parse('${Env.URL_PREFIX}/itMbTest/' +
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
                    'r_hv_uv': _r_hv_uv_Controller.text.toString(),
                    'r_hv_vw': _r_hv_vw_Controller.text.toString(),
                    'r_hv_wu': _r_hv_wu_Controller.text.toString(),
                    'r_lv1_uv': _r_lv1_uv_Controller.text.toString(),
                    'r_lv1_vw': _r_lv1_vw_Controller.text.toString(),
                    'r_lv1_wu': _r_lv1_wu_Controller.text.toString(),
                    'r_lv2_uv': _r_lv2_uv_Controller.text.toString(),
                    'r_lv2_vw': _r_lv2_vw_Controller.text.toString(),
                    'r_lv2_wu': _r_lv2_wu_Controller.text.toString(),
                    'r_lv3_uv': _r_lv3_uv_Controller.text.toString(),
                    'r_lv3_vw': _r_lv3_vw_Controller.text.toString(),
                    'r_lv3_wu': _r_lv3_wu_Controller.text.toString(),
                    'r_lv4_uv': _r_lv4_uv_Controller.text.toString(),
                    'r_lv4_vw': _r_lv4_vw_Controller.text.toString(),
                    'r_lv4_wu': _r_lv4_wu_Controller.text.toString(),
                    'y_hv_uv': _y_hv_uv_Controller.text.toString(),
                    'y_hv_vw': _y_hv_vw_Controller.text.toString(),
                    'y_hv_wu': _y_hv_wu_Controller.text.toString(),
                    'y_lv1_uv': _y_lv1_uv_Controller.text.toString(),
                    'y_lv1_vw': _y_lv1_vw_Controller.text.toString(),
                    'y_lv1_wu': _y_lv1_wu_Controller.text.toString(),
                    'y_lv2_uv': _y_lv2_uv_Controller.text.toString(),
                    'y_lv2_vw': _y_lv2_vw_Controller.text.toString(),
                    'y_lv2_wu': _y_lv2_wu_Controller.text.toString(),
                    'y_lv3_uv': _y_lv3_uv_Controller.text.toString(),
                    'y_lv3_vw': _y_lv3_vw_Controller.text.toString(),
                    'y_lv3_wu': _y_lv3_wu_Controller.text.toString(),
                    'y_lv4_uv': _y_lv4_uv_Controller.text.toString(),
                    'y_lv4_vw': _y_lv4_vw_Controller.text.toString(),
                    'y_lv4_wu': _y_lv4_wu_Controller.text.toString(),
                    'b_hv_uv': _b_hv_uv_Controller.text.toString(),
                    'b_hv_vw': _b_hv_vw_Controller.text.toString(),
                    'b_hv_wu': _b_hv_wu_Controller.text.toString(),
                    'b_lv1_uv': _b_lv1_uv_Controller.text.toString(),
                    'b_lv1_vw': _b_lv1_vw_Controller.text.toString(),
                    'b_lv1_wu': _b_lv1_wu_Controller.text.toString(),
                    'b_lv2_uv': _b_lv2_uv_Controller.text.toString(),
                    'b_lv2_vw': _b_lv2_vw_Controller.text.toString(),
                    'b_lv2_wu': _b_lv2_wu_Controller.text.toString(),
                    'b_lv3_uv': _b_lv3_uv_Controller.text.toString(),
                    'b_lv3_vw': _b_lv3_vw_Controller.text.toString(),
                    'b_lv3_wu': _b_lv3_wu_Controller.text.toString(),
                    'b_lv4_uv': _b_lv4_uv_Controller.text.toString(),
                    'b_lv4_vw': _b_lv4_vw_Controller.text.toString(),
                    'b_lv4_wu': _b_lv4_wu_Controller.text.toString(),
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
                    final ItMbTestModel itMbReportToLocal = ItMbTestModel(
                      trNo: int.parse(_Trno_Controller.text),
                      serialNo: _serialNo_Controller.text,
                      r_hv_uv: double.parse(_r_hv_uv_Controller.text),
                      r_hv_vw: double.parse(_r_hv_vw_Controller.text),
                      r_hv_wu: double.parse(_r_hv_wu_Controller.text),
                      r_lv1_uv: double.parse(_r_lv1_uv_Controller.text),
                      r_lv1_vw: double.parse(_r_lv1_vw_Controller.text),
                      r_lv1_wu: double.parse(_r_lv1_wu_Controller.text),
                      r_lv2_uv: double.parse(_r_lv2_uv_Controller.text),
                      r_lv2_vw: double.parse(_r_lv2_vw_Controller.text),
                      r_lv2_wu: double.parse(_r_lv2_wu_Controller.text),
                      r_lv3_uv: double.parse(_r_lv3_uv_Controller.text),
                      r_lv3_vw: double.parse(_r_lv3_vw_Controller.text),
                      r_lv3_wu: double.parse(_r_lv3_wu_Controller.text),
                      r_lv4_uv: double.parse(_r_lv4_uv_Controller.text),
                      r_lv4_vw: double.parse(_r_lv4_vw_Controller.text),
                      r_lv4_wu: double.parse(_r_lv4_wu_Controller.text),
                      y_hv_uv: double.parse(_y_hv_uv_Controller.text),
                      y_hv_vw: double.parse(_y_hv_vw_Controller.text),
                      y_hv_wu: double.parse(_y_hv_wu_Controller.text),
                      y_lv1_uv: double.parse(_y_lv1_uv_Controller.text),
                      y_lv1_vw: double.parse(_y_lv1_vw_Controller.text),
                      y_lv1_wu: double.parse(_y_lv1_wu_Controller.text),
                      y_lv2_uv: double.parse(_y_lv2_uv_Controller.text),
                      y_lv2_vw: double.parse(_y_lv2_vw_Controller.text),
                      y_lv2_wu: double.parse(_y_lv2_wu_Controller.text),
                      y_lv3_uv: double.parse(_y_lv3_uv_Controller.text),
                      y_lv3_vw: double.parse(_y_lv3_vw_Controller.text),
                      y_lv3_wu: double.parse(_y_lv3_wu_Controller.text),
                      y_lv4_uv: double.parse(_y_lv4_uv_Controller.text),
                      y_lv4_vw: double.parse(_y_lv4_vw_Controller.text),
                      y_lv4_wu: double.parse(_y_lv4_wu_Controller.text),
                      b_hv_uv: double.parse(_b_hv_uv_Controller.text),
                      b_hv_vw: double.parse(_b_hv_vw_Controller.text),
                      b_hv_wu: double.parse(_b_hv_wu_Controller.text),
                      b_lv1_uv: double.parse(_b_lv1_uv_Controller.text),
                      b_lv1_vw: double.parse(_b_lv1_vw_Controller.text),
                      b_lv1_wu: double.parse(_b_lv1_wu_Controller.text),
                      b_lv2_uv: double.parse(_b_lv2_uv_Controller.text),
                      b_lv2_vw: double.parse(_b_lv2_vw_Controller.text),
                      b_lv2_wu: double.parse(_b_lv2_wu_Controller.text),
                      b_lv3_uv: double.parse(_b_lv3_uv_Controller.text),
                      b_lv3_vw: double.parse(_b_lv3_vw_Controller.text),
                      b_lv3_wu: double.parse(_b_lv3_wu_Controller.text),
                      b_lv4_uv: double.parse(_b_lv4_uv_Controller.text),
                      b_lv4_vw: double.parse(_b_lv4_vw_Controller.text),
                      b_lv4_wu: double.parse(_b_lv4_wu_Controller.text),
                      databaseID: ntr.databaseID,
                      equipmentUsed: selectedValueForEquipmentUse.toString(),
                      updateDate: DateTime.now(),
                    );
                    print("Added to local DB");
                    print(itMbReportToLocal);
                    getX((ItMbProvider x) =>
                        x.updateItMb(itMbReportToLocal, args['id']));

                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_IT_MB',
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
                    'Measured Voltage HV Side (V)-R-Cut-U-V',
                    _r_hv_uv_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Measured Voltage HV Side (V)-R-Cut-V-W',
                    _r_hv_vw_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'AMeasured Voltage HV Side (V)-R-Cut-W-U',
                    _r_hv_wu_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Measured Voltage LV1 Side (V)-R-Cut-U-V',
                    _r_lv1_uv_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Measured Voltage LV1 Side (V)-R-Cut-V-W',
                    _r_lv1_vw_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Measured Voltage LV1 Side (V)-R-Cut-W-U',
                    _r_lv1_wu_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Measured Voltage LV2 Side (V)-R-Cut-U-V',
                    _r_lv2_uv_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Measured Voltage LV2 Side (V)-R-cut-V-W',
                    _r_lv2_vw_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Measured Voltage LV2 Side (V)-R-cut-W-U',
                    _r_lv2_wu_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Measured Voltage HV Side (V)-Y-Cut-U-V',
                    _y_hv_uv_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Measured Voltage HV Side (V)-Y-Cut-V-W',
                    _y_hv_vw_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'AMeasured Voltage HV Side (V)-Y-Cut-W-U',
                    _y_hv_wu_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Measured Voltage LV1 Side (V)-Y-Cut-U-V',
                    _y_lv1_uv_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Measured Voltage LV1 Side (V)-Y-Cut-V-W',
                    _y_lv1_vw_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Measured Voltage LV1 Side (V)-Y-Cut-W-U',
                    _y_lv1_wu_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Measured Voltage LV2 Side (V)-Y-Cut-U-V',
                    _y_lv2_uv_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Measured Voltage LV2 Side (V)-Y-cut-V-W',
                    _y_lv2_vw_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Measured Voltage LV2 Side (V)-Y-cut-W-U',
                    _y_lv2_wu_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Measured Voltage HV Side (V)-B-Cut-U-V',
                    _b_hv_uv_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Measured Voltage HV Side (V)-B-Cut-V-W',
                    _b_hv_vw_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'AMeasured Voltage HV Side (V)-B-Cut-W-U',
                    _b_hv_wu_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Measured Voltage LV1 Side (V)-B-Cut-U-V',
                    _b_lv1_uv_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Measured Voltage LV1 Side (V)-B-Cut-V-W',
                    _b_lv1_vw_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Measured Voltage LV1 Side (V)-B-Cut-W-U',
                    _b_lv1_wu_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Measured Voltage LV2 Side (V)-B-Cut-U-V',
                    _b_lv2_uv_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Measured Voltage LV2 Side (V)-B-cut-V-W',
                    _b_lv2_vw_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Measured Voltage LV2 Side (V)-B-cut-W-U',
                    _b_lv2_wu_Controller),
                checkVectoreGroup(ntr)
                    ? Container()
                    : Card(
                        child: Column(
                        children: [
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'Measured Voltage LV3 Side (V)-R-Cut-U-V',
                              _r_lv3_uv_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'Measured Voltage LV3 Side (V)-R-Cut-V-w',
                              _r_lv3_vw_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'Measured Voltage LV3 Side (V)-R-Cut-W-U',
                              _r_lv3_wu_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'Measured Voltage LV3 Side (V)-Y-Cut-U-V',
                              _y_lv3_uv_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'Measured Voltage LV3 Side (V)-Y-Cut-V-w',
                              _y_lv3_vw_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'Measured Voltage LV3 Side (V)-Y-Cut-W-U',
                              _y_lv3_wu_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'Measured Voltage LV3 Side (V)-B-Cut-U-V',
                              _b_lv3_uv_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'Measured Voltage LV3 Side (V)-B-Cut-V-w',
                              _b_lv3_vw_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'Measured Voltage LV3 Side (V)-B-Cut-W-U',
                              _b_lv3_wu_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'Measured Voltage LV4 Side (V)-R-Cut-U-V',
                              _r_lv4_uv_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'Measured Voltage LV4 Side (V)-R-Cut-V-w',
                              _r_lv4_vw_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'Measured Voltage LV4 Side (V)-R-Cut-W-U',
                              _r_lv4_wu_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'Measured Voltage LV4 Side (V)-Y-Cut-U-V',
                              _y_lv4_uv_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'Measured Voltage LV4 Side (V)-Y-Cut-V-w',
                              _y_lv4_vw_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'Measured Voltage LV4 Side (V)-Y-Cut-W-U',
                              _y_lv4_wu_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'Measured Voltage LV4 Side (V)-B-Cut-U-V',
                              _b_lv4_uv_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'Measured Voltage LV4 Side (V)-B-Cut-V-w',
                              _b_lv4_vw_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'Measured Voltage LV4 Side (V)-B-Cut-W-U',
                              _b_lv4_wu_Controller),
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
                    'Measured Voltage HV Side (V)-R-Cut-U-V',
                    _r_hv_uv_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Measured Voltage HV Side (V)-R-Cut-V-W',
                    _r_hv_vw_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'AMeasured Voltage HV Side (V)-R-Cut-W-U',
                    _r_hv_wu_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Measured Voltage LV1 Side (V)-R-Cut-U-V',
                    _r_lv1_uv_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Measured Voltage LV1 Side (V)-R-Cut-V-W',
                    _r_lv1_vw_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Measured Voltage LV1 Side (V)-R-Cut-W-U',
                    _r_lv1_wu_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Measured Voltage LV2 Side (V)-R-Cut-U-V',
                    _r_lv2_uv_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Measured Voltage LV2 Side (V)-R-cut-V-W',
                    _r_lv2_vw_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Measured Voltage LV2 Side (V)-R-cut-W-U',
                    _r_lv2_wu_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Measured Voltage HV Side (V)-Y-Cut-U-V',
                    _y_hv_uv_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Measured Voltage HV Side (V)-Y-Cut-V-W',
                    _y_hv_vw_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'AMeasured Voltage HV Side (V)-Y-Cut-W-U',
                    _y_hv_wu_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Measured Voltage LV1 Side (V)-Y-Cut-U-V',
                    _y_lv1_uv_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Measured Voltage LV1 Side (V)-Y-Cut-V-W',
                    _y_lv1_vw_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Measured Voltage LV1 Side (V)-Y-Cut-W-U',
                    _y_lv1_wu_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Measured Voltage LV2 Side (V)-Y-Cut-U-V',
                    _y_lv2_uv_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Measured Voltage LV2 Side (V)-Y-cut-V-W',
                    _y_lv2_vw_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Measured Voltage LV2 Side (V)-Y-cut-W-U',
                    _y_lv2_wu_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Measured Voltage HV Side (V)-B-Cut-U-V',
                    _b_hv_uv_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Measured Voltage HV Side (V)-B-Cut-V-W',
                    _b_hv_vw_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'AMeasured Voltage HV Side (V)-B-Cut-W-U',
                    _b_hv_wu_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Measured Voltage LV1 Side (V)-B-Cut-U-V',
                    _b_lv1_uv_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Measured Voltage LV1 Side (V)-B-Cut-V-W',
                    _b_lv1_vw_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Measured Voltage LV1 Side (V)-B-Cut-W-U',
                    _b_lv1_wu_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Measured Voltage LV2 Side (V)-B-Cut-U-V',
                    _b_lv2_uv_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Measured Voltage LV2 Side (V)-B-cut-V-W',
                    _b_lv2_vw_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Measured Voltage LV2 Side (V)-B-cut-W-U',
                    _b_lv2_wu_Controller),
                checkVectoreGroup(ntr)
                    ? Container()
                    : Card(
                        child: Column(
                        children: [
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'Measured Voltage LV3 Side (V)-R-Cut-U-V',
                              _r_lv3_uv_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'Measured Voltage LV3 Side (V)-R-Cut-V-w',
                              _r_lv3_vw_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'Measured Voltage LV3 Side (V)-R-Cut-W-U',
                              _r_lv3_wu_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'Measured Voltage LV3 Side (V)-Y-Cut-U-V',
                              _y_lv3_uv_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'Measured Voltage LV3 Side (V)-Y-Cut-V-w',
                              _y_lv3_vw_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'Measured Voltage LV3 Side (V)-Y-Cut-W-U',
                              _y_lv3_wu_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'Measured Voltage LV3 Side (V)-B-Cut-U-V',
                              _b_lv3_uv_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'Measured Voltage LV3 Side (V)-B-Cut-V-w',
                              _b_lv3_vw_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'Measured Voltage LV3 Side (V)-B-Cut-W-U',
                              _b_lv3_wu_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'Measured Voltage LV4 Side (V)-R-Cut-U-V',
                              _r_lv4_uv_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'Measured Voltage LV4 Side (V)-R-Cut-V-w',
                              _r_lv4_vw_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'Measured Voltage LV4 Side (V)-R-Cut-W-U',
                              _r_lv4_wu_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'Measured Voltage LV4 Side (V)-Y-Cut-U-V',
                              _y_lv4_uv_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'Measured Voltage LV4 Side (V)-Y-Cut-V-w',
                              _y_lv4_vw_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'Measured Voltage LV4 Side (V)-Y-Cut-W-U',
                              _y_lv4_wu_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'Measured Voltage LV4 Side (V)-B-Cut-U-V',
                              _b_lv4_uv_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'Measured Voltage LV4 Side (V)-B-Cut-V-w',
                              _b_lv4_vw_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'Measured Voltage LV4 Side (V)-B-Cut-W-U',
                              _b_lv4_wu_Controller),
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
        ntr.vectorGroup.toLowerCase() == 'Yd1d1' ||
        ntr.vectorGroup.toLowerCase() == 'Yd11d11';
  }
}
