// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/yom_drop_list.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/powt/powt_model.dart';
import '../../providers/powt_provider/powt_provider.dart';
import '../../widgets/custom_date_picker_form_field.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/a_location_enum_drop_list.dart';
import '../dropdown_All/a_make_drop_list.dart';
import '../dropdown_All/at_vector_group_6_type_dropdown.dart';
import '../dropdown_All/testedbyuser.dart';
import '../dropdown_All/verifiedbyuser.dart';

String etype_radio = 'powt';
final _formKey = GlobalKey<FormState>();

class Add_Powt_Details extends StatelessWidget with GetItMixin {
  Map args = {};
  DateTime _dateOfTesting;
  Add_Powt_Details(this.args, {Key key}) : super(key: key);

  final String _etypEcontroller = etype_radio;
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
  final TextEditingController _impedanceVoltageLTap_Controller =
      TextEditingController();
  final TextEditingController _impedanceVoltageRTap_Controller =
      TextEditingController();
  final TextEditingController _impedanceVoltageHTap_Controller =
      TextEditingController();
  final TextEditingController _frequency_Controller = TextEditingController();
  final TextEditingController _typeOfCooling_Controller =
      TextEditingController();
  final TextEditingController _noOfPhases_Controller = TextEditingController();
  final TextEditingController _noOfTaps_Controller = TextEditingController();
  final TextEditingController _onOfNominalTaps_Controller =
      TextEditingController();
  final TextEditingController _oilTemp_Controller = TextEditingController();
  final TextEditingController _windingTemp_Controller = TextEditingController();
  final TextEditingController _ambientTemp_Controller = TextEditingController();
  final TextEditingController _dateOfTesting_Controller =
      TextEditingController();
  final TextEditingController _updateDate_Controller = TextEditingController();
  final TextEditingController _WitnessedBy_Controller = TextEditingController();
  final TextEditingController _DOTcontroller = TextEditingController();

  int get selectedValueForTested => TestedByUser().getTestByUser();
  String get selectedVectorGroup => vectorGroup6typePOWT().get_vector();
  int get selectedValueForVerified => VerifiedByUser().getVerifiedByUser();
  String get selectedMake => make_drop_lits().get_Make();
  String get selectedValueLocation =>
      Location_dropDown().get_selectedValueLocation();
  int get selectedValueYOM => yom_drop().get_YOM();

  setTrNo() {
    _trNo_Controller.text = args['trNo'].toString();
  }

  @override
  Widget build(BuildContext context) {
    setTrNo();
    var mob = Text('Add Powt Details', style: TextStyle(fontSize: 17));
    var desk = Text('Add Powt Details', style: TextStyle(fontSize: 20));
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
                  final PowtModel PowttoLocal = PowtModel(
                    trNo: int.parse(_trNo_Controller.text),
                    etype: _etypEcontroller,
                    designation: _etypEcontroller,
                    location: selectedValueLocation,
                    serialNo: _serialNo_Controller.text.toString(),
                    rating: _rating_Controller.text.toString(),
                    ratedVoltage_HV:
                        int.parse(_ratedVoltage_HV_Controller.text.toString()),
                    ratedVoltage_LV:
                        int.parse(_ratedVoltage_LV_Controller.text.toString()),
                    ratedCurrent_HV:
                        _ratedCurrent_HV_Controller.text.toString(),
                    ratedCurrent_LV:
                        _ratedCurrent_LV_Controller.text.toString(),
                    vectorGroup: selectedvectorGroup6type.toString(),
                    impedanceVoltageLTap: double.parse(
                        _impedanceVoltageLTap_Controller.text.toString()),
                    impedanceVoltageRTap: double.parse(
                        _impedanceVoltageRTap_Controller.text.toString()),
                    impedanceVoltageHTap: double.parse(
                        _impedanceVoltageHTap_Controller.text.toString()),
                    frequency: int.parse(_frequency_Controller.text.toString()),
                    typeOfCooling: _typeOfCooling_Controller.text.toString(),
                    noOfPhases:
                        int.parse(_noOfPhases_Controller.text.toString()),
                    make: selectedMake,
                    yom: selectedValueYOM,
                    noOfTaps: int.parse(_noOfTaps_Controller.text.toString()),
                    onOfNominalTaps:
                        int.parse(_onOfNominalTaps_Controller.text.toString()),
                    oilTemp: int.parse(_oilTemp_Controller.text.toString()),
                    windingTemp:
                        int.parse(_windingTemp_Controller.text.toString()),
                    ambientTemp:
                        int.parse(_ambientTemp_Controller.text.toString()),
                    dateOfTesting: _dateOfTesting,
                    testedBy: selectedValueForTested.toString(),
                    verifiedBy: selectedValueForVerified.toString(),
                    WitnessedBy: _WitnessedBy_Controller.text.toString(),
                    databaseID: 0,
                    // updateDate: _dateOfTesting,
                  );
                  getX((PowtProvider x) =>
                      x.addPowt(PowttoLocal, _dateOfTesting));
                  watchOnly((PowtProvider x) => {});
                  Navigator.popAndPushNamed(context, '/detail_report',
                      arguments: args['trId']);
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
                      child: vectorGroup6typePOWT(),
                    ),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Witnessed By-', _WitnessedBy_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Serial No', _serialNo_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Rating', _rating_Controller),

                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Rated Voltage- HV', _ratedVoltage_HV_Controller),

                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Rated Voltage-LV', _ratedVoltage_LV_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Rated Current-HV', _ratedCurrent_HV_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Rated Current-LV', _ratedCurrent_LV_Controller),

                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'ImpedanceVoltage L-Tap',
                        _impedanceVoltageLTap_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'ImpedanceVoltage Rated-Tap',
                        _impedanceVoltageRTap_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'ImpedanceVoltage H-Tap',
                        _impedanceVoltageHTap_Controller),

                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Frequency', _frequency_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Type Of Cooling', _typeOfCooling_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'No Of Phases', _noOfPhases_Controller),

                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'No Of Taps', _noOfTaps_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'No Of Nominal Taps', _onOfNominalTaps_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Oil Tempreture', _oilTemp_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Winding Tempreture', _windingTemp_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Ambient Tempreture', _ambientTemp_Controller),

                    //-----------------------------------------------

                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
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
                    child: vectorGroup6typePOWT(),
                  ),
                  simplifiedFor_Display_for_all_Mobile_alphanum(
                      'Witnessed By-', _WitnessedBy_Controller),

                  //-----------------------------------------------
                  simplifiedFor_Display_for_all_Mobile_alphanum(
                      'Serial No', _serialNo_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'Rating', _rating_Controller),

                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'Rated Voltage- HV', _ratedVoltage_HV_Controller),

                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'Rated Voltage-LV', _ratedVoltage_LV_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'Rated Current-HV', _ratedCurrent_HV_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'Rated Current-LV', _ratedCurrent_LV_Controller),

                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'ImpedanceVoltage L-Tap',
                      _impedanceVoltageLTap_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'ImpedanceVoltage Rated-Tap',
                      _impedanceVoltageRTap_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'ImpedanceVoltage H-Tap',
                      _impedanceVoltageHTap_Controller),

                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'Frequency', _frequency_Controller),
                  simplifiedFor_Display_for_all_Mobile_alphanum(
                      'Type Of Cooling', _typeOfCooling_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'No Of Phases', _noOfPhases_Controller),

                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'No Of Taps', _noOfTaps_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'No Of Nominal Taps', _onOfNominalTaps_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'Oil Tempreture', _oilTemp_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'Winding Tempreture', _windingTemp_Controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'Ambient Tempreture', _ambientTemp_Controller),

                  //-----------------------------------------------

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
