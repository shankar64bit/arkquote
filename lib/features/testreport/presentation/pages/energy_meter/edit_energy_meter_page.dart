// ignore_for_file: missing_return

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../data/models/equipment/energy_meter/energy_meter_model.dart';
import '../../providers/energy_meter_provider/energy_meter_provider.dart';
import '../../widgets/custom_date_picker_form_field.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/a_location_enum_drop_list.dart';
import '../dropdown_All/a_make_drop_list.dart';
import '../dropdown_All/equipmentUsed.dart';
import '../dropdown_All/testedbyuser.dart';
import '../dropdown_All/verifiedbyuser.dart';

final _formKey = GlobalKey<FormState>();

class EditEnergyMeterPage extends StatelessWidget with GetItMixin {
  Map args = {};
  EnergyMeterModel _energyMeterModel;
  EditEnergyMeterPage(@required this.args, {Key key}) : super(key: key);
  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _trnOcontroller = TextEditingController();
  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _DesignatioNcontroller = TextEditingController();
  final TextEditingController _LocatioNcontroller = TextEditingController();
  final TextEditingController _PaneLcontroller = TextEditingController();
  final TextEditingController _SerialNOcontroller = TextEditingController();
  final TextEditingController _makEcontroller = TextEditingController();
  final TextEditingController _voltagEcontroller = TextEditingController();
  final TextEditingController _FrequencYcontroller = TextEditingController();
  final TextEditingController _eqClasScontroller = TextEditingController();
  final TextEditingController _DOTcontroller = TextEditingController();
  final TextEditingController _WitnessedByController = TextEditingController();
  final TextEditingController _ctr_controller = TextEditingController();
  final TextEditingController _ptr_controller = TextEditingController();
  DateTime _dateOfTesting;
  int get selectedValueForTested => TestedByUser().getTestByUser();
  int get selectedValueForVerified => VerifiedByUser().getVerifiedByUser();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();
  String get selectedMake => make_drop_lits().get_Make();
  String get selectedValueLocation =>
      Location_dropDown().get_selectedValueLocation();

  @override
  void dispose() {
    _IDcontroller.dispose();
    _trnOcontroller.dispose();
    _LocatioNcontroller.dispose();
    _PaneLcontroller.dispose();
    _SerialNOcontroller.dispose();
    _makEcontroller.dispose();
    _voltagEcontroller.dispose();
    _FrequencYcontroller.dispose();
    _eqClasScontroller.dispose();
    _DesignatioNcontroller.dispose();
    _DOTcontroller.dispose();
    _WitnessedByController.dispose();
    _ctr_controller.dispose();
    _ptr_controller.dispose();
  }

  Future<void> getReport() async {}

  @override
  Widget build(BuildContext context) {
    final EnergyMeterModel ntr =
        watchOnly((EnergyMeterProvider x) => x.energymeterModel);
    getX((EnergyMeterProvider x) => x.getEnergyMeterByID(args['id']));
    final EnergyMeterModel _energymeterModel =
        watchOnly((EnergyMeterProvider x) => x.energymeterModel);

    _IDcontroller.text = args['id'].toString();
    _trnOcontroller.text = _energymeterModel.trNo.toString();
    _LocatioNcontroller.text = _energymeterModel.location;
    _PaneLcontroller.text = _energymeterModel.panel;
    _SerialNOcontroller.text = _energymeterModel.serialNo;
    _makEcontroller.text = _energymeterModel.make;
    _voltagEcontroller.text = _energymeterModel.voltage.toString();
    _eqClasScontroller.text = _energymeterModel.eqClass.toString();
    _FrequencYcontroller.text = _energymeterModel.frequency.toString();
    _DOTcontroller.text = DateFormat('dd/MM/yyyy')
        .format(_energymeterModel.dateOfTesting)
        .toString();
    _DesignatioNcontroller.text = _energymeterModel.designation;
    _dateOfTesting = _energymeterModel.dateOfTesting;
    _WitnessedByController.text = _energymeterModel.WitnessedBy;
    _ctr_controller.text = _energymeterModel.ctr;
    _ptr_controller.text = _energymeterModel.ptr;

    var mob =
        const Text('Edit Energy Meter Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Edit Energy Meter Details', style: TextStyle(fontSize: 20));

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
                  var url = Uri.parse(
                      '${Env.URL_PREFIX}/energyMeterEquipment/${ntr.databaseID}/');

                  print("********");
                  print(url);
                  Map<String, String> headers = {
                    "Content-type": "application/json",
                    "Authorization": "Bearer $acc_token",
                  };

                  final Map payload = {
                    'trNo': ntr.databaseID.toString(),
                    'etype': 'energy meter',
                    'designation': _DesignatioNcontroller.text,
                    'location': selectedValueLocation.toString(),
                    'serialNo': _SerialNOcontroller.text.toString(),
                    'make': selectedMake.toString(),
                    'eqClass': _eqClasScontroller.text,
                    'frequency': _FrequencYcontroller.text.toString(),
                    'voltage': _voltagEcontroller.text.toString(),
                    'panel': _PaneLcontroller.text.toString(),
                    'testedBy': selectedValueForTested.toString(),
                    'verifiedBy': selectedValueForVerified.toString(),
                    'WitnessedBy': _WitnessedByController.text.toString(),
                    'ctr': _ctr_controller.text.toString(),
                    'ptr': _ptr_controller.text.toString(),
                  };
                  var response = await http.put(url,
                      body: jsonEncode(payload), headers: headers);

                  if (response.statusCode == success_code ||
                      response.statusCode == success_code1) {
                    print('Response status: ${response.statusCode}');
                    print('Response body: ${response.body}');
                    print('Stored successfully');

                    //add to local database
                    final EnergyMeterModel energyMeterReportToLocal =
                        EnergyMeterModel(
                      trNo: int.parse(_trnOcontroller.text),
                      designation: _DesignatioNcontroller.text,
                      location: selectedValueLocation.toString(),
                      panel: _PaneLcontroller.text,
                      serialNo: _SerialNOcontroller.text,
                      make: selectedMake.toString(),
                      frequency: int.parse(_FrequencYcontroller.text),
                      voltage: int.parse(_voltagEcontroller.text),
                      eqClass: double.parse(_eqClasScontroller.text),
                      dateOfTesting: _dateOfTesting,
                      TestedBy: selectedValueForTested.toString(),
                      VerifiedBy: selectedValueForVerified.toString(),
                      WitnessedBy: _WitnessedByController.text,
                      etype: 'energy meter',
                      databaseID: _energymeterModel.databaseID,
                      updateDate: DateTime.now(),
                      ctr: _ctr_controller.text.toString(),
                      ptr: _ptr_controller.text.toString(),
                    );
                    getX((EnergyMeterProvider x) => x.updateEnergyMeter(
                        energyMeterReportToLocal, args['id']));
                    watchOnly((EnergyMeterProvider x) => {});
                    // print(energyMeterReportToLocal);
                    Navigator.popAndPushNamed(context, '/detail_EM',
                        arguments: {
                          'id': args['id'],
                          'trDatabaseID': args['trdatabaseID'],
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
      // body: SingleChildScrollView(child: build_body(context)),
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
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        'ID Number',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                    ),
                    TextFormField(
                      controller: _IDcontroller,
                      enabled: false,
                      textAlign: TextAlign.center,
                      // label : const Text('Test Report No.'),
                    ),
                    Divider(height: 0, thickness: 0.8, color: Colors.black),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        'Test Report No',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                    ),
                    TextFormField(
                      controller: _trnOcontroller,
                      enabled: false,
                      textAlign: TextAlign.center,
                      // label : const Text('Test Report No.'),
                    ),
                    Divider(height: 0, thickness: 0.8, color: Colors.black),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: TestedByUser(),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: VerifiedByUser(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 10, 150, 0),
                      child: Location_dropDown(),
                    ),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'WitnessedBy', _WitnessedByController),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Panel', _PaneLcontroller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Serial No', _SerialNOcontroller),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: make_drop_lits(),
                    ),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Voltage', _voltagEcontroller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'eqClass', _eqClasScontroller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Frequency', _FrequencYcontroller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'ctr', _ctr_controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'ptr', _ptr_controller),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomDatePickerFormField(
                        _DOTcontroller,
                        'Date of Testing',
                        (() {
                          pickDateOfTest(context);
                        }),
                      ),
                    ),
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
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        'ID Number',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                    ),
                    TextFormField(
                      controller: _IDcontroller,
                      enabled: false,
                      textAlign: TextAlign.center,
                      // label : const Text('Test Report No.'),
                    ),
                    Divider(height: 0, thickness: 0.8, color: Colors.black),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        'Test Report No',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                    ),
                    TextFormField(
                      controller: _trnOcontroller,
                      enabled: false,
                      textAlign: TextAlign.center,
                      // label : const Text('Test Report No.'),
                    ),
                    Divider(height: 0, thickness: 0.8, color: Colors.black),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: TestedByUser(),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: VerifiedByUser(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Location_dropDown(),
                    ),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'WitnessedBy', _WitnessedByController),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Panel', _PaneLcontroller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Serial No', _SerialNOcontroller),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: make_drop_lits(),
                    ),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Voltage', _voltagEcontroller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'eqClass', _eqClasScontroller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Frequency', _FrequencYcontroller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'ctr', _ctr_controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'ptr', _ptr_controller),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                      child: CustomDatePickerFormField(
                        _DOTcontroller,
                        'Date of Testing',
                        (() {
                          pickDateOfTest(context);
                        }),
                      ),
                    ),
                  ]),
            ),
          );
        }
      }),
    );
  }

  Future<void> pickDateOfTest(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: _dateOfTesting ?? initialDate,
        firstDate: DateTime(DateTime.now().year - 100),
        lastDate: DateTime(DateTime.now().year + 1),
        builder: (context, child) => Theme(
              data: ThemeData().copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Colors.pink,
                  onPrimary: Colors.white,
                  onSurface: Colors.black,
                ),
                dialogBackgroundColor: Colors.white,
              ),
              child: child ?? const Text(''),
            ));

    if (newDate == null) {
      return;
    }
    String dot = DateFormat('dd/MM/yyyy').format(newDate);

    _dateOfTesting = newDate;
    _DOTcontroller.text = dot;
  }
}
