// ignore_for_file: missing_return, missing_required_param, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/Auser_input_validation_exnt.dart/validation_extension_methods.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../../env.sample.dart';
import '../../../../data/models/equipment/Relays/FPrelay/FPR_overcurrent_model.dart';
import '../../../../data/models/equipment/Relays/FPrelay/FPrelay_model.dart';
import '../../../providers/Relays_providers/FPrelay_providers/FPR_overcurrent_provider.dart';
import '../../../providers/Relays_providers/FPrelay_providers/FPrelay_providers.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../dropdown_All/a_as_simplified_function.dart';
import '../../dropdown_All/a_fpr_curve_drop_list.dart';
import '../../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditFPRovercurrentPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditFPRovercurrentPage(this.args, {Key key}) : super(key: key);

  FPRovercurrentModel _fprovercurrentTestModel;
  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _trNo_controller = TextEditingController();
  final TextEditingController _serialNo_controller = TextEditingController();
  final TextEditingController _CurrentSet_controller = TextEditingController();
  final TextEditingController _TMS_controller = TextEditingController();
  final TextEditingController _delay_controller = TextEditingController();
  final TextEditingController _rn_pickupCurrent_controller =
      TextEditingController();
  final TextEditingController _rn_relayOprTime_2x_controller =
      TextEditingController();
  final TextEditingController _rn_relayOprTime_5x_controller =
      TextEditingController();
  final TextEditingController _yn_pickupCurrent_controller =
      TextEditingController();
  final TextEditingController _yn_relayOprTime_2x_controller =
      TextEditingController();
  final TextEditingController _yn_relayOprTime_5x_controller =
      TextEditingController();
  final TextEditingController _bn_pickupCurrent_controller =
      TextEditingController();
  final TextEditingController _bn_relayOprTime_2x_controller =
      TextEditingController();
  final TextEditingController _bn_relayOprTime_5x_controller =
      TextEditingController();
  final TextEditingController _stageNo_controller = TextEditingController();
  final TextEditingController _curve_controller = TextEditingController();
  final TextEditingController _function_controller = TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Future<void> getReport() async {
    getX((FPRovercurrentProvider x) => x.getFPRovercurrentById(args['id']));
    _fprovercurrentTestModel =
        watchOnly((FPRovercurrentProvider x) => x.fprovercurrent_Model);
    _IDcontroller.text = _fprovercurrentTestModel.id.toString();
    _trNo_controller.text = _fprovercurrentTestModel.trNo.toString();
    _serialNo_controller.text = _fprovercurrentTestModel.serialNo.toString();
    _CurrentSet_controller.text =
        _fprovercurrentTestModel.CurrentSet.toString();
    _TMS_controller.text = _fprovercurrentTestModel.TMS.toString();
    _delay_controller.text = _fprovercurrentTestModel.delay.toString();
    _rn_pickupCurrent_controller.text =
        _fprovercurrentTestModel.rn_pickupCurrent.toString();
    _rn_relayOprTime_2x_controller.text =
        _fprovercurrentTestModel.rn_relayOprTime_2x.toString();
    _rn_relayOprTime_5x_controller.text =
        _fprovercurrentTestModel.rn_relayOprTime_5x.toString();
    _yn_pickupCurrent_controller.text =
        _fprovercurrentTestModel.yn_pickupCurrent.toString();
    _yn_relayOprTime_2x_controller.text =
        _fprovercurrentTestModel.yn_relayOprTime_2x.toString();
    _yn_relayOprTime_5x_controller.text =
        _fprovercurrentTestModel.yn_relayOprTime_5x.toString();
    _bn_pickupCurrent_controller.text =
        _fprovercurrentTestModel.bn_pickupCurrent.toString();
    _bn_relayOprTime_2x_controller.text =
        _fprovercurrentTestModel.bn_relayOprTime_2x.toString();
    _bn_relayOprTime_5x_controller.text =
        _fprovercurrentTestModel.bn_relayOprTime_5x.toString();
    _stageNo_controller.text = _fprovercurrentTestModel.stageNo.toString();
    _curve_controller.text = _fprovercurrentTestModel.curve.toString();
    _function_controller.text = _fprovercurrentTestModel.function.toString();
  }

  @override
  Widget build(BuildContext context) {
    final FPRovercurrentModel ntr =
        watchOnly((FPRovercurrentProvider x) => x.fprovercurrent_Model);
    // getX((ATProvider x) => x.getATByID(args['id']));
    //final ATModel ntr1 = watchOnly((ATProvider x) => x.atModel);
    getReport();
    var mob = const Text('Edit FPRovercurrent Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('Edit FPRovercurrent Details',
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
                  var url = Uri.parse('${Env.URL_PREFIX}/fprOc/' +
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
                    'CurrentSet': _CurrentSet_controller.text.toString(),
                    'TMS': _TMS_controller.text.toString(),
                    'delay': _delay_controller.text.toString(),
                    'rn_pickupCurrent':
                        _rn_pickupCurrent_controller.text.toString(),
                    'rn_relayOprTime_2x':
                        _rn_relayOprTime_2x_controller.text.toString(),
                    'rn_relayOprTime_5x':
                        _rn_relayOprTime_5x_controller.text.toString(),
                    'yn_pickupCurrent':
                        _yn_pickupCurrent_controller.text.toString(),
                    'yn_relayOprTime_2x':
                        _yn_relayOprTime_2x_controller.text.toString(),
                    'yn_relayOprTime_5x':
                        _yn_relayOprTime_5x_controller.text.toString(),
                    'bn_pickupCurrent':
                        _bn_pickupCurrent_controller.text.toString(),
                    'bn_relayOprTime_2x':
                        _bn_relayOprTime_2x_controller.text.toString(),
                    'bn_relayOprTime_5x':
                        _bn_relayOprTime_5x_controller.text.toString(),
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
                    final FPRovercurrentModel FPRovercurrentReportToLocal =
                        FPRovercurrentModel(
                      trNo: int.parse(_trNo_controller.text),
                      serialNo: _serialNo_controller.text,
                      CurrentSet: double.parse(_CurrentSet_controller.text),
                      TMS: double.parse(_TMS_controller.text),
                      delay: double.parse(_delay_controller.text),
                      rn_pickupCurrent:
                          double.parse(_rn_pickupCurrent_controller.text),
                      rn_relayOprTime_2x:
                          double.parse(_rn_relayOprTime_2x_controller.text),
                      rn_relayOprTime_5x:
                          double.parse(_rn_relayOprTime_5x_controller.text),
                      yn_pickupCurrent:
                          double.parse(_yn_pickupCurrent_controller.text),
                      yn_relayOprTime_2x:
                          double.parse(_yn_relayOprTime_2x_controller.text),
                      yn_relayOprTime_5x:
                          double.parse(_yn_relayOprTime_5x_controller.text),
                      bn_pickupCurrent:
                          double.parse(_bn_pickupCurrent_controller.text),
                      bn_relayOprTime_2x:
                          double.parse(_bn_relayOprTime_2x_controller.text),
                      bn_relayOprTime_5x:
                          double.parse(_bn_relayOprTime_5x_controller.text),
                      stageNo: int.parse(_stageNo_controller.text),
                      curve: _curve_controller.text.toString(),
                      function: _function_controller.text.toString(),
                      databaseID: ntr.databaseID,
                      equipmentUsed: selectedValueForEquipmentUse.toString(),
                      updateDate: DateTime.now(),
                    );

                    getX((FPRovercurrentProvider x) => x.updateFPRovercurrent(
                        FPRovercurrentReportToLocal, args['id']));
                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_FPRovercurrent',
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
    final FPrelayModel ntr = watchOnly((FPrelayProvider x) => x.fprelayModel);
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
                        hintText: 'function',
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
                        'delay', _delay_controller),
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
                        'R-N Pickup Current', _rn_pickupCurrent_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'R-N Relay Operated Time 2X',
                        _rn_relayOprTime_2x_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'R-N Relay Operated Time 5X',
                        _rn_relayOprTime_5x_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Y-N Pickup Current', _yn_pickupCurrent_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Y-N Relay Operated Time 2X',
                        _yn_relayOprTime_2x_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Y-N Relay Operated Time 5X',
                        _yn_relayOprTime_5x_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'B-N Pickup Current', _bn_pickupCurrent_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'B-N Relay Operated Time 2X',
                        _bn_relayOprTime_2x_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'B-N Relay Operated Time 5X',
                        _bn_relayOprTime_5x_controller),
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
                        'delay', _delay_controller),
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
                        'R-N Pickup Current', _rn_pickupCurrent_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'R-N Relay Operated Time 2X',
                        _rn_relayOprTime_2x_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'R-N Relay Operated Time 5X',
                        _rn_relayOprTime_5x_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Y-N Pickup Current', _yn_pickupCurrent_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Y-N Relay Operated Time 2X',
                        _yn_relayOprTime_2x_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Y-N Relay Operated Time 5X',
                        _yn_relayOprTime_5x_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'B-N Pickup Current', _bn_pickupCurrent_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'B-N Relay Operated Time 2X',
                        _bn_relayOprTime_2x_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'B-N Relay Operated Time 5X',
                        _bn_relayOprTime_5x_controller),
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
