// ignore_for_file: missing_return

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/powt_3_winding/powt3winding_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/powt_3_winding/powt_3_winding_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../widgets/custom_date_picker_form_field.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/a_location_enum_drop_list.dart';
import '../dropdown_All/a_make_drop_list.dart';
import '../dropdown_All/at_vector_group_2_type_dropdown.dart';
import '../dropdown_All/testedbyuser.dart';
import '../dropdown_All/verifiedbyuser.dart';
import '../dropdown_All/yom_drop_list.dart';

String etype_radio = 'powt3w';
final _formKey = GlobalKey<FormState>();

class EditPowt3WindingPage extends StatelessWidget with GetItMixin {
  Map args = {};
  // Powt3WindingModel _powt3WinModel;
  EditPowt3WindingPage(@required this.args, {Key key}) : super(key: key);
  final String _etypEcontroller = etype_radio;
  final TextEditingController _trNo_Controller = TextEditingController();
  final TextEditingController _IDcontroller = TextEditingController();
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
  final TextEditingController _impedanceVoltageLTap_Controller =
      TextEditingController();
  final TextEditingController _impedanceVoltageRTap_Controller =
      TextEditingController();
  final TextEditingController _impedanceVoltageHTap_Controller =
      TextEditingController();
  final TextEditingController _frequency_Controller = TextEditingController();
  final TextEditingController _ratedVoltage_TS_Controller =
      TextEditingController();

  final TextEditingController _ratedCurrent_TS_Controller =
      TextEditingController();

  final TextEditingController _typeOfCooling_Controller =
      TextEditingController();
  final TextEditingController _noOfPhases_Controller = TextEditingController();
  final TextEditingController _noOfTaps_Controller = TextEditingController();
  final TextEditingController _onOfNominalTaps_Controller =
      TextEditingController();
  final TextEditingController _oilTemp_Controller = TextEditingController();
  final TextEditingController _windingTemp_Controller = TextEditingController();
  final TextEditingController _ambientTemp_Controller = TextEditingController();

  final TextEditingController _updateDate_Controller = TextEditingController();
  final TextEditingController _WitnessedBy_Controller = TextEditingController();
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
    _rating_Controller.dispose();
    _serialNo_Controller.dispose();
    _ratedCurrent_HV_Controller.dispose();
    _ratedCurrent_LV_Controller.dispose();
    _ratedCurrent_TS_Controller.dispose();
    _ratedVoltage_HV_Controller.dispose();
    _ratedVoltage_LV_Controller.dispose();
    _ratedVoltage_TS_Controller.dispose();
    _DOTcontroller.dispose();
    _impedanceVoltageHTap_Controller.dispose();
    _impedanceVoltageLTap_Controller.dispose();
    _impedanceVoltageRTap_Controller.dispose();
    _frequency_Controller.dispose();
    _typeOfCooling_Controller.dispose();
    _noOfPhases_Controller.dispose();
    _noOfTaps_Controller.dispose();
    _onOfNominalTaps_Controller.dispose();
    _oilTemp_Controller.dispose();
    _windingTemp_Controller.dispose();
    _ambientTemp_Controller.dispose();
    _WitnessedBy_Controller.dispose();
  }

  Future<void> getReport() async {}

  @override
  Widget build(BuildContext context) {
    final Powt3WindingModel ntr =
        watchOnly((Powt3WindingProvider x) => x.powt3WindingModel);
    getX((Powt3WindingProvider x) => x.getPowt3WindingByID(args['id']));
    final Powt3WindingModel _powt3WindingModel =
        watchOnly((Powt3WindingProvider x) => x.powt3WindingModel);

    _IDcontroller.text = args['id'].toString();
    _trNo_Controller.text = _powt3WindingModel.trNo.toString();
    _rating_Controller.text = _powt3WindingModel.rating;
    _serialNo_Controller.text = _powt3WindingModel.serialNo;
    _designation_Controller.text = _powt3WindingModel.designation;
    _ratedCurrent_HV_Controller.text = _powt3WindingModel.ratedCurrent_HV;
    _ratedCurrent_LV_Controller.text = _powt3WindingModel.ratedCurrent_LV;
    _ratedCurrent_TS_Controller.text = _powt3WindingModel.ratedCurrent_TS;
    _ratedVoltage_HV_Controller.text =
        _powt3WindingModel.ratedVoltage_HV.toString();
    _ratedVoltage_LV_Controller.text =
        _powt3WindingModel.ratedVoltage_LV.toString();
    _ratedVoltage_TS_Controller.text =
        _powt3WindingModel.ratedVoltage_TS.toString();

    _impedanceVoltageLTap_Controller.text =
        _powt3WindingModel.impedanceVoltageLTap.toString();
    _impedanceVoltageHTap_Controller.text =
        _powt3WindingModel.impedanceVoltageHTap.toString();
    _impedanceVoltageRTap_Controller.text =
        _powt3WindingModel.impedanceVoltageRTap.toString();
    _frequency_Controller.text = _powt3WindingModel.frequency.toString();
    _typeOfCooling_Controller.text =
        _powt3WindingModel.typeOfCooling.toString();
    _noOfPhases_Controller.text = _powt3WindingModel.noOfPhases.toString();
    _noOfTaps_Controller.text = _powt3WindingModel.noOfTaps.toString();
    _onOfNominalTaps_Controller.text =
        _powt3WindingModel.onOfNominalTaps.toString();
    _oilTemp_Controller.text = _powt3WindingModel.oilTemp.toString();
    _windingTemp_Controller.text = _powt3WindingModel.windingTemp.toString();
    _ambientTemp_Controller.text = _powt3WindingModel.ambientTemp.toString();
    _DOTcontroller.text = DateFormat('dd/MM/yyyy')
        .format(_powt3WindingModel.dateOfTesting)
        .toString();
    _designation_Controller.text = _powt3WindingModel.designation;
    _dateOfTesting = _powt3WindingModel.dateOfTesting;
    _WitnessedBy_Controller.text = _powt3WindingModel.WitnessedBy;

    var mob = const Text('Edit power Transformer 3 winding Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('Edit power Transformer 3 winding Details',
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
                      '${Env.URL_PREFIX}/powt3wEquip/${ntr.databaseID}/');

                  print("********");
                  print(url);
                  Map<String, String> headers = {
                    "Content-type": "application/json",
                    "Authorization": "Bearer $acc_token",
                  };

                  final Map payload = {
                    'trNo': args['trDatabaseID'].toString(),
                    'etype': _etypEcontroller,
                    'designation': _etypEcontroller,
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
                    'ratedVoltage_TS':
                        _ratedVoltage_TS_Controller.text.toString(),
                    'ratedCurrent_TS':
                        _ratedCurrent_TS_Controller.text.toString(),
                    'vectorGroup': selectedvectorGroup2typePOWT3WIN.toString(),
                    'impedanceVoltageLTap':
                        _impedanceVoltageLTap_Controller.text.toString(),
                    'impedanceVoltageRTap':
                        _impedanceVoltageRTap_Controller.text.toString(),
                    'impedanceVoltageHTap':
                        _impedanceVoltageHTap_Controller.text.toString(),
                    'frequency': _frequency_Controller.text.toString(),
                    'typeOfCooling': _typeOfCooling_Controller.text.toString(),
                    'noOfPhases': _noOfPhases_Controller.text.toString(),
                    'make': selectedMake.toString(),
                    'yom': selectedValueYOM.toString(),
                    'noOfTaps': _noOfTaps_Controller.text.toString(),
                    'onOfNominalTaps':
                        _onOfNominalTaps_Controller.text.toString(),
                    'oilTemp': _oilTemp_Controller.text.toString(),
                    'windingTemp': _windingTemp_Controller.text.toString(),
                    'ambientTemp': _ambientTemp_Controller.text.toString(),
                    'dateOfTesting': _dateOfTesting.toString(),
                    'testedBy': selectedValueForTested.toString(),
                    'verifiedBy': selectedValueForVerified.toString(),
                    'WitnessedBy': _WitnessedBy_Controller.text.toString(),
                  };
                  var response = await http.put(url,
                      body: jsonEncode(payload), headers: headers);

                  if (response.statusCode == success_code ||
                      response.statusCode == success_code1) {
                    print('Response status: ${response.statusCode}');
                    print('Response body: ${response.body}');
                    print('Stored successfully');

                    //add to local database
                    final Powt3WindingModel powt3wReportToLocal =
                        Powt3WindingModel(
                      trNo: int.parse(_trNo_Controller.text),
                      etype: _etypEcontroller,
                      designation: _etypEcontroller,
                      location: selectedValueLocation,
                      serialNo: _serialNo_Controller.text.toString(),
                      rating: _rating_Controller.text.toString(),
                      ratedVoltage_HV: int.parse(
                          _ratedVoltage_HV_Controller.text.toString()),
                      ratedVoltage_LV: int.parse(
                          _ratedVoltage_LV_Controller.text.toString()),
                      ratedVoltage_TS: int.parse(
                          _ratedVoltage_TS_Controller.text.toString()),
                      ratedCurrent_TS:
                          _ratedCurrent_TS_Controller.text.toString(),
                      ratedCurrent_HV:
                          _ratedCurrent_HV_Controller.text.toString(),
                      ratedCurrent_LV:
                          _ratedCurrent_LV_Controller.text.toString(),
                      vectorGroup: selectedvectorGroup2typePOWT3WIN.toString(),
                      impedanceVoltageLTap: double.parse(
                          _impedanceVoltageLTap_Controller.text.toString()),
                      impedanceVoltageRTap: double.parse(
                          _impedanceVoltageRTap_Controller.text.toString()),
                      impedanceVoltageHTap: double.parse(
                          _impedanceVoltageHTap_Controller.text.toString()),
                      frequency:
                          int.parse(_frequency_Controller.text.toString()),
                      typeOfCooling: _typeOfCooling_Controller.text.toString(),
                      noOfPhases:
                          int.parse(_noOfPhases_Controller.text.toString()),
                      make: selectedMake,
                      yom: selectedValueYOM,
                      noOfTaps: int.parse(_noOfTaps_Controller.text.toString()),
                      onOfNominalTaps: int.parse(
                          _onOfNominalTaps_Controller.text.toString()),
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
                    getX((Powt3WindingProvider x) =>
                        x.updatePowt3Winding(powt3wReportToLocal, args['id']));
                    watchOnly((Powt3WindingProvider x) => {});
                    Navigator.popAndPushNamed(context, '/detail_POWT3WIN',
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
                      padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: Location_dropDown(),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: vectorGroup2typePOWT3W(),
                    ),
                    //-----------------------------------------------

                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Witnessed By-', _WitnessedBy_Controller),

                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'serialNo', _serialNo_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Rating', _rating_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Rated Voltage- HV Side', _ratedVoltage_HV_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Rated Voltage- LV Side', _ratedVoltage_LV_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'rated Voltage_TS / rated Voltage_IV Side',
                        _ratedVoltage_TS_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Rated Current- HV Side', _ratedCurrent_HV_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Rated Current- LV Side', _ratedCurrent_LV_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'rated Current_TS / rated Current_IV Side',
                        _ratedCurrent_TS_Controller),

                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Impedance Voltage H-Tap',
                        _impedanceVoltageHTap_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Impedance Voltage L-Tap',
                        _impedanceVoltageLTap_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Impedance Voltage Rated Tap',
                        _impedanceVoltageRTap_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Frequency', _frequency_Controller),

                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Type of Cooling', _typeOfCooling_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Number of Phases', _noOfPhases_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Number of Taps', _noOfTaps_Controller),

                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Number of Nominal Taps', _onOfNominalTaps_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Oil Temperature', _oilTemp_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Winding Temperature', _windingTemp_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Ambient Temperature', _ambientTemp_Controller),

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
                      'ID',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: TextFormField(
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Location_dropDown(),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: vectorGroup2typePOWT3W(),
                  ),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Witnessed By-', _WitnessedBy_Controller),

                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'serialNo', _serialNo_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Rating', _rating_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Rated Voltage- HV Side', _ratedVoltage_HV_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Rated Voltage- LV Side', _ratedVoltage_LV_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'rated Voltage_TS / rated Voltage_IV Side',
                      _ratedVoltage_TS_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Rated Current- HV Side', _ratedCurrent_HV_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Rated Current- LV Side', _ratedCurrent_LV_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'rated Current_TS / rated Current_IV Side',
                      _ratedCurrent_TS_Controller),

                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Impedance Voltage H-Tap',
                      _impedanceVoltageHTap_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Impedance Voltage L-Tap',
                      _impedanceVoltageLTap_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Impedance Voltage Rated Tap',
                      _impedanceVoltageRTap_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Frequency', _frequency_Controller),

                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Type of Cooling', _typeOfCooling_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Number of Phases', _noOfPhases_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Number of Taps', _noOfTaps_Controller),

                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Number of Nominal Taps', _onOfNominalTaps_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Oil Temperature', _oilTemp_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Winding Temperature', _windingTemp_Controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Ambient Temperature', _ambientTemp_Controller),

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
                ],
              ),
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
