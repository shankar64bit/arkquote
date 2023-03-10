// ignore_for_file: missing_return, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/power_cable/pc_hv_test_model.dart';
import '../../../data/models/equipment/power_cable/pc_model.dart';
import '../../providers/pc_provider/pc_hv_provider.dart';
import '../../providers/pc_provider/pc_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';
import '../dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class AddPcHvPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int TR_ID;
  int PC_ID;

  AddPcHvPage(this.args, {Key key}) : super(key: key);

  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _rCurrentcontroller = TextEditingController();
  final TextEditingController _yCurrentcontroller = TextEditingController();
  final TextEditingController _bCurrentcontroller = TextEditingController();
  final TextEditingController _rVoltagecontroller = TextEditingController();
  final TextEditingController _yVoltagecontroller = TextEditingController();
  final TextEditingController _bVoltagecontroller = TextEditingController();

  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  setTrNo() {
    _nOcontroller.text = args['TrNo'].toString();
    //_pcBRefIDcontroller.text = args['PC_No'].toString();
    //add below, it wasnt ther before
    PC_ID = args['PC_ID'];
    TR_ID = args['trDatabaseID'];
  }

  @override
  Widget build(BuildContext context) {
    final PcModel ntr = watchOnly((PcProvider x) => x.pcModel);
    setTrNo();
    int id;
    var acc_token = sl<GoogleSignInController>().ACCESS_TOKEN;
    var ref_token = sl<GoogleSignInController>().REFRESH_TOKEN;
    var mob = const Text('Add Power Cable-Hv Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('Add Power Cable-Hv Details',
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

                  // loading to add details to remote server & local server

                  //add to local database
                  final PcHvTestModel pcHvReportToLocal = PcHvTestModel(
                    trNo: int.parse(_nOcontroller.text),
                    pcRefId: args['id'],
                    rCurrent: double.parse(_rCurrentcontroller.text),
                    yCurrent: double.parse(_yCurrentcontroller.text),
                    bCurrent: double.parse(_bCurrentcontroller.text),
                    rVoltage: double.parse(_rVoltagecontroller.text),
                    yVoltage: double.parse(_yVoltagecontroller.text),
                    bVoltage: double.parse(_bVoltagecontroller.text),
                    EquipmentType: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,
                  );

                  getX((PcHvProvider x) => x.addPcHv(pcHvReportToLocal));
                  watchOnly((PcHvProvider x) => {});
                  print("Power Cable Hv added");
                  Navigator.popAndPushNamed(context, '/detail_PC', arguments: {
                    'id': args['id'],
                    // 'trDatabaseID': args['trDatabaseID'],
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
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
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
