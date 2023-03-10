// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/test_report_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/Auser_input_validation_exnt.dart/validation_extension_methods.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/equipment_acb_provider/test_report_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/widgets/custom_date_picker_form_field.dart';
import 'package:intl/intl.dart';
import '../../../../../injection_container.dart';
import '../../widgets/custom_text_form_field.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../dropdown_All/user_permission.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class AddTestReportPage extends StatelessWidget with GetItMixin {
  int id;
  AddTestReportPage({Key key}) : super(key: key);

  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _clienTcontroller = TextEditingController();
  final TextEditingController _customeRcontroller = TextEditingController();
  final TextEditingController _projecTcontroller = TextEditingController();
  final TextEditingController _dateofTestController = TextEditingController();
  DateTime _dateOfTest;

  @override
  Widget build(BuildContext context) {
    // setTrNo();
    var mob = Text('Add Report', style: TextStyle(fontSize: 17));
    var desk = Text('Add Report', style: TextStyle(fontSize: 20));
    var acc_token = sl<GoogleSignInController>().ACCESS_TOKEN;
    var ref_token = sl<GoogleSignInController>().REFRESH_TOKEN;
    return Scaffold(
      appBar: AppBar(
        title: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 400) {
            return desk;
          } else {
            return mob;
          }
        }),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              // Loading Function

              // User validation starts from here
              if (!_formKey.currentState.validate()) {
                print('Incomplete Validation - ERROR');
                //Validation Error
              } else if (_formKey.currentState.validate()) {
                //Validation Success
                print('Form Validation Success [No error validation found-OK]');

                String getcustomer;
                if (_customeRcontroller.text == null ||
                    _customeRcontroller.text == '' ||
                    _customeRcontroller.text.isEmpty) {
                  getcustomer = "0";
                } else {
                  getcustomer = _customeRcontroller.text;
                }

                // ---------------------------------------------------

                TestReportModel reportToLocal = TestReportModel(
                  client: _clienTcontroller.text,
                  customer: getcustomer,
                  project: _projecTcontroller.text,
                  trNo: int.parse(_nOcontroller.text),
                  testDate: _dateOfTest,
                  databaseID: 0,
                  // updateDate: _dateOfTest,
                );

                getX((TestReportsProvider x) => x.addReport(reportToLocal));
                watchOnly((TestReportsProvider x) => {});
                print('storing into local database');
                print(reportToLocal);

                Navigator.pop(context);
              }
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: ListView(children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: ConstrainedBox(
                        constraints:
                            BoxConstraints(minHeight: 0, maxWidth: 700),
                        child: Add_Report_Page(context)),
                  ),
                ]),
          ),
        ),
      ]),
    );
  }

  Form Add_Report_Page(BuildContext context) {
    return Form(
      key: _formKey,
      child: LayoutBuilder(builder: (context, constraints) {
        ///////////////////////DESKTOP//////////////////////////
        if (constraints.maxWidth > 400) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Client Report Details',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontSize: 20),
                  ),
                ),
                Card(
                  elevation: 5,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: Column(
                      children: [
                        simplifiedForPC('Test Report No', _nOcontroller),
                        simplifiedForPC('Client', _clienTcontroller),
                        Padding(
                          padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
                          child: CustomTextFormField(
                            controller: _customeRcontroller,
                            hintText: 'Customer (optional)',
                          ),
                        ),
                        simplifiedForPC('Project', _projecTcontroller),
                        Padding(
                          padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
                          child: CustomDatePickerFormField(
                            _dateofTestController,
                            'Date of Testing',
                            (() {
                              pickDateOfTest(context);
                            }),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
                          child: employer_permission(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          ///////////////////////////////////////MOBILE//////////////////////////////
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Client Report Details',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontSize: 20),
                  ),
                ),
                Card(
                  elevation: 5,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Column(
                      children: [
                        simplifiedForMob('Test Report No', _nOcontroller),
                        SizedBox(height: 10.0),
                        simplifiedForMob('Client', _clienTcontroller),
                        SizedBox(height: 10.0),
                        CustomTextFormField(
                          controller: _customeRcontroller,
                          hintText: 'Customer (optional)',
                        ),
                        SizedBox(height: 10.0),
                        simplifiedForMob('Project', _projecTcontroller),
                        SizedBox(height: 10.0),
                        CustomDatePickerFormField(
                          _dateofTestController,
                          'Date of Testing',
                          (() {
                            pickDateOfTest(context);
                          }),
                        ),
                        SizedBox(height: 10.0),
                        employer_permission(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }

  simplifiedForMob(String hinttxt, TextEditingController tc) {
    return CustomTextFormField(
      controller: tc,
      hintText: hinttxt,
      // ignore: missing_return
      validator: (val) {
        if (!val.IsValueEmpty) {
          return 'Enter valid Project name';
        }
      },
    );
  }

  simplifiedForPC(String hinttxt, TextEditingController tc) {
    return Padding(
      padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
      child: CustomTextFormField(
        controller: tc,
        hintText: hinttxt,
        // ignore: missing_return
        validator: (val) {
          if (!val.IsValueEmpty) {
            return 'Enter valid Project name';
          }
        },
      ),
    );
  }

  Future<void> pickDateOfTest(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: _dateOfTest ?? initialDate,
        firstDate: DateTime(DateTime.now().year - 100),
        lastDate: DateTime(DateTime.now().year + 3),
        builder: (context, child) => Theme(
              data: ThemeData().copyWith(
                colorScheme: const ColorScheme.light(
                  // primary: Colors.pink,
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
    _dateOfTest = newDate;
    String dot = DateFormat('dd/MM/yyyy').format(newDate);
    _dateofTestController.text = dot;
  }
}
