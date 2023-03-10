import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../../env.sample.dart';
import '../../../../data/models/equipment/Relays/VoltageRelay/vr_model.dart';
import '../../../../data/models/equipment/Relays/VoltageRelay/vr_pac_model.dart';
import '../../../providers/Relays_providers/voltageRelay_provider/vr_pac_provider.dart';
import '../../../providers/Relays_providers/voltageRelay_provider/vr_provider.dart';
import '../../dropdown_All/a_as_simplified_function.dart';
import '../../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditVrPacPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditVrPacPage(this.args, {Key key}) : super(key: key);

  VrPacModel _vrPacTestModel;
  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _SerialNOcontroller = TextEditingController();
  final TextEditingController _plugSettingcontroller = TextEditingController();
  final TextEditingController _TMScontroller = TextEditingController();

  final TextEditingController _plugSettingMul1controller =
      TextEditingController();
  final TextEditingController _plugSettingMul2controller =
      TextEditingController();
  final TextEditingController _coilResistancecontroller =
      TextEditingController();
  final TextEditingController _relayOprTime_1xcontroller =
      TextEditingController();
  final TextEditingController _relayOprTime_3xcontroller =
      TextEditingController();

  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Future<void> getReport() async {
    getX((VrPacProvider x) => x.getVrPacById(args['id']));
    _vrPacTestModel = watchOnly((VrPacProvider x) => x.vrPac_Model);

    _IDcontroller.text = args['id'].toString();
    _nOcontroller.text = args['TrNo'].toString();
    _SerialNOcontroller.text = args['Serial_No'];
    _plugSettingcontroller.text = _vrPacTestModel.plugSetting.toString();
    _coilResistancecontroller.text = _vrPacTestModel.coilResistanace.toString();
    _plugSettingMul1controller.text =
        _vrPacTestModel.plugSettingMul1.toString();
    _TMScontroller.text = _vrPacTestModel.TMS.toString();
    _plugSettingMul2controller.text =
        _vrPacTestModel.plugSettingMul2.toString();
    _relayOprTime_1xcontroller.text =
        _vrPacTestModel.relayOprTime_1x.toString();
    _relayOprTime_3xcontroller.text =
        _vrPacTestModel.relayOprTime_3x.toString();
  }

  @override
  Widget build(BuildContext context) {
    final VrModel ntr1 = watchOnly((VrProvider x) => x.vrModel);

    final VrPacModel ntr = watchOnly((VrPacProvider x) => x.vrPac_Model);
    getReport();
    var mob = const Text('Edit Protection Accuracy CheckDetails',
        style: TextStyle(fontSize: 15));
    var desk = const Text('Edit Protection Accuracy Check Details',
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
                  var url = Uri.parse('${Env.URL_PREFIX}/vrPac/' +
                      ntr.databaseID.toString() +
                      '/');

                  Map<String, String> headers = {
                    "Content-type": "application/json",
                    "Authorization": "Bearer $acc_token",
                  };
                  print("***********");
                  print(args['trelayDatabaseID'].toString());

                  final Map payload = {
                    "trNo": args['trDatabaseID'].toString(),
                    'plugSetting': _plugSettingcontroller.text.toString(),
                    'TMS': _TMScontroller.text.toString(),
                    'coilResistanace':
                        _coilResistancecontroller.text.toString(),
                    'plugSettingMul1':
                        _plugSettingMul1controller.text.toString(),
                    'plugSettingMul2':
                        _plugSettingMul2controller.text.toString(),
                    'relayOprTime_1x':
                        _relayOprTime_1xcontroller.text.toString(),
                    'relayOprTime_3x':
                        _relayOprTime_3xcontroller.text.toString(),
                    "serialNo": args['vrelayDatabaseID'].toString(),
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
                    final VrPacModel trPacReportToLocal = VrPacModel(
                      trNo: int.parse(_nOcontroller.text),
                      serialNo: _SerialNOcontroller.text,
                      plugSetting: double.parse(_plugSettingcontroller.text),
                      TMS: double.parse(_TMScontroller.text),
                      coilResistanace:
                          double.parse(_coilResistancecontroller.text),
                      plugSettingMul1:
                          double.parse(_plugSettingMul1controller.text),
                      plugSettingMul2:
                          double.parse(_plugSettingMul2controller.text),
                      relayOprTime_1x:
                          double.parse(_relayOprTime_1xcontroller.text),
                      relayOprTime_3x:
                          double.parse(_relayOprTime_3xcontroller.text),
                      databaseID: ntr.databaseID,
                      equipmentUsed: selectedValueForEquipmentUse.toString(),
                      updateDate: DateTime.now(),
                    );

                    getX((VrPacProvider x) =>
                        x.updateVrPac(trPacReportToLocal, args['id']));
                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_VR_PAC',
                        arguments: {
                          'id': args['id'],
                          'VR_ID': args['VR_ID'],
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
                        constraints: const BoxConstraints(
                            minHeight: 0, minWidth: 0, maxWidth: 700),
                        child: build_body(context, ntr1)),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  build_body(BuildContext context, VrModel ntr) {
    String psMul1Text = '';
    String psMul2Text = '';
    String rOprTime1Text = '';
    String rOprTime2Text = '';
    if (ntr.etype == 'ovr') {
      psMul1Text = 'Plug Setting Multiplier - 1.2x';
      psMul2Text = 'Plug Setting Multiplier - 3x';
      rOprTime1Text = 'Relay Operated Time - 1.2x';
      rOprTime2Text = 'Relay Operated Time - 3x';
    } else if (ntr.etype == 'uvr') {
      psMul1Text = 'Plug Setting Multiplier - 10%';
      psMul2Text = 'Plug Setting Multiplier - 50%';
      rOprTime1Text = 'Relay Operated Time - 10%';
      rOprTime2Text = 'Relay Operated Time - 50%';
    }
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
                    'ID',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
                TextFormField(
                  controller: _IDcontroller,
                  textAlign: TextAlign.center,
                  enabled: false,
                ),
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'Relay Adopted Setting',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Plug Setting (V)', _plugSettingcontroller),
                simplifiedFor_Diplay_for_all_PC_numpad('TMS', _TMScontroller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    psMul1Text, _plugSettingMul1controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    psMul2Text, _plugSettingMul2controller),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'Relay Coil Resistance Check',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Coil Resistance', _coilResistancecontroller),
                Text(
                  'Relay Operation Check',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5),
                ),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    rOprTime1Text, _relayOprTime_1xcontroller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    rOprTime2Text, _relayOprTime_3xcontroller),
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
                    'ID',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
                TextFormField(
                  controller: _IDcontroller,
                  textAlign: TextAlign.center,
                  enabled: false,
                ),
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
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: EquipmentTypeList(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'Relay Adopted Setting',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Plug Setting (V)', _plugSettingcontroller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'TMS', _TMScontroller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    psMul1Text, _plugSettingMul1controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    psMul2Text, _plugSettingMul2controller),
                Text(
                  'Relay Coil Resistance Check',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5),
                ),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Coil Resistance', _coilResistancecontroller),
                Text(
                  'Relay Operation Check',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5),
                ),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    rOprTime1Text, _relayOprTime_1xcontroller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    rOprTime2Text, _relayOprTime_3xcontroller),
              ]),
            ),
          );
        }
      }),
    );
  }
}
