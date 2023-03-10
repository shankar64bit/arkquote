// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/Auser_input_validation_exnt.dart/validation_extension_methods.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/equipmentUsed.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/powt_3_winding/powt3win_wrIvT_model.dart';
import '../../../data/models/equipment/powt_3_winding/powt3winding_model.dart';
import '../../providers/powt_3_winding/powt3win_wrIvT_provider.dart';
import '../../providers/powt_3_winding/powt_3_winding_provider.dart';
import '../../widgets/custom_text_form_field_For_number.dart';
import '../dropdown_All/a_as_simplified_function.dart';

final _formKey = GlobalKey<FormState>();

class Add_PowtwrIvT_Details extends StatelessWidget with GetItMixin {
  Map args = {};
  int POWT3WIN_ID;
  int TR_ID;

  Add_PowtwrIvT_Details(this.args, {Key key}) : super(key: key);

  final TextEditingController _trNo_controller = TextEditingController();
  final TextEditingController _serialNo_controller = TextEditingController();
  final TextEditingController _ivt_r_uvn_controller = TextEditingController();
  final TextEditingController _ivt_r_vwn_controller = TextEditingController();
  final TextEditingController _ivt_r_wun_controller = TextEditingController();
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
    var mob = Text('Add Powt3win WR Iv/Tertiary Details',
        style: TextStyle(fontSize: 17));
    var desk = Text('Add Powt3win WR Iv/Tertiary Details',
        style: TextStyle(fontSize: 20));
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
                  final Powt3winwrIvTModel Powt3winwrIvTtoLocal =
                      Powt3winwrIvTModel(
                    trNo: int.parse(_trNo_controller.text),
                    serialNo: _serialNo_controller.text,
                    ivt_r_uvn: double.parse(_ivt_r_uvn_controller.text),
                    ivt_r_vwn: double.parse(_ivt_r_vwn_controller.text),
                    ivt_r_wun: double.parse(_ivt_r_wun_controller.text),
                    tapPosition: int.parse(_tap_controller.text),
                    databaseID: 0,
                  );
                  print(Powt3winwrIvTtoLocal);
                  print(Powt3winwrIvTtoLocal.trNo);
                  getX((Powt3winwrIvTProvider x) =>
                      x.addPowt3winwrIvT(Powt3winwrIvTtoLocal));
                  watchOnly((Powt3winwrIvTProvider x) => {});

                  Navigator.popAndPushNamed(context, '/detail_POWT3WIN',
                      arguments: {
                        'id': args['POWT3WIN_ID'],
                        'powt3winDatabaseID': POWT3WIN_ID,
                        'trDatabaseID': TR_ID,
                      });

                  var url = Uri.parse('${Env.URL_PREFIX}/powt3wWrIvtTest/');
                  var response = await http.post(url, body: {
                    'trNo': args['trDatabaseID'].toString(),
                    'serialNo': args['powt3winDatabaseID'].toString(),
                    'ivt_r_uvn': _ivt_r_uvn_controller.text.toString(),
                    'ivt_r_vwn': _ivt_r_vwn_controller.text.toString(),
                    'ivt_r_wun': _ivt_r_wun_controller.text.toString(),
                    'tapPosition': _tap_controller.text.toString(),
                    'equipmentUsed': selectedValueForEquipmentUse.toString(),
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
                    final Powt3winwrIvTModel Powt3winwrIvTtoLocal =
                        Powt3winwrIvTModel(
                      trNo: int.parse(_trNo_controller.text),
                      serialNo: _serialNo_controller.text,
                      ivt_r_uvn: double.parse(_ivt_r_uvn_controller.text),
                      ivt_r_vwn: double.parse(_ivt_r_vwn_controller.text),
                      ivt_r_wun: double.parse(_ivt_r_wun_controller.text),
                      tapPosition: int.parse(_tap_controller.text),
                      databaseID: json.decode(response.body)['id'],
                    );
                    print(Powt3winwrIvTtoLocal);
                    print(Powt3winwrIvTtoLocal.trNo);
                    getX((Powt3winwrIvTProvider x) =>
                        x.addPowt3winwrIvT(Powt3winwrIvTtoLocal));
                    watchOnly((Powt3winwrIvTProvider x) => {});

                    Navigator.popAndPushNamed(context, '/detail_POWT3WIN',
                        arguments: {
                          'id': args['POWT3WIN_ID'],
                          'powt3winDatabaseID': POWT3WIN_ID,
                          'trDatabaseID': TR_ID,
                        });
                    // min++;
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
    String displayText = 'IV Measured Resistance Value (mΩ)- ';
    final Powt3WindingModel ntr =
        watchOnly((Powt3WindingProvider x) => x.powt3WindingModel);
    if (ntr.vectorGroup.toLowerCase() == 'ynyn0d11')
      displayText = 'Tertairy Measured Resistance Value (mΩ)- ';

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
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _ivt_r_uvn_controller,
                        hintText: displayText + 'UN /UV',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _ivt_r_vwn_controller,
                        hintText: displayText + 'VN /VW',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _ivt_r_wun_controller,
                        hintText: displayText + 'WN / WU',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                        },
                      ),
                    ),
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _ivt_r_uvn_controller,
                        hintText: displayText + 'UN /UV',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _ivt_r_vwn_controller,
                        hintText: displayText + 'VN /VW',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _ivt_r_wun_controller,
                        hintText: displayText + 'WN / WU',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                        },
                      ),
                    ),
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
