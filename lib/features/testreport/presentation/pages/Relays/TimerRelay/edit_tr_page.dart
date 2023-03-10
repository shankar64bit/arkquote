// ignore_for_file: missing_return

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../../../../../../env.sample.dart';
import '../../../../data/models/equipment/Relays/TRelay/tr_model.dart';
import '../../../providers/Relays_providers/TimerRelay_provider/tr_provider.dart';
import '../../../widgets/custom_date_picker_form_field.dart';
import '../../dropdown_All/a_as_simplified_function.dart';
import '../../dropdown_All/a_location_enum_drop_list.dart';
import '../../dropdown_All/a_make_drop_list.dart';
import '../../dropdown_All/testedbyuser.dart';
import '../../dropdown_All/verifiedbyuser.dart';

final _formKey = GlobalKey<FormState>();

class EditTrPage extends StatelessWidget with GetItMixin {
  Map args = {};
  EditTrPage(@required this.args, {Key key}) : super(key: key);
  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _DOTcontroller = TextEditingController();
  final TextEditingController _trNo_Controller = TextEditingController();
  final TextEditingController _LocatioNcontroller = TextEditingController();
  final TextEditingController _designation_Controller = TextEditingController();
  final TextEditingController _serialNo_Controller = TextEditingController();
  final TextEditingController _panel_Controller = TextEditingController();
  final TextEditingController _make_Controller = TextEditingController();
  final TextEditingController _rtype_Controller = TextEditingController();
  final TextEditingController _auxVoltage_Controller = TextEditingController();
  final TextEditingController _witnessedBy_Controller = TextEditingController();
  DateTime _dateOfTesting;
  int get selectedValueForTested => TestedByUser().getTestByUser();
  int get selectedValueForVerified => VerifiedByUser().getVerifiedByUser();
  String get selectedMake => make_drop_lits().get_Make();
  String get selectedValueLocation =>
      Location_dropDown().get_selectedValueLocation();

  @override
  void dispose() {
    _DOTcontroller.dispose();
    _IDcontroller.dispose();
    _trNo_Controller.dispose();
    _LocatioNcontroller.dispose();
    _serialNo_Controller.dispose();
    _make_Controller.dispose();
    _panel_Controller.dispose();
    _designation_Controller.dispose();
    _auxVoltage_Controller.dispose();
    _rtype_Controller.dispose();
    _witnessedBy_Controller.dispose();
  }

  Future<void> getReport() async {}

  @override
  Widget build(BuildContext context) {
    final TrModel ntr = watchOnly((TrProvider x) => x.trModel);
    getX((TrProvider x) => x.getTrByID(args['id']));
    final TrModel _trModel = watchOnly((TrProvider x) => x.trModel);

    _IDcontroller.text = args['id'].toString();
    _trNo_Controller.text = _trModel.trNo.toString();
    _LocatioNcontroller.text = _trModel.location;
    _serialNo_Controller.text = _trModel.serialNo;
    _make_Controller.text = _trModel.make;
    _rtype_Controller.text = _trModel.rtype;
    _panel_Controller.text = _trModel.panel;
    _auxVoltage_Controller.text = _trModel.auxVoltage.toString();
    _DOTcontroller.text =
        DateFormat('dd/MM/yyyy').format(_trModel.dateOfTesting).toString();
    _designation_Controller.text = _trModel.designation;
    _dateOfTesting = _trModel.dateOfTesting;
    _witnessedBy_Controller.text = _trModel.WitnessedBy;

    var mob =
        const Text('Edit Timer Relay Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Edit Timer Relay Details', style: TextStyle(fontSize: 20));

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
                  var url =
                      Uri.parse('${Env.URL_PREFIX}/tRelay/${ntr.databaseID}/');

                  print("********");
                  print(url);
                  Map<String, String> headers = {
                    "Content-type": "application/json",
                    "Authorization": "Bearer $acc_token",
                  };

                  final Map payload = {
                    'trNo': args['trDatabaseID'].toString(),
                    'etype': 'tr',
                    'designation': _designation_Controller.text,
                    'panel': _panel_Controller.text.toString(),
                    'location': selectedValueLocation.toString(),
                    'serialNo': _serialNo_Controller.text,
                    'make': selectedMake.toString(),
                    'rtype': _rtype_Controller.text.toString(),
                    'auxVoltage': _auxVoltage_Controller.text.toString(),
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
                    final TrModel trReportToLocal = TrModel(
                      trNo: int.parse(_trNo_Controller.text),
                      designation: _designation_Controller.text,
                      location: selectedValueLocation.toString(),
                      serialNo: _serialNo_Controller.text,
                      panel: _panel_Controller.text.toString(),
                      make: selectedMake.toString(),
                      rtype: _rtype_Controller.text.toString(),
                      auxVoltage: _auxVoltage_Controller.text.toString(),
                      dateOfTesting: _dateOfTesting,
                      testedBy: selectedValueForTested.toString(),
                      verifiedBy: selectedValueForVerified.toString(),
                      WitnessedBy: _witnessedBy_Controller.text.toString(),
                      etype: 'tr',
                      databaseID: _trModel.databaseID,
                      updateDate: DateTime.now(),
                    );
                    getX((TrProvider x) =>
                        x.updateTr(trReportToLocal, args['id']));
                    watchOnly((TrProvider x) => {});
                    Navigator.popAndPushNamed(context, '/detail_TR',
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
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: make_drop_lits(),
                    ),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Designation', _designation_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'SerialNO', _serialNo_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'panel', _panel_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'make', _make_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'rtype', _rtype_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'auxVoltage', _auxVoltage_Controller),
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
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Designation', _designation_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Serial No', _serialNo_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'panel', _panel_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'make', _make_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'rtype', _rtype_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'auxVoltage', _auxVoltage_Controller),
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