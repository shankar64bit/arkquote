import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/Auser_input_validation_exnt.dart/validation_extension_methods.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../data/models/equipment/EE/ee_r_test_model.dart';
import '../../providers/ee_provider/ee_rtest_provider.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/custom_text_form_field_For_number.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditEERTestPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditEERTestPage(this.args, {Key key}) : super(key: key);
  int _locRef;
  EERTestModel _eeRTestModel;
  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _locNOController = TextEditingController();

  final TextEditingController _eeNamecontroller = TextEditingController();
  final TextEditingController _resistValueArcontroller =
      TextEditingController();
  final TextEditingController _resistValueBrcontroller =
      TextEditingController();

  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Future<void> getReport() async {
    getX((EERTestProvider x) => x.getEERTestByID(args['id']));
    _eeRTestModel = watchOnly((EERTestProvider x) => x.eeRTestModel);
    _locNOController.text = args['EE_LOC_ID'].toString();

    _IDcontroller.text = args['id'].toString();
    _nOcontroller.text = args['trNo'].toString();
    _eeNamecontroller.text = _eeRTestModel.eeName;
    _resistValueArcontroller.text = _eeRTestModel.resistanceValue_AR.toString();
    _resistValueBrcontroller.text = _eeRTestModel.resistanceValue_BR.toString();
    _locRef = _eeRTestModel.locNo;
  }

  @override
  Widget build(BuildContext context) {
    double resistanceValue;
    final EERTestModel ntr = watchOnly((EERTestProvider x) => x.eeRTestModel);
    getReport();
    var mob = const Text('Edit EE-Recondition Test Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('Edit EE-Recondition Test Details',
        style: TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // ignore: missing_return
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
                  //add to remote database
                  var success_code = 201;
                  var success_code1 = 200;
                  var failed_code = 'Server Connection Lost';
                  //add to remote database
                  var url = Uri.parse('${Env.URL_PREFIX}/eeRTest/' +
                      ntr.databaseID.toString() +
                      '/');

                  Map<String, String> headers = {
                    "Content-type": "application/json",
                    "Authorization": "Bearer $acc_token",
                  };
                  print("***********");
                  print(url);

                  final Map payload = {
                    "trNo": args['trDatabaseID'].toString(),
                    'resistanceValue_AR':
                        _resistValueArcontroller.text.toString(),
                    'resistanceValue_BR':
                        _resistValueBrcontroller.text.toString(),
                    'eeName': _eeNamecontroller.text.toString(),
                    'locNo': args['eeLocDatabaseID'].toString(),
                    'equipmentUsed': selectedValueForEquipmentUse.toString(),
                    "updateDate": DateTime.now().toString(),
                  };
                  var response = await http.put(url,
                      body: jsonEncode(payload), headers: headers);

                  if (response.statusCode == success_code ||
                      response.statusCode == success_code1) {
                    print('Response status: ${response.statusCode}');
                    print('Response body: ${response.body}');
                    print('updated remote db successfully');

                    //add to local database

                    final EERTestModel eeTestReportToLocal = EERTestModel(
                      trNo: int.parse(_nOcontroller.text),
                      locNo: _locRef,
                      eeName: _eeNamecontroller.text,
                      resistanceValue_AR:
                          double.parse(_resistValueArcontroller.text),
                      resistanceValue_BR:
                          double.parse(_resistValueBrcontroller.text),
                      databaseID: ntr.databaseID,
                      EquipmentType: selectedValueForEquipmentUse.toString(),
                      lastUpdated: DateTime.now(),
                    );

                    getX((EERTestProvider x) =>
                        x.updateEERTest(eeTestReportToLocal, args['id']));
                    Navigator.pop(context);
                    print('updated local db successfully');

                    Navigator.popAndPushNamed(context, '/detail_EE_LOC',
                        arguments: {
                          'id': args['EE_LOC_ID'],
                          'EE_ID': args['eeDatabaseID'],
                          'trNo': args['trNo'],
                          'trDatabaseID': args['trDatabaseID'],
                        });
                  } else {
                    failed_code;
                    print('Failed Response status: ${response.statusCode}');
                    print('Failed Response body: ${response.body}');
                    print('Unsuccessfully');
                  }
                }
              },
              icon: const Icon(Icons.save)),
          IconButton(
            onPressed: () {
              _showAlertDialog(context);
              //CustomShowDialogBox('Alert', 'Do you want to Delete?',dialog_box_action(context), context);
            },
            icon: const Icon(Icons.delete_forever),
          ),
        ],
      ),
      // body: SingleChildScrollView(child: build_body()),
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
              elevation: 2,
              child: Column(children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'ID',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
                TextFormField(
                  controller: _IDcontroller,
                  enabled: false,
                  textAlign: TextAlign.center,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'Test Report No',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
                TextFormField(
                  controller: _nOcontroller,
                  // label : const Text('Test Report No.'),
                  enabled: false,
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 20, 150, 10),
                  child: EquipmentTypeList(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'Location No',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
                TextFormField(
                  controller: _locNOController,
                  textAlign: TextAlign.center,
                  enabled: false,
                ),
                simplifiedFor_Diplay_for_all_PC_alphanum(
                    'Earth Electrode Name', _eeNamecontroller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Resistance Value Befor Recondition (Ω)',
                    _resistValueBrcontroller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Resistance Value After Recondition (Ω)',
                    _resistValueArcontroller),
              ]),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              elevation: 2,
              child: Column(children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'ID',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
                TextFormField(
                  controller: _IDcontroller,
                  enabled: false,
                  textAlign: TextAlign.center,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'Test Report No',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
                TextFormField(
                  controller: _nOcontroller,
                  // label : const Text('Test Report No.'),
                  enabled: false,
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'Location No',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
                TextFormField(
                  controller: _locNOController,
                  textAlign: TextAlign.center,
                  enabled: false,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child: EquipmentTypeList(),
                ),
                simplifiedFor_Display_for_all_Mobile_alphanum(
                    'Earth Electrode Name', _eeNamecontroller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Resistance Value Befor Recondition (Ω)',
                    _resistValueBrcontroller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Resistance Value After Recondition (Ω)',
                    _resistValueArcontroller),
              ]),
            ),
          );
        }
      }),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Column(
            children: [
              Expanded(
                child: AlertDialog(
                  title: const Text('Alert'),
                  content: const Text('Do you want to delete?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        getX(
                            (EERTestProvider x) => x.deleteEERTest(args['id']));
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'YES',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'NO',
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
