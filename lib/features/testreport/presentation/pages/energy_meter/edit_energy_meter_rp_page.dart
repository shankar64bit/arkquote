import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;

import '../../../../../env.sample.dart';
import '../../../data/models/equipment/energy_meter/energy_meter_rp_test.dart';
import '../../providers/energy_meter_provider/energy_meter_rp_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditEnergyMeterRpPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditEnergyMeterRpPage(this.args, {Key key}) : super(key: key);

  EnergyMeterRpTestModel _energymeterRpTestModel;
  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _SerialNOcontroller = TextEditingController();
  final TextEditingController _itRcontroller = TextEditingController();
  final TextEditingController _atRcontroller = TextEditingController();
  final TextEditingController _tr_Rcontroller = TextEditingController();
  final TextEditingController _isRcontroller = TextEditingController();
  final TextEditingController _asRcontroller = TextEditingController();
  final TextEditingController _sr_Acontroller = TextEditingController();

  Future<void> getReport() async {
    getX((EnergyMeterRpProvider x) => x.getEnergyMeterRpByID(args['id']));
    _energymeterRpTestModel =
        watchOnly((EnergyMeterRpProvider x) => x.energymeterRpModel);

    _IDcontroller.text = args['id'].toString();
    _nOcontroller.text = args['TrNo'].toString();

    _itRcontroller.text =
        _energymeterRpTestModel.initialTestMeterReading.toString();
    _atRcontroller.text =
        _energymeterRpTestModel.afterTestMeterReading.toString();
    _tr_Rcontroller.text =
        _energymeterRpTestModel.testMeterReading_R.toString();
    _isRcontroller.text =
        _energymeterRpTestModel.initialStandardMeterReading.toString();
    _asRcontroller.text =
        _energymeterRpTestModel.afterStandardMeterReading.toString();
    _SerialNOcontroller.text = args['Serial_No'];
    _sr_Acontroller.text =
        _energymeterRpTestModel.standardMeterReading_A.toString();
  }

  @override
  Widget build(BuildContext context) {
    final EnergyMeterRpTestModel ntr =
        watchOnly((EnergyMeterRpProvider x) => x.energymeterRpModel);
    getReport();
    var mob = const Text('Edit Energy Meter-RP Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('Edit Energy Meter-RP Details',
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

                  var success_code = 201;
                  var success_code1 = 200;
                  var failed_code = 'Server Connection Lost';
                  //add to remote database
                  var url = Uri.parse('${Env.URL_PREFIX}/rpTest/' +
                      ntr.databaseID.toString() +
                      '/');

                  Map<String, String> headers = {
                    "Content-type": "application/json",
                    "Authorization": "Bearer $acc_token",
                  };
                  print("***********");
                  print(args['trDatabaseID'].toString());
                  print(args['EM_ID'].toString());

                  final Map payload = {
                    "trNo": args['trDatabaseID'].toString(),
                    "serialNo": args['EM_ID'].toString(),
                    "equipmentUsed": selectedValueForEquipmentUse.toString(),
                    "updateDate": DateTime.now().toString(),
                    "initialTestMeterReading": _itRcontroller.text,
                    "afterTestMeterReading": _atRcontroller.text,
                    "testMeterReading_R": _tr_Rcontroller.text,
                    "initialStandardMeterReading": _isRcontroller.text,
                    "afterStandardMeterReading": _asRcontroller.text,
                    "standardMeterReading_A": _sr_Acontroller.text,
                  };
                  var response = await http.put(url,
                      body: jsonEncode(payload), headers: headers);

                  if (response.statusCode == success_code ||
                      response.statusCode == success_code1) {
                    print('Response status: ${response.statusCode}');
                    print('Response body: ${response.body}');
                    print('Stored successfully');

                    //add to local database

                    final EnergyMeterRpTestModel energyMeterRpReportToLocal =
                        EnergyMeterRpTestModel(
                      trNo: int.parse(_nOcontroller.text),
                      initialTestMeterReading:
                          double.parse(_itRcontroller.text),
                      afterTestMeterReading: double.parse(_atRcontroller.text),
                      serialNo: _SerialNOcontroller.text,
                      testMeterReading_R: double.parse(_tr_Rcontroller.text),
                      initialStandardMeterReading:
                          double.parse(_isRcontroller.text),
                      afterStandardMeterReading:
                          double.parse(_asRcontroller.text),
                      standardMeterReading_A:
                          double.parse(_sr_Acontroller.text),
                      databaseID: ntr.databaseID,
                      EquipmentType: selectedValueForEquipmentUse.toString(),
                      updateDate: DateTime.now(),
                    );

                    getX((EnergyMeterRpProvider x) => x.updateEnergyMeterRp(
                        energyMeterRpReportToLocal, args['id']));
                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_EM_RP',
                        arguments: {
                          'id': args['id'],
                          'EM_ID': args['EM_ID'],
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
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                  ),
                ),
                TextFormField(
                  controller: _SerialNOcontroller,
                  textAlign: TextAlign.center,
                  enabled: false,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 20, 150, 10),
                  child: EquipmentTypeList(),
                ),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'InitialTestMeterReading', _itRcontroller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'afterTestMeterReading', _atRcontroller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'testMeterReading_R', _tr_Rcontroller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'initialStandardMeterReading', _isRcontroller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'afterStandardMeterReading', _asRcontroller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'standardMeterReading_A', _asRcontroller),
              ]),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              elevation: 5,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                  ),
                ),
                TextFormField(
                  controller: _SerialNOcontroller,
                  textAlign: TextAlign.center,
                  enabled: false,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child: EquipmentTypeList(),
                ),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'InitialTestMeterReading', _itRcontroller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'afterTestMeterReading', _atRcontroller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'testMeterReading_R', _tr_Rcontroller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'initialStandardMeterReading', _isRcontroller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'afterStandardMeterReading', _asRcontroller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'standardMeterReading_A', _asRcontroller),
              ]),
            ),
          );
        }
      }),
    );
  }
}
