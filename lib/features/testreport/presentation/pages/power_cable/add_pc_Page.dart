// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/power_cable/pc_model.dart';
import '../../providers/pc_provider/pc_provider.dart';
import '../../widgets/custom_date_picker_form_field.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/a_location_enum_drop_list.dart';
import '../dropdown_All/a_make_drop_list.dart';
import '../dropdown_All/testedbyuser.dart';
import '../dropdown_All/verifiedbyuser.dart';

String etype_radio = 'pc';
final _formKey = GlobalKey<FormState>();

class AddPcDetails extends StatelessWidget with GetItMixin {
  Map args = {};
  DateTime _dateOfTesting;
  AddPcDetails(this.args, {Key key}) : super(key: key);

  final String _etypEcontroller = etype_radio;
  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _DesignatioNcontroller = TextEditingController();
  final TextEditingController _LocatioNcontroller = TextEditingController();
  final TextEditingController _ratingcontroller = TextEditingController();
  final TextEditingController _panelcontroller = TextEditingController();
  final TextEditingController _makEcontroller = TextEditingController();
  final TextEditingController _sizecontroller = TextEditingController();
  final TextEditingController _lengthcontroller = TextEditingController();
  final TextEditingController _DOTcontroller = TextEditingController();
  final TextEditingController _WitnessedByController = TextEditingController();

  int get selectedValueForTested => TestedByUser().getTestByUser();
  int get selectedValueForVerified => VerifiedByUser().getVerifiedByUser();
  String get selectedMake => make_drop_lits().get_Make();
  String get selectedValueLocation =>
      Location_dropDown().get_selectedValueLocation();

  setTrNo() {
    _nOcontroller.text = args['trNo'].toString();
  }

  @override
  Widget build(BuildContext context) {
    setTrNo();
    var mob = Text('Add Power Cable Details', style: TextStyle(fontSize: 17));
    var desk = Text('Add Power Cable Details', style: TextStyle(fontSize: 20));
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
                  final PcModel pcToLocal = PcModel(
                    trNo: int.parse(_nOcontroller.text),
                    etype: _etypEcontroller,
                    designation: _etypEcontroller,
                    location: selectedValueLocation.toString(),
                    rating: _ratingcontroller.text,
                    panel: _panelcontroller.text.toString(),
                    make: selectedMake.toString(),
                    size: _sizecontroller.text,
                    length: _lengthcontroller.text,
                    dateOfTesting: _dateOfTesting,
                    TestedBy: selectedValueForTested.toString(),
                    VerifiedBy: selectedValueForVerified.toString(),
                    WitnessedBy: _WitnessedByController.text,
                    databaseID: 0,
                  );
                  print(pcToLocal);
                  getX((PcProvider x) => x.addPc(pcToLocal, _dateOfTesting));
                  watchOnly((PcProvider x) => {});
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
    final PcModel ntr = watchOnly((PcProvider x) => x.pcModel);

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
                        controller: _nOcontroller,
                        textAlign: TextAlign.center,
                        enabled: false,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
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
                        'Designation', _DesignatioNcontroller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Rating', _ratingcontroller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Panel', _panelcontroller),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: make_drop_lits(),
                    ),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Size', _sizecontroller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Length', _lengthcontroller),
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
                        controller: _nOcontroller,
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
                        'WitnessedBy', _WitnessedByController),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Designation', _DesignatioNcontroller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Rating', _ratingcontroller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Panel', _panelcontroller),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: make_drop_lits(),
                    ),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Size', _sizecontroller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Length', _lengthcontroller),
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
