// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/powt_3_winding/powt3win_ir_model.dart';
import '../../../data/models/equipment/powt_3_winding/powt3winding_model.dart';
import '../../providers/powt_3_winding/powt3win_ir_provider.dart';
import '../../providers/powt_3_winding/powt_3_winding_provider.dart';
import '../dropdown_All/MegaGigaTeraRadioButton/ct_ir_radio_button_page.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

final _formKey = GlobalKey<FormState>();

class Add_Powt3winIR extends StatelessWidget with GetItMixin {
  Map args = {};
  int POWT3WIN_ID;
  int TR_ID;

  Add_Powt3winIR(this.args, {Key key}) : super(key: key);

  final TextEditingController _Trno_Controller = TextEditingController();
  final TextEditingController _serialNo_Controller = TextEditingController();
  final TextEditingController _hvE_60_Controller = TextEditingController();
  final TextEditingController _hvE_600_Controller = TextEditingController();
  final TextEditingController _hvLv_60_Controller = TextEditingController();
  final TextEditingController _hvLv_600_Controller = TextEditingController();
  final TextEditingController _hvT_60_Controller = TextEditingController();
  final TextEditingController _hvT_600_Controller = TextEditingController();
  final TextEditingController _lvE_60_Controller = TextEditingController();
  final TextEditingController _lvE_600_Controller = TextEditingController();
  final TextEditingController _lvT_60_Controller = TextEditingController();
  final TextEditingController _lvT_600_Controller = TextEditingController();
  final TextEditingController _tE_60_Controller = TextEditingController();
  final TextEditingController _tE_600_Controller = TextEditingController();
  final TextEditingController _cF_60_Controller = TextEditingController();
  final TextEditingController _cT_60_Controller = TextEditingController();
  final TextEditingController _fT_60_Controller = TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Enum_ct_ir get selected_hvE_60 => Radio_peR().get_Radio_peR();
  Enum_ct_ir get selected_hvE_600 => Radio_peY().get_Radio_peY();
  Enum_ct_ir get selected_hvLv_60 => Radio_peB().get_Radio_peB();
  Enum_ct_ir get selected_hvLv_600 => Radio_pc1R().get_Radio_pc1R();
  Enum_ct_ir get selected_hvT_60 => Radio_pc2R().get_Radio_pc2R();
  Enum_ct_ir get selected_hvT_600 => Radio_pc3R().get_Radio_pc3R();
  Enum_ct_ir get selected_lvE_60 => Radio_pc4R().get_Radio_pc4R();
  Enum_ct_ir get selected_lvE_600 => Radio_pc5R().get_Radio_pc5R();
  Enum_ct_ir get selected_lvT_60 => Radio_pc1Y().get_Radio_pc1Y();
  Enum_ct_ir get selected_lvT_600 => Radio_pc2Y().get_Radio_pc2Y();
  Enum_ct_ir get selected_tE_60 => Radio_pc3Y().get_Radio_pc3Y();
  Enum_ct_ir get selected_tE_600 => Radio_pc4Y().get_Radio_pc4Y();
  Enum_ct_ir get selected_cF_60 => Radio_pc5Y().get_Radio_pc5Y();
  Enum_ct_ir get selected_cT_60 => Radio_pc1B().get_Radio_pc1B();
  Enum_ct_ir get selected_fT_60 => Radio_pc2B().get_Radio_pc2B();

  setTrNo() {
    _Trno_Controller.text = args['TrNo'].toString();
    _serialNo_Controller.text = args['serialno'].toString();
    POWT3WIN_ID = args['powt3winDatabaseID'];
    TR_ID = args['trDatabaseID'];
  }

  @override
  Widget build(BuildContext context) {
    final Powt3WindingModel ntr =
        watchOnly((Powt3WindingProvider x) => x.powt3WindingModel);

    setTrNo();
    var mob = Text('Add Powt3win IR ', style: TextStyle(fontSize: 17));
    var desk = Text('Add Powt3win IR ', style: TextStyle(fontSize: 20));
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
                  // setDefaultValue(ntr);

                  double hvE_60;
                  double hvE_600;
                  double hvLv_60;
                  double hvLv_600;
                  double hvT_60;
                  double hvT_600;
                  double lvE_60;
                  double lvE_600;
                  double lvT_60;
                  double lvT_600;
                  double tE_60;
                  double tE_600;
                  double cF_60;
                  double cT_60;
                  double fT_60;

                  if (ntr.vectorGroup == 'YNyn0d11') {
                    hvE_60 = 0.00;
                    hvE_600 = 0.00;
                    hvLv_60 = 0.00;
                    hvLv_600 = 0.00;
                    lvE_60 = 0.00;
                    lvE_600 = 0.00;

                    _hvE_60_Controller.text = '0.00';
                    _hvE_600_Controller.text = '0.00';
                    _hvLv_60_Controller.text = '0.00';
                    _hvLv_600_Controller.text = '0.00';
                    _lvE_60_Controller.text = '0.00';
                    _lvE_600_Controller.text = '0.00';
                  }

                  if (ntr.vectorGroup == 'YNa0d11') {
                    hvT_60 = 0.00;
                    hvT_600 = 0.00;
                    lvT_60 = 0.00;
                    lvT_600 = 0.00;
                    tE_60 = 0.00;
                    tE_600 = 0.00;

                    _hvT_60_Controller.text = '0.00';
                    _hvT_600_Controller.text = '0.00';
                    _lvT_60_Controller.text = '0.00';
                    _lvT_600_Controller.text = '0.00';
                    _tE_60_Controller.text = '0.00';
                    _tE_600_Controller.text = '0.00';
                  }

                  if (hvE_60 != 0.00) {
                    hvE_60 = convertValue(double.parse(_hvE_60_Controller.text),
                        selected_hvE_60.toString().split('.')[1]);
                  }
                  if (hvE_600 != 0.00) {
                    hvE_600 = convertValue(
                        double.parse(_hvE_600_Controller.text),
                        selected_hvE_600.toString().split('.')[1]);
                  }
                  if (hvLv_60 != 0.00) {
                    hvLv_60 = convertValue(
                        double.parse(_hvLv_60_Controller.text),
                        selected_hvLv_60.toString().split('.')[1]);
                  }
                  if (hvLv_600 != 0.00) {
                    hvLv_600 = convertValue(
                        double.parse(_hvLv_600_Controller.text),
                        selected_hvLv_600.toString().split('.')[1]);
                  }
                  if (hvT_60 != 0.00) {
                    hvT_60 = convertValue(double.parse(_hvT_60_Controller.text),
                        selected_hvT_60.toString().split('.')[1]);
                  }
                  if (hvT_600 != 0.00) {
                    hvT_600 = convertValue(
                        double.parse(_hvT_600_Controller.text),
                        selected_hvT_600.toString().split('.')[1]);
                  }
                  if (lvE_60 != 0.00) {
                    lvE_60 = convertValue(double.parse(_lvE_60_Controller.text),
                        selected_lvE_60.toString().split('.')[1]);
                  }
                  if (lvE_600 != 0.00) {
                    lvE_600 = convertValue(
                        double.parse(_lvE_600_Controller.text),
                        selected_lvE_600.toString().split('.')[1]);
                  }
                  if (lvT_60 != 0.00) {
                    lvT_60 = convertValue(double.parse(_lvT_60_Controller.text),
                        selected_lvT_60.toString().split('.')[1]);
                  }
                  if (lvT_600 != 0.00) {
                    lvT_600 = convertValue(
                        double.parse(_lvT_600_Controller.text),
                        selected_lvT_600.toString().split('.')[1]);
                  }
                  if (tE_60 != 0.00) {
                    tE_60 = convertValue(double.parse(_tE_60_Controller.text),
                        selected_tE_60.toString().split('.')[1]);
                  }
                  if (tE_600 != 0.00) {
                    tE_600 = convertValue(double.parse(_tE_600_Controller.text),
                        selected_tE_600.toString().split('.')[1]);
                  }
                  if (cF_60 != 0.00) {
                    cF_60 = convertValue(double.parse(_cF_60_Controller.text),
                        selected_cF_60.toString().split('.')[1]);
                  }
                  if (cT_60 != 0.00) {
                    cT_60 = convertValue(double.parse(_cT_60_Controller.text),
                        selected_cT_60.toString().split('.')[1]);
                  }
                  if (fT_60 != 0.00) {
                    fT_60 = convertValue(double.parse(_fT_60_Controller.text),
                        selected_fT_60.toString().split('.')[1]);
                  }
                  // add to local database
                  final Powt3winIRModel Powt3winIRtoLocal = Powt3winIRModel(
                    trNo: int.parse(_Trno_Controller.text),
                    serialNo: _serialNo_Controller.text,
                    hvE_60: hvE_60,
                    hvE_600: hvE_600,
                    hvLv_60: hvLv_60,
                    hvLv_600: hvLv_600,
                    hvT_60: hvT_60,
                    hvT_600: hvT_600,
                    lvE_60: lvE_60,
                    lvE_600: lvE_600,
                    lvT_60: lvT_60,
                    lvT_600: lvT_600,
                    tE_60: tE_60,
                    tE_600: tE_600,
                    cF_60: cF_60,
                    cT_60: cT_60,
                    fT_60: fT_60,
                    equipmentUsed: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,
                  );
                  print(Powt3winIRtoLocal);
                  print(Powt3winIRtoLocal.trNo);

                  getX((Powt3winIRProvider x) =>
                      x.addPowt3winIR(Powt3winIRtoLocal));
                  watchOnly((Powt3winIRProvider x) => {});
                  Navigator.popAndPushNamed(context, '/detail_POWT3WIN',
                      arguments: {
                        'id': args['POWT3WIN_ID'],
                        'powt3winDatabaseID': POWT3WIN_ID,
                        'trDatabaseID': TR_ID,
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
              padding: EdgeInsets.all(5.0),
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
    final Powt3WindingModel ntr =
        watchOnly((Powt3WindingProvider x) => x.powt3WindingModel);
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
                    Padding(
                      padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: EquipmentTypeList(),
                    ),
                    ntr.vectorGroup == 'YNyn0d11'
                        ? Card(
                            elevation: 2,
                            child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(children: [
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'HV-Earth 60 Sec', _hvE_60_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'HV-Earth 600 Sec', _hvE_600_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'HV-LV 60 Sec', _hvLv_60_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'HV-LV 600 Sec', _hvLv_600_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'HV-Tertiary 60 Sec', _hvT_60_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'HV-Tertiary 600 Sec',
                                      _hvT_600_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'LV-Earth 60 Sec', _lvE_60_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'LV-Earth 60 Sec', _lvE_600_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'LV-Tertiary 60 Sec', _lvT_60_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'LV-Tertiary 600 Sec',
                                      _lvT_600_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'Tertiary-Earth 60 Sec',
                                      _tE_60_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'Tertiary-Earth 600 Sec',
                                      _tE_600_Controller),
                                ])))
                        : Container(),
                    ntr.vectorGroup == 'YNa0d11'
                        ? Card(
                            elevation: 2,
                            child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(children: [
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      '(HV+IV+N)-(LV+Earth) 60 Sec',
                                      _hvE_60_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      '(HV+IV+N)-(LV+Earth) 600 Sec',
                                      _hvE_600_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      '(HV+IV+N)-LV 60 Sec',
                                      _hvLv_60_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      '(HV+IV+N)-LV 600 Sec',
                                      _hvLv_600_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'LV-(HV+IV+N+Earth) 60 Sec',
                                      _lvE_60_Controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'LV-(HV+IV+N+Earth) 60 Sec',
                                      _lvE_600_Controller),
                                ])))
                        : Container(),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Core-Frame 60 Sec ', _cF_60_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Core-Tank 60 Sec', _cT_60_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Frame-Tank 60 Sec', _fT_60_Controller),
                    Divider(color: Colors.white)
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
                    ntr.vectorGroup == 'YNyn0d11'
                        ? Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(children: [
                              Radio_peR(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'HV-Earth 60 Sec', _hvE_60_Controller),
                              Radio_peY(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'HV-Earth 600 Sec', _hvE_600_Controller),
                              Radio_peB(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'HV-LV 60 Sec', _hvLv_60_Controller),
                              Radio_pc1R(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'HV-LV 600 Sec', _hvLv_600_Controller),
                              Radio_pc2R(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'HV-Tertiary 60 Sec', _hvT_60_Controller),
                              Radio_pc3R(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'HV-Tertiary 600 Sec', _hvT_600_Controller),
                              Radio_pc4R(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'LV-Earth 60 Sec', _lvE_60_Controller),
                              Radio_pc5R(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'LV-Earth 600 Sec', _lvE_600_Controller),
                              Radio_pc1Y(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'LV-Tertiary 60 Sec', _lvT_60_Controller),
                              Radio_pc2Y(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'LV-Tertiary 600 Sec', _lvT_600_Controller),
                              Radio_pc3Y(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'Tertiary-Earth 60 Sec', _tE_60_Controller),
                              Radio_pc4Y(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'Tertiary-Earth 600 Sec', _tE_600_Controller),
                            ]))
                        : Container(),
                    ntr.vectorGroup == 'YNa0d11'
                        ? Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(children: [
                              Radio_peR(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  '(HV+IV+N)-(LV+Earth) 60 Sec',
                                  _hvE_60_Controller),
                              Radio_peY(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  '(HV+IV+N)-(LV+Earth) 600 Sec',
                                  _hvE_600_Controller),
                              Radio_peB(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  '(HV+IV+N)-LV 60 Sec', _hvLv_60_Controller),
                              Radio_pc1R(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  '(HV+IV+N)-LV 600 Sec', _hvLv_600_Controller),
                              Radio_pc4R(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'LV-(HV+IV+N+Earth) 60 Sec',
                                  _lvE_60_Controller),
                              Radio_pc5R(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'LV-(HV+IV+N+Earth) 60 Sec',
                                  _lvE_600_Controller),
                            ]))
                        : Container(),
                    Radio_pc5Y(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Core-Frame 60 Sec ', _cF_60_Controller),
                    Radio_pc1B(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Core-Tank 60 Sec', _cT_60_Controller),
                    Radio_pc2B(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Frame-Tank 60 Sec', _fT_60_Controller),
                    Divider(color: Colors.white)
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
