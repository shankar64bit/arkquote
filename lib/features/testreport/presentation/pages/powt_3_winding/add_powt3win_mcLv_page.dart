// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/powt_3_winding/powt3winding_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/equipmentUsed.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/powt_3_winding/powt3win_mcLv_model.dart';
import '../../providers/powt_3_winding/powt3win_mcLv_provider.dart';
import '../../providers/powt_3_winding/powt_3_winding_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';

final _formKey = GlobalKey<FormState>();

class Add_Powt3win_mcLv_Details extends StatelessWidget with GetItMixin {
  Map args = {};
  int POWT3WIN_ID;
  int TR_ID;

  Add_Powt3win_mcLv_Details(this.args, {Key key}) : super(key: key);

  final TextEditingController _trNo_controller = TextEditingController();
  final TextEditingController _serialNo_controller = TextEditingController();
  final TextEditingController _lv_u_vn_controller = TextEditingController();
  final TextEditingController _lv_v_wn_controller = TextEditingController();
  final TextEditingController _lv_w_un_controller = TextEditingController();
  final TextEditingController _lv_u_controller = TextEditingController();
  final TextEditingController _lv_v_controller = TextEditingController();
  final TextEditingController _lv_w_controller = TextEditingController();
  final TextEditingController _lv_n_controller = TextEditingController();
  final TextEditingController _tap_controller = TextEditingController();

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
        Text('Add Powt3win MC-LV Side Details', style: TextStyle(fontSize: 17));
    var desk =
        Text('Add Powt3win MC-LV Side Details', style: TextStyle(fontSize: 20));
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

                  if (ntr.vectorGroup.toLowerCase() == "yna0d11") {
                    _lv_n_controller.text = '0.0';
                  }

                  // add to local database
                  final Powt3win_mcLv_Model Powt3win_mcLvtoLocal =
                      Powt3win_mcLv_Model(
                    trNo: int.parse(_trNo_controller.text),
                    serialNo: _serialNo_controller.text,
                    lv_u_vn: double.parse(_lv_u_vn_controller.text),
                    lv_v_wn: double.parse(_lv_v_wn_controller.text),
                    lv_w_un: double.parse(_lv_w_un_controller.text),
                    lv_u: double.parse(_lv_u_controller.text),
                    lv_v: double.parse(_lv_v_controller.text),
                    lv_w: double.parse(_lv_w_controller.text),
                    lv_n: double.parse(_lv_n_controller.text),
                    tapPosition: int.parse(_tap_controller.text),
                    databaseID: 0,
                  );
                  print(Powt3win_mcLvtoLocal);
                  print(Powt3win_mcLvtoLocal.trNo);
                  getX((Powt3win_mcLv_Provider x) =>
                      x.addPowt3win_mcLv(Powt3win_mcLvtoLocal));
                  watchOnly((Powt3win_mcLv_Provider x) => {});

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
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'LV side UN/UV', _lv_u_vn_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'LV side VN/VW', _lv_v_wn_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'LV side WN/WU', _lv_w_un_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'LV side U', _lv_u_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'LV side V', _lv_v_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'LV side W', _lv_w_controller),
                  ntr.vectorGroup.toLowerCase() == "ynyn0d11"
                      ? simplifiedFor_Diplay_for_all_PC_numpad(
                          'LV side N', _lv_n_controller)
                      : Container(),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'tapPosition', _tap_controller),
                  Divider(color: Colors.white)
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
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'LV side UN/UV', _lv_u_vn_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'LV side VN/VW', _lv_v_wn_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'LV side WN/WU', _lv_w_un_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'LV side U', _lv_u_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'LV side V', _lv_v_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'LV side W', _lv_w_controller),
                    ntr.vectorGroup.toLowerCase() == "ynyn0d11"
                        ? simplifiedFor_Display_for_all_Mobile_numpad(
                            'LV side N', _lv_n_controller)
                        : Container(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'tapPosition', _tap_controller),
                    Divider(color: Colors.white)
                  ]),
            ),
          );
        }
      }),
    );
  }
}
