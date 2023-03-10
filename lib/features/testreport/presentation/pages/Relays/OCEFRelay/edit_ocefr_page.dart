// ignore_for_file: missing_return

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../../../../../../env.sample.dart';
import '../../../../data/models/equipment/Relays/OCEFRelay/ocefr_model.dart';
import '../../../providers/Relays_providers/OCEFRelay_provider/ocefr_provider.dart';
import '../../../widgets/custom_date_picker_form_field.dart';
import '../../dropdown_All/a_OcEfetype_drop_list.dart';
import '../../dropdown_All/a_as_simplified_function.dart';
import '../../dropdown_All/a_location_enum_drop_list.dart';
import '../../dropdown_All/a_make_drop_list.dart';
import '../../dropdown_All/testedbyuser.dart';
import '../../dropdown_All/verifiedbyuser.dart';

final _formKey = GlobalKey<FormState>();

class EditOcEfrPage extends StatelessWidget with GetItMixin {
  Map args = {};
  EditOcEfrPage(@required this.args, {Key key}) : super(key: key);
  String _etypEcontroller, designation;

  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _DOTcontroller = TextEditingController();
  final TextEditingController _trNo_Controller = TextEditingController();
  final TextEditingController _LocatioNcontroller = TextEditingController();
  // final TextEditingController _designation_Controller = TextEditingController();
  final TextEditingController _serialNoRph_Controller = TextEditingController();
  final TextEditingController _serialNoYph_Controller = TextEditingController();
  final TextEditingController _serialNoBph_Controller = TextEditingController();
  final TextEditingController _panel_Controller = TextEditingController();
  final TextEditingController _make_Controller = TextEditingController();
  final TextEditingController _rtype_Controller = TextEditingController();
  final TextEditingController _auxVoltage_Controller = TextEditingController();
  final TextEditingController _ctRatio_Controller = TextEditingController();
  final TextEditingController _witnessedBy_Controller = TextEditingController();
  DateTime _dateOfTesting;
  int get selectedValueForTested => TestedByUser().getTestByUser();
  int get selectedValueForVerified => VerifiedByUser().getVerifiedByUser();
  String get selectedMake => make_drop_lits().get_Make();
  String get selectedValueLocation =>
      Location_dropDown().get_selectedValueLocation();
  String get selectedValueForOcEfeType => ocefetype_drop_lits().get_etype();

  @override
  void dispose() {
    _DOTcontroller.dispose();
    _IDcontroller.dispose();
    _trNo_Controller.dispose();
    _LocatioNcontroller.dispose();
    _serialNoRph_Controller.dispose();
    _serialNoYph_Controller.dispose();
    _serialNoBph_Controller.dispose();
    _make_Controller.dispose();
    _panel_Controller.dispose();
    // _designation_Controller.dispose();
    _auxVoltage_Controller.dispose();
    _ctRatio_Controller.dispose();
    _rtype_Controller.dispose();
    _witnessedBy_Controller.dispose();
  }

  Future<void> getReport() async {}

  @override
  Widget build(BuildContext context) {
    final OcEfrModel ntr = watchOnly((OcEfrProvider x) => x.ocefrModel);
    getX((OcEfrProvider x) => x.getOcEfrByID(args['id']));
    final OcEfrModel _ocefrModel = watchOnly((OcEfrProvider x) => x.ocefrModel);
    _etypEcontroller = _ocefrModel.etype;
    _IDcontroller.text = args['id'].toString();
    _trNo_Controller.text = _ocefrModel.trNo.toString();
    _LocatioNcontroller.text = _ocefrModel.location;
    _serialNoRph_Controller.text = _ocefrModel.serialNo_Rph;
    _serialNoYph_Controller.text = _ocefrModel.serialNo_Yph;
    _serialNoBph_Controller.text = _ocefrModel.serialNo_Bph;
    _make_Controller.text = _ocefrModel.make;
    _rtype_Controller.text = _ocefrModel.rtype;
    _panel_Controller.text = _ocefrModel.panel;
    _auxVoltage_Controller.text = _ocefrModel.auxVoltage.toString();
    _ctRatio_Controller.text = _ocefrModel.ctRatio;
    _DOTcontroller.text =
        DateFormat('dd/MM/yyyy').format(_ocefrModel.dateOfTesting).toString();
    designation = _ocefrModel.designation;
    _dateOfTesting = _ocefrModel.dateOfTesting;
    _witnessedBy_Controller.text = _ocefrModel.WitnessedBy;

    var mob = const Text('Edit OverCurrent/Earth Fault Relay Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('Edit OverCurrent/Earth Fault Realy Details',
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
                  var url = Uri.parse(
                      '${Env.URL_PREFIX}/ocefRelay/${ntr.databaseID}/');

                  print("********");
                  print(url);

                  _etypEcontroller = selectedValueForOcEfeType.toString();
                  if (_etypEcontroller == 'ocri') {
                    designation = "OverCurrent Relay(Instantaneous)";
                  } else if (_etypEcontroller == 'ocrinv' ||
                      _etypEcontroller == 'ocrinvl') {
                    designation = 'OverCurrent Relay(Inverse)';
                  } else if (_etypEcontroller == 'ocefri') {
                    designation = 'OC & Earth Fault Relay (Instantaneous)';
                  } else if (_etypEcontroller == 'ocefrinv' ||
                      _etypEcontroller == 'ocefrinvl') {
                    designation = 'OC & Earth Fault Relay (Inverse)';
                  }

                  Map<String, String> headers = {
                    "Content-type": "application/json",
                    "Authorization": "Bearer $acc_token",
                  };

                  final Map payload = {
                    'trNo': args['trDatabaseID'].toString(),
                    'etype': _etypEcontroller,
                    'designation': designation,
                    'panel': _panel_Controller.text.toString(),
                    'location': selectedValueLocation.toString(),
                    'serialNo_Rph': _serialNoRph_Controller.text.toString(),
                    'serialNo_Yph': _serialNoYph_Controller.text.toString(),
                    'serialNo_Bph': _serialNoBph_Controller.text.toString(),
                    'make': selectedMake.toString(),
                    'rtype': _rtype_Controller.text.toString(),
                    'auxVoltage': _auxVoltage_Controller.text.toString(),
                    'ctRatio': _ctRatio_Controller.text.toString(),
                    'dateOfTesting': _dateOfTesting.toString(),
                    'testedBy': selectedValueForTested.toString(),
                    'verifiedBy': selectedValueForVerified.toString(),
                    'WitnessedBy': _witnessedBy_Controller.text.toString(),
                  };
                  var response = await http.put(url,
                      body: jsonEncode(payload), headers: headers);

                  if (response.statusCode == success_code ||
                      response.statusCode == success_code1) {
                    print('Response status: ${response.statusCode}');
                    print('Response body: ${response.body}');
                    print('Stored successfully');

                    //add to local database
                    final OcEfrModel ocefrReportToLocal = OcEfrModel(
                      trNo: int.parse(_trNo_Controller.text),
                      designation: designation,
                      location: selectedValueLocation.toString(),
                      serialNo_Bph: _serialNoBph_Controller.text,
                      serialNo_Rph: _serialNoRph_Controller.text,
                      serialNo_Yph: _serialNoYph_Controller.text,
                      panel: _panel_Controller.text.toString(),
                      make: selectedMake.toString(),
                      rtype: _rtype_Controller.text.toString(),
                      auxVoltage: _auxVoltage_Controller.text.toString(),
                      ctRatio: _ctRatio_Controller.text,
                      dateOfTesting: _dateOfTesting,
                      testedBy: selectedValueForTested.toString(),
                      verifiedBy: selectedValueForVerified.toString(),
                      WitnessedBy: _witnessedBy_Controller.text.toString(),
                      etype: _etypEcontroller,
                      databaseID: _ocefrModel.databaseID,
                      updateDate: DateTime.now(),
                    );
                    getX((OcEfrProvider x) =>
                        x.updateOcEfr(ocefrReportToLocal, args['id']));
                    watchOnly((OcEfrProvider x) => {});
                    Navigator.popAndPushNamed(context, '/detail_OCEFR',
                        arguments: {
                          'id': args['id'],
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
                        'ID',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        controller: _IDcontroller,
                        textAlign: TextAlign.center,
                        enabled: false,
                      ),
                    ),
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        controller: _trNo_Controller,
                        textAlign: TextAlign.center,
                        enabled: false,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: TestedByUser(),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: VerifiedByUser(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: Location_dropDown(),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: make_drop_lits(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: ocefetype_drop_lits(),
                    ),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'SerialNO Rph', _serialNoRph_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'SerialNO Yph', _serialNoYph_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'SerialNO Bph', _serialNoBph_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Panel', _panel_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Make', _make_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Type', _rtype_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'auxVoltage', _auxVoltage_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'CT Ratio', _ctRatio_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'WitnessedBy', _witnessedBy_Controller),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                        child: CustomDatePickerFormField(
                            _DOTcontroller, 'Date of Testing', (() {
                          pickDateOfTest(context);
                        }))),
                  ]),
            ),
          );
          // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
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
                        'ID',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        controller: _IDcontroller,
                        textAlign: TextAlign.center,
                        enabled: false,
                      ),
                    ),
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
                        controller: _trNo_Controller,
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
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Location_dropDown(),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: make_drop_lits(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: ocefetype_drop_lits(),
                    ),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Serial No Rph', _serialNoRph_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Serial No Yph', _serialNoYph_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Serial No Bph', _serialNoBph_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Panel', _panel_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Make', _make_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Type', _rtype_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'auxVoltage', _auxVoltage_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'CT Ratio', _ctRatio_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'WitnessedBy', _witnessedBy_Controller),
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
