// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/yom_drop_list.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/IT/it_model.dart';
import '../../../data/models/equipment/powt/powt_model.dart';
import '../../providers/it_provider/it_provider.dart';
import '../../providers/powt_provider/powt_provider.dart';
import '../../widgets/custom_date_picker_form_field.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/a_location_enum_drop_list.dart';
import '../dropdown_All/a_make_drop_list.dart';
import '../dropdown_All/it_vector_group_8_type_dropdown.dart';
import '../dropdown_All/testedbyuser.dart';
import '../dropdown_All/verifiedbyuser.dart';

String etype_radio = 'it';
final _formKey = GlobalKey<FormState>();

class Add_It_Details extends StatelessWidget with GetItMixin {
  Map args = {};
  DateTime _dateOfTesting;
  Add_It_Details(this.args, {Key key}) : super(key: key);

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

  int get selectedValueForTested => TestedByUser().getTestByUser();
  int get selectedValueForVerified => VerifiedByUser().getVerifiedByUser();
  String get selectedMake => make_drop_lits().get_Make();
  String get selectedValueLocation =>
      Location_dropDown().get_selectedValueLocation();
  int get selectedValueYOM => yom_drop().get_YOM();
  String get selectedvectorGroup => ItvectorGroup().get_vector();

  setTrNo() {
    _trNo_Controller.text = args['trNo'].toString();
  }

  @override
  Widget build(BuildContext context) {
    setTrNo();
    var mob = Text('Add It Details', style: TextStyle(fontSize: 17));
    var desk = Text('Add It Details', style: TextStyle(fontSize: 20));
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

                  if (selectedvectorGroup.toLowerCase() == 'dd0/dd0' ||
                      selectedvectorGroup.toLowerCase() == 'dd6/dd6' ||
                      selectedvectorGroup.toLowerCase() == 'Yd1d1' ||
                      selectedvectorGroup.toLowerCase() == 'Yd11d11') {
                    _impedanceVoltageHvLv3_Controller.text = "0.0";
                    _impedanceVoltageHvLv4_Controller.text = '0.0';
                  }

                  // add to local database
                  final ItModel ittoLocal = ItModel(
                    trNo: int.parse(_trNo_Controller.text),
                    etype: _etypEcontroller,
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
                    frequency: int.parse(_frequency_Controller.text.toString()),
                    typeOfCooling: _typeOfCooling_Controller.text.toString(),
                    noOfPhases:
                        int.parse(_noOfPhases_Controller.text.toString()),
                    make: selectedMake,
                    yom: selectedValueYOM,
                    noOfTaps: int.parse(_noOfTaps_Controller.text.toString()),
                    noOfNominalTaps:
                        int.parse(_noOfNominalTaps_Controller.text.toString()),
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
                  getX((ItProvider x) => x.addIt(ittoLocal, _dateOfTesting));
                  watchOnly((ItProvider x) => {});
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
    final PowtModel ntr = watchOnly((PowtProvider x) => x.powtModel);

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
                    Text('Inverter Transformer'),
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
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
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
