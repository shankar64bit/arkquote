import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../data/models/equipment/SC/sc_c_test_model.dart';
import '../../providers/sc_provider/sc_c_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditScCPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditScCPage(this.args, {Key key}) : super(key: key);

  ScCTestModel _scCTestModel;
  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _SerialNOcontroller = TextEditingController();
  final TextEditingController _racontroller = TextEditingController();
  final TextEditingController _rbcontroller = TextEditingController();
  final TextEditingController _yacontroller = TextEditingController();
  final TextEditingController _ybcontroller = TextEditingController();
  final TextEditingController _bacontroller = TextEditingController();
  final TextEditingController _bbcontroller = TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Future<void> getReport() async {
    getX((ScCProvider x) => x.getScCByID(args['id']));
    _scCTestModel = watchOnly((ScCProvider x) => x.scCModel);

    _IDcontroller.text = args['id'].toString();
    _nOcontroller.text = args['TrNo'].toString();
    _SerialNOcontroller.text = args['Serial_No'];
    _racontroller.text = _scCTestModel.rA.toString();
    _rbcontroller.text = _scCTestModel.rB.toString();
    _yacontroller.text = _scCTestModel.yA.toString();
    _ybcontroller.text = _scCTestModel.yB.toString();
    _bacontroller.text = _scCTestModel.bA.toString();
    _bbcontroller.text = _scCTestModel.bB.toString();
  }

  @override
  Widget build(BuildContext context) {
    final ScCTestModel ntr = watchOnly((ScCProvider x) => x.scCModel);
    getReport();
    var mob = const Text('Edit SC-C Details', style: TextStyle(fontSize: 15));
    var desk = const Text('Edit SC-C Details', style: TextStyle(fontSize: 20));

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
                  var url = Uri.parse('${Env.URL_PREFIX}/scCTest/' +
                      ntr.databaseID.toString() +
                      '/');

                  Map<String, String> headers = {
                    "Content-type": "application/json",
                    "Authorization": "Bearer $acc_token",
                  };
                  print("***********");
                  print(args['trDatabaseID'].toString());

                  final Map payload = {
                    "trNo": args['trDatabaseID'].toString(),
                    'rA': _racontroller.text.toString(),
                    'rB': _rbcontroller.text.toString(),
                    'yA': _yacontroller.text.toString(),
                    'yB': _ybcontroller.text.toString(),
                    'bA': _bacontroller.text.toString(),
                    'bB': _bbcontroller.text.toString(),
                    "serialNo": args['SC_ID'].toString(),
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
                    final ScCTestModel scCReportToLocal = ScCTestModel(
                      trNo: int.parse(_nOcontroller.text),
                      serialNo: _SerialNOcontroller.text,
                      rA: double.parse(_racontroller.text),
                      rB: double.parse(_rbcontroller.text),
                      yA: double.parse(_yacontroller.text),
                      yB: double.parse(_ybcontroller.text),
                      bA: double.parse(_bacontroller.text),
                      bB: double.parse(_bbcontroller.text),
                      databaseID: ntr.databaseID,
                      EquipmentType: selectedValueForEquipmentUse.toString(),
                      lastUpdated: DateTime.now(),
                    );

                    getX((ScCProvider x) =>
                        x.updateScC(scCReportToLocal, args['id']));
                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_SC_C',
                        arguments: {
                          'id': args['id'],
                          'SC_ID': args['SC_ID'],
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
                    'Primary-Earth R Before', _rbcontroller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Primary-Earth R After', _racontroller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Primary-Earth Y Before', _ybcontroller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Primary-Earth Y After', _yacontroller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Primary-Earth B Before', _bbcontroller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Primary-Earth B After', _bacontroller),
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
                  // hintText: 'Serial No',
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child: EquipmentTypeList(),
                ),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Primary-Earth R Before', _rbcontroller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Primary-Earth R After', _racontroller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Primary-Earth Y Before', _ybcontroller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Primary-Earth Y After', _yacontroller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Primary-Earth B Before', _bbcontroller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Primary-Earth B After', _bacontroller),
              ]),
            ),
          );
        }
      }),
    );
  }
}
