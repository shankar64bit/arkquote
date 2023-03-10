// ignore_for_file: missing_return, missing_required_param, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/Auser_input_validation_exnt.dart/validation_extension_methods.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../data/models/equipment/AT/AT_model.dart';
import '../../../data/models/equipment/AT/AT_wrLv_model.dart';
import '../../providers/at_provider/at_provider.dart';
import '../../providers/at_provider/at_wrLv_provider.dart';
import '../../widgets/custom_text_form_field_For_number.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditATwrLVPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditATwrLVPage(this.args, {Key key}) : super(key: key);

  ATwrLv_Model _atwrLvTestModel;
  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _trNo_controller = TextEditingController();
  final TextEditingController _serialNo_controller = TextEditingController();
  final TextEditingController _lv_2u_2v_controller = TextEditingController();
  final TextEditingController _lv_2v_2w_controller = TextEditingController();
  final TextEditingController _lv_2w_2u_controller = TextEditingController();
  final TextEditingController _tap_controller = TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Future<void> getReport() async {
    getX((ATwrLv_Provider x) => x.getATwrLvById(args['id']));
    _atwrLvTestModel = watchOnly((ATwrLv_Provider x) => x.atwrLv_Model);
    _IDcontroller.text = _atwrLvTestModel.id.toString();
    _trNo_controller.text = _atwrLvTestModel.trNo.toString();
    _serialNo_controller.text = _atwrLvTestModel.serialNo.toString();
    _lv_2u_2v_controller.text = _atwrLvTestModel.lv_2u_2v.toString();
    _lv_2v_2w_controller.text = _atwrLvTestModel.lv_2v_2w.toString();
    _lv_2w_2u_controller.text = _atwrLvTestModel.lv_2w_2u.toString();
    _tap_controller.text = _atwrLvTestModel.tapPosition.toString();
  }

  @override
  Widget build(BuildContext context) {
    final ATwrLv_Model ntr = watchOnly((ATwrLv_Provider x) => x.atwrLv_Model);
    getReport();
    var mob =
        const Text('Edit AT-wrLv Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Edit AT-wrLv Details', style: TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // ignore: missing_return
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
                  //add to remote database
                  var success_code = 201;
                  var success_code1 = 200;
                  var failed_code = 'Server Connection Lost';
                  //add to remote database
                  var url = Uri.parse('${Env.URL_PREFIX}/atWrLvTest/' +
                      ntr.databaseID.toString() +
                      '/');

                  Map<String, String> headers = {
                    "Content-type": "application/json",
                    "Authorization": "Bearer $acc_token",
                  };
                  print("***********");
                  print(args['trDatabaseID'].toString());

                  print(url);

                  final Map payload = {
                    'trNo': args['trDatabaseID'].toString(),
                    'serialNo': args['AT_ID'].toString(),
                    'lv_2u_2v': _lv_2u_2v_controller.text.toString(),
                    'lv_2v_2w': _lv_2v_2w_controller.text.toString(),
                    'lv_2w_2u': _lv_2w_2u_controller.text.toString(),
                    'tapPosition': _tap_controller.text.toString(),
                    'equipmentUsed': selectedValueForEquipmentUse.toString(),
                    'updateDate': DateTime.now().toString(),
                  };
                  var response = await http.put(url,
                      body: jsonEncode(payload), headers: headers);

                  if (response.statusCode == success_code ||
                      response.statusCode == success_code1) {
                    print('Response status: ${response.statusCode}');
                    print('Response body: ${response.body}');
                    print('Stored successfully');

                    //add to local database
                    final ATwrLv_Model atwrLvReportToLocal = ATwrLv_Model(
                      trNo: int.parse(_trNo_controller.text),
                      serialNo: _serialNo_controller.text,
                      lv_2u_2v: double.parse(_lv_2u_2v_controller.text),
                      lv_2v_2w: double.parse(_lv_2v_2w_controller.text),
                      lv_2w_2u: double.parse(_lv_2w_2u_controller.text),
                      tapPosition: int.parse(_tap_controller.text),
                      databaseID: ntr.databaseID,
                      equipmentUsed: selectedValueForEquipmentUse.toString(),
                      updateDate: DateTime.now(),
                    );

                    getX((ATwrLv_Provider x) =>
                        x.updateATwrLv(atwrLvReportToLocal, args['id']));
                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_ATwrLv',
                        arguments: {
                          'id': args['id'],
                          'AT_ID': args['AT_ID'],
                          'trDatabaseID': args['trDatabaseID'],
                        });
                  } else {
                    failed_code;
                    print('Failed Response status: ${response.statusCode}');
                    print('Failed Response body: ${response.body}');
                    print('Unsuccessfully');
                  }
                }
              },
              icon: const Icon(Icons.save)),
        ],
      ),
      // body: SingleChildScrollView(child: build_body()),
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
      child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 400) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              elevation: 2,
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text('ID',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5))),
                  TextFormField(
                      controller: _IDcontroller,
                      enabled: false,
                      textAlign: TextAlign.center),
                  Padding(
                      padding: EdgeInsets.fromLTRB(150, 10, 150, 10),
                      child: Text(
                        'Trno',
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
                  Divider(color: Colors.black, thickness: 1),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                    child: EquipmentTypeList(),
                  ),
                  simplifiedFor_AT_wrHv('lv_2u_2v', _lv_2u_2v_controller, 150.0,
                      0.0, 150.0, 10.0),
                  simplifiedFor_AT_wrHv('lv_2v_2w', _lv_2v_2w_controller, 150.0,
                      0.0, 150.0, 10.0),
                  simplifiedFor_AT_wrHv('lv_2w_2u', _lv_2w_2u_controller, 150.0,
                      0.0, 150.0, 10.0),
                  simplifiedFor_AT_wrHv(
                      'tapPosition', _tap_controller, 150.0, 0.0, 150.0, 10.0)
                ],
              ),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              elevation: 2,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      'ID',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5),
                    ),
                  ),
                  TextFormField(
                    controller: _IDcontroller,
                    enabled: false,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        'TrNo',
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
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: EquipmentTypeList(),
                  ),
                  simplifiedFor_AT_wrHv(
                      'lv_2u_2v', _lv_2u_2v_controller, 10.0, 0.0, 10.0, 10.0),
                  simplifiedFor_AT_wrHv(
                      'lv_2v_2w', _lv_2v_2w_controller, 10.0, 0.0, 10.0, 10.0),
                  simplifiedFor_AT_wrHv(
                      'lv_2w_2u', _lv_2w_2u_controller, 10.0, 0.0, 10.0, 10.0),
                  simplifiedFor_AT_wrHv(
                      'tapPosition', _tap_controller, 10.0, 0.0, 10.0, 10.0)
                ],
              ),
            ),
          );
        }
      }),
    );
  }

  simplifiedFor_AT_wrHv(
      var hinttxt, TextEditingController tc, double l, t, r, b) {
    return Padding(
      padding: EdgeInsets.fromLTRB(l, t, r, b),
      child: CustomTextFormFieldForNumber(
        controller: tc,
        hintText: hinttxt,
        validator: (val) {
          if (!val.IsValueEmpty) {
            return 'Field should not be empty';
          }
        },
      ),
    );
  }
}
