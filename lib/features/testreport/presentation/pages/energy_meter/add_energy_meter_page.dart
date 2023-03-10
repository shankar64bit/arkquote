// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/energy_meter/energy_meter_model.dart';
import '../../providers/energy_meter_provider/energy_meter_provider.dart';
import '../../widgets/custom_date_picker_form_field.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/a_location_enum_drop_list.dart';
import '../dropdown_All/a_make_drop_list.dart';
import '../dropdown_All/equipmentUsed.dart';
import '../dropdown_All/testedbyuser.dart';
import '../dropdown_All/verifiedbyuser.dart';

String etype_radio = 'energy meter';
final _formKey = GlobalKey<FormState>();

class AddEnergyMeterDetails extends StatelessWidget with GetItMixin {
  Map args = {};
  DateTime _dateOfTesting;
  AddEnergyMeterDetails(this.args, {Key key}) : super(key: key);

  final String _etypEcontroller = etype_radio;
  final TextEditingController _nOcontroller = TextEditingController();
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
  int get selectedValueForTested => TestedByUser().getTestByUser();
  int get selectedValueForVerified => VerifiedByUser().getVerifiedByUser();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();
  String get selectedMake => make_drop_lits().get_Make();
  String get selectedValueLocation =>
      Location_dropDown().get_selectedValueLocation();

  setTrNo() {
    _nOcontroller.text = args['trNo'].toString();
  }

  @override
  Widget build(BuildContext context) {
    setTrNo();
    var mob = Text('Add Energy Meter Details', style: TextStyle(fontSize: 17));
    var desk = Text('Add Energy Meter Details', style: TextStyle(fontSize: 20));
    var accToken = sl<GoogleSignInController>().ACCESS_TOKEN;
    var refToken = sl<GoogleSignInController>().REFRESH_TOKEN;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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

                  // add to local database
                  final EnergyMeterModel energyMeterToLocal = EnergyMeterModel(
                    trNo: int.parse(_nOcontroller.text),
                    etype: _etypEcontroller,
                    designation: _etypEcontroller,
                    location: selectedValueLocation.toString(),
                    panel: _PaneLcontroller.text,
                    serialNo: _SerialNOcontroller.text.toString(),
                    make: selectedMake.toString(),
                    eqClass: double.parse(_eqClasScontroller.text),
                    frequency: int.parse(_FrequencYcontroller.text),
                    voltage: int.parse(_voltagEcontroller.text),
                    dateOfTesting: _dateOfTesting,
                    TestedBy: selectedValueForTested.toString(),
                    VerifiedBy: selectedValueForVerified.toString(),
                    WitnessedBy: _WitnessedByController.text,
                    databaseID: 0,
                    ctr: _ctr_controller.text.toString(),
                    ptr: _ptr_controller.text.toString(),
                  );
                  print(energyMeterToLocal);
                  getX((EnergyMeterProvider x) =>
                      x.addEnergyMeter(energyMeterToLocal, _dateOfTesting));
                  watchOnly((EnergyMeterProvider x) => {});
                  Navigator.popAndPushNamed(context, '/detail_report',
                      arguments: args['trId']);
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
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        'Test Report  No',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      ),
                    ),
                    Text(_etypEcontroller),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        controller: _nOcontroller,
                        textAlign: TextAlign.center,
                        enabled: false,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: TestedByUser(),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: VerifiedByUser(),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: EquipmentTypeList(),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
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
                            _DOTcontroller, 'Date of Testing', (() {
                          pickDateOfTest(context);
                        }))),
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
                        'Test  Report  No',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: TextFormField(
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        controller: _nOcontroller,
                        textAlign: TextAlign.center,
                        enabled: false,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: TestedByUser(),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: VerifiedByUser(),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: EquipmentTypeList(),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
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
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: CustomDatePickerFormField(
                            _DOTcontroller, 'Date of Testing', (() {
                          pickDateOfTest(context);
                        }))),
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
                  //primary: Colors.pink,
                  primary: Color.fromARGB(255, 119, 11, 11),
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
