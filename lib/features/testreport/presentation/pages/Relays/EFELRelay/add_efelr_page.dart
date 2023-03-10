// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/a_location_enum_drop_list.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/a_make_drop_list.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/testedbyuser.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/verifiedbyuser.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';

import '../../../../../../injection_container.dart';
import '../../../../data/models/equipment/Relays/EFELRelay/efelr_model.dart';
import '../../../providers/Relays_providers/EFELRelay_provider/efelr_provider.dart';
import '../../../widgets/custom_date_picker_form_field.dart';
import '../../dropdown_All/a_EfEletype_drop_list.dart';
import '../../dropdown_All/a_as_simplified_function.dart';

final _formKey = GlobalKey<FormState>();

class AddEfElrDetails extends StatelessWidget with GetItMixin {
  Map args = {};
  DateTime _dateOfTesting;
  AddEfElrDetails(this.args, {Key key}) : super(key: key);

  String _etypEcontroller, designation;

  final TextEditingController _DOTcontroller = TextEditingController();
  final TextEditingController _trNo_Controller = TextEditingController();
  // final TextEditingController _designation_Controller = TextEditingController();
  final TextEditingController _serialNo_Controller = TextEditingController();
  final TextEditingController _panel_Controller = TextEditingController();
  final TextEditingController _make_Controller = TextEditingController();
  final TextEditingController _rtype_Controller = TextEditingController();
  final TextEditingController _auxVoltage_Controller = TextEditingController();
  final TextEditingController _ctRatio_Controller = TextEditingController();
  final TextEditingController _witnessedBy_Controller = TextEditingController();

  int get selectedValueForTested => TestedByUser().getTestByUser();
  int get selectedValueForVerified => VerifiedByUser().getVerifiedByUser();
  String get selectedMake => make_drop_lits().get_Make();
  String get selectedValueForEfEleType => efeletype_drop_lits().get_etype();

  String get selectedValueLocation =>
      Location_dropDown().get_selectedValueLocation();

  setTrNo() {
    _trNo_Controller.text = args['trNo'].toString();
  }

  @override
  Widget build(BuildContext context) {
    setTrNo();
    var mob = Text('Add Earth Fault /Leakage Relay Details',
        style: TextStyle(fontSize: 17));
    var desk = Text('Add Earth Fault /Leakage Relay Details',
        style: TextStyle(fontSize: 20));
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

                  _etypEcontroller = selectedValueForEfEleType.toString();
                  if (_etypEcontroller == 'efri')
                    designation = "Earth Fault Relay(Instantaneous)";
                  else if (_etypEcontroller == 'efrinv' ||
                      _etypEcontroller == 'efrinvl') {
                    designation = 'Earth Fault Relay(Inverse)';
                  } else if (_etypEcontroller == 'elr') {
                    designation = 'Earth Leakage Relay';
                  } else if (_etypEcontroller == 'elrr') {
                    designation = 'Restricated Earth Fault Relay';
                  } else if (_etypEcontroller == 'elrs') {
                    designation = 'Sensitive Earth Fault Relay';
                  }

                  // add to local database
                  final EfElrModel EfElrtoLocal = EfElrModel(
                    trNo: int.parse(_trNo_Controller.text),
                    etype: _etypEcontroller,
                    designation: designation,
                    location: selectedValueLocation.toString(),
                    serialNo: _serialNo_Controller.text,
                    panel: _panel_Controller.text.toString(),
                    make: selectedMake.toString(),
                    rtype: _rtype_Controller.text.toString(),
                    auxVoltage: _auxVoltage_Controller.text.toString(),
                    ctRatio: _ctRatio_Controller.text.toString(),
                    dateOfTesting: _dateOfTesting,
                    testedBy: selectedValueForTested.toString(),
                    verifiedBy: selectedValueForVerified.toString(),
                    WitnessedBy: _witnessedBy_Controller.text.toString(),
                    databaseID: 0,
                  );
                  getX((EfElrProvider x) =>
                      x.addEfElr(EfElrtoLocal, _dateOfTesting));
                  watchOnly((EfElrProvider x) => {});
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
                      padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: make_drop_lits(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: efeletype_drop_lits(),
                    ),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'SerialNO', _serialNo_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Panel', _panel_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Make', _make_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Type', _rtype_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'auxVoltage', _auxVoltage_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'CT Ratio', _ctRatio_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'WitnessedBy', _witnessedBy_Controller),
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
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: make_drop_lits(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: efeletype_drop_lits(),
                    ),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Serial No', _serialNo_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Panel', _panel_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Make', _make_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Type', _rtype_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'auxVoltage', _auxVoltage_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'CT Ratio', _ctRatio_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'WitnessedBy', _witnessedBy_Controller),
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
