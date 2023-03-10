// ignore_for_file: missing_return, missing_required_param, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/Auser_input_validation_exnt.dart/validation_extension_methods.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../../env.sample.dart';
import '../../../../data/models/equipment/Relays/FPrelay/FPR_earthfault_model.dart';
import '../../../providers/Relays_providers/FPrelay_providers/FPR_earthfault_provider.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../dropdown_All/a_as_simplified_function.dart';
import '../../dropdown_All/a_fpr_curve_drop_list.dart';
import '../../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditFPRearthfaultPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditFPRearthfaultPage(this.args, {Key key}) : super(key: key);

  FPRearthfaultModel _fprearthfaultTestModel;
  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _trNo_controller = TextEditingController();
  final TextEditingController _serialNo_controller = TextEditingController();
  final TextEditingController _CurrentSet_controller = TextEditingController();
  final TextEditingController _TMS_controller = TextEditingController();
  final TextEditingController _delay_controller = TextEditingController();
  final TextEditingController _pickupCurrent_controller =
      TextEditingController();
  final TextEditingController _relayOprTime_2x_controller =
      TextEditingController();
  final TextEditingController _relayOprTime_5x_controller =
      TextEditingController();
  final TextEditingController _stageNo_controller = TextEditingController();
  final TextEditingController _curve_controller = TextEditingController();
  final TextEditingController _function_controller = TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();
  String get selectedValueForCurveType => fprCurveType_drop_lits().get_etype();

  Future<void> getReport() async {
    getX((FPRearthfaultProvider x) => x.getFPRearthfaultById(args['id']));
    _fprearthfaultTestModel =
        watchOnly((FPRearthfaultProvider x) => x.fprearthfault_Model);
    _IDcontroller.text = _fprearthfaultTestModel.id.toString();
    _trNo_controller.text = _fprearthfaultTestModel.trNo.toString();
    _serialNo_controller.text = _fprearthfaultTestModel.serialNo.toString();
    _CurrentSet_controller.text = _fprearthfaultTestModel.currentSet.toString();
    _TMS_controller.text = _fprearthfaultTestModel.TMS.toString();
    _delay_controller.text = _fprearthfaultTestModel.delay.toString();
    _pickupCurrent_controller.text =
        _fprearthfaultTestModel.pickupCurrent.toString();
    _relayOprTime_2x_controller.text =
        _fprearthfaultTestModel.relayOprTime_2x.toString();
    _relayOprTime_5x_controller.text =
        _fprearthfaultTestModel.relayOprTime_5x.toString();
    _stageNo_controller.text = _fprearthfaultTestModel.stageNo.toString();
    _curve_controller.text = _fprearthfaultTestModel.curve.toString();
    _function_controller.text = _fprearthfaultTestModel.function.toString();
  }

  @override
  Widget build(BuildContext context) {
    final FPRearthfaultModel ntr =
        watchOnly((FPRearthfaultProvider x) => x.fprearthfault_Model);
    getReport();
    var mob =
        const Text('Edit earthfault Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Edit earthfault Details', style: TextStyle(fontSize: 20));

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
                  var url = Uri.parse('${Env.URL_PREFIX}/fprEf/' +
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
                    'currentSet': _CurrentSet_controller.text.toString(),
                    'TMS': _TMS_controller.text.toString(),
                    'delay': _delay_controller.text.toString(),
                    'pickupCurrent': _pickupCurrent_controller.text.toString(),
                    'relayOprTime_2x':
                        _relayOprTime_2x_controller.text.toString(),
                    'relayOprTime_5x':
                        _relayOprTime_5x_controller.text.toString(),
                    'stageNo': _stageNo_controller.text.toString(),
                    'curve': _curve_controller.text.toString(),
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
                    final FPRearthfaultModel FPRearthfaultReportToLocal =
                        FPRearthfaultModel(
                      trNo: int.parse(_trNo_controller.text),
                      serialNo: _serialNo_controller.text,
                      currentSet: double.parse(_CurrentSet_controller.text),
                      TMS: double.parse(_TMS_controller.text),
                      delay: double.parse(_delay_controller.text),
                      pickupCurrent:
                          double.parse(_pickupCurrent_controller.text),
                      relayOprTime_2x:
                          double.parse(_relayOprTime_2x_controller.text),
                      relayOprTime_5x:
                          double.parse(_relayOprTime_5x_controller.text),
                      stageNo: int.parse(_stageNo_controller.text),
                      curve: selectedValueForCurveType.toString(),
                      function: _function_controller.text.toString(),
                      databaseID: ntr.databaseID,
                      equipmentUsed: selectedValueForEquipmentUse.toString(),
                      updateDate: DateTime.now(),
                    );

                    getX((FPRearthfaultProvider x) => x.updateFPRearthfault(
                        FPRearthfaultReportToLocal, args['id']));
                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_FPRearthfault',
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
                        'Current Set', _CurrentSet_controller),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: fprCurveType_drop_lits(),
                    ),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'TMS', _TMS_controller),
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
                        'Pickup Current', _pickupCurrent_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Relay Operated Time 2X', _relayOprTime_2x_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Relay Operated Time 5X', _relayOprTime_5x_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Stage No', _stageNo_controller),
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
                        'Current Set', _CurrentSet_controller),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: fprCurveType_drop_lits(),
                    ),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'TMS', _TMS_controller),
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
                        'Pickup Current', _pickupCurrent_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Relay Operated Time 2X', _relayOprTime_2x_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Relay Operated Time 5X', _relayOprTime_5x_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Stage No', _stageNo_controller),
                  ]),
            ),
          );
        }
      }),
    );
  }
}
