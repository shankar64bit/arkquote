// ignore_for_file: missing_return, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../../injection_container.dart';
import '../../../../data/models/equipment/Relays/OCEFRelay/ocefr_model.dart';
import '../../../../data/models/equipment/Relays/OCEFRelay/ocefr_pac_model.dart';
import '../../../providers/Relays_providers/OCEFRelay_provider/ocefr_pac_provider.dart';
import '../../../providers/Relays_providers/OCEFRelay_provider/ocefr_provider.dart';
import '../../dropdown_All/a_as_simplified_function.dart';
import '../../dropdown_All/equipmentUsed.dart';
import '../../dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class AddOcEfrPacPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int TR_ID;

  AddOcEfrPacPage(this.args, {Key key}) : super(key: key);

  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _rplugSettingcontroller = TextEditingController();
  final TextEditingController _rTMScontroller = TextEditingController();
  final TextEditingController _rplugSetting_Hicontroller =
      TextEditingController();
  final TextEditingController _rtimEcontroller = TextEditingController();
  final TextEditingController _yplugSettingcontroller = TextEditingController();
  final TextEditingController _yTMScontroller = TextEditingController();
  final TextEditingController _yplugSetting_Hicontroller =
      TextEditingController();
  final TextEditingController _ytimEcontroller = TextEditingController();
  final TextEditingController _bplugSettingcontroller = TextEditingController();
  final TextEditingController _bTMScontroller = TextEditingController();
  final TextEditingController _bplugSetting_Hicontroller =
      TextEditingController();
  final TextEditingController _btimEcontroller = TextEditingController();

  final TextEditingController _plugSettingMul_2xcontroller =
      TextEditingController();
  final TextEditingController _plugSettingMul_5xcontroller =
      TextEditingController();
  final TextEditingController _rcoilResistancecontroller =
      TextEditingController();
  final TextEditingController _ycoilResistancecontroller =
      TextEditingController();
  final TextEditingController _bcoilResistancecontroller =
      TextEditingController();
  final TextEditingController _rpickupCurrentcontroller =
      TextEditingController();
  final TextEditingController _ypickupCurrentcontroller =
      TextEditingController();
  final TextEditingController _bpickupCurrentcontroller =
      TextEditingController();
  final TextEditingController _rrelayOprTime_2xcontroller =
      TextEditingController();
  final TextEditingController _rrelayOprTime_5xcontroller =
      TextEditingController();
  final TextEditingController _rrelayOprTime_Hicontroller =
      TextEditingController();
  final TextEditingController _yrelayOprTime_2xcontroller =
      TextEditingController();
  final TextEditingController _yrelayOprTime_5xcontroller =
      TextEditingController();
  final TextEditingController _yrelayOprTime_Hicontroller =
      TextEditingController();
  final TextEditingController _brelayOprTime_2xcontroller =
      TextEditingController();
  final TextEditingController _brelayOprTime_5xcontroller =
      TextEditingController();
  final TextEditingController _brelayOprTime_Hicontroller =
      TextEditingController();

  final TextEditingController _SerialNORphcontroller = TextEditingController();

  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  setTrNo() {
    _nOcontroller.text = args['TrNo'].toString();
    _SerialNORphcontroller.text = args['Serial_No_Rph'].toString();
    //add below, it wasnt ther before
    TR_ID = args['trDatabaseID'];
  }

  setDefaultValue(OcEfrModel ntr) {
    if (ntr.etype != 'ocefrinv' &&
        ntr.etype != 'ocefrinvl' &&
        ntr.etype != 'ocrinv' &&
        ntr.etype != 'ocrinvl') {
      _rplugSettingcontroller.text = '0.0';
      _rTMScontroller.text = '0.0';
      _yplugSettingcontroller.text = '0.0';
      _yTMScontroller.text = '0.0';
      _bplugSettingcontroller.text = '0.0';
      _bTMScontroller.text = '0.0';
      _plugSettingMul_2xcontroller.text = '0.0';
      _plugSettingMul_5xcontroller.text = '0.0';
      _rrelayOprTime_2xcontroller.text = '0.0';
      _rrelayOprTime_5xcontroller.text = '0.0';
      _rpickupCurrentcontroller.text = '0.0';
      _yrelayOprTime_2xcontroller.text = '0.0';
      _yrelayOprTime_5xcontroller.text = '0.0';
      _ypickupCurrentcontroller.text = '0.0';
      _brelayOprTime_2xcontroller.text = '0.0';
      _brelayOprTime_5xcontroller.text = '0.0';
      _bpickupCurrentcontroller.text = '0.0';
    }
  }

  @override
  Widget build(BuildContext context) {
    final OcEfrModel ntr = watchOnly((OcEfrProvider x) => x.ocefrModel);
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
                  final OcEfrPacModel ocefrPacReportToLocal = OcEfrPacModel(
                    trNo: int.parse(_nOcontroller.text),
                    serialNo: _SerialNORphcontroller.text,
                    r_plugSetting: double.parse(_rplugSettingcontroller.text),
                    r_TMS: double.parse(_rTMScontroller.text),
                    r_plugSetting_Hi:
                        double.parse(_rplugSetting_Hicontroller.text),
                    r_time: double.parse(_rtimEcontroller.text),
                    y_plugSetting: double.parse(_yplugSettingcontroller.text),
                    y_TMS: double.parse(_yTMScontroller.text),
                    y_plugSetting_Hi:
                        double.parse(_yplugSetting_Hicontroller.text),
                    y_time: double.parse(_ytimEcontroller.text),
                    b_plugSetting: double.parse(_bplugSettingcontroller.text),
                    b_TMS: double.parse(_bTMScontroller.text),
                    b_plugSetting_Hi:
                        double.parse(_bplugSetting_Hicontroller.text),
                    b_time: double.parse(_btimEcontroller.text),
                    r_coilResistanace:
                        double.parse(_rcoilResistancecontroller.text),
                    y_coilResistanace:
                        double.parse(_ycoilResistancecontroller.text),
                    b_coilResistanace:
                        double.parse(_bcoilResistancecontroller.text),
                    plugSettingMul_2x:
                        double.parse(_plugSettingMul_2xcontroller.text),
                    plugSettingMul_5x:
                        double.parse(_plugSettingMul_5xcontroller.text),
                    r_pickupCurrent:
                        double.parse(_rpickupCurrentcontroller.text),
                    y_pickupCurrent:
                        double.parse(_ypickupCurrentcontroller.text),
                    b_pickupCurrent:
                        double.parse(_bpickupCurrentcontroller.text),
                    r_relayOprTime_2x:
                        double.parse(_rrelayOprTime_2xcontroller.text),
                    r_relayOprTime_5x:
                        double.parse(_rrelayOprTime_5xcontroller.text),
                    r_relayOprTime_Hi:
                        double.parse(_rrelayOprTime_Hicontroller.text),
                    y_relayOprTime_2x:
                        double.parse(_yrelayOprTime_2xcontroller.text),
                    y_relayOprTime_5x:
                        double.parse(_yrelayOprTime_5xcontroller.text),
                    y_relayOprTime_Hi:
                        double.parse(_yrelayOprTime_Hicontroller.text),
                    b_relayOprTime_2x:
                        double.parse(_brelayOprTime_2xcontroller.text),
                    b_relayOprTime_5x:
                        double.parse(_brelayOprTime_5xcontroller.text),
                    b_relayOprTime_Hi:
                        double.parse(_brelayOprTime_Hicontroller.text),
                    equipmentUsed: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,
                  );

                  getX((OcEfrPacProvider x) =>
                      x.addOcEfrPac(ocefrPacReportToLocal));
                  watchOnly((OcEfrPacProvider x) => {});
                  print(ocefrPacReportToLocal);
                  print("OCEFR PAC added to Local Database");
                  // ignore: use_build_context_synchronously
                  Navigator.popAndPushNamed(context, '/detail_OCEFR',
                      arguments: {
                        'id': args['OCEFR_ID'],
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

  build_body(BuildContext context, OcEfrModel ntr) {
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
                    'Serial No Rph',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
                TextFormField(
                  controller: _SerialNORphcontroller,
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
                ntr.etype == 'ocrinv' ||
                        ntr.etype == 'ocefrinv' ||
                        ntr.etype == 'ocrinvl' ||
                        ntr.etype == 'ocefrinvl'
                    ? Card(
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                            child: Column(children: [
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'R-Plug Setting (V)',
                                  _rplugSettingcontroller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'R-TMS', _rTMScontroller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'Y-Plug Setting (V)',
                                  _yplugSettingcontroller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'Y-TMS', _yTMScontroller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'B-Plug Setting (V)',
                                  _bplugSettingcontroller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'B-TMS', _bTMScontroller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'Plug Setting Multiplier-2X',
                                  _plugSettingMul_2xcontroller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'Plug Setting Multiplier-5X',
                                  _plugSettingMul_5xcontroller)
                            ])))
                    : Container(),
                ntr.etype != 'ocrinvl' || ntr.etype != 'ocefrinvl'
                    ? Card(
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                            child: Column(children: [
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'R-Plug Setting (V)',
                                  _rplugSetting_Hicontroller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'R-time', _rtimEcontroller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'Y-Plug Setting (V)',
                                  _yplugSetting_Hicontroller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'Y-time', _ytimEcontroller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'B-Plug Setting (V)',
                                  _bplugSetting_Hicontroller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'B-time', _btimEcontroller)
                            ])))
                    : Container(),
                Card(
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
                              'R-Coil Resistance', _rcoilResistancecontroller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'Y-Coil Resistance', _ycoilResistancecontroller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'B-Coil Resistance', _bcoilResistancecontroller),
                        ]))),
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
                ntr.etype == 'ocrinv' ||
                        ntr.etype == 'ocefrinv' ||
                        ntr.etype == 'ocrinvl' ||
                        ntr.etype == 'ocefrinvl'
                    ? Card(
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                            child: Column(children: [
                              Text('For Low Set-'),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  "R-Pickup Current",
                                  _rpickupCurrentcontroller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  "R-Relay Operated Time -2X",
                                  _rrelayOprTime_2xcontroller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'R-Relay Operated Time -5X',
                                  _rrelayOprTime_5xcontroller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  "Y-Pickup Current",
                                  _ypickupCurrentcontroller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  "Y-Relay Operated Time -2X",
                                  _yrelayOprTime_2xcontroller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'Y-Relay Operated Time -5X',
                                  _yrelayOprTime_5xcontroller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  "B-Pickup Current",
                                  _bpickupCurrentcontroller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  "B-Relay Operated Time -2X",
                                  _brelayOprTime_2xcontroller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'B-Relay Operated Time -5X',
                                  _brelayOprTime_5xcontroller),
                            ])))
                    : Container(),
                ntr.etype != 'ocrinvl' || ntr.etype != 'ocefrinvl'
                    ? Card(
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                            child: Column(children: [
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'R-Relay Operated Time',
                                  _rrelayOprTime_Hicontroller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'Y-Relay Operated Time',
                                  _yrelayOprTime_Hicontroller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'B-Relay Operated Time',
                                  _brelayOprTime_Hicontroller),
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
                    'Serial No Rph',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
                TextFormField(
                  controller: _SerialNORphcontroller,
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
                ntr.etype == 'ocrinv' ||
                        ntr.etype == 'ocefrinv' ||
                        ntr.etype == 'ocrinvl' ||
                        ntr.etype == 'ocefrinvl'
                    ? Card(
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                            child: Column(children: [
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'R-Plug Setting (V)',
                                  _rplugSettingcontroller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'R-TMS', _rTMScontroller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'Y-Plug Setting (V)',
                                  _yplugSettingcontroller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'Y-TMS', _yTMScontroller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'B-Plug Setting (V)',
                                  _bplugSettingcontroller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'B-TMS', _bTMScontroller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'Plug Setting Multiplier-2X',
                                  _plugSettingMul_2xcontroller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'Plug Setting Multiplier-5X',
                                  _plugSettingMul_5xcontroller)
                            ])))
                    : Container(),
                ntr.etype != 'ocrinvl' || ntr.etype != 'ocefrinvl'
                    ? Card(
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                            child: Column(children: [
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'R-Plug Setting (V)',
                                  _rplugSetting_Hicontroller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'R-time', _rtimEcontroller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'Y-Plug Setting (V)',
                                  _yplugSetting_Hicontroller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'Y-time', _ytimEcontroller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'B-Plug Setting (V)',
                                  _bplugSetting_Hicontroller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'B-time', _btimEcontroller)
                            ])))
                    : Container(),
                Card(
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
                              'R-Coil Resistance', _rcoilResistancecontroller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'Y-Coil Resistance', _ycoilResistancecontroller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'B-Coil Resistance', _bcoilResistancecontroller),
                        ]))),
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
                ntr.etype == 'ocrinv' ||
                        ntr.etype == 'ocefrinv' ||
                        ntr.etype == 'ocrinvl' ||
                        ntr.etype == 'ocefrinvl'
                    ? Card(
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                            child: Column(children: [
                              Text('For Low Set-'),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  "R-Pickup Current",
                                  _rpickupCurrentcontroller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  "R-Relay Operated Time -2X",
                                  _rrelayOprTime_2xcontroller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'R-Relay Operated Time -5X',
                                  _rrelayOprTime_5xcontroller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  "Y-Pickup Current",
                                  _ypickupCurrentcontroller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  "Y-Relay Operated Time -2X",
                                  _yrelayOprTime_2xcontroller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'Y-Relay Operated Time -5X',
                                  _yrelayOprTime_5xcontroller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  "B-Pickup Current",
                                  _bpickupCurrentcontroller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  "B-Relay Operated Time -2X",
                                  _brelayOprTime_2xcontroller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'B-Relay Operated Time -5X',
                                  _brelayOprTime_5xcontroller),
                            ])))
                    : Container(),
                ntr.etype != 'ocrinvl' || ntr.etype != 'ocefrinvl'
                    ? Card(
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                            child: Column(children: [
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'R-Relay Operated Time',
                                  _rrelayOprTime_Hicontroller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'Y-Relay Operated Time',
                                  _yrelayOprTime_Hicontroller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'B-Relay Operated Time',
                                  _brelayOprTime_Hicontroller),
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
