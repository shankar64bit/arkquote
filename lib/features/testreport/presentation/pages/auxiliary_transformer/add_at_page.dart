// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/yom_drop_list.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/AT/AT_model.dart';
import '../../providers/at_provider/at_provider.dart';
import '../../widgets/custom_date_picker_form_field.dart';
import '../dropdown_All/MegaGigaTeraRadioButton/connectedtaps.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/a_location_enum_drop_list.dart';
import '../dropdown_All/a_make_drop_list.dart';
import '../dropdown_All/at_vector_group_8_type_dropdown.dart';
import '../dropdown_All/testedbyuser.dart';
import '../dropdown_All/verifiedbyuser.dart';

String etype_radio = 'at';
final _formKey = GlobalKey<FormState>();

class Add_AT_Details extends StatelessWidget with GetItMixin {
  Map args = {};
  DateTime _dateOfTesting;
  Add_AT_Details(this.args, {Key key}) : super(key: key);

  final String _etypEcontroller = etype_radio;
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

  setTrNo() {
    _trNo_Controller.text = args['trNo'].toString();
  }

  @override
  Widget build(BuildContext context) {
    setTrNo();
    var mob = Text('Add AT Details', style: TextStyle(fontSize: 17));
    var desk = Text('Add AT Details', style: TextStyle(fontSize: 20));
    var accToken = sl<GoogleSignInController>().ACCESS_TOKEN;
    var refToken = sl<GoogleSignInController>().REFRESH_TOKEN;
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

                  // add to local database
                  final ATModel ATtoLocal = ATModel(
                    trNo: int.parse(_trNo_Controller.text),
                    etype: _etypEcontroller,
                    designation: _etypEcontroller,
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
                    databaseID: 0,
                  );
                  getX((ATProvider x) => x.addAT(ATtoLocal, _dateOfTesting));
                  watchOnly((ATProvider x) => {});
                  Navigator.of(context).pop();
                  Navigator.popAndPushNamed(context, '/detail_report',
                      arguments: args['trId']);
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
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: Location_dropDown(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: vectorGroupForAT(),
                    ),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'serialNo', _serialNo_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'rating', _rating_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'ratedVoltage_HV', _ratedVoltage_HV_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'ratedVoltage_LV', _ratedVoltage_LV_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'ratedCurrent_HV', _ratedCurrent_HV_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'ratedCurrent_LV', _ratedCurrent_LV_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'impedanceVoltage', _impedanceVoltage_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'frequency', _frequency_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'typeOfCooling', _typeOfCooling_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'noOfPhases', _noOfPhases_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'noOfTaps', _noOfTaps_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'onOfNominalTaps', _onOfNominalTaps_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'yom', _yom_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
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
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: vectorGroupForAT(),
                    ),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'serialNo', _serialNo_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'rating', _rating_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'ratedVoltage_HV', _ratedVoltage_HV_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'ratedVoltage_LV', _ratedVoltage_LV_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'ratedCurrent_HV', _ratedCurrent_HV_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'ratedCurrent_LV', _ratedCurrent_LV_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'impedanceVoltage', _impedanceVoltage_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'frequency', _frequency_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'typeOfCooling', _typeOfCooling_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'noOfPhases', _noOfPhases_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'noOfTaps', _noOfTaps_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'onOfNominalTaps', _onOfNominalTaps_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'yom', _yom_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
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
