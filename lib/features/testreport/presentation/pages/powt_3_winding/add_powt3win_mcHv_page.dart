// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/equipmentUsed.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/powt_3_winding/powt3win_mcHv_model.dart';
import '../../../data/models/equipment/powt_3_winding/powt3winding_model.dart';
import '../../providers/powt_3_winding/powt3win_mcHv_provider.dart';
import '../../providers/powt_3_winding/powt_3_winding_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';

final _formKey = GlobalKey<FormState>();

class Add_Powt3win_mcHv_Details extends StatelessWidget with GetItMixin {
  Map args = {};
  int POWT3WIN_ID;
  int TR_ID;

  Add_Powt3win_mcHv_Details(this.args, {Key key}) : super(key: key);

  final TextEditingController _trNo_controller = TextEditingController();
  final TextEditingController _serialNo_controller = TextEditingController();
  final TextEditingController _hv_1u_1vn_controller = TextEditingController();
  final TextEditingController _hv_1v_1wn_controller = TextEditingController();
  final TextEditingController _hv_1w_1un_controller = TextEditingController();
  final TextEditingController _hv_1u_controller = TextEditingController();
  final TextEditingController _hv_1v_controller = TextEditingController();
  final TextEditingController _hv_1w_controller = TextEditingController();
  final TextEditingController _hv_1n_controller = TextEditingController();
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
    var mob = Text('Add Powt3win_mcHv Details', style: TextStyle(fontSize: 17));
    var desk =
        Text('Add Powt3win_mcHv Details', style: TextStyle(fontSize: 20));
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
                    _hv_1n_controller.text = '0.0';
                  }

                  // add to local database
                  final Powt3win_mcHv_Model Powt3win_mcHvtoLocal =
                      Powt3win_mcHv_Model(
                    trNo: int.parse(_trNo_controller.text),
                    serialNo: _serialNo_controller.text,
                    hv_1u_1vn: double.parse(_hv_1u_1vn_controller.text),
                    hv_1v_1wn: double.parse(_hv_1v_1wn_controller.text),
                    hv_1w_1un: double.parse(_hv_1w_1un_controller.text),
                    hv_1u: double.parse(_hv_1u_controller.text),
                    hv_1v: double.parse(_hv_1v_controller.text),
                    hv_1w: double.parse(_hv_1w_controller.text),
                    hv_1n: double.parse(_hv_1n_controller.text),
                    tapPosition: int.parse(_tap_controller.text),
                    databaseID: 0,
                  );
                  print(Powt3win_mcHvtoLocal);
                  print(Powt3win_mcHvtoLocal.trNo);
                  getX((Powt3win_mcHv_Provider x) =>
                      x.addPowt3win_mcHv(Powt3win_mcHvtoLocal));
                  watchOnly((Powt3win_mcHv_Provider x) => {});

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
                      'HV side 1UN/UV', _hv_1u_1vn_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'HV side 1VN/VW', _hv_1v_1wn_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'HV side 1WN/WU', _hv_1w_1un_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'HV Side 1U', _hv_1u_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'HV Side 1V', _hv_1v_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'HV Side 1W', _hv_1w_controller),
                  ntr.vectorGroup.toLowerCase() == "ynyn0d11"
                      ? simplifiedFor_Diplay_for_all_PC_numpad(
                          'HV Side 1N', _hv_1n_controller)
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
                        'HV side 1UN/UV', _hv_1u_1vn_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'HV side 1VN/VW', _hv_1v_1wn_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'HV side 1WN/WU', _hv_1w_1un_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'HV Side 1U', _hv_1u_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'HV Side 1V', _hv_1v_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'HV Side 1W', _hv_1w_controller),
                    ntr.vectorGroup == "ynyn0d11"
                        ? simplifiedFor_Display_for_all_Mobile_numpad(
                            'HV Side 1N', _hv_1n_controller)
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
