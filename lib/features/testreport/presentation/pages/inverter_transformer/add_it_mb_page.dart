// ignore_for_file: missing_beturn, missing_required_param, non_constant_identifier_names, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/IT/it_mb_model.dart';
import '../../../data/models/equipment/IT/it_model.dart';
import '../../providers/it_provider/it_mb_provider.dart';
import '../../providers/it_provider/it_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

final _formKey = GlobalKey<FormState>();

class AddItMbPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int itDatabaseID;
  int trDatabaseID;

  AddItMbPage(this.args, {Key key}) : super(key: key);

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
        Text('Add Inverter Transformer Mb', style: TextStyle(fontSize: 17));
    var desk =
        Text('Add Inverter Transformer Mb ', style: TextStyle(fontSize: 20));
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
                  // loading to add details to remote server & local server
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  );

                  if (checkVectoreGroup(ntr)) {
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

                  // add to local database
                  final ItMbTestModel ItMbToLocal = ItMbTestModel(
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
                    equipmentUsed: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,
                  );
                  print(ItMbToLocal);
                  print("Stored to local Databases");
                  getX((ItMbProvider x) => x.addItMb(ItMbToLocal));
                  watchOnly((ItMbProvider x) => {});
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
