import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../data/models/equipment/DG/dg_ir_test_model.dart';
import '../../providers/dg_provider/dg_ir_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditDgIrPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditDgIrPage(this.args, {Key key}) : super(key: key);

  DgIrTestModel _dgIrTestModel;
  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _SerialNOcontroller = TextEditingController();
  final TextEditingController _re_MResistancecontroller =
      TextEditingController();
  final TextEditingController _ye_MResistancecontroller =
      TextEditingController();
  final TextEditingController _be_MResistancecontroller =
      TextEditingController();

  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Future<void> getReport() async {
    getX((DgIrProvider x) => x.getDgIrByID(args['id']));
    _dgIrTestModel = watchOnly((DgIrProvider x) => x.dgIrModel);

    _IDcontroller.text = args['id'].toString();
    _nOcontroller.text = args['TrNo'].toString();
    _SerialNOcontroller.text = args['Serial_No'];
    _re_MResistancecontroller.text = _dgIrTestModel.re_mResistance.toString();
    _ye_MResistancecontroller.text = _dgIrTestModel.ye_mResistance.toString();
    _be_MResistancecontroller.text = _dgIrTestModel.be_mResistance.toString();
  }

  @override
  Widget build(BuildContext context) {
    final DgIrTestModel ntr = watchOnly((DgIrProvider x) => x.dgIrModel);
    getReport();
    var mob = const Text('Edit DG-IR Details', style: TextStyle(fontSize: 15));
    var desk = const Text('Edit DG-IR Details', style: TextStyle(fontSize: 20));

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
                  var url = Uri.parse('${Env.URL_PREFIX}/dgIrTest/' +
                      ntr.databaseID.toString() +
                      '/');

                  Map<String, String> headers = {
                    "Content-type": "application/json",
                    "Authorization": "Bearer $acc_token",
                  };
                  // print("***********");
                  // print(args['trDatabaseID'].toString());

                  final Map payload = {
                    "trNo": args['trDatabaseID'].toString(),
                    're_mResistance': _re_MResistancecontroller.text.toString(),
                    'ye_mResistance': _ye_MResistancecontroller.text.toString(),
                    'be_mResistance': _be_MResistancecontroller.text.toString(),
                    "serialNo": args['DG_ID'].toString(),
                    "equipmentUsed": selectedValueForEquipmentUse.toString(),
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
                    final DgIrTestModel dgIrReportToLocal = DgIrTestModel(
                      trNo: int.parse(_nOcontroller.text),
                      serialNo: _SerialNOcontroller.text,
                      re_mResistance:
                          double.parse(_re_MResistancecontroller.text),
                      ye_mResistance:
                          double.parse(_ye_MResistancecontroller.text),
                      be_mResistance:
                          double.parse(_be_MResistancecontroller.text),
                      databaseID: ntr.databaseID,
                      EquipmentType: selectedValueForEquipmentUse.toString(),
                      lastUpdated: DateTime.now(),
                    );

                    getX((DgIrProvider x) =>
                        x.updateDgIr(dgIrReportToLocal, args['id']));
                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_DG_IR',
                        arguments: {
                          'id': args['id'],
                          'DG_ID': args['DG_ID'],
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
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'Serial No',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
                TextFormField(
                  controller: _SerialNOcontroller,
                  enabled: false,
                  textAlign: TextAlign.center,
                  // hintText: 'Serial No',
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 20, 150, 10),
                  child: EquipmentTypeList(),
                ),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'R-E Measured Resistance', _re_MResistancecontroller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Y-E Measured Resistance', _ye_MResistancecontroller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'B-E Measured Resistance', _be_MResistancecontroller),
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
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'Serial No',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
                TextFormField(
                  controller: _SerialNOcontroller,
                  enabled: false,
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child: EquipmentTypeList(),
                ),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'R-E Measured Resistance', _re_MResistancecontroller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Y-E Measured Resistance', _ye_MResistancecontroller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'B-E Measured Resistance', _be_MResistancecontroller),
              ]),
            ),
          );
        }
      }),
    );
  }
}
