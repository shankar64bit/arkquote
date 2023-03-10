// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/equipmentUsed.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/powt/powt_mb_model.dart';
import '../../../data/models/equipment/powt/powt_model.dart';
import '../../providers/powt_provider/powt_mb_provider.dart';
import '../../providers/powt_provider/powt_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';

final _formKey = GlobalKey<FormState>();
// int min = 0;
// int max;

class Add_Powt_mb_Details extends StatelessWidget with GetItMixin {
  Map args = {};
  int POWT_ID;
  int TR_ID;

  Add_Powt_mb_Details(this.args, {Key key}) : super(key: key);

  final TextEditingController _trNo_controller = TextEditingController();
  final TextEditingController _serialNo_controller = TextEditingController();
  final TextEditingController _ry_hv_1u_1v_controller = TextEditingController();
  final TextEditingController _ry_hv_1v_1w_controller = TextEditingController();
  final TextEditingController _ry_hv_1w_1u_controller = TextEditingController();
  final TextEditingController _ry_hv_1u_1n_controller = TextEditingController();
  final TextEditingController _ry_hv_1v_1n_controller = TextEditingController();
  final TextEditingController _ry_hv_1w_1n_controller = TextEditingController();
  final TextEditingController _ry_lv_2u_2v_controller = TextEditingController();
  final TextEditingController _ry_lv_2v_2w_controller = TextEditingController();
  final TextEditingController _ry_lv_2w_2u_controller = TextEditingController();
  final TextEditingController _ry_lv_2u_2n_controller = TextEditingController();
  final TextEditingController _ry_lv_2v_2n_controller = TextEditingController();
  final TextEditingController _ry_lv_2w_2n_controller = TextEditingController();
  final TextEditingController _yb_hv_1u_1v_controller = TextEditingController();
  final TextEditingController _yb_hv_1v_1w_controller = TextEditingController();
  final TextEditingController _yb_hv_1w_1u_controller = TextEditingController();
  final TextEditingController _yb_hv_1u_1n_controller = TextEditingController();
  final TextEditingController _yb_hv_1v_1n_controller = TextEditingController();
  final TextEditingController _yb_hv_1w_1n_controller = TextEditingController();
  final TextEditingController _yb_lv_2u_2v_controller = TextEditingController();
  final TextEditingController _yb_lv_2v_2w_controller = TextEditingController();
  final TextEditingController _yb_lv_2w_2u_controller = TextEditingController();
  final TextEditingController _yb_lv_2u_2n_controller = TextEditingController();
  final TextEditingController _yb_lv_2v_2n_controller = TextEditingController();
  final TextEditingController _yb_lv_2w_2n_controller = TextEditingController();
  final TextEditingController _br_hv_1u_1v_controller = TextEditingController();
  final TextEditingController _br_hv_1v_1w_controller = TextEditingController();
  final TextEditingController _br_hv_1w_1u_controller = TextEditingController();
  final TextEditingController _br_hv_1u_1n_controller = TextEditingController();
  final TextEditingController _br_hv_1v_1n_controller = TextEditingController();
  final TextEditingController _br_hv_1w_1n_controller = TextEditingController();
  final TextEditingController _br_lv_2u_2v_controller = TextEditingController();
  final TextEditingController _br_lv_2v_2w_controller = TextEditingController();
  final TextEditingController _br_lv_2w_2u_controller = TextEditingController();
  final TextEditingController _br_lv_2u_2n_controller = TextEditingController();
  final TextEditingController _br_lv_2v_2n_controller = TextEditingController();
  final TextEditingController _br_lv_2w_2n_controller = TextEditingController();
  final TextEditingController _equipmentUsed_controller =
      TextEditingController();

  setTrNo() {
    _trNo_controller.text = args['TrNo'].toString();
    _serialNo_controller.text = args['serial_no_bph'].toString();
    POWT_ID = args['powtDatabaseID'];
    TR_ID = args['trDatabaseID'];
  }

  @override
  Widget build(BuildContext context) {
    // getX((ATProvider x) => x.getATByID(args['id']));
    final PowtModel ntr = watchOnly((PowtProvider x) => x.powtModel);
    // max = ntr.noOfCores;
    setTrNo();
    var mob = Text('Add Powt_mb Details', style: TextStyle(fontSize: 17));
    var desk = Text('Add Powt_mb Details', style: TextStyle(fontSize: 20));
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

                  if (ntr.vectorGroup == "Dyn1" || ntr.vectorGroup == "Dyn11") {
                    _ry_hv_1u_1n_controller.text = '0.00';
                    _ry_hv_1v_1n_controller.text = '0.00';
                    _ry_hv_1w_1n_controller.text = '0.00';

                    _yb_hv_1u_1n_controller.text = '0.00';
                    _yb_hv_1v_1n_controller.text = '0.00';
                    _yb_hv_1w_1n_controller.text = '0.00';

                    _br_hv_1u_1n_controller.text = '0.00';
                    _br_hv_1v_1n_controller.text = '0.00';
                    _br_hv_1w_1n_controller.text = '0.00';
                  }
                  if (ntr.vectorGroup == "YNd1" || ntr.vectorGroup == "YNd11") {
                    _ry_lv_2u_2n_controller.text = '0.00';
                    _ry_lv_2v_2n_controller.text = '0.00';
                    _ry_lv_2w_2n_controller.text = '0.00';

                    _yb_lv_2u_2n_controller.text = '0.00';
                    _yb_lv_2v_2n_controller.text = '0.00';
                    _yb_lv_2w_2n_controller.text = '0.00';

                    _br_lv_2u_2n_controller.text = '0.00';
                    _br_lv_2v_2n_controller.text = '0.00';
                    _br_lv_2w_2n_controller.text = '0.00';
                  }

                  // add to local database
                  final Powt_mb_Model Powt_mbtoLocal = Powt_mb_Model(
                    trNo: int.parse(_trNo_controller.text),
                    serialNo: _serialNo_controller.text,
                    ry_hv_1u_1v: double.parse(_ry_hv_1u_1v_controller.text),
                    ry_hv_1v_1w: double.parse(_ry_hv_1v_1w_controller.text),
                    ry_hv_1w_1u: double.parse(_ry_hv_1w_1u_controller.text),
                    ry_hv_1u_1n: double.parse(_ry_hv_1u_1n_controller.text),
                    ry_hv_1v_1n: double.parse(_ry_hv_1v_1n_controller.text),
                    ry_hv_1w_1n: double.parse(_ry_hv_1w_1n_controller.text),
                    ry_lv_2u_2v: double.parse(_ry_lv_2u_2v_controller.text),
                    ry_lv_2v_2w: double.parse(_ry_lv_2v_2w_controller.text),
                    ry_lv_2w_2u: double.parse(_ry_lv_2w_2u_controller.text),
                    ry_lv_2u_2n: double.parse(_ry_lv_2u_2n_controller.text),
                    ry_lv_2v_2n: double.parse(_ry_lv_2v_2n_controller.text),
                    ry_lv_2w_2n: double.parse(_ry_lv_2w_2n_controller.text),
                    yb_hv_1u_1v: double.parse(_yb_hv_1u_1v_controller.text),
                    yb_hv_1v_1w: double.parse(_yb_hv_1v_1w_controller.text),
                    yb_hv_1w_1u: double.parse(_yb_hv_1w_1u_controller.text),
                    yb_hv_1u_1n: double.parse(_yb_hv_1u_1n_controller.text),
                    yb_hv_1v_1n: double.parse(_yb_hv_1v_1n_controller.text),
                    yb_hv_1w_1n: double.parse(_yb_hv_1w_1n_controller.text),
                    yb_lv_2u_2v: double.parse(_yb_lv_2u_2v_controller.text),
                    yb_lv_2v_2w: double.parse(_yb_lv_2v_2w_controller.text),
                    yb_lv_2w_2u: double.parse(_yb_lv_2w_2u_controller.text),
                    yb_lv_2u_2n: double.parse(_yb_lv_2u_2n_controller.text),
                    yb_lv_2v_2n: double.parse(_yb_lv_2v_2n_controller.text),
                    yb_lv_2w_2n: double.parse(_yb_lv_2w_2n_controller.text),
                    br_hv_1u_1v: double.parse(_br_hv_1u_1v_controller.text),
                    br_hv_1v_1w: double.parse(_br_hv_1v_1w_controller.text),
                    br_hv_1w_1u: double.parse(_br_hv_1w_1u_controller.text),
                    br_hv_1u_1n: double.parse(_br_hv_1u_1n_controller.text),
                    br_hv_1v_1n: double.parse(_br_hv_1v_1n_controller.text),
                    br_hv_1w_1n: double.parse(_br_hv_1w_1n_controller.text),
                    br_lv_2u_2v: double.parse(_br_lv_2u_2v_controller.text),
                    br_lv_2v_2w: double.parse(_br_lv_2v_2w_controller.text),
                    br_lv_2w_2u: double.parse(_br_lv_2w_2u_controller.text),
                    br_lv_2u_2n: double.parse(_br_lv_2u_2n_controller.text),
                    br_lv_2v_2n: double.parse(_br_lv_2v_2n_controller.text),
                    br_lv_2w_2n: double.parse(_br_lv_2w_2n_controller.text),
                    equipmentUsed: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,
                  );
                  print(Powt_mbtoLocal);
                  print(Powt_mbtoLocal.trNo);
                  getX((Powt_mb_Provider x) => x.addPowt_mb(Powt_mbtoLocal));
                  watchOnly((Powt_mb_Provider x) => {});

                  Navigator.popAndPushNamed(context, '/detail_POWT',
                      arguments: {
                        'id': args['POWT_ID'],
                        // 'powtDatabaseID': POWT_ID,
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
    final PowtModel ntr = watchOnly((PowtProvider x) => x.powtModel);
    return Form(
      key: _formKey,
      child: LayoutBuilder(builder: (context, constraints) {
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
                          'trNo',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5),
                        )),
                    TextFormField(
                      controller: _trNo_controller,
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
                      ),
                    ),
                    TextFormField(
                      controller: _serialNo_controller,
                      textAlign: TextAlign.center,
                      enabled: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: EquipmentTypeList(),
                    ),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'RY Cut HV-Side 1U-1V', _ry_hv_1u_1v_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'RY Cut HV-Side 1V-1W', _ry_hv_1v_1w_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'RY Cut HV-Side 1W-1U', _ry_hv_1w_1u_controller),
                    ntr.vectorGroup.toLowerCase() == 'dyn1' ||
                            ntr.vectorGroup.toLowerCase() == 'dyn11'
                        ? Container()
                        : Card(
                            elevation: 2,
                            child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(children: [
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'RY Cut HV-Side 1U-1N',
                                      _ry_hv_1u_1n_controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'RY Cut HV-Side 1V-1N',
                                      _ry_hv_1v_1n_controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'RY Cut HV-Side 1W-1N',
                                      _ry_hv_1w_1n_controller),
                                ]))),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'RY Cut LV-Side 2U-2V', _ry_lv_2u_2v_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'RY Cut LV-Side 2V-2W', _ry_lv_2v_2w_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'RY Cut LV-Side 2W-2U', _ry_lv_2w_2u_controller),
                    ntr.vectorGroup.toLowerCase() == 'ynd1' ||
                            ntr.vectorGroup.toLowerCase() == 'ynd11'
                        ? Container()
                        : Card(
                            elevation: 2,
                            child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(children: [
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'RY Cut LV-Side 2U-2N',
                                      _ry_lv_2u_2n_controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'RY Cut LV-Side 2V-2N',
                                      _ry_lv_2v_2n_controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'RY Cut LV-Side 2W-2N',
                                      _ry_lv_2w_2n_controller),
                                ]))),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'YB Cut HV-Side 1U-1V', _yb_hv_1u_1v_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'YB Cut HV-Side 1V-1W', _yb_hv_1v_1w_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'YB Cut HV-Side 1W-1U', _yb_hv_1w_1u_controller),
                    ntr.vectorGroup.toLowerCase() == 'dyn1' ||
                            ntr.vectorGroup.toLowerCase() == 'dyn11'
                        ? Container()
                        : Card(
                            elevation: 2,
                            child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(children: [
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'YB Cut HV-Side 1U-1N',
                                      _yb_hv_1u_1n_controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'YB Cut HV-Side 1V-1N',
                                      _yb_hv_1v_1n_controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'YB Cut HV-Side 1W-1N',
                                      _yb_hv_1w_1n_controller),
                                ]))),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'YB Cut LV-Side 2U-2V', _yb_lv_2u_2v_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'YB Cut LV-Side 2V-2W', _yb_lv_2v_2w_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'YB Cut LV-Side 2W-2U', _yb_lv_2w_2u_controller),
                    ntr.vectorGroup.toLowerCase() == 'ynd1' ||
                            ntr.vectorGroup.toLowerCase() == 'ynd11'
                        ? Container()
                        : Card(
                            elevation: 2,
                            child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(children: [
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'YB Cut LV-Side 2U-2N',
                                      _yb_lv_2u_2n_controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'YB Cut LV-Side 2V-2N',
                                      _yb_lv_2v_2n_controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'RY Cut LV-Side 2W-2N',
                                      _yb_lv_2w_2n_controller),
                                ]))),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'BR Cut HV-Side 1U-1V', _br_hv_1u_1v_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'BR Cut HV-Side 1V-1W', _br_hv_1v_1w_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'BR Cut HV-Side 1W-1U', _br_hv_1w_1u_controller),
                    ntr.vectorGroup.toLowerCase() == 'dyn1' ||
                            ntr.vectorGroup.toLowerCase() == 'dyn11'
                        ? Container()
                        : Card(
                            elevation: 2,
                            child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(children: [
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'BR Cut HV-Side 1U-1N',
                                      _br_hv_1u_1n_controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'BR Cut HV-Side 1V-1N',
                                      _br_hv_1v_1n_controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'BR Cut HV-Side 1W-1N',
                                      _br_hv_1w_1n_controller),
                                ]))),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'BR Cut LV-Side 2U-2V', _br_lv_2u_2v_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'BR Cut LV-Side 2V-2W', _br_lv_2v_2w_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'BR Cut LV-Side 2W-2U', _br_lv_2w_2u_controller),
                    ntr.vectorGroup.toLowerCase() == 'ynd1' ||
                            ntr.vectorGroup.toLowerCase() == 'ynd11'
                        ? Container()
                        : Card(
                            elevation: 2,
                            child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(children: [
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'BR Cut LV-Side 2U-2N',
                                      _br_lv_2u_2n_controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'BR Cut LV-Side 2V-2N',
                                      _br_lv_2v_2n_controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'BR Cut LV-Side 2W-2N',
                                      _br_lv_2w_2n_controller),
                                ]))),
                  ]),
            ),
          );
          //------------------------------------------------------------------------------
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
                        'trNo',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      )),
                  TextFormField(
                    controller: _trNo_controller,
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
                    controller: _serialNo_controller,
                    textAlign: TextAlign.center,
                    enabled: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                    child: EquipmentTypeList(),
                  ),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'RY Cut HV-Side 1U-1V', _ry_hv_1u_1v_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'RY Cut HV-Side 1V-1W', _ry_hv_1v_1w_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'RY Cut HV-Side 1W-1U', _ry_hv_1w_1u_controller),
                  ntr.vectorGroup.toLowerCase() == 'dyn1' ||
                          ntr.vectorGroup.toLowerCase() == 'dyn11'
                      ? Container()
                      : Card(
                          elevation: 2,
                          child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(children: [
                                simplifiedFor_Display_for_all_Mobile_numpad(
                                    'RY Cut HV-Side 1U-1N',
                                    _ry_hv_1u_1n_controller),
                                simplifiedFor_Display_for_all_Mobile_numpad(
                                    'RY Cut HV-Side 1V-1N',
                                    _ry_hv_1v_1n_controller),
                                simplifiedFor_Display_for_all_Mobile_numpad(
                                    'RY Cut HV-Side 1W-1N',
                                    _ry_hv_1w_1n_controller),
                              ]))),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'RY Cut LV-Side 2U-2V', _ry_lv_2u_2v_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'RY Cut LV-Side 2V-2W', _ry_lv_2v_2w_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'RY Cut LV-Side 2W-2U', _ry_lv_2w_2u_controller),
                  ntr.vectorGroup.toLowerCase() == 'ynd1' ||
                          ntr.vectorGroup.toLowerCase() == 'ynd11'
                      ? Container()
                      : Card(
                          elevation: 2,
                          child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(children: [
                                simplifiedFor_Display_for_all_Mobile_numpad(
                                    'RY Cut LV-Side 2U-2N',
                                    _ry_lv_2u_2n_controller),
                                simplifiedFor_Display_for_all_Mobile_numpad(
                                    'RY Cut LV-Side 2V-2N',
                                    _ry_lv_2v_2n_controller),
                                simplifiedFor_Display_for_all_Mobile_numpad(
                                    'RY Cut LV-Side 2W-2N',
                                    _ry_lv_2w_2n_controller),
                              ]))),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'YB Cut HV-Side 1U-1V', _yb_hv_1u_1v_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'YB Cut HV-Side 1V-1W', _yb_hv_1v_1w_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'YB Cut HV-Side 1W-1U', _yb_hv_1w_1u_controller),
                  ntr.vectorGroup.toLowerCase() == 'dyn1' ||
                          ntr.vectorGroup.toLowerCase() == 'dyn11'
                      ? Container()
                      : Card(
                          elevation: 2,
                          child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(children: [
                                simplifiedFor_Display_for_all_Mobile_numpad(
                                    'YB Cut HV-Side 1U-1N',
                                    _yb_hv_1u_1n_controller),
                                simplifiedFor_Display_for_all_Mobile_numpad(
                                    'YB Cut HV-Side 1V-1N',
                                    _yb_hv_1v_1n_controller),
                                simplifiedFor_Display_for_all_Mobile_numpad(
                                    'YB Cut HV-Side 1W-1N',
                                    _yb_hv_1w_1n_controller),
                              ]))),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'YB Cut LV-Side 2U-2V', _yb_lv_2u_2v_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'YB Cut LV-Side 2V-2W', _yb_lv_2v_2w_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'YB Cut LV-Side 2W-2U', _yb_lv_2w_2u_controller),
                  ntr.vectorGroup.toLowerCase() == 'ynd1' ||
                          ntr.vectorGroup.toLowerCase() == 'ynd11'
                      ? Container()
                      : Card(
                          elevation: 2,
                          child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(children: [
                                simplifiedFor_Display_for_all_Mobile_numpad(
                                    'YB Cut LV-Side 2U-2N',
                                    _yb_lv_2u_2n_controller),
                                simplifiedFor_Display_for_all_Mobile_numpad(
                                    'YB Cut LV-Side 2V-2N',
                                    _yb_lv_2v_2n_controller),
                                simplifiedFor_Display_for_all_Mobile_numpad(
                                    'RY Cut LV-Side 2W-2N',
                                    _yb_lv_2w_2n_controller),
                              ]))),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'BR Cut HV-Side 1U-1V', _br_hv_1u_1v_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'BR Cut HV-Side 1V-1W', _br_hv_1v_1w_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'BR Cut HV-Side 1W-1U', _br_hv_1w_1u_controller),
                  ntr.vectorGroup.toLowerCase() == 'dyn1' ||
                          ntr.vectorGroup.toLowerCase() == 'dyn11'
                      ? Container()
                      : Card(
                          elevation: 2,
                          child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(children: [
                                simplifiedFor_Display_for_all_Mobile_numpad(
                                    'BR Cut HV-Side 1U-1N',
                                    _br_hv_1u_1n_controller),
                                simplifiedFor_Display_for_all_Mobile_numpad(
                                    'BR Cut HV-Side 1V-1N',
                                    _br_hv_1v_1n_controller),
                                simplifiedFor_Display_for_all_Mobile_numpad(
                                    'BR Cut HV-Side 1W-1N',
                                    _br_hv_1w_1n_controller),
                              ]))),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'BR Cut LV-Side 2U-2V', _br_lv_2u_2v_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'BR Cut LV-Side 2V-2W', _br_lv_2v_2w_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'BR Cut LV-Side 2W-2U', _br_lv_2w_2u_controller),
                  ntr.vectorGroup.toLowerCase() == 'ynd1' ||
                          ntr.vectorGroup.toLowerCase() == 'ynd11'
                      ? Container()
                      : Card(
                          elevation: 2,
                          child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(children: [
                                simplifiedFor_Display_for_all_Mobile_numpad(
                                    'BR Cut LV-Side 2U-2N',
                                    _br_lv_2u_2n_controller),
                                simplifiedFor_Display_for_all_Mobile_numpad(
                                    'BR Cut LV-Side 2V-2N',
                                    _br_lv_2v_2n_controller),
                                simplifiedFor_Display_for_all_Mobile_numpad(
                                    'BR Cut LV-Side 2W-2N',
                                    _br_lv_2w_2n_controller),
                              ]))),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
