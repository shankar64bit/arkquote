// ignore_for_file: missing_return, missing_required_param, prefer_const_constructors
import 'dart:convert';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/Auser_input_validation_exnt.dart/validation_extension_methods.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/testedbyuser.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/verifiedbyuser.dart';
import 'package:flutter_testreports/features/testreport/presentation/widgets/custom_date_picker_form_field.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import '../../../../../env.sample.dart';
import '../../../data/models/equipment/AT/AT_model.dart';
import '../../providers/at_provider/at_provider.dart';
import '../../widgets/custom_text_form_field.dart';
import '../dropdown_All/MegaGigaTeraRadioButton/connectedtaps.dart';
import '../dropdown_All/a_location_enum_drop_list.dart';
import '../dropdown_All/a_make_drop_list.dart';
import '../dropdown_All/at_vector_group_8_type_dropdown.dart';
import '../dropdown_All/yom_drop_list.dart';

// the formkey used to validate the forms with key

final _formKey = GlobalKey<FormState>();
String getEtype;

class EditATPage extends StatelessWidget with GetItMixin {
  final int id;
  ATModel _atModel;
  Map args = {};

  EditATPage({@required this.id, Key key}) : super(key: key);

  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _DOTcontroller = TextEditingController();
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
  final TextEditingController _impedanceVoltage_Controller =
      TextEditingController();
  final TextEditingController _frequency_Controller = TextEditingController();
  final TextEditingController _typeOfCooling_Controller =
      TextEditingController();
  final TextEditingController _noOfPhases_Controller = TextEditingController();
  final TextEditingController _noOfTaps_Controller = TextEditingController();
  final TextEditingController _onOfNominalTaps_Controller =
      TextEditingController();
  final TextEditingController _yom_Controller = TextEditingController();
  final TextEditingController _dateOfTesting_Controller =
      TextEditingController();
  final TextEditingController _updateDate_Controller = TextEditingController();
  final TextEditingController _WitnessedBy_Controller = TextEditingController();

  int get selectedValueForTested => TestedByUser().getTestByUser();
  int get selectedValueForVerified => VerifiedByUser().getVerifiedByUser();
  String get selectedMake => make_drop_lits().get_Make();
  String get selectedvectorGroup => vectorGroupForAT().get_vector();

  String get selectedValueLocation =>
      Location_dropDown().get_selectedValueLocation();
  int get selectedValueYOM => yom_drop().get_YOM();
  CONNTap get selectedConnectedtaps =>
      connectedTapRadio().get_connectedTapRadio();
  DateTime _dateOfTesting;

  @override
  void dispose() {
    _IDcontroller.dispose();
    _DOTcontroller.dispose();
    _trNo_Controller.dispose();
    _designation_Controller.dispose();
    _serialNo_Controller.dispose();
    _rating_Controller.dispose();
    _ratedVoltage_HV_Controller.dispose();
    _ratedVoltage_LV_Controller.dispose();
    _ratedCurrent_HV_Controller.dispose();
    _ratedCurrent_LV_Controller.dispose();
    _vectorGroup_Controller.dispose();
    _impedanceVoltage_Controller.dispose();
    _frequency_Controller.dispose();
    _typeOfCooling_Controller.dispose();
    _noOfPhases_Controller.dispose();
    _noOfTaps_Controller.dispose();
    _onOfNominalTaps_Controller.dispose();
    _yom_Controller.dispose();
    _dateOfTesting_Controller.dispose();
    _updateDate_Controller.dispose();
    _WitnessedBy_Controller.dispose();
  }

  // setTrNo() {
  //   _trnOcontroller.text = widget.TrNo.toString();
  // }

  Future<void> getReport() async {}

  @override
  Widget build(BuildContext context) {
    final ATModel ntr = watchOnly((ATProvider x) => x.atModel);
    getX((ATProvider x) => x.getATByID(id));
    final ATModel _atModel = watchOnly((ATProvider x) => x.atModel);

    getEtype = _atModel.etype;
    _IDcontroller.text = _atModel.id.toString();
    _DOTcontroller.text =
        DateFormat('dd/MM/yyyy').format(_atModel.dateOfTesting).toString();
    _trNo_Controller.text = _atModel.trNo.toString();
    _designation_Controller.text = _atModel.designation.toString();
    _serialNo_Controller.text = _atModel.serialNo.toString();
    _rating_Controller.text = _atModel.rating.toString();
    _ratedVoltage_HV_Controller.text = _atModel.ratedVoltage_HV.toString();

    _ratedVoltage_LV_Controller.text = _atModel.ratedVoltage_LV.toString();

    _ratedCurrent_HV_Controller.text = _atModel.ratedCurrent_HV.toString();

    _ratedCurrent_LV_Controller.text = _atModel.ratedCurrent_LV.toString();

    _vectorGroup_Controller.text = _atModel.vectorGroup.toString();
    _impedanceVoltage_Controller.text = _atModel.impedanceVoltage.toString();

    _frequency_Controller.text = _atModel.frequency.toString();
    _typeOfCooling_Controller.text = _atModel.typeOfCooling.toString();

    _noOfPhases_Controller.text = _atModel.noOfPhases.toString();
    _noOfTaps_Controller.text = _atModel.noOfTaps.toString();
    _onOfNominalTaps_Controller.text = _atModel.onOfNominalTaps.toString();

    _yom_Controller.text = _atModel.yom.toString();
    _DOTcontroller.text =
        DateFormat('dd/MM/yyyy').format(_atModel.dateOfTesting).toString();
    _dateOfTesting = _atModel.dateOfTesting;

    _updateDate_Controller.text =
        DateFormat('dd/MM/yyyy').format(_atModel.updateDate).toString();
    _WitnessedBy_Controller.text = _atModel.WitnessedBy.toString();

    var mob = const Text('Edit AT Details', style: TextStyle(fontSize: 15));
    var desk = const Text('Edit AT Details', style: TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 400) {
            if (ntr.etype == 'at') {
              return ntr.etype == 'at' ? desk : mob;
            }
          } else {
            if (ntr.etype == 'at') {
              return ntr.etype == 'at' ? mob : desk;
            }
          }
        }),
        actions: [
          IconButton(
            onPressed: () async {
              if (!_formKey.currentState.validate()) {
                print('Incomplete Validation');
              } else if (_formKey.currentState.validate()) {
                print('Form Validation Success [No error validation found-OK]');
                //add to remote database
                var success_code = 201;
                var success_code1 = 200;
                var failed_code = 'Server Connection Lost';
                //add to remote database
                var url =
                    Uri.parse('${Env.URL_PREFIX}/atEquip/${ntr.databaseID}/');

                print("********");
                print(url);
                Map<String, String> headers = {
                  "Content-type": "application/json",
                  "Authorization": "Bearer $acc_token",
                };
                final Map payload = {
                  'trNo': ntr.databaseID.toString(),
                  'etype': getEtype,
                  'designation': getEtype,
                  'location': selectedValueLocation.toString(),
                  'make': selectedMake.toString(),
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
                  'impedanceVoltage':
                      _impedanceVoltage_Controller.text.toString(),
                  'frequency': _frequency_Controller.text.toString(),
                  'typeOfCooling': _typeOfCooling_Controller.text.toString(),
                  'noOfPhases': _noOfPhases_Controller.text.toString(),
                  'noOfTaps': _noOfTaps_Controller.text.toString(),
                  'onOfNominalTaps':
                      _onOfNominalTaps_Controller.text.toString(),
                  'yom': _yom_Controller.text.toString(),
                  'dateOfTesting': _dateOfTesting.toString(),
                  'testedBy': selectedValueForTested.toString(),
                  'verifiedBy': selectedValueForVerified.toString(),
                  'WitnessedBy': _WitnessedBy_Controller.text.toString(),
                  // 'updateDate': _updateDate_Controller.text.toString(),
                };
                var response = await http.put(url,
                    body: jsonEncode(payload), headers: headers);

                if (response.statusCode == success_code ||
                    response.statusCode == success_code1) {
                  print('Response status: ${response.statusCode}');
                  print('Response body: ${response.body}');
                  print('Stored successfully');

                  //add to local database

                  final ATModel atReportToLocal = ATModel(
                    etype: getEtype,
                    trNo: int.parse(_trNo_Controller.text),
                    designation: getEtype,
                    location: selectedValueLocation.toString(),
                    make: selectedMake.toString(),
                    serialNo: _serialNo_Controller.text.toString(),
                    rating: int.parse(_rating_Controller.text),
                    ratedVoltage_HV:
                        int.parse(_ratedVoltage_HV_Controller.text),
                    ratedVoltage_LV:
                        int.parse(_ratedVoltage_LV_Controller.text),
                    ratedCurrent_HV:
                        double.parse(_ratedCurrent_HV_Controller.text),
                    ratedCurrent_LV:
                        double.parse(_ratedCurrent_LV_Controller.text),
                    vectorGroup: selectedvectorGroup.toString(),
                    impedanceVoltage:
                        double.parse(_impedanceVoltage_Controller.text),
                    frequency: int.parse(_ratedVoltage_HV_Controller.text),
                    typeOfCooling: _typeOfCooling_Controller.text.toString(),
                    noOfPhases: int.parse(_ratedVoltage_HV_Controller.text),
                    noOfTaps: int.parse(_ratedVoltage_HV_Controller.text),
                    onOfNominalTaps:
                        int.parse(_onOfNominalTaps_Controller.text),
                    yom: int.parse(_yom_Controller.text),
                    dateOfTesting: _dateOfTesting,
                    testedBy: selectedValueForTested.toString(),
                    verifiedBy: selectedValueForVerified.toString(),
                    WitnessedBy: _WitnessedBy_Controller.text.toString(),
                    databaseID: ntr.databaseID,
                    updateDate: DateTime.now(),
                  );
                  print("**************");
                  print(atReportToLocal);
                  getX((ATProvider x) => x.updateAT(atReportToLocal, id));
                  watchOnly((ATProvider x) => {});
                  Navigator.popAndPushNamed(context, '/detail_AT', arguments: {
                    'id': this.id,
                    'trDatabaseID': ntr.databaseID
                  });
                } else {
                  failed_code;
                  print('Failed Response status: ${response.statusCode}');
                  print('Failed Response body: ${response.body}');
                  print('Unsuccessfully');
                }
              }
            },
            icon: const Icon(Icons.save),
          )
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
      child: LayoutBuilder(
        builder: (context, constraints) {
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
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          'serial No',
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
                          controller: _serialNo_Controller,
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
                        child: vectorGroupForAT(),
                      ),
                      simplifiedFor_edit_AT_PC('rating', _rating_Controller),
                      simplifiedFor_edit_AT_PC(
                          'ratedVoltage_HV', _ratedVoltage_HV_Controller),
                      simplifiedFor_edit_AT_PC(
                          'ratedVoltage_LV', _ratedVoltage_LV_Controller),
                      simplifiedFor_edit_AT_PC(
                          'ratedCurrent_HV', _ratedCurrent_HV_Controller),
                      simplifiedFor_edit_AT_PC(
                          'ratedCurrent_LV', _ratedCurrent_LV_Controller),
                      simplifiedFor_edit_AT_PC(
                          'impedanceVoltage', _impedanceVoltage_Controller),
                      simplifiedFor_edit_AT_PC(
                          'frequency', _frequency_Controller),
                      simplifiedFor_edit_AT_PC(
                          'typeOfCooling', _typeOfCooling_Controller),
                      simplifiedFor_edit_AT_PC(
                          'noOfPhases', _noOfPhases_Controller),
                      simplifiedFor_edit_AT_PC(
                          'noOfTaps', _noOfTaps_Controller),
                      simplifiedFor_edit_AT_PC(
                          'onOfNominalTaps', _onOfNominalTaps_Controller),
                      simplifiedFor_edit_AT_PC('yom', _yom_Controller),
                      simplifiedFor_edit_AT_PC(
                          'WitnessedBy', _WitnessedBy_Controller),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: make_drop_lits(),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: yom_drop(),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                          child: CustomDatePickerFormField(
                              _DOTcontroller, 'Date of Testing', (() {
                            pickDateOfTest(context, 0);
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
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        'serial No',
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
                        controller: _serialNo_Controller,
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
                      child: Location_dropDown(),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: vectorGroupForAT(),
                    ),
                    simplifiedFor_edit_AT('rating', _rating_Controller),
                    simplifiedFor_edit_AT(
                        'ratedVoltage_HV', _ratedVoltage_HV_Controller),
                    simplifiedFor_edit_AT(
                        'ratedVoltage_LV', _ratedVoltage_LV_Controller),
                    simplifiedFor_edit_AT(
                        'ratedCurrent_HV', _ratedCurrent_HV_Controller),
                    simplifiedFor_edit_AT(
                        'ratedCurrent_LV', _ratedCurrent_LV_Controller),
                    simplifiedFor_edit_AT(
                        'impedanceVoltage', _impedanceVoltage_Controller),
                    simplifiedFor_edit_AT('frequency', _frequency_Controller),
                    simplifiedFor_edit_AT(
                        'typeOfCooling', _typeOfCooling_Controller),
                    simplifiedFor_edit_AT('noOfPhases', _noOfPhases_Controller),
                    simplifiedFor_edit_AT('noOfTaps', _noOfTaps_Controller),
                    simplifiedFor_edit_AT(
                        'onOfNominalTaps', _onOfNominalTaps_Controller),
                    simplifiedFor_edit_AT('yom', _yom_Controller),
                    simplifiedFor_edit_AT(
                        'WitnessedBy', _WitnessedBy_Controller),
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
                          pickDateOfTest(context, 0);
                        }))),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  simplifiedFor_edit_AT(var hinttxt, TextEditingController tc) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: CustomTextFormField(
        controller: tc,
        hintText: hinttxt,
        validator: (val) {
          if (!val.IsValueEmpty) {
            return 'Field should not be empty';
          }
        },
      ),
    );
  }

  simplifiedFor_edit_AT_PC(var hinttxt, TextEditingController tc) {
    return Padding(
      padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
      child: CustomTextFormField(
        controller: tc,
        hintText: hinttxt,
        validator: (val) {
          if (!val.IsValueEmpty) {
            return 'Field should not be empty';
          }
        },
      ),
    );
  }

  Future<void> pickDateOfTest(BuildContext context, int dtTest) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: _dateOfTesting ?? initialDate,
        firstDate: DateTime(DateTime.now().year - 100),
        lastDate: DateTime(DateTime.now().year + 3),
        builder: (context, child) => Theme(
              data: ThemeData().copyWith(
                colorScheme: const ColorScheme.light(
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
    if (dtTest == 1) {
      _dateOfTesting = newDate;
      _DOTcontroller.text = dot;
    } else if (dtTest == 0) {
      _dateOfTesting = newDate;
      _DOTcontroller.text = dot;
    }
  }
}
