// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/equipmentUsed.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/AT/AT_mc_model.dart';
import '../../../data/models/equipment/AT/AT_model.dart';
import '../../providers/at_provider/at_mc_provider.dart';
import '../../providers/at_provider/at_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';

final _formKey = GlobalKey<FormState>();

class Add_At_mc_Details extends StatelessWidget with GetItMixin {
  Map args = {};
  int AT_ID;
  int TR_ID;

  Add_At_mc_Details(this.args, {Key key}) : super(key: key);

  final TextEditingController _trNo_controller = TextEditingController();
  final TextEditingController _serialNo_controller = TextEditingController();
  final TextEditingController _hv_1u_1n_controller = TextEditingController();
  final TextEditingController _hv_1v_1n_controller = TextEditingController();
  final TextEditingController _hv_1w_1n_controller = TextEditingController();
  final TextEditingController _hv_1u_controller = TextEditingController();
  final TextEditingController _hv_1v_controller = TextEditingController();
  final TextEditingController _hv_1w_controller = TextEditingController();
  final TextEditingController _hv_1n_controller = TextEditingController();
  final TextEditingController _tap_controller = TextEditingController();

  setTrNo() {
    _trNo_controller.text = args['TrNo'].toString();
    _serialNo_controller.text = args['serial_no_bph'].toString();
    AT_ID = args['atDatabaseID'];
    TR_ID = args['trDatabaseID'];
  }

  @override
  Widget build(BuildContext context) {
    final ATModel ntr = watchOnly((ATProvider x) => x.atModel);

    setTrNo();
    var mob = Text('Add AT_mc Details', style: TextStyle(fontSize: 17));
    var desk = Text('Add AT_mc Details', style: TextStyle(fontSize: 20));
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

                  double hv_1u_1n;
                  double hv_1v_1n;
                  double hv_1w_1n;
                  double hv_1u;
                  double hv_1v;
                  double hv_1w;
                  double hv_1n;

                  if (ntr.vectorGroup == "Dd0" ||
                      ntr.vectorGroup == "Dd6" ||
                      ntr.vectorGroup == "Dyn1" ||
                      ntr.vectorGroup == "Dyn11") {
                    hv_1u_1n = double.parse(_hv_1u_1n_controller.text);
                    hv_1v_1n = double.parse(_hv_1v_1n_controller.text);
                    hv_1w_1n = double.parse(_hv_1w_1n_controller.text);
                    hv_1u = double.parse(_hv_1u_controller.text);
                    hv_1v = double.parse(_hv_1v_controller.text);
                    hv_1w = double.parse(_hv_1w_controller.text);
                    hv_1n = 0.00;
                  }

                  _hv_1u_1n_controller.text = hv_1u_1n.toString();
                  _hv_1v_1n_controller.text = hv_1v_1n.toString();
                  _hv_1w_1n_controller.text = hv_1w_1n.toString();
                  _hv_1u_controller.text = hv_1u.toString();
                  _hv_1v_controller.text = hv_1v.toString();
                  _hv_1w_controller.text = hv_1w.toString();
                  _hv_1n_controller.text = hv_1n.toString();

                  // add to local database
                  final AT_mc_Model AT_mctoLocal = AT_mc_Model(
                    trNo: int.parse(_trNo_controller.text),
                    serialNo: _serialNo_controller.text,
                    hv_1u_1n: double.parse(_hv_1u_1n_controller.text),
                    hv_1v_1n: double.parse(_hv_1v_1n_controller.text),
                    hv_1w_1n: double.parse(_hv_1w_1n_controller.text),
                    hv_1u: double.parse(_hv_1u_controller.text),
                    hv_1v: double.parse(_hv_1v_controller.text),
                    hv_1w: double.parse(_hv_1w_controller.text),
                    hv_1n: double.parse(_hv_1n_controller.text),
                    equipmentUsed: selectedValueForEquipmentUse.toString(),
                    tapPosition: int.parse(_tap_controller.text),
                    databaseID: 0,
                  );
                  print(AT_mctoLocal);
                  print(AT_mctoLocal.trNo);
                  getX((AT_mc_Provider x) => x.addAT_mc(AT_mctoLocal));
                  watchOnly((AT_mc_Provider x) => {});
                  Navigator.popAndPushNamed(context, '/detail_AT', arguments: {
                    'id': args['AT_ID'],
                    'atDatabaseID': AT_ID,
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
    final ATModel ntr = watchOnly((ATProvider x) => x.atModel);

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
                          'hv_1u_1n', _hv_1u_1n_controller),
                      simplifiedFor_Diplay_for_all_PC_numpad(
                          'hv_1v_1n', _hv_1v_1n_controller),
                      simplifiedFor_Diplay_for_all_PC_numpad(
                          'hv_1w_1n', _hv_1w_1n_controller),
                      simplifiedFor_Diplay_for_all_PC_numpad(
                          'hv_1u', _hv_1u_controller),
                      simplifiedFor_Diplay_for_all_PC_numpad(
                          'hv_1v', _hv_1v_controller),
                      simplifiedFor_Diplay_for_all_PC_numpad(
                          'hv_1w', _hv_1w_controller),
                      ntr.vectorGroup == "YNd1" ||
                              ntr.vectorGroup == "YNd11" ||
                              ntr.vectorGroup == "YNyn0" ||
                              ntr.vectorGroup == "YNyn6"
                          ? simplifiedFor_Diplay_for_all_PC_numpad(
                              'hv_1n', _hv_1n_controller)
                          : Container(),
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
                        'hv_1u_1n', _hv_1u_1n_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'hv_1v_1n', _hv_1v_1n_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'hv_1w_1n', _hv_1w_1n_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'hv_1u', _hv_1u_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'hv_1v', _hv_1v_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'hv_1w', _hv_1w_controller),
                    ntr.vectorGroup == "YNd1" ||
                            ntr.vectorGroup == "YNd11" ||
                            ntr.vectorGroup == "YNyn0" ||
                            ntr.vectorGroup == "YNyn6"
                        ? simplifiedFor_Display_for_all_Mobile_numpad(
                            'hv_1n', _hv_1n_controller)
                        : Container(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'tapPosition', _tap_controller),
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
