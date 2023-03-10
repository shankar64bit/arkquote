// ignore_for_file: missing_return

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/PT/pt_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/Auser_input_validation_exnt.dart/validation_extension_methods.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/pt_provider/pt_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../widgets/custom_date_picker_form_field.dart';
import '../../widgets/custom_text_form_field_For_number.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/a_location_enum_drop_list.dart';
import '../dropdown_All/a_make_drop_list.dart';
import '../dropdown_All/kv_v_dropdown_for_ct_nameplate.dart';
import '../dropdown_All/testedbyuser.dart';
import '../dropdown_All/verifiedbyuser.dart';
import '../dropdown_All/yom_drop_list.dart';

String etype_radio = 'pt';
final _formKey = GlobalKey<FormState>();

class EditPtPage extends StatelessWidget with GetItMixin {
  Map args = {};
  // Powt3WindingModel _powt3WinModel;
  EditPtPage(@required this.args, {Key key}) : super(key: key);
  final String _etypEcontroller = etype_radio;
  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _trNo_Controller = TextEditingController();
  final TextEditingController _designation_Controller = TextEditingController();
  final TextEditingController _Panel_Controller = TextEditingController();
  final TextEditingController _Sn_Rph_controller = TextEditingController();
  final TextEditingController _Sn_Yph_controller = TextEditingController();
  final TextEditingController _Sn_Bph_controller = TextEditingController();
  final TextEditingController _pRatio_Controller = TextEditingController();
  final TextEditingController _sRatio_Controller = TextEditingController();
  final TextEditingController _noOfCore_Controller = TextEditingController();
  // final TextEditingController _noOfTap_Controller = TextEditingController();
  final TextEditingController _yom_Controller = TextEditingController();
  final TextEditingController _WitnessedBy_Controller = TextEditingController();
  final TextEditingController _ratedVoltage_Controller =
      TextEditingController();
  final TextEditingController _DOTcontroller = TextEditingController();
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
    _designation_Controller.dispose();
    _Panel_Controller.dispose();
    _Sn_Bph_controller.dispose();
    _Sn_Rph_controller.dispose();
    _Sn_Yph_controller.dispose();
    _pRatio_Controller.dispose();
    _sRatio_Controller.dispose();
    _noOfCore_Controller.dispose();
    _yom_Controller.dispose();
    _ratedVoltage_Controller.dispose();
    _WitnessedBy_Controller.dispose();
    _DOTcontroller.dispose();
  }

  Future<void> getReport() async {}

  @override
  Widget build(BuildContext context) {
    final PTModel ntr = watchOnly((PTProvider x) => x.ptModel);
    getX((PTProvider x) => x.getPTByID(args['id']));
    final PTModel _ptModel = watchOnly((PTProvider x) => x.ptModel);

    _IDcontroller.text = args['id'].toString();
    _trNo_Controller.text = _ptModel.trNo.toString();
    _designation_Controller.text = _ptModel.designation;
    _Panel_Controller.text = _ptModel.panel;
    _Sn_Bph_controller.text = _ptModel.serialNo_Bph;
    _Sn_Rph_controller.text = _ptModel.serialNo_Rph.toString();
    _Sn_Yph_controller.text = _ptModel.serialNo_Yph.toString();

    _pRatio_Controller.text = _ptModel.pRatio.toString();
    _sRatio_Controller.text = _ptModel.sRatio.toString();
    _noOfCore_Controller.text = _ptModel.noOfCores.toString();
    _yom_Controller.text = _ptModel.yom.toString();
    _WitnessedBy_Controller.text = _ptModel.WitnessedBy.toString();
    _ratedVoltage_Controller.text = _ptModel.ratedVoltage.toString();
    _DOTcontroller.text =
        DateFormat('dd/MM/yyyy').format(_ptModel.dateOfTesting).toString();
    _designation_Controller.text = _ptModel.designation;
    _dateOfTesting = _ptModel.dateOfTesting;
    _WitnessedBy_Controller.text = _ptModel.WitnessedBy;

    var mob = const Text('Edit Potential Transformer Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('Edit Potential Transformer Details',
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
                  var url =
                      Uri.parse('${Env.URL_PREFIX}/ptEquip/${ntr.databaseID}/');

                  print("********");
                  print(url);
                  Map<String, String> headers = {
                    "Content-type": "application/json",
                    "Authorization": "Bearer $acc_token",
                  };

                  final Map payload = {
                    'trNo': args['trDatabaseID'].toString(),
                    'etype': _etypEcontroller,
                    'designation': _designation_Controller.text.toString(),
                    'location': selectedValueLocation.toString(),
                    'make': selectedMake.toString(),
                    'panel': _Panel_Controller.text.toString(),
                    'serialNo_Rph': _Sn_Rph_controller.text.toString(),
                    'serialNo_Yph': _Sn_Yph_controller.text.toString(),
                    'serialNo_Bph': _Sn_Bph_controller.text.toString(),
                    'pRatio': _pRatio_Controller.text.toString(),
                    'sRatio': _sRatio_Controller.text.toString(),
                    'noOfCores': _noOfCore_Controller.text,
                    // 'noOfTaps': _noOfTap_Controller.text.toString(),
                    'yom': selectedValueYOM.toString(),
                    'testedBy': selectedValueForTested.toString(),
                    'verifiedBy': selectedValueForVerified.toString(),
                    'WitnessedBy': _WitnessedBy_Controller.text.toString(),
                    'ratedVoltage': _ratedVoltage_Controller.text.toString(),
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
                    final PTModel ptReportToLocal = PTModel(
                      trNo: int.parse(_trNo_Controller.text),
                      etype: _etypEcontroller,
                      designation: _designation_Controller.text,
                      location: selectedValueLocation,
                      panel: _Panel_Controller.text,
                      make: selectedMake.toString(),
                      serialNo_Rph: _Sn_Rph_controller.text.toString(),
                      serialNo_Yph: _Sn_Yph_controller.text.toString(),
                      serialNo_Bph: _Sn_Bph_controller.text.toString(),
                      pRatio: int.parse(_pRatio_Controller.text),
                      sRatio: int.parse(_sRatio_Controller.text),
                      noOfCores: int.parse(_noOfCore_Controller.text),
                      yom: selectedValueYOM,
                      dateOfTesting: _dateOfTesting,
                      testedBy: selectedValueForTested.toString(),
                      verifiedBy: selectedValueForVerified.toString(),
                      WitnessedBy: _WitnessedBy_Controller.text,
                      ratedVoltage: int.parse(_ratedVoltage_Controller.text),
                      databaseID: json.decode(response.body)['id'],
                      updateDate: DateTime.now(),
                    );
                    getX((PTProvider x) =>
                        x.updatePT(ptReportToLocal, args['id']));
                    watchOnly((PTProvider x) => {});
                    Navigator.popAndPushNamed(context, '/detail_PT',
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
                    Text(_etypEcontroller),
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
                      padding:
                          const EdgeInsets.fromLTRB(150.0, 0.0, 150.0, 10.0),
                      child: Location_dropDown(),
                    ),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'WitnessedBy', _WitnessedBy_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Panel', _Panel_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Serial Number-Bph', _Sn_Bph_controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Serial Number-Rph', _Sn_Rph_controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Serial Number-Yph', _Sn_Yph_controller),
                    ptnameplate_kv(),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Ratio(Secondary)', _sRatio_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Rated Voltage', _ratedVoltage_Controller),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: make_drop_lits(),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: yom_drop(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _noOfCore_Controller,
                        hintText: 'No Of Cores',
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
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Serial Number-Bph', _Sn_Bph_controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Serial Number-Rph', _Sn_Rph_controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Serial Number-Yph', _Sn_Yph_controller),
                    ptnameplate_kv(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Ratio(Secondary)', _sRatio_Controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Rated Voltage', _ratedVoltage_Controller),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _noOfCore_Controller,
                        hintText: 'No Of Cores',
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
