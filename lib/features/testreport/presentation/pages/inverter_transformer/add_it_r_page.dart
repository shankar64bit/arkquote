// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/IT/it_model.dart';
import '../../../data/models/equipment/IT/it_r_model.dart';
import '../../providers/it_provider/it_provider.dart';
import '../../providers/it_provider/it_r_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

final _formKey = GlobalKey<FormState>();

class AddItRPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int itDatabaseID;
  int trDatabaseID;

  AddItRPage(this.args, {Key key}) : super(key: key);

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
        Text('Add Inverter Transformer R', style: TextStyle(fontSize: 17));
    var desk =
        Text('Add Inverter Transformer R ', style: TextStyle(fontSize: 20));
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

                  if (checkVectoreGroup(ntr)) {
                    _lv3_uv_Controller.text = "0.0";
                    _lv3_vw_Controller.text = '0.0';
                    _lv3_wu_Controller.text = "0.0";
                    _lv4_uv_Controller.text = "0.0";
                    _lv4_vw_Controller.text = '0.0';
                    _lv4_wu_Controller.text = "0.0";
                  }

                  // add to local database
                  final ItRTestModel ItRToLocal = ItRTestModel(
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
                    equipmentUsed: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,

                    // updateDate: DateTime.now(),
                  );
                  print(ItRToLocal);
                  print(ItRToLocal.trNo);
                  getX((ItRProvider x) => x.addItR(ItRToLocal));
                  watchOnly((ItRProvider x) => {});

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
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Tap Position', _tapPosition_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Applied Voltage HV Side (V)-U-V', _hv_uv_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Applied Voltage HV Side (V)-V-W', _hv_vw_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Applied Voltage HV Side (V)-W-U', _hv_wu_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Measured Voltage LV1 Side (V) -U-V',
                        _lv1_uv_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Measured Voltage LV1 Side (V) -V-W',
                        _lv1_vw_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Measured Voltage LV1 Side (V) -W-U',
                        _lv1_wu_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Measured Voltage LV2 Side (V) -U-V',
                        _lv2_uv_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Measured Voltage LV2 Side (V) -V-W',
                        _lv2_vw_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Measured Voltage LV2 Side (V) -W-U',
                        _lv2_wu_Controller),

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
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Tap Position', _tapPosition_Controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Applied Voltage HV Side (V)-U-V', _hv_uv_Controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Applied Voltage HV Side (V)-V-W', _hv_vw_Controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Applied Voltage HV Side (V)-W-U', _hv_wu_Controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Measured Voltage LV1 Side (V) -U-V',
                        _lv1_uv_Controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Measured Voltage LV1 Side (V) -V-W',
                        _lv1_vw_Controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Measured Voltage LV1 Side (V) -W-U',
                        _lv1_wu_Controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Measured Voltage LV2 Side (V) -U-V',
                        _lv2_uv_Controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Measured Voltage LV2 Side (V) -V-W',
                        _lv2_vw_Controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Measured Voltage LV2 Side (V) -W-U',
                        _lv2_wu_Controller),
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
