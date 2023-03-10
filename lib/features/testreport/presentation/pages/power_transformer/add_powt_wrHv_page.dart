// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/powt/powt_model.dart';
import '../../../data/models/equipment/powt/powt_wrHv_model.dart';
import '../../providers/powt_provider/powt_provider.dart';
import '../../providers/powt_provider/powt_wrHv_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';

final _formKey = GlobalKey<FormState>();

class Add_PowtwrHv_Details extends StatelessWidget with GetItMixin {
  Map args = {};
  int POWT_ID;
  int TR_ID;

  Add_PowtwrHv_Details(this.args, {Key key}) : super(key: key);

  final TextEditingController _trNo_controller = TextEditingController();
  final TextEditingController _serialNo_controller = TextEditingController();
  final TextEditingController _hv_r_1u_1vn_controller = TextEditingController();
  final TextEditingController _hv_r_1v_1wn_controller = TextEditingController();
  final TextEditingController _hv_r_1w_1un_controller = TextEditingController();
  final TextEditingController _tap_controller = TextEditingController();

  setTrNo() {
    _trNo_controller.text = args['TrNo'].toString();
    _serialNo_controller.text = args['serial_no_bph'].toString();
    POWT_ID = args['powtDatabaseID'];
    TR_ID = args['trDatabaseID'];
  }

  @override
  Widget build(BuildContext context) {
    final PowtModel ntr = watchOnly((PowtProvider x) => x.powtModel);

    setTrNo();
    var mob = Text('Add Powt Wr Hv Details', style: TextStyle(fontSize: 17));
    var desk = Text('Add Powt Wr Hv Details', style: TextStyle(fontSize: 20));
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
                  final PowtwrHvModel PowtwrHvtoLocal = PowtwrHvModel(
                    trNo: int.parse(_trNo_controller.text),
                    serialNo: _serialNo_controller.text,
                    hv_r_1u_1vn: double.parse(_hv_r_1u_1vn_controller.text),
                    hv_r_1v_1wn: double.parse(_hv_r_1v_1wn_controller.text),
                    hv_r_1w_1un: double.parse(_hv_r_1w_1un_controller.text),
                    tapPosition: int.parse(_tap_controller.text),
                    databaseID: 0,
                  );
                  print(PowtwrHvtoLocal);
                  print(PowtwrHvtoLocal.trNo);
                  getX((PowtwrHvProvider x) => x.addPowtwrHv(PowtwrHvtoLocal));
                  watchOnly((PowtwrHvProvider x) => {});

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
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'HV Winding Measured Resistance Value (mΩ) 1U1V/1U1N',
                        _hv_r_1u_1vn_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'HV Winding Measured Resistance Value (mΩ) 1V1W/1V1N',
                        _hv_r_1v_1wn_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'HV Winding Measured Resistance Value (mΩ) 1W1U/1W1N',
                        _hv_r_1w_1un_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Tap Position', _tap_controller),
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
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'HV Winding Measured Resistance Value (mΩ) 1U1V/1U1N',
                        _hv_r_1u_1vn_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'HV Winding Measured Resistance Value (mΩ) 1V1W/1V1N',
                        _hv_r_1v_1wn_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'HV Winding Measured Resistance Value (mΩ) 1W1U/1W1N',
                        _hv_r_1w_1un_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Tap Position', _tap_controller),
                  ]),
            ),
          );
        }
      }),
    );
  }
}
