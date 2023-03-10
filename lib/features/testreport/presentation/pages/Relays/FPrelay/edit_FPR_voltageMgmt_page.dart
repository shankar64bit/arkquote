// ignore_for_file: missing_return, missing_required_param, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../../env.sample.dart';
import '../../../../data/models/equipment/Relays/FPrelay/FPR_voltageMgmt_model.dart';
import '../../../providers/Relays_providers/FPrelay_providers/FPR_voltageMgmt_provider.dart';
import '../../dropdown_All/a_as_simplified_function.dart';
import '../../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditFPRvoltageMgmtPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditFPRvoltageMgmtPage(this.args, {Key key}) : super(key: key);

  FPRvoltageMgmtModel _fprvoltageMgmtTestModel;
  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _trNo_controller = TextEditingController();
  final TextEditingController _serialNo_controller = TextEditingController();
  final TextEditingController _rn_applSecVoltage_controller =
      TextEditingController();
  final TextEditingController _rn_measurePrimVoltage_controller =
      TextEditingController();
  final TextEditingController _yn_applSecVoltage_controller =
      TextEditingController();
  final TextEditingController _yn_measurePrimVoltage_controller =
      TextEditingController();
  final TextEditingController _bn_applSecVoltage_controller =
      TextEditingController();
  final TextEditingController _bn_measurePrimVoltage_controller =
      TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Future<void> getReport() async {
    getX((FPRvoltageMgmtProvider x) => x.getFPRvoltageMgmtById(args['id']));
    _fprvoltageMgmtTestModel =
        watchOnly((FPRvoltageMgmtProvider x) => x.fprvoltageMgmt_Model);
    _IDcontroller.text = _fprvoltageMgmtTestModel.id.toString();
    _trNo_controller.text = _fprvoltageMgmtTestModel.trNo.toString();
    _serialNo_controller.text = _fprvoltageMgmtTestModel.serialNo.toString();
    _rn_applSecVoltage_controller.text =
        _fprvoltageMgmtTestModel.rn_applSecVoltage.toString();
    _rn_measurePrimVoltage_controller.text =
        _fprvoltageMgmtTestModel.rn_measurePrimVoltage.toString();
    _yn_applSecVoltage_controller.text =
        _fprvoltageMgmtTestModel.yn_applSecVoltage.toString();
    _yn_measurePrimVoltage_controller.text =
        _fprvoltageMgmtTestModel.yn_measurePrimVoltage.toString();
    _bn_applSecVoltage_controller.text =
        _fprvoltageMgmtTestModel.bn_applSecVoltage.toString();
    _bn_measurePrimVoltage_controller.text =
        _fprvoltageMgmtTestModel.bn_measurePrimVoltage.toString();
  }

  @override
  Widget build(BuildContext context) {
    final FPRvoltageMgmtModel ntr =
        watchOnly((FPRvoltageMgmtProvider x) => x.fprvoltageMgmt_Model);

    getReport();
    var mob = const Text('Edit FPRvoltageMgmt Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('Edit FPRvoltageMgmt Details',
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
                  var url = Uri.parse('${Env.URL_PREFIX}/fprVm/' +
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
                    'rn_applSecVoltage':
                        _rn_applSecVoltage_controller.text.toString(),
                    'rn_measurePrimVoltage':
                        _rn_measurePrimVoltage_controller.text.toString(),
                    'yn_applSecVoltage':
                        _yn_applSecVoltage_controller.text.toString(),
                    'yn_measurePrimVoltage':
                        _yn_measurePrimVoltage_controller.text.toString(),
                    'bn_applSecVoltage':
                        _bn_applSecVoltage_controller.text.toString(),
                    'bn_measurePrimVoltage':
                        _bn_measurePrimVoltage_controller.text.toString(),
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
                    final FPRvoltageMgmtModel FPRvoltageMgmtReportToLocal =
                        FPRvoltageMgmtModel(
                      trNo: int.parse(_trNo_controller.text),
                      serialNo: _serialNo_controller.text,
                      rn_applSecVoltage:
                          double.parse(_rn_applSecVoltage_controller.text),
                      rn_measurePrimVoltage:
                          double.parse(_rn_measurePrimVoltage_controller.text),
                      yn_applSecVoltage:
                          double.parse(_yn_applSecVoltage_controller.text),
                      yn_measurePrimVoltage:
                          double.parse(_yn_measurePrimVoltage_controller.text),
                      bn_applSecVoltage:
                          double.parse(_bn_applSecVoltage_controller.text),
                      bn_measurePrimVoltage:
                          double.parse(_bn_measurePrimVoltage_controller.text),
                      databaseID: ntr.databaseID,
                      equipmentUsed: selectedValueForEquipmentUse.toString(),
                      updateDate: DateTime.now(),
                    );

                    getX((FPRvoltageMgmtProvider x) => x.updateFPRvoltageMgmt(
                        FPRvoltageMgmtReportToLocal, args['id']));
                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_FPRvoltageMgmt',
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
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'R-N Applied Secondary Voltage',
                        _rn_applSecVoltage_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'R-N Measured Primary Voltage',
                        _rn_measurePrimVoltage_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Y-N Applied Secondary Voltage',
                        _yn_applSecVoltage_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Y-N Measured Primary Voltage ',
                        _yn_measurePrimVoltage_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'B-N Applied Secondary Voltage',
                        _bn_applSecVoltage_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'B-N Measured Primary Voltage ',
                        _bn_measurePrimVoltage_controller),
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
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'R-N Applied Secondary Voltage',
                        _rn_applSecVoltage_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'R-N Measured Primary Voltage ',
                        _rn_measurePrimVoltage_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Y-N Applied Secondary Voltage',
                        _yn_applSecVoltage_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Y-N Measured Primary Voltage ',
                        _yn_measurePrimVoltage_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'B-N Applied Secondary Voltage',
                        _bn_applSecVoltage_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'B-N Measured Primary Voltage ',
                        _bn_measurePrimVoltage_controller),
                  ]),
            ),
          );
        }
      }),
    );
  }
}
