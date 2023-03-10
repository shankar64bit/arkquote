import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/Auser_input_validation_exnt.dart/validation_extension_methods.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/widgets/custom_text_form_field.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../data/models/equipment/IT/it_ir_model.dart';
import '../../../data/models/equipment/IT/it_model.dart';
import '../../providers/it_provider/it_ir_provider.dart';
import '../../providers/it_provider/it_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';
import '../dropdown_All/responsive_tool/google_sign_in_out/login_page.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditItIrPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditItIrPage(this.args, {Key key}) : super(key: key);

  ItIrTestModel _itIrTestModel;
  final TextEditingController _IDcontroller = TextEditingController();

  final TextEditingController _Trno_Controller = TextEditingController();
  final TextEditingController _serialNo_Controller = TextEditingController();

  final TextEditingController _hvE_60_Controller = TextEditingController();
  final TextEditingController _hvE_600_Controller = TextEditingController();
  final TextEditingController _hvLV1_60_Controller = TextEditingController();
  final TextEditingController _hvLV1_600_Controller = TextEditingController();
  final TextEditingController _hvLV2_60_Controller = TextEditingController();
  final TextEditingController _hvLV2_600_Controller = TextEditingController();
  final TextEditingController _hvLV3_60_Controller = TextEditingController();
  final TextEditingController _hvLV3_600_Controller = TextEditingController();
  final TextEditingController _hvLV4_60_Controller = TextEditingController();
  final TextEditingController _hvLV4_600_Controller = TextEditingController();
  final TextEditingController _lv1EController = TextEditingController();
  final TextEditingController _lv2EController = TextEditingController();
  final TextEditingController _lv3EController = TextEditingController();
  final TextEditingController _lv4EController = TextEditingController();
  final TextEditingController _lv1Lv2_Controller = TextEditingController();
  final TextEditingController _lv1Lv3_Controller = TextEditingController();
  final TextEditingController _lv1Lv4_Controller = TextEditingController();
  final TextEditingController _lv2Lv3_Controller = TextEditingController();
  final TextEditingController _lv2Lv4_Controller = TextEditingController();
  final TextEditingController _lv3Lv4_Controller = TextEditingController();
  final TextEditingController _lv4Lv1_Controller = TextEditingController();

  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Future<void> getReport() async {
    getX((ItIrProvider x) => x.getItIrByID(args['id']));
    _itIrTestModel = watchOnly((ItIrProvider x) => x.itIrModel);

    _IDcontroller.text = args['id'].toString();
    _Trno_Controller.text = args['TrNo'].toString();
    _serialNo_Controller.text = args['SerialNo'];
    _hvE_600_Controller.text = _itIrTestModel.hvE_600.toString();
    _hvE_60_Controller.text = _itIrTestModel.hvE_60.toString();
    _hvLV1_60_Controller.text = _itIrTestModel.hvLv1_60.toString();
    _hvLV1_600_Controller.text = _itIrTestModel.hvLv1_600.toString();
    _hvLV2_60_Controller.text = _itIrTestModel.hvLv2_60.toString();
    _hvLV2_600_Controller.text = _itIrTestModel.hvLv2_600.toString();
    _hvLV3_60_Controller.text = _itIrTestModel.hvLv3_60.toString();
    _hvLV3_600_Controller.text = _itIrTestModel.hvLv3_600.toString();
    _hvLV4_60_Controller.text = _itIrTestModel.hvLv4_60.toString();
    _hvLV4_600_Controller.text = _itIrTestModel.hvLv4_600.toString();
    _lv1EController.text = _itIrTestModel.lv1E.toString();
    _lv2EController.text = _itIrTestModel.lv2E.toString();
    _lv3EController.text = _itIrTestModel.lv3E.toString();
    _lv4EController.text = _itIrTestModel.lv4E.toString();
    _lv1Lv2_Controller.text = _itIrTestModel.lv1Lv2.toString();
    _lv1Lv3_Controller.text = _itIrTestModel.lv1Lv3.toString();
    _lv1Lv4_Controller.text = _itIrTestModel.lv1Lv4.toString();
    _lv2Lv3_Controller.text = _itIrTestModel.lv2Lv3.toString();
    _lv2Lv4_Controller.text = _itIrTestModel.lv2Lv4.toString();

    _lv3Lv4_Controller.text = _itIrTestModel.lv3Lv4.toString();
    _lv4Lv1_Controller.text = _itIrTestModel.lv4Lv1.toString();
  }

  @override
  Widget build(BuildContext context) {
    final ItModel ntr1 = watchOnly((ItProvider x) => x.itModel);

    final ItIrTestModel ntr = watchOnly((ItIrProvider x) => x.itIrModel);
    getReport();
    var mob = const Text('Edit IT-IR Details', style: TextStyle(fontSize: 15));
    var desk = const Text('Edit IT-IR Details', style: TextStyle(fontSize: 20));

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
                  if (ntr1.vectorGroup.toLowerCase() == 'dd0/dd0' ||
                      ntr1.vectorGroup.toLowerCase() == 'dd6/dd6' ||
                      ntr1.vectorGroup.toLowerCase() == 'Yd1d1' ||
                      ntr1.vectorGroup.toLowerCase() == 'Yd11d11') {
                    _hvLV3_600_Controller.text = "0.0";
                    _hvLV3_60_Controller.text = '0.0';
                    _hvLV4_600_Controller.text = "0.0";
                    _hvLV4_60_Controller.text = '0.0';
                    _lv3EController.text = '0.0';
                    _lv4EController.text = '0.0';
                    _lv1Lv3_Controller.text = '0.0';
                    _lv1Lv4_Controller.text = '0.0';
                    _lv2Lv3_Controller.text = '0.0';
                    _lv2Lv4_Controller.text = '0.0';
                    _lv3Lv4_Controller.text = '0.0';
                    _lv4Lv1_Controller.text = '0.0';
                  }
                  //add to remote database
                  var url = Uri.parse('${Env.URL_PREFIX}/itIrTest/' +
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
                    'hvE_60': _hvE_60_Controller.text,
                    'hvE_600': _hvE_600_Controller.text,
                    'hvLv1_60': _hvLV1_60_Controller.text,
                    'hvLv1_600': _hvLV1_600_Controller.text,
                    'hvLv2_60': _hvLV2_60_Controller.text,
                    'hvLv2_600': _hvLV2_600_Controller.text,
                    'hvLv3_60': _hvLV3_60_Controller.text,
                    'hvLv3_600': _hvLV3_600_Controller.text,
                    'hvLv4_60': _hvLV4_60_Controller.text,
                    'hvLv4_600': _hvLV4_600_Controller.text,
                    'lv1E': _lv1EController.text,
                    'lv2E': _lv2EController.text,
                    'lv3E': _lv3EController.text,
                    'lv4E': _lv4EController.text,
                    'lv1Lv2': _lv1Lv2_Controller.text,
                    'lv1Lv3': _lv1Lv3_Controller.text,
                    'lv1Lv4': _lv1Lv4_Controller.text,
                    'lv2Lv3': _lv2Lv3_Controller.text,
                    'lv2Lv4': _lv2Lv4_Controller.text,
                    'lv3Lv4': _lv3Lv4_Controller.text,
                    'lv4Lv1': _lv4Lv1_Controller.text,
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
                    final ItIrTestModel itIrReportToLocal = ItIrTestModel(
                      trNo: int.parse(_Trno_Controller.text),
                      serialNo: _serialNo_Controller.text,
                      hvE_60: double.parse(_hvE_60_Controller.text),
                      hvE_600: double.parse(_hvE_600_Controller.text),
                      hvLv1_60: double.parse(_hvLV1_60_Controller.text),
                      hvLv1_600: double.parse(_hvLV1_600_Controller.text),
                      hvLv2_60: double.parse(_hvLV2_60_Controller.text),
                      hvLv2_600: double.parse(_hvLV2_600_Controller.text),
                      hvLv3_60: double.parse(_hvLV3_60_Controller.text),
                      hvLv3_600: double.parse(_hvLV3_600_Controller.text),
                      hvLv4_60: double.parse(_hvLV4_60_Controller.text),
                      hvLv4_600: double.parse(_hvLV4_600_Controller.text),
                      lv1E: double.parse(_lv1EController.text),
                      lv2E: double.parse(_lv2EController.text),
                      lv3E: double.parse(_lv3EController.text),
                      lv4E: double.parse(_lv4EController.text),
                      lv1Lv2: double.parse(_lv1Lv2_Controller.text),
                      lv1Lv3: double.parse(_lv1Lv3_Controller.text),
                      lv1Lv4: double.parse(_lv1Lv4_Controller.text),
                      lv2Lv3: double.parse(_lv2Lv3_Controller.text),
                      lv2Lv4: double.parse(_lv2Lv4_Controller.text),
                      lv3Lv4: double.parse(_lv3Lv4_Controller.text),
                      lv4Lv1: double.parse(_lv4Lv1_Controller.text),
                      databaseID: ntr.databaseID,
                      equipmentUsed: selectedValueForEquipmentUse.toString(),
                      updateDate: DateTime.now(),
                    );

                    getX((ItIrProvider x) =>
                        x.updateItIr(itIrReportToLocal, args['id']));
                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_IT_IR',
                        arguments: {
                          'id': args['id'],
                          'itirDatabaseID': ntr.databaseID,
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
                  controller: _IDcontroller,
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
                    'HV Earth 60 sec', _hvE_60_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'HV Earth 600 sec', _hvE_600_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'hvLv1 60 sec', _hvLV1_60_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'hvLv1 600 sec', _hvLV1_600_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'hvLv2 60 sec', _hvLV2_60_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'hvLv2 600 sec', _hvLV2_600_Controller),
                checkVectoreGroup(ntr)
                    ? Container()
                    : Card(
                        child: Column(children: [
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'hvLv3 60 sec', _hvLV3_60_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'hvLv3 600 sec', _hvLV3_600_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'hvLv4 60 sec', _hvLV4_60_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'hvLv4 600 sec', _hvLV4_600_Controller),
                        ]),
                      ),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Lv1-Earth', _lv1EController),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Lv2-Earth', _lv2EController),
                checkVectoreGroup(ntr)
                    ? Container()
                    : Card(
                        child: Column(children: [
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            'Lv3-Earth', _lv3EController),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            'Lv4-Earth', _lv4EController),
                      ])),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Lv1-Lv2', _lv1Lv2_Controller),
                checkVectoreGroup(ntr)
                    ? Container()
                    : Card(
                        child: Column(children: [
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            'Lv1-Lv3', _lv1Lv3_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            'Lv1-Lv4', _lv1Lv4_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            'Lv2-Lv3', _lv2Lv3_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            'Lv2-Lv4', _lv2Lv4_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            'Lv3-Lv4', _lv3Lv4_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            'Lv4-Lv1', _lv4Lv1_Controller),
                      ])),
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
                  controller: _IDcontroller,
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
                    'HV Earth 60 sec', _hvE_60_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'HV Earth 600 sec', _hvE_600_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'hvLv1 60 sec', _hvLV1_60_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'hvLv1 600 sec', _hvLV1_600_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'hvLv2 60 sec', _hvLV2_60_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'hvLv2 600 sec', _hvLV2_600_Controller),
                checkVectoreGroup(ntr)
                    ? Container()
                    : Card(
                        child: Column(children: [
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'hvLv3 60 sec', _hvLV3_60_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'hvLv3 600 sec', _hvLV3_600_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'hvLv4 60 sec', _hvLV4_60_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'hvLv4 600 sec', _hvLV4_600_Controller),
                        ]),
                      ),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Lv1-Earth', _lv1EController),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Lv2-Earth', _lv2EController),
                checkVectoreGroup(ntr)
                    ? Container()
                    : Card(
                        child: Column(children: [
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            'Lv3-Earth', _lv3EController),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            'Lv4-Earth', _lv4EController),
                      ])),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Lv1-Lv2', _lv1Lv2_Controller),
                checkVectoreGroup(ntr)
                    ? Container()
                    : Card(
                        child: Column(children: [
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            'Lv1-Lv3', _lv1Lv3_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            'Lv1-Lv4', _lv1Lv4_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            'Lv2-Lv3', _lv2Lv3_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            'Lv2-Lv4', _lv2Lv4_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            'Lv3-Lv4', _lv3Lv4_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            'Lv4-Lv1', _lv4Lv1_Controller),
                      ])),
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
