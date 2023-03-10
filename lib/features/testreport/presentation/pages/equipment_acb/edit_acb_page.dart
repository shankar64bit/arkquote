// ignore_for_file: missing_return, missing_required_param
import 'dart:convert';

import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/acb/acb_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/Auser_input_validation_exnt.dart/validation_extension_methods.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/testedbyuser.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/vcb_ocb_sfe_rsv_kv_drop.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/verifiedbyuser.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/login_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/equipment_acb_provider/acb_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/widgets/custom_date_picker_form_field.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import '../../../../../env.sample.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/custom_text_form_field_For_number.dart';
import '../dropdown_All/a_location_enum_drop_list.dart';
import '../dropdown_All/a_make_drop_list.dart';
import '../dropdown_All/no_of_poles_drop_list.dart';
import '../dropdown_All/yom_drop_list.dart';

// the formkey used to validate the forms with key

final _formKey = GlobalKey<FormState>();
String getEtype;

class EditAcbPage extends StatelessWidget with GetItMixin {
  final int id;
  AcbModel _acbModel;

  EditAcbPage({@required this.id, Key key}) : super(key: key);

  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _trnOcontroller = TextEditingController();
  final TextEditingController _PaneLcontroller = TextEditingController();
  final TextEditingController _SerialNOcontroller = TextEditingController();
  final TextEditingController _TypEcontroller = TextEditingController();
  final TextEditingController _RSCcontroller = TextEditingController();
  final TextEditingController _RSVcontroller = TextEditingController();
  final TextEditingController _DDOTcontroller = TextEditingController();
  final TextEditingController _iceStandarDcontroller = TextEditingController();
  final TextEditingController _designatioNcontroller = TextEditingController();
  final TextEditingController _DOTcontroller = TextEditingController();
  final TextEditingController _WitnessedByController = TextEditingController();
  final TextEditingController _TestedByController = TextEditingController();
  final TextEditingController _VerifiedByController = TextEditingController();
  final TextEditingController _no_pole_nOcontroller = TextEditingController();
  final TextEditingController _YOMcontroller = TextEditingController();
  final TextEditingController _makEcontroller = TextEditingController();
  final TextEditingController _LocatioNcontroller = TextEditingController();

  int get selectedValueForTested => TestedByUser().getTestByUser();
  int get selectedValueForVerified => VerifiedByUser().getVerifiedByUser();
  int get selectedNoofPoles => no_of_poles_drop().get_No_Of_Poles();
  int get selectedYOM => yom_drop().get_YOM();
  String get selectedMake => make_drop_lits().get_Make();
  String get selectedValueLocation =>
      Location_dropDown().get_selectedValueLocation();

  // int get selectedValueForTested =>
  //     TestedByUser().getTestByUsertoDefaultValue();
  // int get selectedValueForVerified =>
  //     VerifiedByUser().getTestByUsertoDefaultValue();
  // int get selectedNoofPoles =>
  //     no_of_poles_drop().get_No_Of_Poles_Default_value();
  // int get selectedYOM => yom_drop().get_YOM_Default_value();
  // String get selectedMake => make_drop_lits().get_Make_Default_value();
  // String get selectedValueLocation =>
  //     Location_dropDown().get_selectedValueLocation_Default_value();

  DateTime _dateOfTesting, _dueDateOfTesting;

  @override
  void dispose() {
    _IDcontroller.dispose();
    _trnOcontroller.dispose();
    _PaneLcontroller.dispose();
    _SerialNOcontroller.dispose();
    _TypEcontroller.dispose();
    _RSCcontroller.dispose();
    _iceStandarDcontroller.dispose();
    _designatioNcontroller.dispose();
    _DDOTcontroller.dispose();
    _DOTcontroller.dispose();
    _WitnessedByController.dispose();
    _RSVcontroller.dispose();
    _TestedByController.dispose();
    _VerifiedByController.dispose();
    _no_pole_nOcontroller.dispose();
    _LocatioNcontroller.dispose();
    _makEcontroller.dispose();
    _WitnessedByController.dispose();
    _YOMcontroller.dispose();
  }

  // setTrNo() {
  //   _trnOcontroller.text = widget.TrNo.toString();
  // }

  Future<void> getReport() async {}

  @override
  Widget build(BuildContext context) {
    final AcbModel ntr = watchOnly((AcbProvider x) => x.acbModel);
    getX((AcbProvider x) => x.getAcbByID(id));
    final AcbModel _acbModel = watchOnly((AcbProvider x) => x.acbModel);

    getEtype = _acbModel.etype;
    _IDcontroller.text = _acbModel.id.toString();
    _trnOcontroller.text = _acbModel.trNo.toString();
    _PaneLcontroller.text = _acbModel.panel;
    _SerialNOcontroller.text = _acbModel.serialNo;
    _TypEcontroller.text = _acbModel.type;
    _RSCcontroller.text = _acbModel.ratedSystemCurrent.toString();
    _DOTcontroller.text =
        DateFormat('dd/MM/yyyy').format(_acbModel.dateOfTesting).toString();
    _DDOTcontroller.text =
        DateFormat('dd/MM/yyyy').format(_acbModel.dueDateOfTesting).toString();
    _iceStandarDcontroller.text = _acbModel.iecStandard.toString();
    _designatioNcontroller.text = _acbModel.designation;
    _dateOfTesting = _acbModel.dateOfTesting;
    _dueDateOfTesting = _acbModel.dueDateOfTesting;
    _WitnessedByController.text = _acbModel.WitnessedBy;
    _RSVcontroller.text = _acbModel.ratedSystemVoltage.toString();
    _TestedByController.text = _acbModel.TestedBy;
    _VerifiedByController.text = _acbModel.VerifiedBy;
    _YOMcontroller.text = _acbModel.yom.toString();
    _LocatioNcontroller.text = _acbModel.location;
    _makEcontroller.text = _acbModel.make;
    _no_pole_nOcontroller.text = _acbModel.noOfPoles.toString();

    var mob = const Text('Edit ACB Details', style: TextStyle(fontSize: 15));
    var desk = const Text('Edit ACB Details', style: TextStyle(fontSize: 20));
    var mobV = const Text('Edit VCB Details', style: TextStyle(fontSize: 15));
    var deskV = const Text('Edit VCB Details', style: TextStyle(fontSize: 20));
    var mobO = const Text('Edit OCB Details', style: TextStyle(fontSize: 15));
    var deskO = const Text('Edit OCB Details', style: TextStyle(fontSize: 20));
    var mobS = const Text('Edit SF6 Details', style: TextStyle(fontSize: 15));
    var deskS = const Text('Edit SF6 Details', style: TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 400) {
            if (ntr.etype == 'acb') {
              return ntr.etype == 'acb' ? desk : mob;
            } else if (ntr.etype == 'vcb') {
              return ntr.etype == 'vcb' ? deskV : mobV;
            } else if (ntr.etype == 'ocb') {
              return ntr.etype == 'ocb' ? deskO : mobO;
            } else if (ntr.etype == 'sf6') {
              return ntr.etype == 'sf6' ? deskS : mobS;
            }
          } else {
            if (ntr.etype == 'acb') {
              return ntr.etype == 'acb' ? mob : desk;
            } else if (ntr.etype == 'vcb') {
              return ntr.etype == 'vcb' ? mobV : deskV;
            } else if (ntr.etype == 'ocb') {
              return ntr.etype == 'ocb' ? mobO : deskO;
            } else if (ntr.etype == 'sf6') {
              return ntr.etype == 'sf6' ? mobS : deskS;
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
                    Uri.parse('${Env.URL_PREFIX}/equipment/${ntr.databaseID}/');

                print("********");
                print(url);
                Map<String, String> headers = {
                  "Content-type": "application/json",
                  "Authorization": "Bearer $acc_token",
                };
                final Map payload = {
                  "etype": getEtype,
                  "trNo": ntr.databaseID.toString(),
                  "designation": _designatioNcontroller.text,
                  "location": selectedValueLocation.toString(),
                  "panel": _PaneLcontroller.text,
                  "serialNo": _SerialNOcontroller.text.toString(),
                  "make": selectedMake.toString(),
                  "type": _TypEcontroller.text,
                  "ratedSystemCurrent": _RSCcontroller.text,
                  "ratedSystemVoltage": _RSVcontroller.text,
                  "yom": selectedYOM.toString(),
                  "dateOfTesting": _dateOfTesting.toString(),
                  "dueDateOfTesting": _dueDateOfTesting.toString(),
                  "noOfPoles": selectedNoofPoles.toString(),
                  "iecStandard": _iceStandarDcontroller.text,
                  "TestedBy": selectedValueForTested.toString(),
                  "VerifiedBy": selectedValueForVerified.toString(),
                  "WitnessedBy": _WitnessedByController.text.toString(),
                  "lastUpdated": DateTime.now().toString(),
                };
                var response = await http.put(url,
                    body: jsonEncode(payload), headers: headers);

                if (response.statusCode == success_code ||
                    response.statusCode == success_code1) {
                  print('Response status: ${response.statusCode}');
                  print('Response body: ${response.body}');
                  print('Stored successfully');

                  //add to local database

                  final AcbModel acbReportToLocal = AcbModel(
                    etype: getEtype,
                    trNo: int.parse(_trnOcontroller.text),
                    designation: _designatioNcontroller.text,
                    location: selectedValueLocation.toString(),
                    panel: _PaneLcontroller.text,
                    serialNo: _SerialNOcontroller.text.toString(),
                    make: selectedMake.toString(),
                    type: _TypEcontroller.text,
                    ratedSystemCurrent: int.parse(_RSCcontroller.text),
                    ratedSystemVoltage: int.parse(_RSVcontroller.text),
                    yom: int.parse(selectedYOM.toString()),
                    dateOfTesting: _dateOfTesting,
                    dueDateOfTesting: _dueDateOfTesting,
                    noOfPoles: int.parse(selectedNoofPoles.toString()),
                    iecStandard: int.parse(_iceStandarDcontroller.text),
                    TestedBy: selectedValueForTested.toString(),
                    VerifiedBy: selectedValueForVerified.toString(),
                    WitnessedBy: _WitnessedByController.text.toString(),
                    databaseID: ntr.databaseID,
                    lastUpdated: DateTime.now(),
                  );
                  print("**************");
                  print(acbReportToLocal);
                  getX((AcbProvider x) => x.updateACB(acbReportToLocal, id));
                  watchOnly((AcbProvider x) => {});
                  Navigator.popAndPushNamed(context, '/detail_ACB', arguments: {
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
                    Divider(height: 0, thickness: 0.8, color: Colors.black),
                    const Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text('Test Report No',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1))),
                    TextFormField(
                        controller: _trnOcontroller,
                        enabled: false,
                        textAlign: TextAlign.center),
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
                    Padding(
                      padding: EdgeInsets.fromLTRB(150, 10, 150, 0),
                      child: CustomTextFormField(
                        controller: _WitnessedByController,
                        hintText: 'WitnessedBy',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 10, 150, 10),
                      child: CustomTextFormField(
                        controller: _designatioNcontroller,
                        hintText: 'Designation',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomTextFormField(
                        controller: _PaneLcontroller,
                        hintText: 'Panel',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _SerialNOcontroller,
                        hintText: 'Serial No.',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomTextFormField(
                        controller: _TypEcontroller,
                        hintText: 'Type',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _RSCcontroller,
                        hintText: 'Rated System Current',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                        },
                      ),
                    ),
                    getEtype == 'acb'
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                            child: CustomTextFormFieldForNumber(
                              controller: _RSVcontroller,
                              hintText: 'Rated System Voltage',
                              validator: (val) {
                                if (!val.IsValueEmpty) {
                                  return 'Field should not be empty';
                                }
                              },
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: vcb_ocb_sfe_RSV(),
                          ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: make_drop_lits(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: no_of_poles_drop(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: yom_drop(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 30, 150, 10),
                      child: CustomDatePickerFormField(
                        _DDOTcontroller,
                        'Date of Testing',
                        (() {
                          pickDateOfTest(context, 1);
                        }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomDatePickerFormField(
                          _DDOTcontroller, 'Due Date of Testing', (() {
                        pickDateOfTest(context, 0);
                      })),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 20),
                      child: CustomTextFormField(
                        controller: _iceStandarDcontroller,
                        hintText: 'ice Standerd',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                        },
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
                      controller: _trnOcontroller,
                      enabled: false,
                      textAlign: TextAlign.center,
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
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: CustomTextFormField(
                        controller: _WitnessedByController,
                        hintText: 'WitnessedBy',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                      child: CustomTextFormField(
                        controller: _designatioNcontroller,
                        hintText: 'Designation',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                      child: CustomTextFormField(
                        controller: _PaneLcontroller,
                        hintText: 'Panel',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _SerialNOcontroller,
                        hintText: 'Serial No.',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                      child: CustomTextFormField(
                        controller: _TypEcontroller,
                        hintText: 'Type',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _RSCcontroller,
                        hintText: 'Rated System Current',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                        },
                      ),
                    ),
                    getEtype == 'acb'
                        ? Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                            child: CustomTextFormFieldForNumber(
                              controller: _RSVcontroller,
                              hintText: 'Rated System Voltage',
                              validator: (val) {
                                if (!val.IsValueEmpty) {
                                  return 'Field should not be empty';
                                }
                              },
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: vcb_ocb_sfe_RSV(),
                          ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: make_drop_lits(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: no_of_poles_drop(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: yom_drop(),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                        child: CustomDatePickerFormField(
                            _DDOTcontroller, 'Date of Testing', (() {
                          pickDateOfTest(context, 1);
                        }))),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                        child: CustomDatePickerFormField(
                            _DDOTcontroller, 'Due Date of Testing', (() {
                          pickDateOfTest(context, 0);
                        }))),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                      child: CustomTextFormField(
                        controller: _iceStandarDcontroller,
                        hintText: 'ice Standerd',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                        },
                      ),
                    ),
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
      _dueDateOfTesting = newDate;
      _DDOTcontroller.text = dot;
    }
  }
}
