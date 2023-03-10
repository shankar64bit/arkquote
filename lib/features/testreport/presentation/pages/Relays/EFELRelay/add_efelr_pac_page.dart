// ignore_for_file: missing_return, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../../injection_container.dart';
import '../../../../data/models/equipment/Relays/EFELRelay/efelr_model.dart';
import '../../../../data/models/equipment/Relays/EFELRelay/efelr_pac_model.dart';
import '../../../providers/Relays_providers/EFELRelay_provider/efelr_pac_provider.dart';
import '../../../providers/Relays_providers/EFELRelay_provider/efelr_provider.dart';
import '../../dropdown_All/a_as_simplified_function.dart';
import '../../dropdown_All/equipmentUsed.dart';
import '../../dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class AddEfElrPacPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int TR_ID;

  AddEfElrPacPage(this.args, {Key key}) : super(key: key);

  final TextEditingController _nOcontroller = TextEditingController();
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

  final TextEditingController _SerialNOcontroller = TextEditingController();

  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  setTrNo() {
    _nOcontroller.text = args['TrNo'].toString();
    _SerialNOcontroller.text = args['Serial_No'].toString();
    //add below, it wasnt ther before
    TR_ID = args['trDatabaseID'];
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
    final EfElrModel ntr = watchOnly((EfElrProvider x) => x.efelrModel);
    setTrNo();
    int id;
    var acc_token = sl<GoogleSignInController>().ACCESS_TOKEN;
    var ref_token = sl<GoogleSignInController>().REFRESH_TOKEN;
    var mob = const Text('Add Protection Accuracy Check Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('Add Protection Accuracy Check Details',
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

                  setDefaultValue(ntr);

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
                    pickupCurrent: double.parse(_pickupCurrentcontroller.text),
                    relayOprTime_2x:
                        double.parse(_relayOprTime_2xcontroller.text),
                    relayOprTime_5x:
                        double.parse(_relayOprTime_5xcontroller.text),
                    relayOprTime_Hi:
                        double.parse(_relayOprTime_Hicontroller.text),
                    equipmentUsed: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,
                  );

                  getX((EfElrPacProvider x) =>
                      x.addEfElrPac(trPacReportToLocal));
                  watchOnly((EfElrPacProvider x) => {});
                  print(trPacReportToLocal);
                  print("EFELR PAC added to Local Database");
                  // ignore: use_build_context_synchronously
                  Navigator.popAndPushNamed(context, '/detail_EFELR',
                      arguments: {
                        'id': args['EFELR_ID'],
                        'trDatabaseID': TR_ID
                      });
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
                        child: build_body(context, ntr)),
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
