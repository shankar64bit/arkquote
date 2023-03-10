// ignore_for_file: missing_return, missing_required_param, prefer_const_constructors
import 'dart:convert';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/testedbyuser.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/verifiedbyuser.dart';
import 'package:flutter_testreports/features/testreport/presentation/widgets/custom_date_picker_form_field.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import '../../../../../../env.sample.dart';
import '../../../../data/models/equipment/Relays/AuxiliaryRelay/AR_model.dart';
import '../../../providers/Relays_providers/AuxiliaryRelay_providers/AR_provider.dart';
import '../../dropdown_All/MegaGigaTeraRadioButton/connectedtaps.dart';
import '../../dropdown_All/a_as_simplified_function.dart';
import '../../dropdown_All/a_location_enum_drop_list.dart';
import '../../dropdown_All/a_make_drop_list.dart';
import '../../dropdown_All/at_vector_group_8_type_dropdown.dart';
import '../../dropdown_All/yom_drop_list.dart';

// the formkey used to validate the forms with key

final _formKey = GlobalKey<FormState>();
String getEtype;

class EditARPage extends StatelessWidget with GetItMixin {
  final int id;
  ARModel _arModel;
  Map args = {};

  EditARPage({@required this.id, Key key}) : super(key: key);

  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _DOTcontroller = TextEditingController();
  final TextEditingController _trNo_Controller = TextEditingController();
  final TextEditingController _designation_Controller = TextEditingController();
  final TextEditingController _noOfCoil_Controller = TextEditingController();
  final TextEditingController _panel_Controller = TextEditingController();
  final TextEditingController _make_Controller = TextEditingController();
  final TextEditingController _rtype_Controller = TextEditingController();
  final TextEditingController _auxVoltage_Controller = TextEditingController();
  final TextEditingController _witnessedBy_Controller = TextEditingController();

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
    _noOfCoil_Controller.dispose();
    _panel_Controller.dispose();
    _make_Controller.dispose();
    _rtype_Controller.dispose();
    _auxVoltage_Controller.dispose();

    _witnessedBy_Controller.dispose();
  }

  // setTrNo() {
  //   _trnOcontroller.text = widget.TrNo.toString();
  // }

  Future<void> getReport() async {}

  @override
  Widget build(BuildContext context) {
    final ARModel ntr = watchOnly((ARProvider x) => x.arModel);
    getX((ARProvider x) => x.getARByID(id));
    final ARModel _arModel = watchOnly((ARProvider x) => x.arModel);

    getEtype = _arModel.etype;
    _IDcontroller.text = _arModel.id.toString();
    _DOTcontroller.text =
        DateFormat('dd/MM/yyyy').format(_arModel.dateOfTesting).toString();
    _trNo_Controller.text = _arModel.trNo.toString();
    _designation_Controller.text = _arModel.designation.toString();
    _noOfCoil_Controller.text = _arModel.noOfCoil.toString();
    _panel_Controller.text = _arModel.panel.toString();
    _make_Controller.text = _arModel.make.toString();
    _rtype_Controller.text = _arModel.rtype.toString();
    _auxVoltage_Controller.text = _arModel.auxVoltage.toString();
    _witnessedBy_Controller.text = _arModel.WitnessedBy.toString();
    _DOTcontroller.text =
        DateFormat('dd/MM/yyyy').format(_arModel.dateOfTesting).toString();
    _dateOfTesting = _arModel.dateOfTesting;

    var mob = const Text('Edit AR Details', style: TextStyle(fontSize: 15));
    var desk = const Text('Edit AR Details', style: TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 400) {
            if (ntr.etype == 'ar') {
              return ntr.etype == 'ar' ? desk : mob;
            }
          } else {
            if (ntr.etype == 'ar') {
              return ntr.etype == 'ar' ? mob : desk;
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
                    Uri.parse('${Env.URL_PREFIX}/aRelay/${ntr.databaseID}/');

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
                  'noOfCoil': _noOfCoil_Controller.text.toString(),
                  'panel': _panel_Controller.text.toString(),
                  'rtype': _rtype_Controller.text.toString(),
                  'auxVoltage': _auxVoltage_Controller.text.toString(),
                  'dateOfTesting': _dateOfTesting.toString(),
                  'testedBy': selectedValueForTested.toString(),
                  'verifiedBy': selectedValueForVerified.toString(),
                  'WitnessedBy': _witnessedBy_Controller.text.toString(),
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

                  final ARModel arReportToLocal = ARModel(
                    etype: getEtype,
                    trNo: int.parse(_trNo_Controller.text),
                    designation: getEtype,
                    location: selectedValueLocation.toString(),
                    make: selectedMake.toString(),
                    noOfCoil: int.parse(_noOfCoil_Controller.text),
                    panel: _panel_Controller.text.toString(),
                    rtype: _rtype_Controller.text.toString(),
                    auxVoltage: _auxVoltage_Controller.text.toString(),
                    dateOfTesting: _dateOfTesting,
                    testedBy: selectedValueForTested.toString(),
                    verifiedBy: selectedValueForVerified.toString(),
                    WitnessedBy: _witnessedBy_Controller.text.toString(),
                    databaseID: ntr.databaseID,
                    updateDate: DateTime.now(),
                  );
                  print("**************");
                  print(arReportToLocal);
                  getX((ARProvider x) => x.updateAR(arReportToLocal, id));
                  watchOnly((ARProvider x) => {});
                  Navigator.popAndPushNamed(context, '/detail_AR', arguments: {
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
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: make_drop_lits(),
                    ),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'noOfCoil', _noOfCoil_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'panel', _panel_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'rtype', _rtype_Controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'auxVoltage', _auxVoltage_Controller),
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
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: make_drop_lits(),
                    ),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'noOfCoil', _noOfCoil_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'panel', _panel_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'rtype', _rtype_Controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'auxVoltage', _auxVoltage_Controller),
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
