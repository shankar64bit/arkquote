// ignore_for_file: missing_return

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/isolator/iso_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/iso_provider/iso_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../widgets/custom_date_picker_form_field.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/a_location_enum_drop_list.dart';
import '../dropdown_All/a_make_drop_list.dart';
import '../dropdown_All/testedbyuser.dart';
import '../dropdown_All/verifiedbyuser.dart';
import '../dropdown_All/yom_drop_list.dart';

final _formKey = GlobalKey<FormState>();

class EditIsoPage extends StatelessWidget with GetItMixin {
  Map args = {};
  EditIsoPage(@required this.args, {Key key}) : super(key: key);
  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _DesignatioNcontroller = TextEditingController();
  final TextEditingController _LocatioNcontroller = TextEditingController();
  final TextEditingController _ratingcontroller = TextEditingController();
  final TextEditingController _SerialNOcontroller = TextEditingController();
  final TextEditingController _makEcontroller = TextEditingController();
  final TextEditingController _equipTypecontroller = TextEditingController();
  final TextEditingController _yomcontroller = TextEditingController();
  final TextEditingController _DOTcontroller = TextEditingController();
  final TextEditingController _WitnessedByController = TextEditingController();
  DateTime _dateOfTesting;
  int get selectedValueForTested => TestedByUser().getTestByUser();
  int get selectedValueForVerified => VerifiedByUser().getVerifiedByUser();
  String get selectedMake => make_drop_lits().get_Make();
  String get selectedValueLocation =>
      Location_dropDown().get_selectedValueLocation();

  @override
  void dispose() {
    _IDcontroller.dispose();
    _nOcontroller.dispose();
    _LocatioNcontroller.dispose();
    _ratingcontroller.dispose();
    _SerialNOcontroller.dispose();
    _makEcontroller.dispose();
    _equipTypecontroller.dispose();
    _DesignatioNcontroller.dispose();
    _yomcontroller.dispose();
    _DOTcontroller.dispose();
    _WitnessedByController.dispose();
  }

  Future<void> getReport() async {}

  @override
  Widget build(BuildContext context) {
    final IsoModel ntr = watchOnly((IsoProvider x) => x.isoModel);
    getX((IsoProvider x) => x.getIsoByID(args['id']));
    final IsoModel _isoModel = watchOnly((IsoProvider x) => x.isoModel);

    _IDcontroller.text = args['id'].toString();
    _nOcontroller.text = _isoModel.trNo.toString();
    _LocatioNcontroller.text = _isoModel.location;
    _ratingcontroller.text = _isoModel.rating;
    _SerialNOcontroller.text = _isoModel.serialNo;
    _makEcontroller.text = _isoModel.make;
    _equipTypecontroller.text = _isoModel.equipType;
    _yomcontroller.text = _isoModel.yom.toString();
    _DOTcontroller.text =
        DateFormat('dd/MM/yyyy').format(_isoModel.dateOfTesting).toString();
    _DesignatioNcontroller.text = _isoModel.designation;
    _dateOfTesting = _isoModel.dateOfTesting;
    _WitnessedByController.text = _isoModel.WitnessedBy;

    var mob =
        const Text('Edit Isolator Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Edit Isolator Details', style: TextStyle(fontSize: 20));

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
                      '${Env.URL_PREFIX}/isoEquip/${ntr.databaseID}/');

                  print("********");
                  print(url);
                  Map<String, String> headers = {
                    "Content-type": "application/json",
                    "Authorization": "Bearer $acc_token",
                  };

                  final Map payload = {
                    'trNo': args['trDatabaseID'].toString(),
                    'etype': 'iso',
                    'designation': _DesignatioNcontroller.text,
                    'location': selectedValueLocation.toString(),
                    // 'serialNo': _SerialNOcontroller.text.toString(),
                    'serialNo': ntr.databaseID.toString(),
                    'make': selectedMake.toString(),
                    'equipType': _equipTypecontroller.text,
                    'rating': _ratingcontroller.text.toString(),
                    'yom': _yomcontroller.text.toString(),
                    'testedBy': selectedValueForTested.toString(),
                    'verifiedBy': selectedValueForVerified.toString(),
                    'WitnessedBy': _WitnessedByController.text.toString(),
                    'dateOfTesting': _dateOfTesting.toString(),
                  };
                  var response = await http.put(url,
                      body: jsonEncode(payload), headers: headers);

                  if (response.statusCode == success_code ||
                      response.statusCode == success_code1) {
                    print('Response status: ${response.statusCode}');
                    print('Response body: ${response.body}');
                    print('Stored successfully');

                    //add to local database
                    final IsoModel isoReportToLocal = IsoModel(
                      trNo: int.parse(_nOcontroller.text),
                      designation: _DesignatioNcontroller.text,
                      location: selectedValueLocation.toString(),
                      rating: _ratingcontroller.text,
                      serialNo: _SerialNOcontroller.text,
                      make: selectedMake.toString(),
                      equipType: _equipTypecontroller.text,
                      yom: int.parse(_yomcontroller.text),
                      dateOfTesting: _dateOfTesting,
                      TestedBy: selectedValueForTested.toString(),
                      VerifiedBy: selectedValueForVerified.toString(),
                      WitnessedBy: _WitnessedByController.text,
                      etype: 'iso',
                      databaseID: _isoModel.databaseID,
                      lastUpdated: DateTime.now(),
                    );
                    getX((IsoProvider x) =>
                        x.updateIso(isoReportToLocal, args['id']));
                    watchOnly((IsoProvider x) => {});
                    Navigator.popAndPushNamed(context, '/detail_ISO',
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
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: Location_dropDown(),
                    ),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'WitnessedBy', _WitnessedByController),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Designation', _DesignatioNcontroller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Rating', _ratingcontroller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Serial No', _SerialNOcontroller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Equipment Type', _equipTypecontroller),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: make_drop_lits(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: yom_drop(),
                    ),
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
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Location_dropDown(),
                    ),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'WitnessedBy', _WitnessedByController),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Designation', _DesignatioNcontroller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Rating', _ratingcontroller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Serial No', _SerialNOcontroller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Equipment Type', _equipTypecontroller),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: make_drop_lits(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: yom_drop(),
                    ),
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