// ignore_for_file: missing_return

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../data/models/equipment/IT/it_model.dart';
import '../../providers/it_provider/it_provider.dart';
import '../../widgets/custom_date_picker_form_field.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/a_location_enum_drop_list.dart';
import '../dropdown_All/a_make_drop_list.dart';
import '../dropdown_All/it_vector_group_8_type_dropdown.dart';
import '../dropdown_All/testedbyuser.dart';
import '../dropdown_All/verifiedbyuser.dart';
import '../dropdown_All/yom_drop_list.dart';

final _formKey = GlobalKey<FormState>();

class EditItPage extends StatelessWidget with GetItMixin {
  Map args = {};
  EditItPage(@required this.args, {Key key}) : super(key: key);
  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _trNo_Controller = TextEditingController();
  final TextEditingController _designation_Controller = TextEditingController();
  final TextEditingController _serialNo_Controller = TextEditingController();
  final TextEditingController _rating_Controller = TextEditingController();
  final TextEditingController _ratedVoltage_HV_Controller =
      TextEditingController();
  final TextEditingController _ratedVoltage_LV_Controller =
      TextEditingController();
  final TextEditingController _ratedCurrent_HV_Controller =
      TextEditingController();
  final TextEditingController _ratedCurrent_LV_Controller =
      TextEditingController();
  final TextEditingController _vectorGroup_Controller = TextEditingController();
  final TextEditingController _impedanceVoltageHvLv1_Controller =
      TextEditingController();
  final TextEditingController _impedanceVoltageHvLv2_Controller =
      TextEditingController();
  final TextEditingController _impedanceVoltageHvLv3_Controller =
      TextEditingController();
  final TextEditingController _impedanceVoltageHvLv4_Controller =
      TextEditingController();
  final TextEditingController _impedanceVoltageLvLv_Controller =
      TextEditingController();
  final TextEditingController _frequency_Controller = TextEditingController();
  final TextEditingController _typeOfCooling_Controller =
      TextEditingController();
  final TextEditingController _noOfPhases_Controller = TextEditingController();
  final TextEditingController _noOfTaps_Controller = TextEditingController();
  final TextEditingController _noOfNominalTaps_Controller =
      TextEditingController();
  final TextEditingController _oilTemp_Controller = TextEditingController();
  final TextEditingController _windingTemp_Controller = TextEditingController();
  final TextEditingController _ambientTemp_Controller = TextEditingController();
  final TextEditingController _WitnessedBy_Controller = TextEditingController();
  final TextEditingController _DOTcontroller = TextEditingController();
  DateTime _dateOfTesting;
  int get selectedValueForTested => TestedByUser().getTestByUser();
  int get selectedValueForVerified => VerifiedByUser().getVerifiedByUser();
  String get selectedMake => make_drop_lits().get_Make();
  String get selectedValueLocation =>
      Location_dropDown().get_selectedValueLocation();
  int get selectedValueYOM => yom_drop().get_YOM();
  String get selectedvectorGroup => ItvectorGroup().get_vector();

  @override
  void dispose() {
    _trNo_Controller.dispose();
    _designation_Controller.dispose();
    _serialNo_Controller.dispose();
    _rating_Controller.dispose();
    _ratedCurrent_HV_Controller.dispose();
    _ratedCurrent_LV_Controller.dispose();
    _ratedVoltage_HV_Controller.dispose();
    _ratedVoltage_LV_Controller.dispose();
    _vectorGroup_Controller.dispose();
    _impedanceVoltageHvLv1_Controller.dispose();
    _impedanceVoltageHvLv2_Controller.dispose();
    _impedanceVoltageHvLv3_Controller.dispose();
    _impedanceVoltageHvLv4_Controller.dispose();
    _impedanceVoltageLvLv_Controller.dispose();
    _frequency_Controller.dispose();
    _typeOfCooling_Controller.dispose();
    _noOfPhases_Controller.dispose();
    _noOfTaps_Controller.dispose();
    _noOfNominalTaps_Controller.dispose();
    _oilTemp_Controller.dispose();
    _windingTemp_Controller.dispose();
    _ambientTemp_Controller.dispose();
    _WitnessedBy_Controller.dispose();
    _DOTcontroller.dispose();
  }

  Future<void> getReport() async {}

  @override
  Widget build(BuildContext context) {
    final ItModel ntr = watchOnly((ItProvider x) => x.itModel);
    getX((ItProvider x) => x.getItByID(args['id']));
    final ItModel _itModel = watchOnly((ItProvider x) => x.itModel);

    _IDcontroller.text = args['id'].toString();
    _nOcontroller.text = _itModel.trNo.toString();
    _trNo_Controller.text = _itModel.trNo.toString();
    _designation_Controller.text = _itModel.designation;
    _serialNo_Controller.text = _itModel.serialNo;
    _rating_Controller.text = _itModel.rating;
    _ratedCurrent_HV_Controller.text = _itModel.ratedCurrent_HV.toString();
    _ratedCurrent_LV_Controller.text = _itModel.ratedCurrent_LV.toString();
    _ratedVoltage_HV_Controller.text = _itModel.ratedVoltage_HV.toString();
    _ratedVoltage_LV_Controller.text = _itModel.ratedVoltage_LV.toString();
    _vectorGroup_Controller.text = _itModel.vectorGroup;
    _impedanceVoltageHvLv1_Controller.text =
        _itModel.impedanceVoltage_HV_LV1.toString();
    _impedanceVoltageHvLv2_Controller.text =
        _itModel.impedanceVoltage_HV_LV2.toString();
    _impedanceVoltageHvLv3_Controller.text =
        _itModel.impedanceVoltage_HV_LV3.toString();
    _impedanceVoltageHvLv4_Controller.text =
        _itModel.impedanceVoltage_HV_LV4.toString();
    _impedanceVoltageLvLv_Controller.text =
        _itModel.impedanceVoltage_LV_LV.toString();
    _frequency_Controller.text = _itModel.frequency.toString();
    _typeOfCooling_Controller.text = _itModel.typeOfCooling;
    _noOfPhases_Controller.text = _itModel.noOfPhases.toString();
    _noOfTaps_Controller.text = _itModel.noOfTaps.toString();
    _noOfNominalTaps_Controller.text = _itModel.noOfNominalTaps.toString();
    _oilTemp_Controller.text = _itModel.oilTemp.toString();
    _windingTemp_Controller.text = _itModel.windingTemp.toString();
    _ambientTemp_Controller.text = _itModel.ambientTemp.toString();

    _DOTcontroller.text =
        DateFormat('dd/MM/yyyy').format(_itModel.dateOfTesting).toString();
    _dateOfTesting = _itModel.dateOfTesting;
    _windingTemp_Controller.text = _itModel.windingTemp.toString();
    _WitnessedBy_Controller.text = _itModel.WitnessedBy;

    var mob = const Text('Edit Inverter Transformer Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('Edit Inverter Transformer Details',
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
                      Uri.parse('${Env.URL_PREFIX}/itEquip/${ntr.databaseID}/');

                  print("********");
                  print(url);
                  Map<String, String> headers = {
                    "Content-type": "application/json",
                    "Authorization": "Bearer $acc_token",
                  };

                  final Map payload = {
                    'trNo': args['trDatabaseID'].toString(),
                    'etype': 'it',
                    'designation': _designation_Controller.text.toString(),
                    'location': selectedValueLocation.toString(),
                    'serialNo': _serialNo_Controller.text.toString(),
                    'rating': _rating_Controller.text.toString(),
                    'ratedVoltage_HV':
                        _ratedVoltage_HV_Controller.text.toString(),
                    'ratedVoltage_LV':
                        _ratedVoltage_LV_Controller.text.toString(),
                    'ratedCurrent_HV':
                        _ratedCurrent_HV_Controller.text.toString(),
                    'ratedCurrent_LV':
                        _ratedCurrent_LV_Controller.text.toString(),
                    'vectorGroup': selectedvectorGroup.toString(),
                    'impedanceVoltage_HV_LV1':
                        _impedanceVoltageHvLv1_Controller.text.toString(),
                    'impedanceVoltage_HV_LV2':
                        _impedanceVoltageHvLv2_Controller.text.toString(),
                    'impedanceVoltage_HV_LV3':
                        _impedanceVoltageHvLv3_Controller.text.toString(),
                    'impedanceVoltage_HV_LV4':
                        _impedanceVoltageHvLv4_Controller.text.toString(),
                    'impedanceVoltage_LV_LV':
                        _impedanceVoltageLvLv_Controller.text.toString(),
                    'frequency': _frequency_Controller.text.toString(),
                    'typeOfCooling': _typeOfCooling_Controller.text.toString(),
                    'noOfPhases': _noOfPhases_Controller.text.toString(),
                    'make': selectedMake.toString(),
                    'yom': selectedValueYOM.toString(),
                    'noOfTaps': _noOfTaps_Controller.text.toString(),
                    'onOfNominalTaps':
                        _noOfNominalTaps_Controller.text.toString(),
                    'oilTemp': _oilTemp_Controller.text.toString(),
                    'windingTemp': _windingTemp_Controller.text.toString(),
                    'ambientTemp': _ambientTemp_Controller.text.toString(),
                    'dateOfTesting': _dateOfTesting.toString(),
                    'testedBy': selectedValueForTested.toString(),
                    'verifiedBy': selectedValueForVerified.toString(),
                    'WitnessedBy': _WitnessedBy_Controller.text.toString(),
                    'updateDate': DateTime.now().toString(),
                  };
                  var response = await http.put(url,
                      body: jsonEncode(payload), headers: headers);

                  if (response.statusCode == success_code ||
                      response.statusCode == success_code1) {
                    print('Response status: ${response.statusCode}');
                    print('Response body: ${response.body}');
                    print('Stored successfully');

                    //add to local database
                    final ItModel itReportToLocal = ItModel(
                      trNo: int.parse(_trNo_Controller.text),
                      etype: 'it',
                      designation: _designation_Controller.text.toString(),
                      location: selectedValueLocation,
                      serialNo: _serialNo_Controller.text.toString(),
                      rating: _rating_Controller.text.toString(),
                      ratedVoltage_HV:
                          int.parse(_ratedVoltage_HV_Controller.text),
                      ratedVoltage_LV:
                          int.parse(_ratedVoltage_LV_Controller.text),
                      ratedCurrent_HV:
                          double.parse(_ratedCurrent_HV_Controller.text),
                      ratedCurrent_LV:
                          double.parse(_ratedCurrent_LV_Controller.text),
                      vectorGroup: selectedvectorGroup.toString(),
                      impedanceVoltage_HV_LV1: double.parse(
                          _impedanceVoltageHvLv1_Controller.text.toString()),
                      impedanceVoltage_HV_LV2: double.parse(
                          _impedanceVoltageHvLv2_Controller.text.toString()),
                      impedanceVoltage_HV_LV3: double.parse(
                          _impedanceVoltageHvLv3_Controller.text.toString()),
                      impedanceVoltage_HV_LV4: double.parse(
                          _impedanceVoltageHvLv4_Controller.text.toString()),
                      impedanceVoltage_LV_LV: double.parse(
                          _impedanceVoltageLvLv_Controller.text.toString()),
                      frequency:
                          int.parse(_frequency_Controller.text.toString()),
                      typeOfCooling: _typeOfCooling_Controller.text.toString(),
                      noOfPhases:
                          int.parse(_noOfPhases_Controller.text.toString()),
                      make: selectedMake,
                      yom: selectedValueYOM,
                      noOfTaps: int.parse(_noOfTaps_Controller.text.toString()),
                      noOfNominalTaps: int.parse(
                          _noOfNominalTaps_Controller.text.toString()),
                      oilTemp: int.parse(_oilTemp_Controller.text.toString()),
                      windingTemp:
                          int.parse(_windingTemp_Controller.text.toString()),
                      ambientTemp:
                          int.parse(_ambientTemp_Controller.text.toString()),
                      dateOfTesting: _dateOfTesting,
                      testedBy: selectedValueForTested.toString(),
                      verifiedBy: selectedValueForVerified.toString(),
                      WitnessedBy: _WitnessedBy_Controller.text.toString(),
                      databaseID: json.decode(response.body)['id'],
                      updateDate: DateTime.now(),
                    );
                    getX((ItProvider x) =>
                        x.updateIt(itReportToLocal, args['id']));
                    watchOnly((ItProvider x) => {});
                    Navigator.popAndPushNamed(context, '/detail_IT',
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
                        'WitnessedBy', _WitnessedBy_Controller),
                    //-----------------------------------------------

                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Designation', _designation_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'serial No', _serialNo_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Rating', _rating_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'ratedVoltage_HV', _ratedVoltage_HV_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'ratedVoltage_LV', _ratedVoltage_LV_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'ratedCurrent_HV', _ratedCurrent_HV_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'ratedCurrent_LV', _ratedCurrent_LV_Controller),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: ItvectorGroup(),
                    ),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'impedanceVoltage HV-LV1',
                        _impedanceVoltageHvLv1_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'impedanceVoltage HV-LV2',
                        _impedanceVoltageHvLv2_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'impedanceVoltage HV-LV3',
                        _impedanceVoltageHvLv3_Controller),

                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'impedanceVoltage HV-LV4',
                        _impedanceVoltageHvLv4_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'impedanceVoltage Lv1-LV2',
                        _impedanceVoltageLvLv_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Frequency', _frequency_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Type of Cooling', _typeOfCooling_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Number of Phases', _noOfPhases_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Number of Taps', _noOfTaps_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Number of Nominal Taps', _noOfNominalTaps_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Oil Tempresture', _oilTemp_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Winding Tempreture', _windingTemp_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Ambient Tempreture', _ambientTemp_Controller),
                    //-----------------------------------------------

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
                        'WitnessedBy', _WitnessedBy_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Designation', _designation_Controller),

                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'serial No', _serialNo_Controller),

                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Rating', _rating_Controller),

                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'ratedVoltage_HV', _ratedVoltage_HV_Controller),

                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'ratedVoltage_LV', _ratedVoltage_LV_Controller),

                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'ratedCurrent_HV', _ratedCurrent_HV_Controller),

                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'ratedCurrent_LV', _ratedCurrent_LV_Controller),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: ItvectorGroup(),
                    ),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'impedanceVoltage HV-LV1',
                        _impedanceVoltageHvLv1_Controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'impedanceVoltage HV-LV2',
                        _impedanceVoltageHvLv2_Controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'impedanceVoltage HV-LV3',
                        _impedanceVoltageHvLv3_Controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'impedanceVoltage HV-LV4',
                        _impedanceVoltageHvLv4_Controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'impedanceVoltage LV1-LV2',
                        _impedanceVoltageLvLv_Controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Frequency', _frequency_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Type of Cooling', _typeOfCooling_Controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Number of Phases', _noOfPhases_Controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Number of Taps', _noOfTaps_Controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'number Of NominalTaps', _noOfNominalTaps_Controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'oilTemp', _oilTemp_Controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'windingTemp', _windingTemp_Controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'ambientTemp', _ambientTemp_Controller),

                    //-----------------------------------------------

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
