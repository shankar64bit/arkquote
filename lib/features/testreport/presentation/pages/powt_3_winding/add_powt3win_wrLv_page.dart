// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/equipmentUsed.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/powt_3_winding/powt3win_wrLv_model.dart';
import '../../../data/models/equipment/powt_3_winding/powt3winding_model.dart';
import '../../providers/powt_3_winding/powt3_wrLv_provider.dart';
import '../../providers/powt_3_winding/powt_3_winding_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';

final _formKey = GlobalKey<FormState>();

class Add_Powt3winwrLv_Details extends StatelessWidget with GetItMixin {
  Map args = {};
  int POWT3WIN_ID;
  int TR_ID;

  Add_Powt3winwrLv_Details(this.args, {Key key}) : super(key: key);

  final TextEditingController _trNo_controller = TextEditingController();
  final TextEditingController _serialNo_controller = TextEditingController();
  final TextEditingController _lv_r_uv_controller = TextEditingController();
  final TextEditingController _lv_r_vw_controller = TextEditingController();
  final TextEditingController _lv_r_wu_controller = TextEditingController();
  final TextEditingController _equipmentUsed_controller =
      TextEditingController();
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
        Text('Add Powt3win Wr Lv Details', style: TextStyle(fontSize: 17));
    var desk =
        Text('Add Powt3win WrLv Details', style: TextStyle(fontSize: 20));
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
                  final Powt3winwrLvModel Powt3winwrLvtoLocal =
                      Powt3winwrLvModel(
                    trNo: int.parse(_trNo_controller.text),
                    serialNo: _serialNo_controller.text,
                    lv_r_uv: double.parse(_lv_r_uv_controller.text),
                    lv_r_vw: double.parse(_lv_r_vw_controller.text),
                    lv_r_wu: double.parse(_lv_r_wu_controller.text),
                    equipmentUsed: selectedValueForEquipmentUse.toString(),
                    tapPosition: int.parse(_tap_controller.text),
                    databaseID: 0,
                  );
                  print(Powt3winwrLvtoLocal);
                  print(Powt3winwrLvtoLocal.trNo);
                  getX((Powt3winwrLvProvider x) =>
                      x.addPowt3winwrLv(Powt3winwrLvtoLocal));
                  watchOnly((Powt3winwrLvProvider x) => {});

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
                        'LV Measured Resistance Value (mΩ)- UV',
                        _lv_r_uv_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'LV Measured Resistance Value (mΩ)- VW',
                        _lv_r_vw_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'LV Measured Resistance Value (mΩ)- WU',
                        _lv_r_wu_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'tapPosition', _tap_controller),
                  ]),
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
                        'LV Measured Resistance Value (mΩ)- UV',
                        _lv_r_uv_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'LV Measured Resistance Value (mΩ)- VW',
                        _lv_r_vw_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'LV Measured Resistance Value (mΩ)- WU',
                        _lv_r_wu_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'tapPosition', _tap_controller),
                  ]),
            ),
          );
        }
      }),
    );
  }
}
