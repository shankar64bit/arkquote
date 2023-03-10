// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/equipmentUsed.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/powt_3_winding/powt3win_mb_model.dart';
import '../../../data/models/equipment/powt_3_winding/powt3winding_model.dart';
import '../../providers/powt_3_winding/powt3win_mb_provider.dart';
import '../../providers/powt_3_winding/powt_3_winding_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';

final _formKey = GlobalKey<FormState>();
// int min = 0;
// int max;

class Add_Powt3win_mb_Details extends StatelessWidget with GetItMixin {
  Map args = {};
  int POWT3WIN_ID;
  int TR_ID;

  Add_Powt3win_mb_Details(this.args, {Key key}) : super(key: key);

  final TextEditingController _trNo_controller = TextEditingController();
  final TextEditingController _serialNo_controller = TextEditingController();
  final TextEditingController _r_hv_un_controller = TextEditingController();
  final TextEditingController _r_hv_vn_controller = TextEditingController();
  final TextEditingController _r_hv_wn_controller = TextEditingController();
  final TextEditingController _y_hv_un_controller = TextEditingController();
  final TextEditingController _y_hv_vn_controller = TextEditingController();
  final TextEditingController _y_hv_wn_controller = TextEditingController();
  final TextEditingController _b_hv_un_controller = TextEditingController();
  final TextEditingController _b_hv_vn_controller = TextEditingController();
  final TextEditingController _b_hv_wn_controller = TextEditingController();

  final TextEditingController _r_lv_un_controller = TextEditingController();
  final TextEditingController _r_lv_vn_controller = TextEditingController();
  final TextEditingController _r_lv_wn_controller = TextEditingController();
  final TextEditingController _y_lv_un_controller = TextEditingController();
  final TextEditingController _y_lv_vn_controller = TextEditingController();
  final TextEditingController _y_lv_wn_controller = TextEditingController();
  final TextEditingController _b_lv_un_controller = TextEditingController();
  final TextEditingController _b_lv_vn_controller = TextEditingController();
  final TextEditingController _b_lv_wn_controller = TextEditingController();

  final TextEditingController _r_ivt_un_controller = TextEditingController();
  final TextEditingController _r_ivt_vn_controller = TextEditingController();
  final TextEditingController _r_ivt_wn_controller = TextEditingController();
  final TextEditingController _y_ivt_un_controller = TextEditingController();
  final TextEditingController _y_ivt_vn_controller = TextEditingController();
  final TextEditingController _y_ivt_wn_controller = TextEditingController();
  final TextEditingController _b_ivt_un_controller = TextEditingController();
  final TextEditingController _b_ivt_vn_controller = TextEditingController();
  final TextEditingController _b_ivt_wn_controller = TextEditingController();

  setTrNo() {
    _trNo_controller.text = args['TrNo'].toString();
    _serialNo_controller.text = args['serialno'].toString();
    POWT3WIN_ID = args['powt3winDatabaseID'];
    TR_ID = args['trDatabaseID'];
  }

  @override
  Widget build(BuildContext context) {
    final Powt3WindingModel ntr =
        watchOnly((Powt3WindingProvider x) => x.powt3WindingModel);

    setTrNo();
    var mob =
        Text('Add Powt3win_MB Test Details', style: TextStyle(fontSize: 17));
    var desk =
        Text('Add Powt3win_MB Test Details', style: TextStyle(fontSize: 20));
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

                  // add to local database
                  final Powt3win_mb_Model Powt3win_mbtoLocal =
                      Powt3win_mb_Model(
                    trNo: int.parse(_trNo_controller.text),
                    serialNo: _serialNo_controller.text,
                    r_hv_un: double.parse(_r_hv_un_controller.text),
                    r_hv_vn: double.parse(_r_hv_vn_controller.text),
                    r_hv_wn: double.parse(_r_hv_wn_controller.text),
                    y_hv_un: double.parse(_y_hv_un_controller.text),
                    y_hv_vn: double.parse(_y_hv_vn_controller.text),
                    y_hv_wn: double.parse(_y_hv_wn_controller.text),
                    b_hv_un: double.parse(_b_hv_un_controller.text),
                    b_hv_vn: double.parse(_b_hv_vn_controller.text),
                    b_hv_wn: double.parse(_b_hv_wn_controller.text),
                    r_lv_un: double.parse(_r_lv_un_controller.text),
                    r_lv_vn: double.parse(_r_lv_vn_controller.text),
                    r_lv_wn: double.parse(_r_lv_wn_controller.text),
                    y_lv_un: double.parse(_y_lv_un_controller.text),
                    y_lv_vn: double.parse(_y_lv_vn_controller.text),
                    y_lv_wn: double.parse(_y_lv_wn_controller.text),
                    b_lv_un: double.parse(_b_lv_un_controller.text),
                    b_lv_vn: double.parse(_b_lv_vn_controller.text),
                    b_lv_wn: double.parse(_b_lv_wn_controller.text),
                    r_ivt_un: double.parse(_r_ivt_un_controller.text),
                    r_ivt_vn: double.parse(_r_ivt_vn_controller.text),
                    r_ivt_wn: double.parse(_r_ivt_wn_controller.text),
                    y_ivt_un: double.parse(_y_ivt_un_controller.text),
                    y_ivt_vn: double.parse(_y_ivt_vn_controller.text),
                    y_ivt_wn: double.parse(_y_ivt_wn_controller.text),
                    b_ivt_un: double.parse(_b_ivt_un_controller.text),
                    b_ivt_vn: double.parse(_b_ivt_vn_controller.text),
                    b_ivt_wn: double.parse(_b_ivt_wn_controller.text),
                    equipmentUsed: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,
                  );
                  print(Powt3win_mbtoLocal);
                  print(Powt3win_mbtoLocal.trNo);
                  getX((Powt3win_mb_Provider x) =>
                      x.addPowt3win_mb(Powt3win_mbtoLocal));
                  watchOnly((Powt3win_mb_Provider x) => {});

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
    final Powt3WindingModel ntr =
        watchOnly((Powt3WindingProvider x) => x.powt3WindingModel);

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
                  Padding(
                      padding: const EdgeInsets.fromLTRB(150, 10, 150, 10),
                      child: Text(
                        'HV Side',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      )),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'RY-CUT  U-N', _r_hv_un_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'RY-CUT  V-N', _r_hv_vn_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'RY-CUT  W-N', _r_hv_wn_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'YB-CUT  U-N', _y_hv_un_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'YB-CUT  V-N', _y_hv_vn_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'YB-CUT  W-N', _y_hv_wn_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'BR-CUT  U-N', _b_hv_un_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'BR-CUT  V-N', _b_hv_vn_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'BR-CUT  W-N', _b_hv_wn_controller),
                  Divider(color: Colors.black),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(150, 10, 150, 10),
                      child: Text(
                        'LV Side',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      )),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'RY-CUT  U-N', _r_lv_un_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'RY-CUT  V-N', _r_lv_vn_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'RY-CUT  W-N', _r_lv_wn_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'YB-CUT  U-N', _y_lv_un_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'YB-CUT  V-N', _y_lv_vn_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'YB-CUT  W-N', _y_lv_wn_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'BR-CUT  U-N', _b_lv_un_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'BR-CUT  V-N', _b_lv_vn_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'BR-CUT  W-N', _b_lv_wn_controller),
                  Divider(color: Colors.black),
                  ntr.vectorGroup.toLowerCase() == 'yna0d11'
                      ? Padding(
                          padding: const EdgeInsets.fromLTRB(150, 10, 150, 10),
                          child: Text(
                            'IV Side',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5),
                          ))
                      : Padding(
                          padding: const EdgeInsets.fromLTRB(150, 10, 150, 10),
                          child: Text(
                            'Tertiary Side Side',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5),
                          ),
                        ),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'RY-CUT  U-N', _r_ivt_un_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'RY-CUT  V-N', _r_ivt_vn_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'RY-CUT  W-N', _r_ivt_wn_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'YB-CUT  U-N', _y_ivt_un_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'YB-CUT  V-N', _y_ivt_vn_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'YB-CUT  W-N', _y_ivt_wn_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'BR-CUT  U-N', _b_ivt_un_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'BR-CUT  V-N', _b_ivt_vn_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'BR-CUT  W-N', _b_ivt_wn_controller),
                ],
              ),
            ),
          );
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
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: EquipmentTypeList(),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(150, 10, 150, 10),
                      child: Text(
                        'HV Side',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      )),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'RY-CUT  U-N', _r_hv_un_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'RY-CUT  V-N', _r_hv_vn_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'RY-CUT  W-N', _r_hv_wn_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'YB-CUT  U-N', _y_hv_un_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'YB-CUT  V-N', _y_hv_vn_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'YB-CUT W-N', _y_hv_wn_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'BR-CUT  U-N', _b_hv_un_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'BR-CUT  V-N', _b_hv_vn_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'BR-CUT  W-N', _b_hv_wn_controller),
                  Divider(color: Colors.black),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(150, 10, 150, 10),
                      child: Text(
                        'LV Side',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      )),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'RY-CUT  U-N', _r_lv_un_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'RY-CUT  V-N', _r_lv_vn_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'RY-CUT  W-N', _r_lv_wn_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'YB-CUT  U-N', _y_lv_un_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'YB-CUT  V-N', _y_lv_vn_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'YB-CUT  W-N', _y_lv_wn_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'BR-CUT  U-N', _b_lv_un_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'BR-CUT  V-N', _b_lv_vn_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'BR-CUT  W-N', _b_lv_wn_controller),
                  Divider(color: Colors.black),
                  ntr.vectorGroup.toLowerCase() == 'yna0d11'
                      ? Padding(
                          padding: const EdgeInsets.fromLTRB(150, 10, 150, 10),
                          child: Text(
                            'IV Side',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5),
                          ))
                      : Padding(
                          padding: const EdgeInsets.fromLTRB(150, 10, 150, 10),
                          child: Text(
                            'Tertiary Side',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5),
                          ),
                        ),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'RY-CUT  U-N', _r_ivt_un_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'RY-CUT  V-N', _r_ivt_vn_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'RY-CUT  W-N', _r_ivt_wn_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'YB-CUT  U-N', _y_ivt_un_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'YB-CUT  V-N', _y_ivt_vn_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'YB-CUT  W-N', _y_ivt_wn_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'BR-CUT  U-N', _b_ivt_un_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'BR-CUT  V-N', _b_ivt_vn_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'BR-CUT  W-N', _b_ivt_wn_controller),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}