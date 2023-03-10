// ignore_for_file: missing_return, prefer_const_constructors, missing_required_param

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/energy_meter/energy_meter_model.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/energy_meter/energy_meter_rp_test.dart';
import '../../providers/energy_meter_provider/energy_meter_provider.dart';
import '../../providers/energy_meter_provider/energy_meter_rp_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';
import '../dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class AddEnergyMeterRpPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int TR_ID;
  int EM_ID;

  AddEnergyMeterRpPage(this.args, {Key key}) : super(key: key);

  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _itRcontroller = TextEditingController();
  final TextEditingController _atRcontroller = TextEditingController();
  final TextEditingController _tr_Rcontroller = TextEditingController();
  final TextEditingController _isRcontroller = TextEditingController();
  final TextEditingController _asRcontroller = TextEditingController();
  final TextEditingController _sr_Acontroller = TextEditingController();
  final TextEditingController _SerialNOcontroller = TextEditingController();

  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  setTrNo() {
    _nOcontroller.text = args['TrNo'].toString();
    _SerialNOcontroller.text = args['Serial_No'].toString();
    EM_ID = args['emDatabaseID'];
    TR_ID = args['trDatabaseID'];
  }

  @override
  Widget build(BuildContext context) {
    final EnergyMeterModel ntr =
        watchOnly((EnergyMeterProvider x) => x.energymeterModel);
    setTrNo();
    int id;
    var acc_token = sl<GoogleSignInController>().ACCESS_TOKEN;
    var ref_token = sl<GoogleSignInController>().REFRESH_TOKEN;
    var mob = const Text('Add Energy Meter-RP Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('Add Energy Meter-RP  Details',
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
                  final EnergyMeterRpTestModel energyMeterRpReportToLocal =
                      EnergyMeterRpTestModel(
                    trNo: int.parse(_nOcontroller.text),
                    serialNo: _SerialNOcontroller.text,
                    initialTestMeterReading: double.parse(_itRcontroller.text),
                    afterTestMeterReading: double.parse(_atRcontroller.text),
                    testMeterReading_R: double.parse(_tr_Rcontroller.text),
                    initialStandardMeterReading:
                        double.parse(_isRcontroller.text),
                    afterStandardMeterReading:
                        double.parse(_asRcontroller.text),
                    standardMeterReading_A: double.parse(_sr_Acontroller.text),
                    EquipmentType: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,
                  );

                  print(energyMeterRpReportToLocal.serialNo);
                  getX((EnergyMeterRpProvider x) =>
                      x.addEnergyMeterRp(energyMeterRpReportToLocal));
                  watchOnly((EnergyMeterRpProvider x) => {});
                  print("Energy Meter rp test added");

                  Navigator.popAndPushNamed(context, '/detail_EM',
                      arguments: {'id': args['EM_ID'], 'trDatabaseID': TR_ID});
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
