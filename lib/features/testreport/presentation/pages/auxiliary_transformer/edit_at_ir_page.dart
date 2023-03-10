// ignore_for_file: missing_return, missing_required_param, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../data/models/equipment/AT/AT_ir_model.dart';
import '../../providers/at_provider/at_ir_provider.dart';
import '../dropdown_All/MegaGigaTeraRadioButton/ct_wr_radio_button_page.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditATirPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditATirPage(this.args, {Key key}) : super(key: key);

  ATcoreIRModel _atIrTestModel;

  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _Trno_Controller = TextEditingController();
  final TextEditingController _serialNo_Controller = TextEditingController();
  final TextEditingController _hvE_1min_Controller = TextEditingController();
  final TextEditingController _hvE_10min_Controller = TextEditingController();
  final TextEditingController _hvE_PImin_Controller = TextEditingController();
  final TextEditingController _hvLV_1min_Controller = TextEditingController();
  final TextEditingController _hvLV_10min_Controller = TextEditingController();
  final TextEditingController _hvLV_PImin_Controller = TextEditingController();
  final TextEditingController _lvE_1min_Controller = TextEditingController();
  final TextEditingController _lvE_10min_Controller = TextEditingController();
  final TextEditingController _lvE_PImin_Controller = TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Enum_ct_wr get selected_hvE_1min => Radio_R_1S1_1S2().get_Radio_R_1S1_1S2();
  Enum_ct_wr get selected_hvE_10min => Radio_R_2S1_2S2().get_Radio_R_2S1_2S2();
  Enum_ct_wr get selected_hvE_PImin => Radio_R_3S1_3S2().get_Radio_R_3S1_3S2();

  Enum_ct_wr get selected_hvLV_1min => Radio_Y_1S1_1S2().get_Radio_Y_1S1_1S2();
  Enum_ct_wr get selected_hvLV_10min => Radio_Y_2S1_2S2().get_Radio_Y_2S1_2S2();
  Enum_ct_wr get selected_hvLV_PImin => Radio_Y_3S1_3S2().get_Radio_Y_3S1_3S2();

  Enum_ct_wr get selected_lvE_1min => Radio_B_1S1_1S2().get_Radio_B_1S1_1S2();
  Enum_ct_wr get selected_lvE_10min => Radio_B_2S1_2S2().get_Radio_B_2S1_2S2();
  Enum_ct_wr get selected_lvE_PImin => Radio_B_3S1_3S2().get_Radio_B_3S1_3S2();

  Future<void> getReport() async {
    getX((ATcoreIRProvider x) => x.getATcoreIR_ById(args['id']));
    _atIrTestModel = watchOnly((ATcoreIRProvider x) => x.atcoreIR_Model);

    _IDcontroller.text = _atIrTestModel.id.toString();
    _Trno_Controller.text = _atIrTestModel.trNo.toString();
    _serialNo_Controller.text = _atIrTestModel.serialNo.toString();
    _hvE_1min_Controller.text = _atIrTestModel.hvE_1min.toString();
    _hvE_10min_Controller.text = _atIrTestModel.hvE_10min.toString();
    _hvE_PImin_Controller.text = _atIrTestModel.hvE_PImin.toString();
    _hvLV_1min_Controller.text = _atIrTestModel.hvLV_1min.toString();
    _hvLV_10min_Controller.text = _atIrTestModel.hvLV_10min.toString();
    _hvLV_PImin_Controller.text = _atIrTestModel.hvLV_PImin.toString();
    _lvE_1min_Controller.text = _atIrTestModel.lvE_1min.toString();
    _lvE_10min_Controller.text = _atIrTestModel.lvE_10min.toString();
    _lvE_PImin_Controller.text = _atIrTestModel.lvE_PImin.toString();
  }

  @override
  Widget build(BuildContext context) {
    final ATcoreIRModel ntr =
        watchOnly((ATcoreIRProvider x) => x.atcoreIR_Model);
    getReport();
    var mob = const Text('Edit AT-Ir Details', style: TextStyle(fontSize: 15));
    var desk = const Text('Edit AT-Ir Details', style: TextStyle(fontSize: 20));

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

                  double hvE_1min;
                  double hvE_10min;
                  double hvE_PImin;
                  double hvLV_1min;
                  double hvLV_10min;
                  double hvLV_PImin;
                  double lvE_1min;
                  double lvE_10min;
                  double lvE_PImin;

                  hvE_1min = convertValue(
                      double.parse(_hvE_1min_Controller.text),
                      selected_hvE_1min.toString().split('.')[1]);

                  hvE_10min = convertValue(
                      double.parse(_hvE_10min_Controller.text),
                      selected_hvE_10min.toString().split('.')[1]);

                  hvE_PImin = convertValue(
                      double.parse(_hvE_PImin_Controller.text),
                      selected_hvE_PImin.toString().split('.')[1]);

                  hvLV_1min = convertValue(
                      double.parse(_hvLV_1min_Controller.text),
                      selected_hvLV_1min.toString().split('.')[1]);

                  hvLV_10min = convertValue(
                      double.parse(_hvLV_10min_Controller.text),
                      selected_hvLV_10min.toString().split('.')[1]);

                  hvLV_PImin = convertValue(
                      double.parse(_hvLV_PImin_Controller.text),
                      selected_hvLV_PImin.toString().split('.')[1]);

                  lvE_1min = convertValue(
                      double.parse(_lvE_1min_Controller.text),
                      selected_lvE_1min.toString().split('.')[1]);

                  lvE_10min = convertValue(
                      double.parse(_lvE_10min_Controller.text),
                      selected_lvE_10min.toString().split('.')[1]);

                  lvE_PImin = convertValue(
                      double.parse(_lvE_PImin_Controller.text),
                      selected_lvE_PImin.toString().split('.')[1]);

                  //add to remote database
                  var success_code = 201;
                  var success_code1 = 200;
                  var failed_code = 'Server Connection Lost';
                  //add to remote database
                  var url = Uri.parse('${Env.URL_PREFIX}/atIrTest/' +
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
                    'serialNo': args['AT_ID'].toString(),
                    'equipmentUsed': selectedValueForEquipmentUse.toString(),
                    'hvE_1min': hvE_1min.toString(),
                    'hvE_10min': hvE_10min.toString(),
                    'hvE_PImin': hvE_PImin.toString(),
                    'hvLV_1min': hvLV_1min.toString(),
                    'hvLV_10min': hvLV_10min.toString(),
                    'hvLV_PImin': hvLV_PImin.toString(),
                    'lvE_1min': lvE_1min.toString(),
                    'lvE_10min': lvE_10min.toString(),
                    'lvE_PImin': lvE_PImin.toString(),
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
                    final ATcoreIRModel atIrReportToLocal = ATcoreIRModel(
                      trNo: int.parse(_Trno_Controller.text),
                      serialNo: _serialNo_Controller.text,
                      hvE_1min: hvE_1min,
                      hvE_10min: hvE_10min,
                      hvE_PImin: hvE_PImin,
                      hvLV_1min: hvLV_1min,
                      hvLV_10min: hvLV_10min,
                      hvLV_PImin: hvLV_PImin,
                      lvE_1min: lvE_1min,
                      lvE_10min: lvE_10min,
                      lvE_PImin: lvE_PImin,
                      equipmentUsed: selectedValueForEquipmentUse.toString(),
                      databaseID: ntr.databaseID,
                      updateDate: DateTime.now(),
                    );

                    getX((ATcoreIRProvider x) =>
                        x.updateATcoreIR(atIrReportToLocal, args['id']));
                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_ATcoreIR',
                        arguments: {
                          'id': args['id'],
                          'AT_ID': args['AT_ID'],
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
                      controller: _IDcontroller,
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
                  Radio_R_1S1_1S2(), //hvE_1min
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'hvE_1min', _hvE_1min_Controller),
                  Radio_R_2S1_2S2(), //hvE_10min
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'hvE_10min', _hvE_10min_Controller),
                  Radio_R_3S1_3S2(), //hvE_PImin
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'hvE_PImin', _hvE_PImin_Controller),
                  Radio_Y_1S1_1S2(), //hvLV_1min
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'hvLV_1min', _hvLV_1min_Controller),
                  Radio_Y_2S1_2S2(), //hvLV_10min
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'hvLV_10min', _hvLV_10min_Controller),
                  Radio_Y_3S1_3S2(), //hvLV_PImin
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'hvLV_PImin', _hvLV_PImin_Controller),
                  Radio_B_1S1_1S2(), //lvE_1min
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'lvE_1min', _lvE_1min_Controller),
                  Radio_B_2S1_2S2(), //lvE_10min
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'lvE_10min', _lvE_10min_Controller),
                  Radio_B_3S1_3S2(), //lvE_PImin
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'lvE_PImin', _lvE_PImin_Controller),
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
                    controller: _IDcontroller,
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
                  Radio_R_1S1_1S2(), //hvE_1min
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'hvE_1min', _hvE_1min_Controller),
                  Radio_R_2S1_2S2(), //hvE_10min
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'hvE_10min', _hvE_10min_Controller),
                  Radio_R_3S1_3S2(), //hvE_PImin
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'hvE_PImin', _hvE_PImin_Controller),
                  Radio_Y_1S1_1S2(), //hvLV_1min
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'hvLV_1min', _hvLV_1min_Controller),
                  Radio_Y_2S1_2S2(), //hvLV_10min
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'hvLV_10min', _hvLV_10min_Controller),
                  Radio_Y_3S1_3S2(), //hvLV_PImin
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'hvLV_PImin', _hvLV_PImin_Controller),
                  Radio_B_1S1_1S2(), //lvE_1min
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'lvE_1min', _lvE_1min_Controller),
                  Radio_B_2S1_2S2(), //lvE_10min
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'lvE_10min', _lvE_10min_Controller),
                  Radio_B_3S1_3S2(), //lvE_PImin
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'lvE_PImin', _lvE_PImin_Controller),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
