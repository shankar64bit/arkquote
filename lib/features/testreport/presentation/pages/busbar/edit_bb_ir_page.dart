import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/Auser_input_validation_exnt.dart/validation_extension_methods.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../data/models/equipment/busbar/bb_ir_test_model.dart';
import '../../../data/models/equipment/busbar/bb_model.dart';
import '../../providers/busbar_provider/bb_ir_provider.dart';
import '../../providers/busbar_provider/bb_provider.dart';
import '../../widgets/custom_text_form_field_For_number.dart';
import '../dropdown_All/MegaGigaTeraRadioButton/ct_wr_radio_button_page.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';
import '../dropdown_All/responsive_tool/google_sign_in_out/login_page.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditBbIrPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditBbIrPage(this.args, {Key key}) : super(key: key);
  int _bbRefID;
  BbIrTestModel _bbIrTestModel;
  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _rBcontroller = TextEditingController();
  final TextEditingController _yBcontroller = TextEditingController();
  final TextEditingController _bBcontroller = TextEditingController();
  final TextEditingController _rAcontroller = TextEditingController();
  final TextEditingController _yAcontroller = TextEditingController();
  final TextEditingController _bAcontroller = TextEditingController();
  final TextEditingController _nAcontroller = TextEditingController();
  final TextEditingController _nBcontroller = TextEditingController();

  final TextEditingController _ryBcontroller = TextEditingController();
  final TextEditingController _ybBcontroller = TextEditingController();
  final TextEditingController _brBcontroller = TextEditingController();
  final TextEditingController _ryAcontroller = TextEditingController();
  final TextEditingController _ybAcontroller = TextEditingController();
  final TextEditingController _brAcontroller = TextEditingController();

  final TextEditingController _rnAcontroller = TextEditingController();
  final TextEditingController _rnBcontroller = TextEditingController();
  final TextEditingController _ynAcontroller = TextEditingController();
  final TextEditingController _ynBcontroller = TextEditingController();
  final TextEditingController _bnAcontroller = TextEditingController();
  final TextEditingController _bnBcontroller = TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  // -------------------------------phase 1-------------------------------------

  Enum_ct_wr get selected_yB => Radio_B_1S1_1S2().get_Radio_B_1S1_1S2();
  Enum_ct_wr get selected_rB => Radio_B_2S1_2S2().get_Radio_B_2S1_2S2();
  Enum_ct_wr get selected_bB => Radio_B_3S1_3S2().get_Radio_B_3S1_3S2();

  Enum_ct_wr get selected_ryB => Radio_B_4S1_4S2().get_Radio_B_4S1_4S2();
  Enum_ct_wr get selected_ybB => Radio_B_5S1_5S2().get_Radio_B_5S1_5S2();
  Enum_ct_wr get selected_brB => Radio_R_1S1_1S2().get_Radio_R_1S1_1S2();

  Enum_ct_wr get selected_rA => Radio_R_2S1_2S2().get_Radio_R_2S1_2S2();
  Enum_ct_wr get selected_yA => Radio_R_3S1_3S2().get_Radio_R_3S1_3S2();
  Enum_ct_wr get selected_bA => Radio_R_4S1_4S2().get_Radio_R_4S1_4S2();

  Enum_ct_wr get selected_ryA => Radio_R_5S1_5S2().get_Radio_R_5S1_5S2();
  Enum_ct_wr get selected_ybA => Radio_Y_1S1_1S2().get_Radio_Y_1S1_1S2();
  Enum_ct_wr get selected_brA => Radio_Y_2S1_2S2().get_Radio_Y_2S1_2S2();

  // -------------------------------phase 2-------------------------------------
  Enum_ct_wr get selected_nB => Radio_B_1S1_1S2().get_Radio_B_1S1_1S2();
  Enum_ct_wr get selected_rnB => Radio_B_2S1_2S2().get_Radio_B_2S1_2S2();
  Enum_ct_wr get selected_ynB => Radio_B_3S1_3S2().get_Radio_B_3S1_3S2();
  Enum_ct_wr get selected_bnB => Radio_B_4S1_4S2().get_Radio_B_4S1_4S2();

  Enum_ct_wr get selected_nA => Radio_B_5S1_5S2().get_Radio_B_5S1_5S2();
  Enum_ct_wr get selected_rnA => Radio_R_1S1_1S2().get_Radio_R_1S1_1S2();
  Enum_ct_wr get selected_bnA => Radio_R_2S1_2S2().get_Radio_R_2S1_2S2();
  Enum_ct_wr get selected_ynA => Radio_R_3S1_3S2().get_Radio_R_3S1_3S2();

  Future<void> getReport() async {
    getX((BbIrProvider x) => x.getBbIrByID(args['id']));
    _bbIrTestModel = watchOnly((BbIrProvider x) => x.bbIrModel);

    _IDcontroller.text = args['id'].toString();
    _nOcontroller.text = args['TrNo'].toString();
    _yAcontroller.text = _bbIrTestModel.yA.toString();
    _yBcontroller.text = _bbIrTestModel.yB.toString();
    _bAcontroller.text = _bbIrTestModel.bA.toString();
    _bBcontroller.text = _bbIrTestModel.bB.toString();
    _rAcontroller.text = _bbIrTestModel.rA.toString();
    _rBcontroller.text = _bbIrTestModel.rB.toString();
    _nAcontroller.text = _bbIrTestModel.nA.toString();
    _nBcontroller.text = _bbIrTestModel.nB.toString();

    _brAcontroller.text = _bbIrTestModel.brA.toString();
    _ryAcontroller.text = _bbIrTestModel.ryA.toString();
    _ybAcontroller.text = _bbIrTestModel.ybA.toString();
    _rnAcontroller.text = _bbIrTestModel.rnA.toString();
    _ynAcontroller.text = _bbIrTestModel.ynA.toString();
    _bnAcontroller.text = _bbIrTestModel.bnA.toString();

    _brBcontroller.text = _bbIrTestModel.brB.toString();
    _ryBcontroller.text = _bbIrTestModel.ryB.toString();
    _ybBcontroller.text = _bbIrTestModel.ybB.toString();
    _rnBcontroller.text = _bbIrTestModel.rnB.toString();
    _ynBcontroller.text = _bbIrTestModel.ynB.toString();
    _bnBcontroller.text = _bbIrTestModel.bnB.toString();
    _bbRefID = _bbIrTestModel.bbRefId;
  }

  @override
  Widget build(BuildContext context) {
    final BbIrTestModel ntr1 = watchOnly((BbIrProvider x) => x.bbIrModel);
    getX((BbProvider x) => x.getBbByID(args['BB_ID']));
    final BbModel ntr = watchOnly((BbProvider x) => x.bbModel);
    getReport();
    var mob = const Text('Edit BB-Ir Details', style: TextStyle(fontSize: 15));
    var desk = const Text('Edit BB-Ir Details', style: TextStyle(fontSize: 20));

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

                  // ----------------------phase-1-------------------
                  double rA;
                  double yA;
                  double bA;

                  double rB;
                  double yB;
                  double bB;

                  double ryA;
                  double ybA;
                  double brA;

                  double ryB;
                  double ybB;
                  double brB;
                  // -----------------------phase-2--------------------

                  double nA;
                  double rnA;
                  double bnA;
                  double ynA;

                  double nB;
                  double rnB;
                  double ynB;
                  double bnB;

                  if (ntr.noOfBar == 3) {
                    rA = 0.00;
                    yA = 0.00;
                    bA = 0.00;
                    _rAcontroller.text = '0.00';
                    _yAcontroller.text = '0.00';
                    _bAcontroller.text = '0.00';

                    rB = 0.00;
                    yB = 0.00;
                    bB = 0.00;
                    _rBcontroller.text = '0.00';
                    _yBcontroller.text = '0.00';
                    _bBcontroller.text = '0.00';

                    ryA = 0.00;
                    ybA = 0.00;
                    brA = 0.00;
                    _ryAcontroller.text = '0.00';
                    _ybAcontroller.text = '0.00';
                    _brAcontroller.text = '0.00';

                    ryB = 0.00;
                    ybB = 0.00;
                    brB = 0.00;
                    _ryBcontroller.text = '0.00';
                    _ybBcontroller.text = '0.00';
                    _brBcontroller.text = '0.00';
                  } else if (ntr.noOfBar == 4) {
                    nA = 0.00;
                    rnA = 0.00;
                    bnA = 0.00;
                    ynA = 0.00;
                    _nAcontroller.text = '0.00';
                    _rnAcontroller.text = '0.00';
                    _bnAcontroller.text = '0.00';
                    _ynAcontroller.text = '0.00';

                    nB = 0.00;
                    rnB = 0.00;
                    ynB = 0.00;
                    bnB = 0.00;
                    _nBcontroller.text = '0.00';
                    _rnBcontroller.text = '0.00';
                    _ynBcontroller.text = '0.00';
                    _bnBcontroller.text = '0.00';
                  }

                  rA = convertValue(double.parse(_rAcontroller.text),
                      selected_rA.toString().split('.')[1]);

                  yA = convertValue(double.parse(_yAcontroller.text),
                      selected_yA.toString().split('.')[1]);

                  bA = convertValue(double.parse(_bAcontroller.text),
                      selected_bA.toString().split('.')[1]);

                  rB = convertValue(double.parse(_rBcontroller.text),
                      selected_rB.toString().split('.')[1]);

                  bB = convertValue(double.parse(_bBcontroller.text),
                      selected_bB.toString().split('.')[1]);

                  ryA = convertValue(double.parse(_ryAcontroller.text),
                      selected_ryA.toString().split('.')[1]);

                  ybA = convertValue(double.parse(_ybAcontroller.text),
                      selected_ybA.toString().split('.')[1]);

                  brA = convertValue(double.parse(_brAcontroller.text),
                      selected_brA.toString().split('.')[1]);

                  ryB = convertValue(double.parse(_ryBcontroller.text),
                      selected_ryB.toString().split('.')[1]);

                  ybB = convertValue(double.parse(_ybBcontroller.text),
                      selected_ybB.toString().split('.')[1]);

                  brB = convertValue(double.parse(_brBcontroller.text),
                      selected_brB.toString().split('.')[1]);

                  // --------------------phase-2-----------------------

                  nA = convertValue(double.parse(_nAcontroller.text),
                      selected_nA.toString().split('.')[1]);

                  rnA = convertValue(double.parse(_rnAcontroller.text),
                      selected_rnA.toString().split('.')[1]);

                  bnA = convertValue(double.parse(_bnAcontroller.text),
                      selected_bnA.toString().split('.')[1]);

                  ynA = convertValue(double.parse(_ynAcontroller.text),
                      selected_ynA.toString().split('.')[1]);

                  nB = convertValue(double.parse(_nBcontroller.text),
                      selected_nB.toString().split('.')[1]);

                  rnB = convertValue(double.parse(_rnBcontroller.text),
                      selected_rnB.toString().split('.')[1]);

                  ynB = convertValue(double.parse(_ynBcontroller.text),
                      selected_ynB.toString().split('.')[1]);

                  bnB = convertValue(double.parse(_bnBcontroller.text),
                      selected_bnB.toString().split('.')[1]);

                  //add to remote database
                  var success_code = 201;
                  var success_code1 = 200;
                  var failed_code = 'Server Connection Lost';
                  //add to remote database
                  var url = Uri.parse('${Env.URL_PREFIX}/bbIrTest/' +
                      ntr1.databaseID.toString() +
                      '/');

                  Map<String, String> headers = {
                    "Content-type": "application/json",
                    "Authorization": "Bearer $acc_token",
                  };
                  print("***********");
                  print(url);

                  final Map payload = {
                    "trNo": args['trDatabaseID'].toString(),
                    "bbRef": args['bbDatabaseID'].toString(),
                    'rA': rA.toString(),
                    'rB': rB.toString(),
                    'yA': yA.toString(),
                    'yB': yB.toString(),
                    'bA': bA.toString(),
                    'bB': bB.toString(),
                    'nA': nA.toString(),
                    'nB': nB.toString(),
                    'ryA': ryA.toString(),
                    'ryB': ryB.toString(),
                    'ybA': ybA.toString(),
                    'ybB': ybB.toString(),
                    'brA': brA.toString(),
                    'brB': brB.toString(),
                    'rnA': rnA.toString(),
                    'rnB': rnB.toString(),
                    'ynA': ynA.toString(),
                    'ynB': ynB.toString(),
                    'bnA': bnA.toString(),
                    'bnB': bnB.toString(),
                    "equipmentUsed": selectedValueForEquipmentUse.toString(),
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
                    final BbIrTestModel bbIrReportToLocal = BbIrTestModel(
                      trNo: int.parse(_nOcontroller.text),
                      bbRefId: _bbRefID,
                      rA: rA,
                      rB: rB,
                      yA: yA,
                      yB: yB,
                      bA: bA,
                      bB: bB,
                      nA: nA,
                      nB: nB,
                      ryA: ryA,
                      ryB: ryB,
                      ybA: ybA,
                      ybB: ybB,
                      brA: brA,
                      brB: brB,
                      rnA: rnA,
                      rnB: rnB,
                      ynA: ynA,
                      ynB: ynB,
                      bnA: bnA,
                      bnB: bnB,
                      databaseID: ntr.databaseID,
                      EquipmentType: selectedValueForEquipmentUse.toString(),
                      lastUpdated: DateTime.now(),
                    );

                    getX((BbIrProvider x) =>
                        x.updateBbIr(bbIrReportToLocal, args['id']));
                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_BB_IR',
                        arguments: {
                          'id': args['id'],
                          'BB_ID': args['bbDatabaseID'],
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
                        child: build_body(context, ntr)),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  build_body(BuildContext context, BbModel ntr) {
    return Form(
      key: _formKey,
      child: LayoutBuilder(
        builder: (context, constraints) {
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
                    padding: const EdgeInsets.fromLTRB(150, 20, 150, 10),
                    child: EquipmentTypeList(),
                  ),
                  Radio_R_3S1_3S2(),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Phase-Earth Before HV Test-R', _rBcontroller),
                  Radio_R_2S1_2S2(),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Phase-Earth Before HV Test-Y', _yBcontroller),
                  Radio_R_1S1_1S2(),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Phase-Earth Before HV Test-B', _bBcontroller),
                  Radio_B_3S1_3S2(),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Phase-Phase Befror HV Test-RY', _ryBcontroller),
                  Radio_R_2S1_2S2(),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Phase-Phase Before HV Test-YB', _ybBcontroller),
                  Radio_Y_1S1_1S2(),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Phase-Phase Before HV Test-BR', _brBcontroller),
                  // -----------------------------------------------------------
                  Radio_R_1S1_1S2(),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Phase-Earth After HV Test-R', _rAcontroller),
                  Radio_R_3S1_3S2(),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Phase-Earth After HV Test-Y', _yAcontroller),
                  Radio_Y_2S1_2S2(),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Phase-Earth After HV Test-B', _bAcontroller),
                  Radio_B_3S1_3S2(),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Phase-Phase After HV Test-RY', _ryAcontroller),
                  Radio_R_1S1_1S2(),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Phase-Phase After HV Test-YB', _ybAcontroller),
                  Radio_R_3S1_3S2(),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Phase-Phase After HV Test-BR', _brAcontroller),
                  ntr.noOfBar == 4
                      ? Column(
                          children: [
                            Radio_B_2S1_2S2(),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                'Phase-Earth Before HV Test-N', _nBcontroller),
                            Radio_Y_3S1_3S2(),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                'Phase-Phase Before HV Test-RN',
                                _rnBcontroller),
                            Radio_B_2S1_2S2(),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                'Phase-Phase Before HV Test-YN',
                                _ynBcontroller),
                            Radio_B_2S1_2S2(),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                'Phase-Phase Before HV Test-BN',
                                _bnBcontroller),
                            Radio_B_2S1_2S2(),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                'Phase-Earth After HV Test-N', _nAcontroller),
                            Radio_B_2S1_2S2(),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                'Phase-Phase After HV Test-RN', _rnAcontroller),
                            Radio_B_2S1_2S2(),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                'Phase-Phase After HV Test-YN', _ynAcontroller),
                            Radio_B_2S1_2S2(),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                'Phase-Phase After HV Test-BN', _bnAcontroller),
                          ],
                        )
                      : Container(),
                ]),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                elevation: 5,
                child: Column(
                  children: [
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
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                      child: EquipmentTypeList(),
                    ),

                    Radio_R_3S1_3S2(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Phase-Earth Before HV Test-R', _rBcontroller),
                    Radio_R_2S1_2S2(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Phase-Earth Before HV Test-Y', _yBcontroller),
                    Radio_R_1S1_1S2(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Phase-Earth Before HV Test-B', _bBcontroller),
                    Radio_B_3S1_3S2(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Phase-Phase Befror HV Test-RY', _ryBcontroller),
                    Radio_R_2S1_2S2(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Phase-Phase Before HV Test-YB', _ybBcontroller),
                    Radio_Y_1S1_1S2(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Phase-Phase Before HV Test-BR', _brBcontroller),
                    // -----------------------------------------------------------
                    Radio_R_1S1_1S2(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Phase-Earth After HV Test-R', _rAcontroller),
                    Radio_R_3S1_3S2(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Phase-Earth After HV Test-Y', _yAcontroller),
                    Radio_Y_2S1_2S2(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Phase-Earth After HV Test-B', _bAcontroller),
                    Radio_B_3S1_3S2(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Phase-Phase After HV Test-RY', _ryAcontroller),
                    Radio_R_1S1_1S2(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Phase-Phase After HV Test-YB', _ybAcontroller),
                    Radio_R_3S1_3S2(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Phase-Phase After HV Test-BR', _brAcontroller),
                    ntr.noOfBar == 4
                        ? Column(
                            children: [
                              Radio_B_2S1_2S2(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'Phase-Earth Before HV Test-N',
                                  _nBcontroller),
                              Radio_Y_3S1_3S2(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'Phase-Phase Before HV Test-RN',
                                  _rnBcontroller),
                              Radio_B_2S1_2S2(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'Phase-Phase Before HV Test-YN',
                                  _ynBcontroller),
                              Radio_B_2S1_2S2(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'Phase-Phase Before HV Test-BN',
                                  _bnBcontroller),
                              Radio_B_2S1_2S2(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'Phase-Earth After HV Test-N', _nAcontroller),
                              Radio_B_2S1_2S2(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'Phase-Phase After HV Test-RN',
                                  _rnAcontroller),
                              Radio_B_2S1_2S2(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'Phase-Phase After HV Test-YN',
                                  _ynAcontroller),
                              Radio_B_2S1_2S2(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'Phase-Phase After HV Test-BN',
                                  _bnAcontroller),
                            ],
                          )
                        : Container(),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
