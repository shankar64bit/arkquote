import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../data/models/equipment/power_cable/pc_hv_test_model.dart';
import '../../providers/pc_provider/pc_hv_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();
int _pcRefId;

class EditPcHvPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditPcHvPage(this.args, {Key key}) : super(key: key);

  PcHvTestModel _pcHvTestModel;
  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _rCurrentcontroller = TextEditingController();
  final TextEditingController _yCurrentcontroller = TextEditingController();
  final TextEditingController _bCurrentcontroller = TextEditingController();
  final TextEditingController _rVoltagecontroller = TextEditingController();
  final TextEditingController _yVoltagecontroller = TextEditingController();
  final TextEditingController _bVoltagecontroller = TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Future<void> getReport() async {
    getX((PcHvProvider x) => x.getPcHvByID(args['id']));
    _pcHvTestModel = watchOnly((PcHvProvider x) => x.pcHvModel);

    _IDcontroller.text = args['id'].toString();
    _nOcontroller.text = args['TrNo'].toString();
    _rCurrentcontroller.text = _pcHvTestModel.rCurrent.toString();
    _yCurrentcontroller.text = _pcHvTestModel.yCurrent.toString();
    _bCurrentcontroller.text = _pcHvTestModel.bCurrent.toString();
    _rVoltagecontroller.text = _pcHvTestModel.rVoltage.toString();
    _yVoltagecontroller.text = _pcHvTestModel.yVoltage.toString();
    _bVoltagecontroller.text = _pcHvTestModel.bVoltage.toString();
    _pcRefId = _pcHvTestModel.pcRefId;
  }

  @override
  Widget build(BuildContext context) {
    final PcHvTestModel ntr = watchOnly((PcHvProvider x) => x.pcHvModel);
    getReport();
    var mob = const Text('Edit PC-Hv Details', style: TextStyle(fontSize: 15));
    var desk = const Text('Edit PC-Hv Details', style: TextStyle(fontSize: 20));

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
                  var url = Uri.parse('${Env.URL_PREFIX}/PcHvTest/' +
                      ntr.databaseID.toString() +
                      '/');

                  Map<String, String> headers = {
                    "Content-type": "application/json",
                    "Authorization": "Bearer $acc_token",
                  };
                  print("***********");
                  print(args['trDatabaseID'].toString());

                  final Map payload = {
                    "trNo": args['trDatabaseID'].toString(),
                    'rCurrent': _rCurrentcontroller.text.toString(),
                    'yCurrent': _yCurrentcontroller.text.toString(),
                    'bCurrent': _bCurrentcontroller.text.toString(),
                    'rVoltage': _rVoltagecontroller.text.toString(),
                    'yVoltage': _yVoltagecontroller.text.toString(),
                    'bVoltage': _bVoltagecontroller.text.toString(),
                    "pcRef": args['PC_ID'].toString(),
                    "equipmentUsed": selectedValueForEquipmentUse.toString(),
                    "updateDate": DateTime.now().toString(),
                  };
                  var response = await http.put(url,
                      body: jsonEncode(payload), headers: headers);

                  if (response.statusCode == success_code ||
                      response.statusCode == success_code1) {
                    print('Response status: ${response.statusCode}');
                    print('Response body: ${response.body}');
                    print('Stored successfully');

                    //add to local database
                    final PcHvTestModel pcHvReportToLocal = PcHvTestModel(
                      trNo: int.parse(_nOcontroller.text),
                      pcRefId: _pcRefId,
                      rVoltage: double.parse(_rVoltagecontroller.text),
                      yVoltage: double.parse(_yVoltagecontroller.text),
                      bVoltage: double.parse(_bVoltagecontroller.text),
                      rCurrent: double.parse(_rCurrentcontroller.text),
                      yCurrent: double.parse(_yCurrentcontroller.text),
                      bCurrent: double.parse(_bCurrentcontroller.text),
                      databaseID: ntr.databaseID,
                      EquipmentType: selectedValueForEquipmentUse.toString(),
                      lastUpdated: DateTime.now(),
                    );

                    getX((PcHvProvider x) =>
                        x.updatePcHv(pcHvReportToLocal, args['id']));
                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_PC_HV',
                        arguments: {
                          'id': args['id'],
                          'PC_ID': args['PC_ID'],
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
              elevation: 2,
              child: Column(children: [
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
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'Test Report No',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
                TextFormField(
                  controller: _nOcontroller,
                  // label : const Text('Test Report No.'),
                  enabled: false,
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 20, 150, 10),
                  child: EquipmentTypeList(),
                ),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'R-Phase Applied Voltage', _rVoltagecontroller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Y-Phase Applied Voltage', _yVoltagecontroller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'B-Phase Applied Voltage', _bVoltagecontroller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'R-Phase Measured Leakage Current', _rCurrentcontroller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Y-Phase Measured Leakage Current', _yCurrentcontroller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'B-Phase Measured Leakage Current', _bCurrentcontroller),
              ]),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              elevation: 2,
              child: Column(children: [
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
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'Test Report No',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
                TextFormField(
                  controller: _nOcontroller,
                  // label : const Text('Test Report No.'),
                  enabled: false,
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 20, 150, 10),
                  child: EquipmentTypeList(),
                ),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'R-Phase Applied Voltage', _rVoltagecontroller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Y-Phase Applied Voltage', _yVoltagecontroller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'B-Phase Applied Voltage', _bVoltagecontroller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'R-Phase Measured Leakage Current', _rCurrentcontroller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Y-Phase Measured Leakage Current', _yCurrentcontroller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'B-Phase Measured Leakage Current', _bCurrentcontroller),
              ]),
            ),
          );
        }
      }),
    );
  }
}
