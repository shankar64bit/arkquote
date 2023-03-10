// ignore_for_file: missing_return, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/busbar/bb_ir_test_model.dart';
import '../../../data/models/equipment/busbar/bb_model.dart';
import '../../providers/busbar_provider/bb_ir_provider.dart';
import '../../providers/busbar_provider/bb_provider.dart';
import '../dropdown_All/MegaGigaTeraRadioButton/ct_wr_radio_button_page.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';
import '../dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class AddBbIrPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int TR_ID;
  int BB_ID;

  AddBbIrPage(this.args, {Key key}) : super(key: key);

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

  setTrNo() {
    _nOcontroller.text = args['TrNo'].toString();
    BB_ID = args['BB_ID'];
    TR_ID = args['trDatabaseID'];
  }

  @override
  Widget build(BuildContext context) {
    final BbModel ntr = watchOnly((BbProvider x) => x.bbModel);
    setTrNo();
    int id;
    var acc_token = sl<GoogleSignInController>().ACCESS_TOKEN;
    var ref_token = sl<GoogleSignInController>().REFRESH_TOKEN;
    var mob =
        const Text('Add Busbar-IR Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Add Busbar-IR Details', style: TextStyle(fontSize: 20));

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
                  double bA;
                  if (bA == 0.00) {
                    bA = convertValue(double.parse(_bAcontroller.text),
                        selected_bA.toString().split('.')[1]);
                  }
                  print(bA);
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

                  // rA = convertValue(double.parse(_rAcontroller.text),
                  //     selected_rA.toString().split('.')[1]);
                  // rB = convertValue(double.parse(_rBcontroller.text),
                  //     selected_rB.toString().split('.')[1]);
                  // yA = convertValue(double.parse(_yAcontroller.text),
                  //     selected_yA.toString().split('.')[1]);
                  // yB = convertValue(double.parse(_yBcontroller.text),
                  //     selected_yB.toString().split('.')[1]);
                  // bA = convertValue(double.parse(_bAcontroller.text),
                  //     selected_bA.toString().split('.')[1]);
                  // bB = convertValue(double.parse(_bBcontroller.text),
                  //     selected_bB.toString().split('.')[1]);
                  // nA = convertValue(double.parse(_nAcontroller.text),
                  //     selected_nA.toString().split('.')[1]);
                  // nB = convertValue(double.parse(_nBcontroller.text),
                  //     selected_nB.toString().split('.')[1]);
                  // ryA = convertValue(double.parse(_ryAcontroller.text),
                  //     selected_ryA.toString().split('.')[1]);
                  // ryB = convertValue(double.parse(_ryBcontroller.text),
                  //     selected_ryB.toString().split('.')[1]);
                  // ybA = convertValue(double.parse(_ybAcontroller.text),
                  //     selected_ybA.toString().split('.')[1]);
                  // ybB = convertValue(double.parse(_ybBcontroller.text),
                  //     selected_ybB.toString().split('.')[1]);
                  // brA = convertValue(double.parse(_brAcontroller.text),
                  //     selected_brA.toString().split('.')[1]);
                  // brB = convertValue(double.parse(_brBcontroller.text),
                  //     selected_brB.toString().split('.')[1]);
                  // rnA = convertValue(double.parse(_rnAcontroller.text),
                  //     selected_rnA.toString().split('.')[1]);
                  // rnB = convertValue(double.parse(_rnBcontroller.text),
                  //     selected_rnB.toString().split('.')[1]);
                  // ynA = convertValue(double.parse(_ynAcontroller.text),
                  //     selected_ynA.toString().split('.')[1]);
                  // ynB = convertValue(double.parse(_ynBcontroller.text),
                  //     selected_ynB.toString().split('.')[1]);
                  // bnA = convertValue(double.parse(_bnAcontroller.text),
                  //     selected_bnA.toString().split('.')[1]);
                  // bnB = convertValue(double.parse(_bnBcontroller.text),
                  //     selected_bnB.toString().split('.')[1]);

                  //add to local database
                  final BbIrTestModel bbIrReportToLocal = BbIrTestModel(
                    trNo: int.parse(_nOcontroller.text),
                    bbRefId: args['id'],
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
                    EquipmentType: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,
                  );

                  getX((BbIrProvider x) => x.addBbIr(bbIrReportToLocal));
                  watchOnly((BbIrProvider x) => {});
                  print("Busbar IR added");

                  Navigator.popAndPushNamed(context, '/detail_BB',
                      arguments: {'id': args['id'], 'trDatabaseID': TR_ID});
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
