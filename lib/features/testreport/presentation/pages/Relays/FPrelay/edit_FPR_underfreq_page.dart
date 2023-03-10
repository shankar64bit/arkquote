// ignore_for_file: missing_return, missing_required_param, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/Auser_input_validation_exnt.dart/validation_extension_methods.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../../env.sample.dart';
import '../../../../data/models/equipment/Relays/FPrelay/FPR_underfreq_model.dart';
import '../../../providers/Relays_providers/FPrelay_providers/FPR_underfreq_provider.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../dropdown_All/a_as_simplified_function.dart';
import '../../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditFPRunderfreqPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditFPRunderfreqPage(this.args, {Key key}) : super(key: key);

  FPRunderfreqModel _fprunderfreqTestModel;
  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _trNo_controller = TextEditingController();
  final TextEditingController _serialNo_controller = TextEditingController();
  final TextEditingController _frequencySet_controller =
      TextEditingController();
  final TextEditingController _delay_controller = TextEditingController();
  final TextEditingController _rn_relayOprTime_controller =
      TextEditingController();
  final TextEditingController _yn_relayOprTime_controller =
      TextEditingController();
  final TextEditingController _bn_relayOprTime_controller =
      TextEditingController();
  final TextEditingController _stageNo_controller = TextEditingController();
  final TextEditingController _function_controller = TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Future<void> getReport() async {
    getX((FPRunderfreqProvider x) => x.getFPRunderfreqById(args['id']));
    _fprunderfreqTestModel =
        watchOnly((FPRunderfreqProvider x) => x.fprunderfreq_Model);
    _IDcontroller.text = _fprunderfreqTestModel.id.toString();
    _trNo_controller.text = _fprunderfreqTestModel.trNo.toString();
    _serialNo_controller.text = _fprunderfreqTestModel.serialNo.toString();
    _frequencySet_controller.text =
        _fprunderfreqTestModel.frequencySet.toString();

    _delay_controller.text = _fprunderfreqTestModel.delay.toString();

    _rn_relayOprTime_controller.text =
        _fprunderfreqTestModel.rn_relayOprTime.toString();

    _yn_relayOprTime_controller.text =
        _fprunderfreqTestModel.yn_relayOprTime.toString();

    _bn_relayOprTime_controller.text =
        _fprunderfreqTestModel.bn_relayOprTime.toString();

    _stageNo_controller.text = _fprunderfreqTestModel.stageNo.toString();
    _function_controller.text = _fprunderfreqTestModel.function.toString();
  }

  @override
  Widget build(BuildContext context) {
    final FPRunderfreqModel ntr =
        watchOnly((FPRunderfreqProvider x) => x.fprunderfreq_Model);
    getReport();
    var mob = const Text('Edit FPR Underfreq Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('Edit FPR Underfreq Details',
        style: TextStyle(fontSize: 20));

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
                  var url = Uri.parse('${Env.URL_PREFIX}/fprUf/' +
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
                    'serialNo': args['FPR_ID'].toString(),
                    'frequencySet': _frequencySet_controller.text.toString(),
                    'delay': _delay_controller.text.toString(),
                    'rn_relayOprTime':
                        _rn_relayOprTime_controller.text.toString(),
                    'yn_relayOprTime':
                        _yn_relayOprTime_controller.text.toString(),
                    'bn_relayOprTime':
                        _bn_relayOprTime_controller.text.toString(),
                    'stageNo': _stageNo_controller.text.toString(),
                    'function': _function_controller.text.toString(),
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
                    final FPRunderfreqModel FPRunderfreqReportToLocal =
                        FPRunderfreqModel(
                      trNo: int.parse(_trNo_controller.text),
                      serialNo: _serialNo_controller.text,
                      frequencySet: double.parse(_frequencySet_controller.text),
                      delay: double.parse(_delay_controller.text),
                      rn_relayOprTime:
                          double.parse(_rn_relayOprTime_controller.text),
                      yn_relayOprTime:
                          double.parse(_yn_relayOprTime_controller.text),
                      bn_relayOprTime:
                          double.parse(_bn_relayOprTime_controller.text),
                      stageNo: int.parse(_stageNo_controller.text),
                      function: _function_controller.text.toString(),
                      databaseID: ntr.databaseID,
                      equipmentUsed: selectedValueForEquipmentUse.toString(),
                      updateDate: DateTime.now(),
                    );

                    getX((FPRunderfreqProvider x) => x.updateFPRunderfreq(
                        FPRunderfreqReportToLocal, args['id']));
                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_FPRunderfreq',
                        arguments: {
                          'id': args['id'],
                          'FPR_ID': args['FPR_ID'],
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
                          'ID',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5),
                        )),
                    TextFormField(
                      controller: _IDcontroller,
                      textAlign: TextAlign.center,
                      enabled: false,
                    ),
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
                      child: Text(
                        'Relay Adopted Setting',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomTextFormField(
                        controller: _function_controller,
                        hintText: 'Function',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                        },
                      ),
                    ),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Frequency Set', _frequencySet_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Delay', _delay_controller),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: Text(
                        'Relay Operation Check',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      ),
                    ),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'R-N Relay Operated Time', _rn_relayOprTime_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Y-N Relay Operated Time', _yn_relayOprTime_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'B-N Relay Operated Time', _bn_relayOprTime_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'stageNo', _stageNo_controller),
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
                          'ID',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5),
                        )),
                    TextFormField(
                      controller: _IDcontroller,
                      textAlign: TextAlign.center,
                      enabled: false,
                    ),
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
                          'Serial No',
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
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Text(
                        'Relay Adopted Setting',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: CustomTextFormField(
                        controller: _function_controller,
                        hintText: 'Function',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                        },
                      ),
                    ),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Frequency Set', _frequencySet_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Delay', _delay_controller),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Text(
                        'Relay Operation Check',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      ),
                    ),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'R-N Relay Operated Time', _rn_relayOprTime_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Y-N Relay Operated Time', _yn_relayOprTime_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'B-N Relay Operated Time', _bn_relayOprTime_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'stageNo', _stageNo_controller),
                  ]),
            ),
          );
        }
      }),
    );
  }
}
