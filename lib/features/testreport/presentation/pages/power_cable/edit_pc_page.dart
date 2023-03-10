// ignore_for_file: missing_return

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../data/models/equipment/power_cable/pc_model.dart';
import '../../providers/pc_provider/pc_provider.dart';
import '../../widgets/custom_date_picker_form_field.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/a_location_enum_drop_list.dart';
import '../dropdown_All/a_make_drop_list.dart';
import '../dropdown_All/equipmentUsed.dart';
import '../dropdown_All/testedbyuser.dart';
import '../dropdown_All/verifiedbyuser.dart';

final _formKey = GlobalKey<FormState>();

class EditPcPage extends StatelessWidget with GetItMixin {
  Map args = {};
  PcModel _pcModel;
  EditPcPage(@required this.args, {Key key}) : super(key: key);
  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _DesignatioNcontroller = TextEditingController();
  final TextEditingController _LocatioNcontroller = TextEditingController();
  final TextEditingController _ratingcontroller = TextEditingController();
  final TextEditingController _panelcontroller = TextEditingController();
  final TextEditingController _makEcontroller = TextEditingController();
  final TextEditingController _sizecontroller = TextEditingController();
  final TextEditingController _lengthcontroller = TextEditingController();
  final TextEditingController _DOTcontroller = TextEditingController();
  final TextEditingController _WitnessedByController = TextEditingController();
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
    _nOcontroller.dispose();
    _LocatioNcontroller.dispose();
    _ratingcontroller.dispose();
    _panelcontroller.dispose();
    _makEcontroller.dispose();
    _sizecontroller.dispose();
    _DesignatioNcontroller.dispose();
    _lengthcontroller.dispose();
    _DOTcontroller.dispose();
    _WitnessedByController.dispose();
  }

  Future<void> getReport() async {}

  @override
  Widget build(BuildContext context) {
    final PcModel ntr = watchOnly((PcProvider x) => x.pcModel);
    getX((PcProvider x) => x.getPcByID(args['id']));
    final PcModel _pcModel = watchOnly((PcProvider x) => x.pcModel);

    _IDcontroller.text = args['id'].toString();
    _nOcontroller.text = _pcModel.trNo.toString();
    _LocatioNcontroller.text = _pcModel.location;
    _ratingcontroller.text = _pcModel.rating;
    _panelcontroller.text = _pcModel.panel;
    _makEcontroller.text = _pcModel.make;
    _sizecontroller.text = _pcModel.size;
    _lengthcontroller.text = _pcModel.length.toString();
    _DOTcontroller.text =
        DateFormat('dd/MM/yyyy').format(_pcModel.dateOfTesting).toString();
    _DesignatioNcontroller.text = _pcModel.designation;
    _dateOfTesting = _pcModel.dateOfTesting;
    _WitnessedByController.text = _pcModel.WitnessedBy;

    var mob =
        const Text('Edit Power Cable Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Edit Power Cable Details', style: TextStyle(fontSize: 20));

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
                      Uri.parse('${Env.URL_PREFIX}/pcEquip/${ntr.databaseID}/');

                  print("********");
                  print(url);
                  Map<String, String> headers = {
                    "Content-type": "application/json",
                    "Authorization": "Bearer $acc_token",
                  };

                  final Map payload = {
                    'trNo': args['trDatabaseID'].toString(),
                    'etype': 'pc',
                    'designation': _DesignatioNcontroller.text,
                    'location': selectedValueLocation.toString(),
                    'panel': _panelcontroller.text.toString(),
                    'make': selectedMake.toString(),
                    'size': _sizecontroller.text,
                    'rating': _ratingcontroller.text.toString(),
                    'length': _lengthcontroller.text.toString(),
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
                    final PcModel pcReportToLocal = PcModel(
                      trNo: int.parse(_nOcontroller.text),
                      designation: _DesignatioNcontroller.text,
                      location: selectedValueLocation.toString(),
                      rating: _ratingcontroller.text,
                      panel: _panelcontroller.text,
                      make: selectedMake.toString(),
                      size: _sizecontroller.text,
                      length: _lengthcontroller.text,
                      dateOfTesting: _dateOfTesting,
                      TestedBy: selectedValueForTested.toString(),
                      VerifiedBy: selectedValueForVerified.toString(),
                      WitnessedBy: _WitnessedByController.text,
                      etype: 'pc',
                      databaseID: _pcModel.databaseID,
                      lastUpdated: DateTime.now(),
                    );
                    getX((PcProvider x) =>
                        x.updatePc(pcReportToLocal, args['id']));
                    watchOnly((PcProvider x) => {});
                    Navigator.popAndPushNamed(context, '/detail_PC',
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
    final PcModel ntr = watchOnly((PcProvider x) => x.pcModel);

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
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Rating', _ratingcontroller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Panel', _panelcontroller),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: make_drop_lits(),
                    ),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Size', _sizecontroller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Length', _lengthcontroller),
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
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Rating', _ratingcontroller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Panel', _panelcontroller),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: make_drop_lits(),
                    ),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Size', _sizecontroller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Length', _lengthcontroller),
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
