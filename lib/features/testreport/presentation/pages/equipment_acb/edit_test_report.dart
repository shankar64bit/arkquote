// ignore_for_file: missing_return

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/test_report_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/Auser_input_validation_exnt.dart/validation_extension_methods.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import '../../../../../env.sample.dart';
import '../../providers/equipment_acb_provider/test_report_provider.dart';
import '../../widgets/custom_date_picker_form_field.dart';
import '../../widgets/custom_text_form_field.dart';
import 'package:http/http.dart' as http;

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditTestReportPage extends StatelessWidget with GetItMixin {
  final int id;

  EditTestReportPage({@required this.id, Key key}) : super(key: key);

  TestReportModel ntr;
  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _clienTcontroller = TextEditingController();
  final TextEditingController _customeRcontroller = TextEditingController();
  final TextEditingController _projecTcontroller = TextEditingController();
  final TextEditingController _dateOfTestcontroller = TextEditingController();
  DateTime _dateOfTest;

  @override
  void dispose() {
    _nOcontroller.dispose();
    _clienTcontroller.dispose();
    _customeRcontroller.dispose();
    _projecTcontroller.dispose();
    //sl<AppDatabase>().close();
  }

  @override
  Widget build(BuildContext context) {
    getX((TestReportsProvider x) => x.getReportByID(id));
    final TestReportModel ntr = watchOnly((TestReportsProvider x) => x.trModel);
    _clienTcontroller.text = ntr.client;
    _customeRcontroller.text = ntr.customer;
    _projecTcontroller.text = ntr.project;
    _nOcontroller.text = ntr.trNo.toString();
    _dateOfTestcontroller.text =
        DateFormat('dd/MM/yyyy').format(ntr.testDate).toString();
    _dateOfTest = ntr.testDate;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Report'),
        centerTitle: true,
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
                var url = Uri.parse('${Env.URL_PREFIX}/testReport/' +
                    ntr.databaseID.toString() +
                    '/');

                Map<String, String> headers = {
                  "Content-type": "application/json",
                  "Authorization": "Bearer $acc_token",
                };
                final Map payload = {
                  "timeStamp": _dateOfTest.toString(),
                  "client": _clienTcontroller.text.toString(),
                  "customer": _customeRcontroller.text,
                  "project": _projecTcontroller.text,
                  "trNo": _nOcontroller.text,
                  "updateDate": DateTime.now().toString(),
                };
                var response = await http.put(url,
                    body: jsonEncode(payload), headers: headers);

                if (response.statusCode == success_code ||
                    response.statusCode == success_code1) {
                  print('Response status: ${response.statusCode}');
                  print('Response body: ${response.body}');
                  print('Stored successfully');

                  //add to local database
                  final TestReportModel reportToLocal = TestReportModel(
                    lastUpdated: DateTime.now(),
                    testDate: _dateOfTest,
                    client: _clienTcontroller.text,
                    customer: _customeRcontroller.text,
                    project: _projecTcontroller.text,
                    trNo: int.parse(_nOcontroller.text),
                    databaseID: ntr.databaseID,
                  );
                  getX((TestReportsProvider x) =>
                      x.updateReport(reportToLocal, id));
                  watchOnly((TestReportsProvider x) => {});
                  print('storing into local database');
                  print(reportToLocal);
                  Navigator.pop(context);
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
                          child: Edit_Report_Page(context)),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  Form Edit_Report_Page(BuildContext context) {
    return Form(
      key: _formKey,
      child: LayoutBuilder(builder: (context, constraints) {
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
                  elevation: 2,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(150, 20, 150, 20),
                    child: Column(
                      children: [
                        Text('Test Report No'),
                        TextFormField(
                          controller: _nOcontroller,
                          textAlign: TextAlign.center,
                          enabled: false,
                        ),
                        const SizedBox(height: 20.0),
                        CustomTextFormField(
                          controller: _clienTcontroller,
                          hintText: 'Client',
                          validator: (val) {
                            if (!val.IsValueEmpty) {
                              return 'Enter valid client name';
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          controller: _customeRcontroller,
                          hintText: 'Customer',
                          validator: (val) {
                            if (!val.IsValueEmpty) {
                              return 'Enter valid customer name';
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          controller: _projecTcontroller,
                          hintText: 'Project',
                          validator: (val) {
                            if (!val.IsValueEmpty) {
                              return 'Enter valid Project name';
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        CustomDatePickerFormField(
                          _dateOfTestcontroller,
                          'Date of Testing',
                          (() {
                            pickDateOfTest(context);
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
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
                  elevation: 2,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Column(
                      children: [
                        Text('Test Report No'),
                        TextFormField(
                          controller: _nOcontroller,
                          textAlign: TextAlign.center,
                          enabled: false,
                        ),
                        const SizedBox(height: 20.0),
                        CustomTextFormField(
                          controller: _clienTcontroller,
                          hintText: 'Client',
                          validator: (val) {
                            if (!val.IsValueEmpty) {
                              return 'Enter valid client name';
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          controller: _customeRcontroller,
                          hintText: 'Customer',
                          validator: (val) {
                            if (!val.IsValueEmpty) {
                              return 'Enter valid customer name';
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          controller: _projecTcontroller,
                          hintText: 'Project',
                          validator: (val) {
                            if (!val.IsValueEmpty) {
                              return 'Enter valid Project name';
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        CustomDatePickerFormField(
                          _dateOfTestcontroller,
                          'Date of Testing',
                          (() {
                            pickDateOfTest(context);
                          }),
                        ),
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
    _dateOfTestcontroller.text = dot;
  }
}
