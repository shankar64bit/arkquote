// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/equipmentUsed.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/powt/powt_mc_model.dart';
import '../../../data/models/equipment/powt/powt_model.dart';
import '../../providers/powt_provider/powt_mc_provider.dart';
import '../../providers/powt_provider/powt_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';

final _formKey = GlobalKey<FormState>();
// int min = 0;
// int max;

class Add_Powt_mc_Details extends StatelessWidget with GetItMixin {
  Map args = {};
  int POWT_ID;
  int TR_ID;

  Add_Powt_mc_Details(this.args, {Key key}) : super(key: key);

  final TextEditingController _trNo_controller = TextEditingController();
  final TextEditingController _serialNo_controller = TextEditingController();
  final TextEditingController _hv_1u_1n_controller = TextEditingController();
  final TextEditingController _hv_1v_1n_controller = TextEditingController();
  final TextEditingController _hv_1w_1n_controller = TextEditingController();
  final TextEditingController _hv_1u_controller = TextEditingController();
  final TextEditingController _hv_1v_controller = TextEditingController();
  final TextEditingController _hv_1w_controller = TextEditingController();
  final TextEditingController _hv_1n_controller = TextEditingController();
  final TextEditingController _equipmentUsed_controller =
      TextEditingController();
  final TextEditingController _tap_controller = TextEditingController();

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
    //doubt in importing model file in all add pages
    // max = ntr.noOfCores;
    setTrNo();
    var mob = Text('Add Powt_mc Details', style: TextStyle(fontSize: 17));
    var desk = Text('Add Powt_mc Details', style: TextStyle(fontSize: 20));
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

                  if (ntr.vectorGroup == "Db0" ||
                      ntr.vectorGroup == "Db6" ||
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

                  if (ntr.vectorGroup == "YNd1" ||
                      ntr.vectorGroup == "YNd11" ||
                      ntr.vectorGroup == "YNyn0" ||
                      ntr.vectorGroup == "YNyn6") {
                    hv_1u_1n = double.parse(_hv_1u_1n_controller.text);
                    hv_1v_1n = double.parse(_hv_1v_1n_controller.text);
                    hv_1w_1n = double.parse(_hv_1w_1n_controller.text);
                    hv_1u = double.parse(_hv_1u_controller.text);
                    hv_1v = double.parse(_hv_1v_controller.text);
                    hv_1w = double.parse(_hv_1w_controller.text);
                    hv_1n = double.parse(_hv_1n_controller.text);
                  }

                  _hv_1u_1n_controller.text = hv_1u_1n.toString();
                  _hv_1v_1n_controller.text = hv_1v_1n.toString();
                  _hv_1w_1n_controller.text = hv_1w_1n.toString();
                  _hv_1u_controller.text = hv_1u.toString();
                  _hv_1v_controller.text = hv_1v.toString();
                  _hv_1w_controller.text = hv_1w.toString();
                  _hv_1n_controller.text = hv_1n.toString();

                  // add to local database
                  final Powt_mc_Model Powt_mctoLocal = Powt_mc_Model(
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
                  print(Powt_mctoLocal);
                  print(Powt_mctoLocal.trNo);
                  getX((Powt_mc_Provider x) => x.addPowt_mc(Powt_mctoLocal));
                  watchOnly((Powt_mc_Provider x) => {});

                  Navigator.popAndPushNamed(context, '/detail_POWT',
                      arguments: {
                        'id': args['POWT_ID'],
                        'powtDatabaseID': POWT_ID,
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
                        'Tap Position', _tap_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Applied Voltage HV Side - UN', _hv_1u_1n_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Applied Voltage HV Side - VN', _hv_1v_1n_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Applied Voltage HV Side - WN', _hv_1w_1n_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Measured Magnetizing Current HV Side-1U',
                        _hv_1u_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Measured Magnetizing Current HV Side-1V',
                        _hv_1v_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Measured Magnetizing Current HV Side-1W',
                        _hv_1w_controller),
                    ntr.vectorGroup.toLowerCase() == 'dyn1' ||
                            ntr.vectorGroup.toLowerCase() == 'dyn11'
                        ? Container()
                        : simplifiedFor_Diplay_for_all_PC_numpad(
                            'Measured Magnetizing Current HV Side-1N',
                            _hv_1n_controller),
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
                        'Tap Position', _tap_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Applied Voltage HV Side - UN', _hv_1u_1n_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Applied Voltage HV Side - VN', _hv_1v_1n_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Applied Voltage HV Side - WN', _hv_1w_1n_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Measured Magnetizing Current HV Side-1U',
                        _hv_1u_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Measured Magnetizing Current HV Side-1V',
                        _hv_1v_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Measured Magnetizing Current HV Side-1W',
                        _hv_1w_controller),
                    ntr.vectorGroup.toLowerCase() == 'dyn1' ||
                            ntr.vectorGroup.toLowerCase() == 'dyn11'
                        ? Container()
                        : simplifiedFor_Display_for_all_Mobile_numpad(
                            'Measured Magnetizing Current HV Side-1N',
                            _hv_1n_controller),
                  ]),
            ),
          );
        }
      }),
    );
  }
}
