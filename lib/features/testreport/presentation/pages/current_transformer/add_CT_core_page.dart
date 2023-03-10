// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/CT/ct_core_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/Auser_input_validation_exnt.dart/validation_extension_methods.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/ct_provider/ct_core_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../../../injection_container.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/custom_text_form_field_For_number.dart';
import '../dropdown_All/a_as_simplified_function.dart';

final _formKey = GlobalKey<FormState>();

class Add_CT_core_Details extends StatelessWidget with GetItMixin {
  Map args = {};
  int CT_ID;
  int TR_ID;

  Add_CT_core_Details(this.args, {Key key}) : super(key: key);

  final TextEditingController _coreNo_controller = TextEditingController();
  final TextEditingController _coreClass_controller = TextEditingController();
  final TextEditingController _burden_controller = TextEditingController();
  final TextEditingController _ctNo_controller = TextEditingController();

  setTrNo() {
    _ctNo_controller.text = args['CT_ID'].toString();
    CT_ID = args['ctDatabaseID'];
    TR_ID = args['trDatabaseID'];
  }

  @override
  Widget build(BuildContext context) {
    setTrNo();
    var mob = Text('Add CTcore Details', style: TextStyle(fontSize: 17));
    var desk = Text('Add CTcore Details', style: TextStyle(fontSize: 20));
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

                  var coreClass_toLower =
                      _coreClass_controller.text.toLowerCase();

                  var core_class_value;
                  if (coreClass_toLower == 'ps') {
                    core_class_value = 'ps';
                  } else {
                    core_class_value == _coreClass_controller.text;
                  }

                  var burden;
                  if (_burden_controller.text.isEmpty == true) {
                    burden = '0';
                  }

                  _coreClass_controller.text = core_class_value;
                  _burden_controller.text = burden;

                  // add to remote database
                  var url = Uri.parse('${Env.URL_PREFIX}/coreDetails/');
                  var response = await http.post(url, body: {
                    'ctNo': args['ctDatabaseID'].toString(),
                    'coreNo': _coreNo_controller.text.toString(),
                    'coreClass': _coreClass_controller.text.toString(),
                    'burden': _burden_controller.text.toString(),
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
                    final CT_core_Model CTcoretoLocal = CT_core_Model(
                      ctNo: int.parse(_ctNo_controller.text),
                      burden: int.parse(_burden_controller.text),
                      coreClass: _coreClass_controller.text,
                      coreNo: int.parse(_coreNo_controller.text),
                      databaseID: json.decode(response.body)['id'],
                    );
                    print(CTcoretoLocal);
                    print(CTcoretoLocal.ctNo);
                    getX((CT_core_Provider x) => x.addCT_core(CTcoretoLocal));
                    watchOnly((CT_core_Provider x) => {});

                    Navigator.popAndPushNamed(context, '/detail_CT',
                        arguments: {
                          'id': args['CT_ID'],
                          'ctDatabaseID': CT_ID,
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
                          'ctNo',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5),
                        )),
                    TextFormField(
                      controller: _ctNo_controller,
                      textAlign: TextAlign.center,
                      enabled: false,
                    ),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'coreNo', _coreNo_controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'coreClass', _coreClass_controller),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _burden_controller,
                        hintText: 'burden (optional only for PS)',
                        validator: (val) {
                          if (_coreClass_controller.text == 'ps') {
                            return null;
                          }
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                        },
                      ),
                    ),
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
                        'ctNo',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      )),
                  TextFormField(
                    controller: _ctNo_controller,
                    textAlign: TextAlign.center,
                    enabled: false,
                  ),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'coreNo', _coreNo_controller),
                  simplifiedFor_Display_for_all_Mobile_alphanum(
                      'coreClass', _coreClass_controller),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: CustomTextFormFieldForNumber(
                      controller: _burden_controller,
                      hintText: 'burden (optional only for PS)',
                      validator: (val) {
                        if (_coreClass_controller.text == 'ps') {
                          return null;
                        }
                        if (!val.IsValueEmpty) {
                          return 'Field should not be empty';
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
