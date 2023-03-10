// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/IT/it_ir_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/it_provider/it_ir_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/IT/it_model.dart';
import '../../providers/it_provider/it_provider.dart';
import '../dropdown_All/MegaGigaTeraRadioButton/ct_ir_radio_button_page.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

final _formKey = GlobalKey<FormState>();

class AddItIrPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int itDatabaseID;
  int trDatabaseID;

  AddItIrPage(this.args, {Key key}) : super(key: key);

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

  Enum_ct_ir get selected_hvE_60 => Radio_peR().get_Radio_peR();
  Enum_ct_ir get selected_hvE_600 => Radio_peY().get_Radio_peY();
  Enum_ct_ir get selected_hvLv1_60 => Radio_peB().get_Radio_peB();
  Enum_ct_ir get selected_hvLv1_600 => Radio_pc1R().get_Radio_pc1R();
  Enum_ct_ir get selected_hvLv2_60 => Radio_pc2R().get_Radio_pc2R();
  Enum_ct_ir get selected_hvLv2_600 => Radio_pc3R().get_Radio_pc3R();

  Enum_ct_ir get selected_hvLv3_60 => Radio_pc4R().get_Radio_pc4R();
  Enum_ct_ir get selected_hvLv3_600 => Radio_pc5R().get_Radio_pc5R();
  Enum_ct_ir get selected_hvLv4_60 => Radio_pc1Y().get_Radio_pc1Y();
  Enum_ct_ir get selected_hvLv4_600 => Radio_pc2Y().get_Radio_pc2Y();

  Enum_ct_ir get selected_lv1E => Radio_pc3Y().get_Radio_pc3Y();
  Enum_ct_ir get selected_lv2E => Radio_pc4Y().get_Radio_pc4Y();

  Enum_ct_ir get selected_lv3E => Radio_pc5Y().get_Radio_pc5Y();
  Enum_ct_ir get selected_lv4E => Radio_pc1B().get_Radio_pc1B();

  Enum_ct_ir get selected_lv1Lv2 => Radio_pc2B().get_Radio_pc2B();

  Enum_ct_ir get selected_lv1Lv3 => Radio_pc3B().get_Radio_pc3B();
  Enum_ct_ir get selected_lv1Lv4 => Radio_pc4B().get_Radio_pc4B();
  Enum_ct_ir get selected_lv2Lv3 => Radio_pc5B().get_Radio_pc5B();
  Enum_ct_ir get selected_lv2Lv4 => Radio_c1eR().get_Radio_c1eR();
  Enum_ct_ir get selected_lv3Lv4 => Radio_c2eR().get_Radio_c2eR();
  Enum_ct_ir get selected_lv4Lv1 => Radio_c3eR().get_Radio_c3eR();

  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  setTrNo() {
    _Trno_Controller.text = args['TrNo'].toString();
    _serialNo_Controller.text = args['serialNo'].toString();
    itDatabaseID = args['itDatabaseID'];
    trDatabaseID = args['trDatabaseID'];
  }

  @override
  Widget build(BuildContext context) {
    final ItModel ntr = watchOnly((ItProvider x) => x.itModel);

    setTrNo();
    var mob =
        Text('Add Inverter Transformer IR ', style: TextStyle(fontSize: 17));
    var desk =
        Text('Add Inverter Transformer IR ', style: TextStyle(fontSize: 20));
    var accToken = sl<GoogleSignInController>().ACCESS_TOKEN;
    var refToken = sl<GoogleSignInController>().REFRESH_TOKEN;
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

                  double hvE_60;
                  double hvE_600;

                  double hvLv1_60;
                  double hvLv1_600;

                  double hvLv2_60;
                  double hvLv2_600;

                  double hvLv3_60;
                  double hvLv3_600;

                  double hvLv4_60;
                  double hvLv4_600;

                  double lv1E;
                  double lv2E;
                  double lv3E;
                  double lv4E;

                  double lv1Lv2;
                  double lv1Lv3;
                  double lv1Lv4;

                  double lv2Lv3;
                  double lv2Lv4;
                  double lv3Lv4;
                  double lv4Lv1;

                  if (ntr.vectorGroup.toLowerCase() == 'dd0/dd0' ||
                      ntr.vectorGroup.toLowerCase() == 'dd6/dd6' ||
                      ntr.vectorGroup.toLowerCase() == 'Yd1d1' ||
                      ntr.vectorGroup.toLowerCase() == 'Yd11d11') {
                    _hvLV3_600_Controller.text = "0.0";
                    _hvLV3_60_Controller.text = '0.0';
                    _hvLV4_600_Controller.text = "0.0";
                    _hvLV4_60_Controller.text = '0.0';
                    hvLv3_60 = 0.00;
                    hvLv3_600 = 0.00;
                    hvLv4_60 = 0.00;
                    hvLv4_600 = 0.00;

                    _lv3EController.text = '0.0';
                    _lv4EController.text = '0.0';
                    lv3E = 0.00;
                    lv4E = 0.00;

                    _lv1Lv3_Controller.text = '0.0';
                    _lv1Lv4_Controller.text = '0.0';
                    _lv2Lv3_Controller.text = '0.0';
                    _lv2Lv4_Controller.text = '0.0';
                    _lv3Lv4_Controller.text = '0.0';
                    _lv4Lv1_Controller.text = '0.0';
                    lv1Lv3 = 0.00;
                    lv1Lv4 = 0.00;
                    lv2Lv3 = 0.00;
                    lv2Lv4 = 0.00;
                    lv3Lv4 = 0.00;
                    lv4Lv1 = 0.00;
                  }

                  hvE_60 = convertValue(double.parse(_hvE_60_Controller.text),
                      selected_hvE_60.toString().split('.')[1]);

                  hvE_600 = convertValue(double.parse(_hvE_600_Controller.text),
                      selected_hvE_600.toString().split('.')[1]);

                  hvLv1_60 = convertValue(
                      double.parse(_hvLV1_60_Controller.text),
                      selected_hvLv1_60.toString().split('.')[1]);

                  hvLv1_600 = convertValue(
                      double.parse(_hvLV1_600_Controller.text),
                      selected_hvLv1_600.toString().split('.')[1]);

                  hvLv2_60 = convertValue(
                      double.parse(_hvLV2_60_Controller.text),
                      selected_hvLv2_60.toString().split('.')[1]);

                  hvLv2_600 = convertValue(
                      double.parse(_hvLV2_600_Controller.text),
                      selected_hvLv2_600.toString().split('.')[1]);

                  lv1E = convertValue(double.parse(_lv1EController.text),
                      selected_lv1E.toString().split('.')[1]);

                  lv2E = convertValue(double.parse(_lv2EController.text),
                      selected_lv2E.toString().split('.')[1]);

                  lv1Lv2 = convertValue(double.parse(_lv1Lv2_Controller.text),
                      selected_lv1Lv2.toString().split('.')[1]);

                  // -----------------------------------------------------------

                  if (hvLv3_60 != 0.00) {
                    hvLv3_60 = convertValue(
                        double.parse(_hvLV3_60_Controller.text),
                        selected_hvLv3_60.toString().split('.')[1]);
                  }
                  if (hvLv3_600 != 0.00) {
                    hvLv3_600 = convertValue(
                        double.parse(_hvLV3_600_Controller.text),
                        selected_hvLv3_600.toString().split('.')[1]);
                  }
                  if (hvLv4_60 != 0.00) {
                    hvLv4_60 = convertValue(
                        double.parse(_hvLV4_60_Controller.text),
                        selected_hvLv4_60.toString().split('.')[1]);
                  }
                  if (hvLv4_600 != 0.00) {
                    hvLv4_600 = convertValue(
                        double.parse(_hvLV4_600_Controller.text),
                        selected_hvLv4_600.toString().split('.')[1]);
                  }
                  // -----------------------------------------------
                  if (lv3E != 0.00) {
                    lv3E = convertValue(double.parse(_lv3EController.text),
                        selected_lv3E.toString().split('.')[1]);
                  }
                  if (lv4E != 0.00) {
                    lv4E = convertValue(double.parse(_lv4EController.text),
                        selected_lv4E.toString().split('.')[1]);
                  }
                  // ------------------------------------------------

                  if (lv1Lv3 != 0.00) {
                    lv1Lv3 = convertValue(double.parse(_lv1Lv3_Controller.text),
                        selected_lv1Lv3.toString().split('.')[1]);
                  }
                  if (lv1Lv4 != 0.00) {
                    lv1Lv4 = convertValue(double.parse(_lv1Lv4_Controller.text),
                        selected_lv1Lv4.toString().split('.')[1]);
                  }
                  if (lv2Lv3 != 0.00) {
                    lv2Lv3 = convertValue(double.parse(_lv2Lv3_Controller.text),
                        selected_lv2Lv3.toString().split('.')[1]);
                  }
                  if (lv2Lv4 != 0.00) {
                    lv2Lv4 = convertValue(double.parse(_lv2Lv4_Controller.text),
                        selected_lv2Lv4.toString().split('.')[1]);
                  }
                  if (lv3Lv4 != 0.00) {
                    lv3Lv4 = convertValue(double.parse(_lv3Lv4_Controller.text),
                        selected_lv3Lv4.toString().split('.')[1]);
                  }
                  if (lv4Lv1 != 0.00) {
                    lv4Lv1 = convertValue(double.parse(_lv4Lv1_Controller.text),
                        selected_lv4Lv1.toString().split('.')[1]);
                  }

                  // add to local database
                  final ItIrTestModel ItIrToLocal = ItIrTestModel(
                    trNo: int.parse(_Trno_Controller.text),
                    serialNo: _serialNo_Controller.text,
                    hvE_60: hvE_60,
                    hvE_600: hvE_600,
                    hvLv1_60: hvLv1_60,
                    hvLv1_600: hvLv1_600,
                    hvLv2_60: hvLv2_60,
                    hvLv2_600: hvLv2_600,
                    hvLv3_60: hvLv3_60,
                    hvLv3_600: hvLv3_600,
                    hvLv4_60: hvLv4_60,
                    hvLv4_600: hvLv4_600,
                    lv1E: lv1E,
                    lv2E: lv2E,
                    lv3E: lv3E,
                    lv4E: lv4E,
                    lv1Lv2: lv1Lv2,
                    lv1Lv3: lv1Lv3,
                    lv1Lv4: lv1Lv4,
                    lv2Lv3: lv2Lv3,
                    lv2Lv4: lv2Lv4,
                    lv3Lv4: lv3Lv4,
                    lv4Lv1: lv4Lv1,
                    equipmentUsed: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,
                    // updateDate: DateTime.now(),
                  );
                  print(ItIrToLocal);
                  print(ItIrToLocal.trNo);
                  getX((ItIrProvider x) => x.addItIr(ItIrToLocal));
                  watchOnly((ItIrProvider x) => {});
                  Navigator.popAndPushNamed(context, '/detail_IT', arguments: {
                    'id': args['IT_ID'],
                    'itDatabaseID': itDatabaseID,
                    'trDatabaseID': trDatabaseID,
                  });
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
    final ItModel ntr = watchOnly((ItProvider x) => x.itModel);
    return Form(
      key: _formKey,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 400) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(150, 10, 150, 10),
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
                    //EquipmentTypeList

                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: EquipmentTypeList(),
                    ),
                    Radio_peR(),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'HV Earth 60 sec', _hvE_60_Controller),
                    Radio_peY(),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'HV Earth 600 sec', _hvE_600_Controller),
                    Radio_peB(),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'hvLv1 60 sec', _hvLV1_60_Controller),
                    Radio_pc1R(),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'hvLv1 600 sec', _hvLV1_600_Controller),
                    Radio_pc2R(),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'hvLv2 60 sec', _hvLV2_60_Controller),
                    Radio_pc3R(),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'hvLv2 600 sec', _hvLV2_600_Controller),

                    checkVectoreGroup(ntr)
                        ? Container()
                        : Card(
                            child: Column(children: [
                              Radio_pc4R(),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'hvLv3 60 sec', _hvLV3_60_Controller),
                              Radio_pc5R(),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'hvLv3 600 sec', _hvLV3_600_Controller),
                              Radio_pc1Y(),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'hvLv4 60 sec', _hvLV4_60_Controller),
                              Radio_pc2Y(),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'hvLv4 600 sec', _hvLV4_600_Controller),
                            ]),
                          ),
                    Radio_pc3Y(),

                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Lv1-Earth', _lv1EController),
                    Radio_pc4Y(),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Lv2-Earth', _lv2EController),

                    checkVectoreGroup(ntr)
                        ? Container()
                        : Card(
                            child: Column(children: [
                            Radio_pc5Y(),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                'Lv3-Earth', _lv3EController),
                            Radio_pc1B(),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                'Lv4-Earth', _lv4EController),
                          ])),
                    Radio_pc2B(),

                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Lv1-Lv2', _lv1Lv2_Controller),

                    checkVectoreGroup(ntr)
                        ? Container()
                        : Card(
                            child: Column(children: [
                            Radio_pc3B(),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                'Lv1-Lv3', _lv1Lv3_Controller),
                            Radio_pc4B(),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                'Lv1-Lv4', _lv1Lv4_Controller),
                            Radio_pc5B(),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                'Lv2-Lv3', _lv2Lv3_Controller),
                            Radio_c1eR(),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                'Lv2-Lv4', _lv2Lv4_Controller),
                            Radio_c2eR(),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                'Lv3-Lv4', _lv3Lv4_Controller),
                            Radio_c3eR(),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                'Lv4-Lv1', _lv4Lv1_Controller),
                          ])),
                  ],
                ),
              ),
            );

            // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
          } else {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                    Radio_peR(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'HV Earth 60 sec', _hvE_60_Controller),
                    Radio_peY(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'HV Earth 600 sec', _hvE_600_Controller),
                    Radio_peB(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'hvLv1 60 sec', _hvLV1_60_Controller),
                    Radio_pc1R(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'hvLv1 600 sec', _hvLV1_600_Controller),
                    Radio_pc2R(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'hvLv2 60 sec', _hvLV2_60_Controller),
                    Radio_pc3R(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'hvLv2 600 sec', _hvLV2_600_Controller),
                    checkVectoreGroup(ntr)
                        ? Container()
                        : Card(
                            child: Column(children: [
                              Radio_pc4R(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'hvLv3 60 sec', _hvLV3_60_Controller),
                              Radio_pc5R(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'hvLv3 600 sec', _hvLV3_600_Controller),
                              Radio_pc1Y(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'hvLv4 60 sec', _hvLV4_60_Controller),
                              Radio_pc2Y(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'hvLv4 600 sec', _hvLV4_600_Controller),
                            ]),
                          ),
                    Radio_pc3Y(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Lv1-Earth', _lv1EController),
                    Radio_pc4Y(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Lv2-Earth', _lv2EController),
                    checkVectoreGroup(ntr)
                        ? Container()
                        : Card(
                            child: Column(children: [
                            Radio_pc5Y(),
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                'Lv3-Earth', _lv3EController),
                            Radio_pc1B(),
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                'Lv4-Earth', _lv4EController),
                          ])),
                    Radio_pc2B(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Lv1-Lv2', _lv1Lv2_Controller),
                    checkVectoreGroup(ntr)
                        ? Container()
                        : Card(
                            child: Column(children: [
                            Radio_pc3B(),
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                'Lv1-Lv3', _lv1Lv3_Controller),
                            Radio_pc4B(),
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                'Lv1-Lv4', _lv1Lv4_Controller),
                            Radio_pc5B(),
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                'Lv2-Lv3', _lv2Lv3_Controller),
                            Radio_c1eR(),
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                'Lv2-Lv4', _lv2Lv4_Controller),
                            Radio_c2eR(),
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                'Lv3-Lv4', _lv3Lv4_Controller),
                            Radio_c3eR(),
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                'Lv4-Lv1', _lv4Lv1_Controller),
                          ])),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  bool checkVectoreGroup(ItModel ntr) {
    return ntr.vectorGroup.toLowerCase() == 'dd0/dd0' ||
        ntr.vectorGroup.toLowerCase() == 'dd6/dd6' ||
        ntr.vectorGroup.toLowerCase() == 'yd1d1' ||
        ntr.vectorGroup.toLowerCase() == 'yd11d11';
  }
}
