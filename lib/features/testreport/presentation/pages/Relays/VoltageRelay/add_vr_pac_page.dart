// ignore_for_file: missing_return, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../../injection_container.dart';
import '../../../../data/models/equipment/Relays/VoltageRelay/vr_model.dart';
import '../../../../data/models/equipment/Relays/VoltageRelay/vr_pac_model.dart';
import '../../../providers/Relays_providers/voltageRelay_provider/vr_pac_provider.dart';
import '../../../providers/Relays_providers/voltageRelay_provider/vr_provider.dart';
import '../../dropdown_All/a_as_simplified_function.dart';
import '../../dropdown_All/equipmentUsed.dart';
import '../../dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class AddVrPacPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int TR_ID;

  AddVrPacPage(this.args, {Key key}) : super(key: key);

  final TextEditingController _nOcontroller = TextEditingController();
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

  final TextEditingController _SerialNOcontroller = TextEditingController();

  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  setTrNo() {
    _nOcontroller.text = args['TrNo'].toString();
    _SerialNOcontroller.text = args['Serial_No'].toString();
    //add below, it wasnt ther before
    TR_ID = args['trDatabaseID'];
  }

  @override
  Widget build(BuildContext context) {
    final VrModel ntr = watchOnly((VrProvider x) => x.vrModel);
    setTrNo();
    int id;
    var acc_token = sl<GoogleSignInController>().ACCESS_TOKEN;
    var ref_token = sl<GoogleSignInController>().REFRESH_TOKEN;
    var mob = const Text('Add VR-PAC Details', style: TextStyle(fontSize: 15));
    var desk = const Text('Add VR-PAC Details', style: TextStyle(fontSize: 20));

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
                    equipmentUsed: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,
                  );

                  getX((VrPacProvider x) => x.addVrPac(trPacReportToLocal));
                  watchOnly((VrPacProvider x) => {});
                  print("RV PAC added");

                  // ignore: use_build_context_synchronously
                  Navigator.popAndPushNamed(context, '/detail_VR',
                      arguments: {'id': args['VR_ID'], 'trDatabaseID': TR_ID});
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
