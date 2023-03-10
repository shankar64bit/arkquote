// ignore_for_file: missing_return

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../data/models/equipment/busbar/bb_model.dart';
import '../../providers/busbar_provider/bb_provider.dart';
import '../../widgets/custom_date_picker_form_field.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/a_bbetype_drop_list.dart';
import '../dropdown_All/a_location_enum_drop_list.dart';
import '../dropdown_All/a_make_drop_list.dart';
import '../dropdown_All/no_of_poles_drop_list.dart';
import '../dropdown_All/testedbyuser.dart';
import '../dropdown_All/verifiedbyuser.dart';

final _formKey = GlobalKey<FormState>();

class EditBbPage extends StatelessWidget with GetItMixin {
  Map args = {};
  BbModel _bbModel;
  EditBbPage(@required this.args, {Key key}) : super(key: key);
  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _DesignatioNcontroller = TextEditingController();
  final TextEditingController _LocatioNcontroller = TextEditingController();
  final TextEditingController _ratingcontroller = TextEditingController();
  final TextEditingController _panelcontroller = TextEditingController();
  final TextEditingController _noBcontroller = TextEditingController();
  final TextEditingController _DOTcontroller = TextEditingController();
  final TextEditingController _WitnessedByController = TextEditingController();

  DateTime _dateOfTesting;
  int get selectedValueForTested => TestedByUser().getTestByUser();
  int get selectedValueForVerified => VerifiedByUser().getVerifiedByUser();
  String get selectedMake => make_drop_lits().get_Make();
  String get selectedValueLocation =>
      Location_dropDown().get_selectedValueLocation();
  String get selectedValueForBBeType => bbetype_drop_lits().get_etype();
  int get selectedNoofPoles => no_of_poles_drop().get_No_Of_Poles();

  @override
  void dispose() {
    _IDcontroller.dispose();
    _nOcontroller.dispose();
    _LocatioNcontroller.dispose();
    _ratingcontroller.dispose();
    _panelcontroller.dispose();
    _noBcontroller.dispose();
    _DesignatioNcontroller.dispose();
    _DOTcontroller.dispose();
    _WitnessedByController.dispose();
  }

  Future<void> getReport() async {}

  @override
  Widget build(BuildContext context) {
    final BbModel ntr = watchOnly((BbProvider x) => x.bbModel);
    getX((BbProvider x) => x.getBbByID(args['id']));
    final BbModel _bbModel = watchOnly((BbProvider x) => x.bbModel);

    _IDcontroller.text = args['id'].toString();
    _nOcontroller.text = _bbModel.trNo.toString();
    _LocatioNcontroller.text = _bbModel.location;
    _ratingcontroller.text = _bbModel.rating;
    _panelcontroller.text = _bbModel.panel;
    _noBcontroller.text = _bbModel.noOfBar.toString();
    _DOTcontroller.text =
        DateFormat('dd/MM/yyyy').format(_bbModel.dateOfTesting).toString();
    _DesignatioNcontroller.text = _bbModel.designation;
    _dateOfTesting = _bbModel.dateOfTesting;
    _WitnessedByController.text = _bbModel.WitnessedBy;

    var mob = const Text('Edit Busbar Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Edit Busbar Details', style: TextStyle(fontSize: 20));

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
                      Uri.parse('${Env.URL_PREFIX}/bbEquip/${ntr.databaseID}/');

                  print("********");
                  print(url);
                  Map<String, String> headers = {
                    "Content-type": "application/json",
                    "Authorization": "Bearer $acc_token",
                  };
                  print(_noBcontroller.text.toString());
                  final Map payload = {
                    'trNo': args['trDatabaseID'].toString(),
                    'etype': selectedValueForBBeType.toString(),
                    'designation': _DesignatioNcontroller.text,
                    'location': selectedValueLocation.toString(),
                    'panel': _panelcontroller.text.toString(),
                    'nob': _noBcontroller.text.toString(),
                    'rating': _ratingcontroller.text.toString(),
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
                    final BbModel bbReportToLocal = BbModel(
                      trNo: int.parse(_nOcontroller.text),
                      designation: _DesignatioNcontroller.text,
                      location: selectedValueLocation.toString(),
                      rating: _ratingcontroller.text,
                      panel: _panelcontroller.text,
                      noOfBar: int.parse(_noBcontroller.text),
                      dateOfTesting: _dateOfTesting,
                      TestedBy: selectedValueForTested.toString(),
                      VerifiedBy: selectedValueForVerified.toString(),
                      WitnessedBy: _WitnessedByController.text,
                      etype: selectedValueForBBeType.toString(),
                      databaseID: _bbModel.databaseID,
                      lastUpdated: DateTime.now(),
                    );
                    getX((BbProvider x) =>
                        x.updateBb(bbReportToLocal, args['id']));
                    watchOnly((BbProvider x) => {});
                    Navigator.popAndPushNamed(context, '/detail_BB',
                        arguments: {
                          'id': args['id'],
                          'trDatabaseID': args['trDatabaseID']
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
                      controller: _nOcontroller,
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
                        'Designation', _DesignatioNcontroller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Rating', _ratingcontroller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Panel', _panelcontroller),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: bbetype_drop_lits(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: no_of_poles_drop(),
                    ),
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
                      controller: _nOcontroller,
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
                        'Designation', _DesignatioNcontroller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Rating', _ratingcontroller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Panel', _panelcontroller),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: bbetype_drop_lits(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: no_of_poles_drop(),
                    ),
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
