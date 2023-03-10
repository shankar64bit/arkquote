// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/CT/ct_core_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/CT/ct_tap_model.dart';
import '../../providers/ct_provider/ct_core_provider.dart';
import '../../providers/ct_provider/ct_tap_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';

final _formKey = GlobalKey<FormState>();

class Add_CT_tap_Details extends StatelessWidget with GetItMixin {
  Map args = {};
  int CTcore_ID;
  int CT_ID;

  Add_CT_tap_Details(this.args, {Key key}) : super(key: key);

  final TextEditingController _tapName_controller = TextEditingController();
  final TextEditingController _ratio_controller = TextEditingController();
  final TextEditingController _kneePointVoltage_controller =
      TextEditingController();
  final TextEditingController _leakageCurrent_controller =
      TextEditingController();
  final TextEditingController _coreRef_controller = TextEditingController();

  setTrNo() {
    _coreRef_controller.text = args['CTcore_ID'].toString();
    CT_ID = args['ctDatabaseID'];
    CTcore_ID = args['ctcoreDatabaseID'];
  }

  @override
  Widget build(BuildContext context) {
    final CT_core_Model ntr =
        watchOnly((CT_core_Provider x) => x.ct_core_Model);

    final CT_tap_Model ntr_tap =
        watchOnly((CT_tap_Provider x) => x.ct_tap_Model);
    setTrNo();
    var mob = Text('Add CTtap Details', style: TextStyle(fontSize: 17));
    var desk = Text('Add CTtap Details', style: TextStyle(fontSize: 20));
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

                  var kneepoint;
                  var leakCurr;
                  var coreClass = ntr.coreClass.toLowerCase();

                  if (coreClass == 'ps') {
                    if (coreClass == 'ps') {
                      kneepoint = _kneePointVoltage_controller.text;
                      leakCurr = _leakageCurrent_controller.text;
                    }
                    kneepoint = _kneePointVoltage_controller.text;
                    leakCurr = _leakageCurrent_controller.text;
                  } else {
                    kneepoint = 0;
                    leakCurr = 0;
                  }
                  _kneePointVoltage_controller.text = kneepoint.toString();
                  _leakageCurrent_controller.text = leakCurr.toString();
                  // add to remote database
                  var url = Uri.parse('${Env.URL_PREFIX}/tapDetails/');
                  var response = await http.post(url, body: {
                    'coreRef': args['ctcoreDatabaseID'].toString(),
                    'tapName': _tapName_controller.text.toString(),
                    'ratio': _ratio_controller.text.toString(),
                    'kneePointVoltage':
                        _kneePointVoltage_controller.text.toString(),
                    'leakageCurrent':
                        _leakageCurrent_controller.text.toString(),
                  }, headers: {
                    'Authorization': 'Bearer $accToken',
                  });

                  ///////////////////////////////Status-Code-Condition///////////////////
                  var successCode = 200;
                  var successCode2 = 201;
                  var failedCode = 'Server Connection Lost';

                  if (response.statusCode == successCode ||
                      response.statusCode == successCode2) {
                    print('Response status: ${response.statusCode}');
                    print('Response body: ${response.body}');
                    print('Stored successfully');

                    // add to local database
                    final CT_tap_Model CTtaptoLocal = CT_tap_Model(
                      coreRef: int.parse(_coreRef_controller.text),
                      kneePointVoltage:
                          int.parse(_kneePointVoltage_controller.text),
                      leakageCurrent:
                          int.parse(_leakageCurrent_controller.text),
                      ratio: int.parse(_ratio_controller.text),
                      tapName: _tapName_controller.text.toString(),
                      updateDate: DateTime.now(),
                      databaseID: json.decode(response.body)['id'],
                    );
                    print(CTtaptoLocal);
                    print(CTtaptoLocal.coreRef);
                    getX((CT_tap_Provider x) => x.addCT_tap(CTtaptoLocal));
                    watchOnly((CT_tap_Provider x) => {});

                    Navigator.popAndPushNamed(context, '/detail_CT_core',
                        arguments: {
                          'id': args['CTcore_ID'],
                          'ctDatabaseID': CT_ID,
                          'ctcoreDatabaseID': CTcore_ID,
                        });
                  } else {
                    failedCode;
                    print('Response status: ${response.statusCode}');
                    print('Response body: ${response.body}');
                  }
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
    final CT_core_Model ntr =
        watchOnly((CT_core_Provider x) => x.ct_core_Model);

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
                          'coreRef',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5),
                        )),
                    TextFormField(
                      controller: _coreRef_controller,
                      textAlign: TextAlign.center,
                      enabled: false,
                    ),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'tapName', _tapName_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'ration', _ratio_controller),
                    ntr.coreClass == "PS" || ntr.coreClass == 'ps'
                        ? Column(
                            children: [
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'kneePointVolt',
                                  _kneePointVoltage_controller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'leakageCurrent', _leakageCurrent_controller),
                            ],
                          )
                        : Container()
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
                        'coreRef',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      )),
                  TextFormField(
                    controller: _coreRef_controller,
                    textAlign: TextAlign.center,
                    enabled: false,
                  ),
                  simplifiedFor_Display_for_all_Mobile_alphanum(
                      'tapName', _tapName_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'ration', _ratio_controller),
                  ntr.coreClass == "PS" || ntr.coreClass == 'ps'
                      ? Column(
                          children: [
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                'kneePointVolt', _kneePointVoltage_controller),
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                'leakageCurrent', _leakageCurrent_controller),
                          ],
                        )
                      : Container()
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
