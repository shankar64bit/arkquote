// ignore_for_file: missing_return, non_constant_identifier_names, use_build_context_synchronously, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/acb/acb_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:flutter_testreports/features/testreport/presentation/widgets/custom_date_picker_form_field.dart';
import 'package:flutter_testreports/injection_container.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import '../../providers/equipment_acb_provider/acb_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/a_location_enum_drop_list.dart';
import '../dropdown_All/a_make_drop_list.dart';
import '../dropdown_All/no_of_poles_drop_list.dart';
import '../dropdown_All/testedbyuser.dart';
import '../dropdown_All/vcb_ocb_sfe_rsv_kv_drop.dart';
import '../dropdown_All/verifiedbyuser.dart';
import '../dropdown_All/yom_drop_list.dart';
import 'detail_test_report_page.dart';

// the formkey used to validate the forms with key
String etype_radio;
int RSV_value;
var motorvolt;
var closeCoilvolt;
final _formKey = GlobalKey<FormState>();

class AddACBDetails extends StatelessWidget with GetItMixin {
  //int trId, trNo;
  Map args = {};
  DateTime _dateOfTesting;
  DateTime _dueDateOfTesting;

  AddACBDetails(this.args, {Key key}) : super(key: key);

  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _PaneLcontroller = TextEditingController();
  final TextEditingController _SerialNOcontroller = TextEditingController();
  final TextEditingController _TypEcontroller = TextEditingController();
  final TextEditingController _RSCcontroller = TextEditingController();
  final TextEditingController _DDOTcontroller = TextEditingController();
  final TextEditingController _iceStandarDcontroller = TextEditingController();
  final TextEditingController _DOTcontroller = TextEditingController();
  final TextEditingController _WitnessedByController = TextEditingController();
  final TextEditingController _motorVoltage = TextEditingController();
  final TextEditingController _closeCoilTripVolt = TextEditingController();

  int get selectedValueForTested => TestedByUser().getTestByUser();
  int get selectedValueForVerified => VerifiedByUser().getVerifiedByUser();
  int get selectedNoofPoles => no_of_poles_drop().get_No_Of_Poles();
  int get selectedYOM => yom_drop().get_YOM();
  String get selectedMake => make_drop_lits().get_Make();
  String get selectedValueLocation =>
      Location_dropDown().get_selectedValueLocation();

  String get selectedEtypeForEquip =>
      DetailTestReportPage().findEtypeForEquip();
  int get selectedKeyvcb => vcb_ocb_sfe_RSV().getRSVforVCB_OCB_SFE();

  send_RSV_to_vcb_ocb_sfe() {
    return selectedKeyvcb;
  }

  setTrNo() {
    _nOcontroller.text = args['trNo'].toString();
  }

  @override
  Widget build(BuildContext context) {
    setTrNo();
    var mob;
    var desk;

    print(selectedEtypeForEquip);

    if (selectedEtypeForEquip == 'acb') {
      mob = Text('Add ACB Details', style: TextStyle(fontSize: 17));
      desk = Text('Add ACB Details', style: TextStyle(fontSize: 20));
    }
    if (selectedEtypeForEquip == 'vcb') {
      mob = Text('Add VCB Details', style: TextStyle(fontSize: 17));
      desk = Text('Add VCB Details', style: TextStyle(fontSize: 20));
    }
    if (selectedEtypeForEquip == 'ocb') {
      mob = Text('Add OCB Details', style: TextStyle(fontSize: 17));
      desk = Text('Add OCB Details', style: TextStyle(fontSize: 20));
    }
    if (selectedEtypeForEquip == 'sf6') {
      mob = Text('Add SF6 Details', style: TextStyle(fontSize: 17));
      desk = Text('Add SF6 Details', style: TextStyle(fontSize: 20));
    }

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
                  print(selectedMake);
                  print(selectedValueLocation);
                } else if (_formKey.currentState.validate()) {
                  print(
                      'Form Validation Success [No error validation found-OK]');

                  if (selectedEtypeForEquip == 'acb') {
                    etype_radio = 'acb';
                    RSV_value = 415;
                    motorvolt = 0.00;
                    closeCoilvolt = 0.00;
                  } else if (selectedEtypeForEquip == 'vcb') {
                    etype_radio = 'vcb';
                    RSV_value = selectedKeyvcb;
                    motorvolt = double.parse(_motorVoltage.text);
                    closeCoilvolt = double.parse(_closeCoilTripVolt.text);
                  } else if (selectedEtypeForEquip == 'ocb') {
                    etype_radio = 'ocb';
                    RSV_value = selectedKeyvcb;
                    motorvolt = double.parse(_motorVoltage.text);
                    closeCoilvolt = double.parse(_closeCoilTripVolt.text);
                  } else if (selectedEtypeForEquip == 'sf6') {
                    etype_radio = 'sf6';
                    RSV_value = selectedKeyvcb;
                    motorvolt = double.parse(_motorVoltage.text);
                    closeCoilvolt = double.parse(_closeCoilTripVolt.text);
                  }

                  // add to local database
                  final AcbModel acbToLocal = AcbModel(
                    trNo: int.parse(_nOcontroller.text),
                    etype: etype_radio,
                    designation: etype_radio,
                    location: selectedValueLocation.toString(),
                    panel: _PaneLcontroller.text,
                    serialNo: _SerialNOcontroller.text.toString(),
                    make: selectedMake.toString(),
                    type: _TypEcontroller.text,
                    ratedSystemCurrent:
                        int.parse(_RSCcontroller.text.toString()),
                    ratedSystemVoltage: RSV_value,
                    yom: int.parse(selectedYOM.toString()),
                    dateOfTesting: _dateOfTesting,
                    dueDateOfTesting: _dueDateOfTesting,
                    noOfPoles: int.parse(selectedNoofPoles.toString()),
                    iecStandard: int.parse(_iceStandarDcontroller.text),
                    TestedBy: selectedValueForTested.toString(),
                    VerifiedBy: selectedValueForVerified.toString(),
                    WitnessedBy: _WitnessedByController.text,
                    motorVoltage: motorvolt,
                    closeCoilTripVolt: closeCoilvolt,
                    databaseID: 0,
                  );

                  getX((AcbProvider x) =>
                      x.addACB(acbToLocal, _dateOfTesting, _dueDateOfTesting));
                  watchOnly((AcbProvider x) => {});
                  print('storing into local database');
                  print(acbToLocal);

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

  build_body(BuildContext Context) {
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
                        'Test  Report  No',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      ),
                    ),
                    // Text(selectedEtypeForEquip),
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
                        'WitnessedBy', _WitnessedByController),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Panel', _PaneLcontroller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Serial No', _SerialNOcontroller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Type', _TypEcontroller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Rated System Current', _RSCcontroller),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: make_drop_lits(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: no_of_poles_drop(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: yom_drop(),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                        child: CustomDatePickerFormField(
                            _DOTcontroller, 'Date of Testing', (() {
                          pickDateOfTest(Context, 1);
                        }))),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                        child: CustomDatePickerFormField(
                            _DDOTcontroller, 'Due Date of Testing', (() {
                          pickDateOfTest(Context, 0);
                        }))),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'iec Standerd', _iceStandarDcontroller),
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
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        'Test  Report  No',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      ),
                    ),
                    // Text(selectedEtypeForEquip),
                    TextFormField(
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      controller: _nOcontroller,
                      textAlign: TextAlign.center,
                      enabled: false,
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
                    // -------------------------->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'WitnessedBy', _WitnessedByController),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Panel', _PaneLcontroller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Serial No', _SerialNOcontroller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Type', _TypEcontroller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Rated System Current', _RSCcontroller),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: make_drop_lits(),
                    ),
                    selectedEtypeForEquip == 'vcb' ||
                            selectedEtypeForEquip == 'ocb' ||
                            selectedEtypeForEquip == 'sf6'
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                            child: vcb_ocb_sfe_RSV())
                        : Container(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: no_of_poles_drop(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: yom_drop(),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: CustomDatePickerFormField(
                            _DOTcontroller, 'Date of Testing', (() {
                          pickDateOfTest(Context, 1);
                        }))),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: CustomDatePickerFormField(
                            _DDOTcontroller, 'Due Date of Testing', (() {
                          pickDateOfTest(Context, 0);
                        }))),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'iec Standerd', _iceStandarDcontroller),
                    selectedEtypeForEquip == 'vcb' ||
                            selectedEtypeForEquip == 'ocb' ||
                            selectedEtypeForEquip == 'sf6'
                        ? Column(
                            children: [
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'motor voltage', _motorVoltage),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'close coil and trip coil voltage',
                                  _closeCoilTripVolt),
                            ],
                          )
                        : Container(),
                  ]),
            ),
          );
        }
      }),
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
    //YYYY-MM-DDThh:mm[:ss[.uuuuuu]]
    if (dtTest == 1) {
      _dateOfTesting = newDate;
      _DOTcontroller.text = dot;
      print(_DOTcontroller.text);
    } else if (dtTest == 0) {
      _dueDateOfTesting = newDate;
      _DDOTcontroller.text = dot;
      print(_DDOTcontroller.text);
    }
  }
}
