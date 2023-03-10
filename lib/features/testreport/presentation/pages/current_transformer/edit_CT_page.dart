// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/CT/ct_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/Auser_input_validation_exnt.dart/validation_extension_methods.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/yom_drop_list.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/ct_provider/ct_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../../../../../env.sample.dart';
import '../../widgets/custom_date_picker_form_field.dart';
import '../../widgets/custom_text_form_field_For_number.dart';
import '../dropdown_All/MegaGigaTeraRadioButton/connectedtaps.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/a_location_enum_drop_list.dart';
import '../dropdown_All/a_make_drop_list.dart';
import '../dropdown_All/testedbyuser.dart';
import '../dropdown_All/verifiedbyuser.dart';
import '../dropdown_All/vk_values_3_ctTapTable.dart';
import '../equipment_acb/test_report_page.dart';

final _formKey = GlobalKey<FormState>();

class Edit_CT_Details extends StatelessWidget with GetItMixin {
  final int id;
  CTModel _ctModel;
  Edit_CT_Details({@required this.id, Key key}) : super(key: key);
  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _trNo_Controller = TextEditingController();
  final TextEditingController _Panel_Controller = TextEditingController();
  final TextEditingController _Sn_Rph_controller = TextEditingController();
  final TextEditingController _Sn_Yph_controller = TextEditingController();
  final TextEditingController _Sn_Bph_controller = TextEditingController();
  final TextEditingController _pRatio_Controller = TextEditingController();
  final TextEditingController _sRatio_Controller = TextEditingController();
  final TextEditingController _noOfCore_Controller = TextEditingController();
  final TextEditingController _noOfTap_Controller = TextEditingController();
  final TextEditingController _yom_Controller = TextEditingController();
  final TextEditingController _WitnessedBy_Controller = TextEditingController();
  final TextEditingController _ratedVoltage = TextEditingController();
  final TextEditingController _DOTcontroller = TextEditingController();
  final TextEditingController _connectedTapController = TextEditingController();
  final TextEditingController _Location_Controller = TextEditingController();
  final TextEditingController _makE_Controller = TextEditingController();
  final TextEditingController _testedBy_Controller = TextEditingController();
  final TextEditingController _verifiedBy_Controller = TextEditingController();
  DateTime _dateOfTesting;
  int get selectedValueForTested => TestedByUser().getTestByUser();
  int get selectedValueForVerified => VerifiedByUser().getVerifiedByUser();
  String get selectedMake => make_drop_lits().get_Make();
  String get selectedValueLocation =>
      Location_dropDown().get_selectedValueLocation();
  int get selectedValueYOM => yom_drop().get_YOM();

  @override
  void dispose() {
    _IDcontroller.dispose();
    _trNo_Controller.dispose();
    _Panel_Controller.dispose();
    _Sn_Bph_controller.dispose();
    _Sn_Rph_controller.dispose();
    _Sn_Yph_controller.dispose();
    _pRatio_Controller.dispose();
    _sRatio_Controller.dispose();
    _noOfCore_Controller.dispose();
    _noOfTap_Controller.dispose();
    _yom_Controller.dispose();
    _WitnessedBy_Controller.dispose();
    _ratedVoltage.dispose();
    _DOTcontroller.dispose();
    _connectedTapController.dispose();
    _Location_Controller.dispose();
    _makE_Controller.dispose();
    _testedBy_Controller.dispose();
    _verifiedBy_Controller.dispose();
  }

  Future<void> getReport() async {}

  @override
  Widget build(BuildContext context) {
    final CTModel ntr = watchOnly((CTProvider x) => x.ctModel);
    getX((CTProvider x) => x.getCTByID(id));
    final CTModel _ctModel = watchOnly((CTProvider x) => x.ctModel);

    _IDcontroller.text = id.toString();
    _trNo_Controller.text = _ctModel.trNo.toString();
    _Panel_Controller.text = _ctModel.panel;
    _Sn_Bph_controller.text = _ctModel.serialNo_Bph;
    _Sn_Rph_controller.text = _ctModel.serialNo_Rph;
    _Sn_Yph_controller.text = _ctModel.serialNo_Yph;
    _pRatio_Controller.text = _ctModel.pRatio.toString();
    _sRatio_Controller.text = _ctModel.sRatio.toString();
    _noOfTap_Controller.text = _ctModel.noOfTaps.toString();
    _yom_Controller.text = _ctModel.yom.toString();
    _WitnessedBy_Controller.text = _ctModel.WitnessedBy;
    _ratedVoltage.text = _ctModel.ratedVoltage.toString();
    _DOTcontroller.text =
        DateFormat('dd/MM/yyyy').format(_ctModel.dateOfTesting).toString();
    _connectedTapController.text = _ctModel.connectedTap;
    _Location_Controller.text = _ctModel.location;
    _makE_Controller.text = _ctModel.make;
    _testedBy_Controller.text = _ctModel.testedBy;
    _verifiedBy_Controller.text = _ctModel.verifiedBy;
    _noOfCore_Controller.text = _ctModel.noOfCores.toString();

    var mob = Text('Edit CT Details', style: TextStyle(fontSize: 17));
    var desk = Text('Edit CT Details', style: TextStyle(fontSize: 20));

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

                  var success_code = 201;
                  var success_code1 = 200;
                  var failed_code = 'Server Connection Lost';
                  var url =
                      Uri.parse('${Env.URL_PREFIX}/ctEquip/${ntr.databaseID}/');

                  print("********");
                  print(url);
                  Map<String, String> headers = {
                    "Content-type": "application/json",
                    "Authorization": "Bearer $acc_token",
                  };

                  final Map payload = {
                    'trNo': ntr.databaseID.toString(),
                    'etype': 'CT',
                    'designation': 'CT',
                    'location': selectedValueLocation.toString(),
                    'make': selectedMake.toString(),
                    'panel': _Panel_Controller.text.toString(),
                    'serialNo_Rph': _Sn_Rph_controller.text.toString(),
                    'serialNo_Yph': _Sn_Yph_controller.text.toString(),
                    'serialNo_Bph': _Sn_Bph_controller.text.toString(),
                    'pRatio': _pRatio_Controller.text.toString(),
                    'sRatio': _sRatio_Controller.text.toString(),
                    'noOfCores': _noOfCore_Controller.text,
                    'noOfTaps': _noOfTap_Controller.text.toString(),
                    'yom': selectedValueYOM.toString(),
                    'testedBy': selectedValueForTested.toString(),
                    'verifiedBy': selectedValueForVerified.toString(),
                    'WitnessedBy': _WitnessedBy_Controller.text.toString(),
                    'ratedVoltage': _ratedVoltage.text.toString(),
                    'dateOfTesting': _dateOfTesting.toString(),
                    'connectedTap': _connectedTapController.toString(),
                  };
                  ///////////////////////////////Status-Code-Condition///////////////////

                  var response = await http.put(url,
                      body: jsonEncode(payload), headers: headers);

                  if (response.statusCode == success_code ||
                      response.statusCode == success_code1) {
                    print('Response status: ${response.statusCode}');
                    print('Response body: ${response.body}');
                    print('Stored successfully');

                    // add to local database
                    final CTModel CTtoLocal = CTModel(
                      trNo: int.parse(_trNo_Controller.text),
                      etype: 'CT',
                      designation: 'CT',
                      location: selectedValueLocation.toString(),
                      panel: _Panel_Controller.text,
                      make: selectedMake.toString(),
                      serialNo_Rph: _Sn_Rph_controller.text.toString(),
                      serialNo_Yph: _Sn_Yph_controller.text.toString(),
                      serialNo_Bph: _Sn_Bph_controller.text.toString(),
                      pRatio: int.parse(_pRatio_Controller.text),
                      sRatio: int.parse(_sRatio_Controller.text),
                      noOfCores: int.parse(_noOfCore_Controller.text),
                      noOfTaps: int.parse(_noOfTap_Controller.text),
                      yom: selectedValueYOM,
                      dateOfTesting: _dateOfTesting,
                      testedBy: selectedValueForTested.toString(),
                      verifiedBy: selectedValueForVerified.toString(),
                      WitnessedBy: _WitnessedBy_Controller.text,
                      databaseID: _ctModel.databaseID,
                      updateDate: DateTime.now(),
                      ratedVoltage: int.parse(_ratedVoltage.text),
                      connectedTap: _connectedTapController.toString(),
                    );
                    getX((CTProvider x) => x.updateCT(CTtoLocal, id));
                    watchOnly((CTProvider x) => {});
                    Navigator.popAndPushNamed(context, '/detail_CT',
                        arguments: {
                          'id': this.id,
                          'trDatabaseID': ntr.databaseID
                        });
                  } else {
                    failed_code;
                    print('Failed Response status: ${response.statusCode}');
                    print('Failed Response body: ${response.body}');
                    print('Unsuccessfully');
                  }
                  ///////////////////////////////Status-Code-Condition///////////////////
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
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'WitnessedBy', _WitnessedBy_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Panel', _Panel_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Sn_Bph', _Sn_Bph_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Sn_Yph', _Sn_Yph_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Sn_Rph', _Sn_Rph_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'pRatio', _pRatio_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'sRatio', _sRatio_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'ratedVoltage', _ratedVoltage),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: make_drop_lits(),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: yom_drop(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _noOfCore_Controller,
                        hintText: 'noOfCores',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (int.parse(_noOfCore_Controller.text) >= 6) {
                            return 'NoOfCores should be below 5 cores';
                          }
                        },
                      ),
                    ),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'noOfTaps', _noOfTap_Controller),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: vk_value_drop(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: connectedTapRadio(),
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
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'WitnessedBy', _WitnessedBy_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Panel', _Panel_Controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Sn_Bph', _Sn_Bph_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Sn_Yph', _Sn_Yph_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Sn_Rph', _Sn_Rph_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'pRatio', _pRatio_Controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'sRatio', _sRatio_Controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'ratedVoltage', _ratedVoltage),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: make_drop_lits(),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: yom_drop(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _noOfCore_Controller,
                        hintText: 'noOfCores',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (int.parse(_noOfCore_Controller.text) >= 6) {
                            return 'NoOfCores should be below 5 cores';
                          }
                        },
                      ),
                    ),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'noOfTaps', _noOfTap_Controller),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: vk_value_drop(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: connectedTapRadio(),
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
