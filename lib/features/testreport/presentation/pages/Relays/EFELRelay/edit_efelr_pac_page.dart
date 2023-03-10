import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../../env.sample.dart';
import '../../../../data/models/equipment/Relays/EFELRelay/efelr_model.dart';
import '../../../../data/models/equipment/Relays/EFELRelay/efelr_pac_model.dart';
import '../../../providers/Relays_providers/EFELRelay_provider/efelr_pac_provider.dart';
import '../../../providers/Relays_providers/EFELRelay_provider/efelr_provider.dart';
import '../../dropdown_All/a_as_simplified_function.dart';
import '../../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditEfElrPacPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditEfElrPacPage(this.args, {Key key}) : super(key: key);

  EfElrPacModel _efelrPacTestModel;
  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _SerialNOcontroller = TextEditingController();
  final TextEditingController _plugSettingcontroller = TextEditingController();
  final TextEditingController _TMScontroller = TextEditingController();
  final TextEditingController _plugSetting_Hicontroller =
      TextEditingController();
  final TextEditingController _timEcontroller = TextEditingController();
  final TextEditingController _plugSettingMul_2xcontroller =
      TextEditingController();
  final TextEditingController _plugSettingMul_5xcontroller =
      TextEditingController();
  final TextEditingController _coilResistancecontroller =
      TextEditingController();
  final TextEditingController _pickupCurrentcontroller =
      TextEditingController();
  final TextEditingController _relayOprTime_2xcontroller =
      TextEditingController();
  final TextEditingController _relayOprTime_5xcontroller =
      TextEditingController();
  final TextEditingController _relayOprTime_Hicontroller =
      TextEditingController();

  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Future<void> getReport() async {
    getX((EfElrPacProvider x) => x.getEfElrPacById(args['id']));
    _efelrPacTestModel = watchOnly((EfElrPacProvider x) => x.efelrPac_Model);

    _IDcontroller.text = args['id'].toString();
    _nOcontroller.text = args['TrNo'].toString();
    _SerialNOcontroller.text = args['Serial_No'];
    _plugSettingcontroller.text = _efelrPacTestModel.plugSetting.toString();
    _TMScontroller.text = _efelrPacTestModel.TMS.toString();
    _coilResistancecontroller.text =
        _efelrPacTestModel.coilResistanace.toString();
    _plugSetting_Hicontroller.text =
        _efelrPacTestModel.plugSetting_Hi.toString();
    _timEcontroller.text = _efelrPacTestModel.time.toString();
    _plugSettingMul_2xcontroller.text =
        _efelrPacTestModel.plugSettingMul_2x.toString();
    _plugSettingMul_5xcontroller.text =
        _efelrPacTestModel.plugSettingMul_5x.toString();
    _relayOprTime_2xcontroller.text =
        _efelrPacTestModel.relayOprTime_2x.toString();
    _relayOprTime_5xcontroller.text =
        _efelrPacTestModel.relayOprTime_5x.toString();
    _relayOprTime_Hicontroller.text =
        _efelrPacTestModel.relayOprTime_Hi.toString();
  }

  setDefaultValue(EfElrModel ntr) {
    if (ntr.etype != 'efrinv' && ntr.etype != 'efrinvl') {
      _plugSettingcontroller.text = '0.0';
      _TMScontroller.text = '0.0';
      _plugSettingMul_2xcontroller.text = '0.0';
      _plugSettingMul_5xcontroller.text = '0.0';
      _relayOprTime_2xcontroller.text = '0.0';
      _relayOprTime_5xcontroller.text = '0.0';
      _pickupCurrentcontroller.text = '0.0';
    }
    if (ntr.etype == 'elr') {
      _coilResistancecontroller.text = '0.0';
    }
  }

  @override
  Widget build(BuildContext context) {
    final EfElrModel ntr1 = watchOnly((EfElrProvider x) => x.efelrModel);

    final EfElrPacModel ntr =
        watchOnly((EfElrPacProvider x) => x.efelrPac_Model);
    getReport();
    var mob = const Text('Edit Protection Accuracy Check Details',
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
                  setDefaultValue(ntr1);
                  var url = Uri.parse('${Env.URL_PREFIX}/efelrPac/' +
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
                    'plugSetting_Hi': _plugSetting_Hicontroller.text.toString(),
                    'time': _timEcontroller.text.toString(),
                    'coilResistanace':
                        _coilResistancecontroller.text.toString(),
                    'plugSettingMul_2x':
                        _plugSettingMul_2xcontroller.text.toString(),
                    'plugSettingMul_5x':
                        _plugSettingMul_5xcontroller.text.toString(),
                    'pickupCurrent': _pickupCurrentcontroller.text.toString(),
                    'relayOprTime_2x':
                        _relayOprTime_2xcontroller.text.toString(),
                    'relayOprTime_5x':
                        _relayOprTime_5xcontroller.text.toString(),
                    'relayOprTime_Hi':
                        _relayOprTime_Hicontroller.text.toString(),
                    "serialNo": args['efelrelayDatabaseID'].toString(),
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
                    final EfElrPacModel trPacReportToLocal = EfElrPacModel(
                      trNo: int.parse(_nOcontroller.text),
                      serialNo: _SerialNOcontroller.text,
                      plugSetting: double.parse(_plugSettingcontroller.text),
                      TMS: double.parse(_TMScontroller.text),
                      plugSetting_Hi:
                          double.parse(_plugSetting_Hicontroller.text),
                      time: double.parse(_timEcontroller.text),
                      coilResistanace:
                          double.parse(_coilResistancecontroller.text),
                      plugSettingMul_2x:
                          double.parse(_plugSettingMul_2xcontroller.text),
                      plugSettingMul_5x:
                          double.parse(_plugSettingMul_5xcontroller.text),
                      pickupCurrent:
                          double.parse(_pickupCurrentcontroller.text),
                      relayOprTime_2x:
                          double.parse(_relayOprTime_2xcontroller.text),
                      relayOprTime_5x:
                          double.parse(_relayOprTime_5xcontroller.text),
                      relayOprTime_Hi:
                          double.parse(_relayOprTime_Hicontroller.text),
                      databaseID: ntr.databaseID,
                      equipmentUsed: selectedValueForEquipmentUse.toString(),
                      updateDate: DateTime.now(),
                    );

                    getX((EfElrPacProvider x) =>
                        x.updateEfElrPac(trPacReportToLocal, args['id']));
                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_EFELR_PAC',
                        arguments: {
                          'id': args['id'],
                          'EFELR_ID': args['EFELR_ID'],
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
                        child: build_body(context, ntr1)),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  build_body(BuildContext context, EfElrModel ntr) {
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
                ntr.etype == 'efrinv' || ntr.etype == 'efrinvl'
                    ? Card(
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                            child: Column(children: [
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'Plug Setting (V)', _plugSettingcontroller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'TMS', _TMScontroller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'Plug Setting Multiplier-2X',
                                  _plugSettingMul_2xcontroller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'Plug Setting Multiplier-5X',
                                  _plugSettingMul_5xcontroller)
                            ])))
                    : Container(),
                ntr.etype != 'efrinvl'
                    ? Card(
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                            child: Column(children: [
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'Plug Setting (V)',
                                  _plugSetting_Hicontroller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'time', _timEcontroller)
                            ])))
                    : Container(),
                ntr.etype != 'elr'
                    ? Card(
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                            child: Column(children: [
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
                            ])))
                    : Container(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'Relay Operation Check',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
                ntr.etype == 'efrinv' || ntr.etype == 'efrinvl'
                    ? Card(
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                            child: Column(children: [
                              Text('For Low Set-'),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  "Pickup Current", _pickupCurrentcontroller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  "Relay Operated Time -2X",
                                  _relayOprTime_2xcontroller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'Relay Operated Time -5X',
                                  _relayOprTime_5xcontroller),
                            ])))
                    : Container(),
                ntr.etype != 'efrinvl'
                    ? Card(
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                            child: Column(children: [
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'Relay Operated Time',
                                  _relayOprTime_Hicontroller),
                            ])))
                    : Container(),
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
                ntr.etype == 'efrinv' || ntr.etype == 'efrinvl'
                    ? Card(
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                            child: Column(children: [
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'Plug Setting (V)', _plugSettingcontroller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'TMS', _TMScontroller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'Plug Setting Multiplier-2X',
                                  _plugSettingMul_2xcontroller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'Plug Setting Multiplier-5X',
                                  _plugSettingMul_5xcontroller)
                            ])))
                    : Container(),
                ntr.etype != 'efrinvl'
                    ? Card(
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                            child: Column(children: [
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'Plug Setting (V)',
                                  _plugSetting_Hicontroller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'time', _timEcontroller)
                            ])))
                    : Container(),
                ntr.etype != 'elr'
                    ? Card(
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                            child: Column(children: [
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
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'Coil Resistance', _coilResistancecontroller),
                            ])))
                    : Container(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'Relay Operation Check',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
                ntr.etype == 'efrinv' || ntr.etype == 'efrinvl'
                    ? Card(
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                            child: Column(children: [
                              Text('For Low Set-'),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  "Pickup Current", _pickupCurrentcontroller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  "Relay Operated Time -2X",
                                  _relayOprTime_2xcontroller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'Relay Operated Time -5X',
                                  _relayOprTime_5xcontroller),
                            ])))
                    : Container(),
                ntr.etype != 'efrinvl'
                    ? Card(
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                            child: Column(children: [
                              ntr.etype == 'efrinv'
                                  ? Text('For Hi-Set')
                                  : Container(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'Relay Operated Time',
                                  _relayOprTime_Hicontroller),
                            ])))
                    : Container(),
              ]),
            ),
          );
        }
      }),
    );
  }
}
