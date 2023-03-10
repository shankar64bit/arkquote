import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/PT/pt_core_r_model.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/PT/pt_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/pt_provider/pt_core_r_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../providers/pt_provider/pt_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditPtRPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditPtRPage(this.args, {Key key}) : super(key: key);

  final TextEditingController _IDcontroller = TextEditingController();

  final TextEditingController _Trno_Controller = TextEditingController();
  final TextEditingController _serialNo_Controller = TextEditingController();
  final TextEditingController _R_1a_1n_1000_Controller =
      TextEditingController();
  final TextEditingController _R_2a_2n_1000_Controller =
      TextEditingController();
  final TextEditingController _R_3a_3n_1000_Controller =
      TextEditingController();

  final TextEditingController _Y_1a_1n_1000_Controller =
      TextEditingController();
  final TextEditingController _Y_2a_2n_1000_Controller =
      TextEditingController();
  final TextEditingController _Y_3a_3n_1000_Controller =
      TextEditingController();

  final TextEditingController _B_1a_1n_1000_Controller =
      TextEditingController();
  final TextEditingController _B_2a_2n_1000_Controller =
      TextEditingController();
  final TextEditingController _B_3a_3n_1000_Controller =
      TextEditingController();
  // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  final TextEditingController _R_1a_1n_2000_Controller =
      TextEditingController();
  final TextEditingController _R_2a_2n_2000_Controller =
      TextEditingController();
  final TextEditingController _R_3a_3n_2000_Controller =
      TextEditingController();

  final TextEditingController _Y_1a_1n_2000_Controller =
      TextEditingController();
  final TextEditingController _Y_2a_2n_2000_Controller =
      TextEditingController();
  final TextEditingController _Y_3a_3n_2000_Controller =
      TextEditingController();

  final TextEditingController _B_1a_1n_2000_Controller =
      TextEditingController();
  final TextEditingController _B_2a_2n_2000_Controller =
      TextEditingController();
  final TextEditingController _B_3a_3n_2000_Controller =
      TextEditingController();
  // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  final TextEditingController _R_1a_1n_3000_Controller =
      TextEditingController();
  final TextEditingController _R_2a_2n_3000_Controller =
      TextEditingController();
  final TextEditingController _R_3a_3n_3000_Controller =
      TextEditingController();

  final TextEditingController _Y_1a_1n_3000_Controller =
      TextEditingController();
  final TextEditingController _Y_2a_2n_3000_Controller =
      TextEditingController();
  final TextEditingController _Y_3a_3n_3000_Controller =
      TextEditingController();

  final TextEditingController _B_1a_1n_3000_Controller =
      TextEditingController();
  final TextEditingController _B_2a_2n_3000_Controller =
      TextEditingController();
  final TextEditingController _B_3a_3n_3000_Controller =
      TextEditingController();
  // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  final TextEditingController _R_1a_1n_4000_Controller =
      TextEditingController();
  final TextEditingController _R_2a_2n_4000_Controller =
      TextEditingController();
  final TextEditingController _R_3a_3n_4000_Controller =
      TextEditingController();

  final TextEditingController _Y_1a_1n_4000_Controller =
      TextEditingController();
  final TextEditingController _Y_2a_2n_4000_Controller =
      TextEditingController();
  final TextEditingController _Y_3a_3n_4000_Controller =
      TextEditingController();

  final TextEditingController _B_1a_1n_4000_Controller =
      TextEditingController();
  final TextEditingController _B_2a_2n_4000_Controller =
      TextEditingController();
  final TextEditingController _B_3a_3n_4000_Controller =
      TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Future<void> getReport() async {
    getX((PTcoreRProvider x) => x.getPTcoreR_ById(args['id']));
    PTcoreRModel _ptRModel = watchOnly((PTcoreRProvider x) => x.ptcoreR_Model);

    _IDcontroller.text = args['id'].toString();
    _Trno_Controller.text = _ptRModel.trNo.toString();
    // args['TrNo'].toString();
    _serialNo_Controller.text = _ptRModel.serialNo.toString();
    //args['Serial_No'];
    _R_1a_1n_1000_Controller.text = _ptRModel.R_1a_1n_1000.toString();
    _R_2a_2n_1000_Controller.text = _ptRModel.R_2a_2n_1000.toString();
    _R_3a_3n_1000_Controller.text = _ptRModel.R_3a_3n_1000.toString();
    _Y_1a_1n_1000_Controller.text = _ptRModel.Y_1a_1n_1000.toString();
    _Y_2a_2n_1000_Controller.text = _ptRModel.Y_2a_2n_1000.toString();
    _Y_3a_3n_1000_Controller.text = _ptRModel.Y_3a_3n_1000.toString();
    _B_1a_1n_1000_Controller.text = _ptRModel.B_1a_1n_1000.toString();
    _B_2a_2n_1000_Controller.text = _ptRModel.B_2a_2n_1000.toString();
    _B_3a_3n_1000_Controller.text = _ptRModel.B_3a_3n_1000.toString();

    _R_1a_1n_2000_Controller.text = _ptRModel.R_1a_1n_2000.toString();
    _R_2a_2n_2000_Controller.text = _ptRModel.R_2a_2n_2000.toString();
    _R_3a_3n_2000_Controller.text = _ptRModel.R_3a_3n_2000.toString();
    _Y_1a_1n_2000_Controller.text = _ptRModel.Y_1a_1n_2000.toString();
    _Y_2a_2n_2000_Controller.text = _ptRModel.Y_2a_2n_2000.toString();
    _Y_3a_3n_2000_Controller.text = _ptRModel.Y_3a_3n_2000.toString();
    _B_1a_1n_2000_Controller.text = _ptRModel.B_1a_1n_2000.toString();
    _B_2a_2n_2000_Controller.text = _ptRModel.B_2a_2n_2000.toString();
    _B_3a_3n_2000_Controller.text = _ptRModel.B_3a_3n_2000.toString();

    _R_1a_1n_3000_Controller.text = _ptRModel.R_1a_1n_3000.toString();
    _R_2a_2n_3000_Controller.text = _ptRModel.R_2a_2n_3000.toString();
    _R_3a_3n_3000_Controller.text = _ptRModel.R_3a_3n_3000.toString();
    _Y_1a_1n_3000_Controller.text = _ptRModel.Y_1a_1n_3000.toString();
    _Y_2a_2n_3000_Controller.text = _ptRModel.Y_2a_2n_3000.toString();
    _Y_3a_3n_3000_Controller.text = _ptRModel.Y_3a_3n_3000.toString();
    _B_1a_1n_3000_Controller.text = _ptRModel.B_1a_1n_3000.toString();
    _B_2a_2n_3000_Controller.text = _ptRModel.B_2a_2n_3000.toString();
    _B_3a_3n_3000_Controller.text = _ptRModel.B_3a_3n_3000.toString();

    _R_1a_1n_4000_Controller.text = _ptRModel.R_1a_1n_4000.toString();
    _R_2a_2n_4000_Controller.text = _ptRModel.R_2a_2n_4000.toString();
    _R_3a_3n_4000_Controller.text = _ptRModel.R_3a_3n_4000.toString();
    _Y_1a_1n_4000_Controller.text = _ptRModel.Y_1a_1n_4000.toString();
    _Y_2a_2n_4000_Controller.text = _ptRModel.Y_2a_2n_4000.toString();
    _Y_3a_3n_4000_Controller.text = _ptRModel.Y_3a_3n_4000.toString();
    _B_1a_1n_4000_Controller.text = _ptRModel.B_1a_1n_4000.toString();
    _B_2a_2n_4000_Controller.text = _ptRModel.B_2a_2n_4000.toString();
    _B_3a_3n_4000_Controller.text = _ptRModel.B_3a_3n_4000.toString();
  }

  @override
  Widget build(BuildContext context) {
    final PTModel ntr1 = watchOnly((PTProvider x) => x.ptModel);
    getX((PTcoreRProvider x) => x.getPTcoreR_ById(args['id']));
    final PTcoreRModel ntr = watchOnly((PTcoreRProvider x) => x.ptcoreR_Model);
    getReport();
    var mob =
        const Text('Edit PT-Ratio Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Edit PT-Ratio Details', style: TextStyle(fontSize: 20));

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
                  var url = Uri.parse('${Env.URL_PREFIX}/ptRTest/' +
                      ntr.databaseID.toString() +
                      '/');
                  if (ntr1.noOfCores == 1 || ntr1.noOfCores == 2) {
                    _R_3a_3n_1000_Controller.text = '0.00';
                    _R_3a_3n_2000_Controller.text = '0.00';
                    _R_3a_3n_3000_Controller.text = '0.00';
                    _R_3a_3n_4000_Controller.text = '0.00';
                    _Y_3a_3n_1000_Controller.text = '0.00';
                    _Y_3a_3n_2000_Controller.text = '0.00';
                    _Y_3a_3n_3000_Controller.text = '0.00';
                    _Y_3a_3n_4000_Controller.text = '0.00';
                    _B_3a_3n_1000_Controller.text = '0.00';
                    _B_3a_3n_2000_Controller.text = '0.00';
                    _B_3a_3n_3000_Controller.text = '0.00';
                    _B_3a_3n_4000_Controller.text = '0.00';
                  }

                  if (ntr1.noOfCores == 1) {
                    _R_2a_2n_1000_Controller.text = '0.00';
                    _R_2a_2n_2000_Controller.text = '0.00';
                    _R_2a_2n_3000_Controller.text = '0.00';
                    _R_2a_2n_4000_Controller.text = '0.00';
                    _Y_2a_2n_1000_Controller.text = '0.00';
                    _Y_2a_2n_2000_Controller.text = '0.00';
                    _Y_2a_2n_3000_Controller.text = '0.00';
                    _Y_2a_2n_4000_Controller.text = '0.00';
                    _B_2a_2n_1000_Controller.text = '0.00';
                    _B_2a_2n_2000_Controller.text = '0.00';
                    _B_2a_2n_3000_Controller.text = '0.00';
                    _B_2a_2n_4000_Controller.text = '0.00';
                  }

                  Map<String, String> headers = {
                    "Content-type": "application/json",
                    "Authorization": "Bearer $acc_token",
                  };
                  print("***********");
                  print(url);
                  print(args['trDatabaseID'].toString());

                  final Map payload = {
                    "trNo": args['trDatabaseID'].toString(),
                    'R_1a_1n_1000': _R_1a_1n_1000_Controller.text.toString(),
                    'R_2a_2n_1000': _R_2a_2n_1000_Controller.text.toString(),
                    'R_3a_3n_1000': _R_3a_3n_1000_Controller.text.toString(),
                    'Y_1a_1n_1000': _Y_1a_1n_1000_Controller.text.toString(),
                    'Y_2a_2n_1000': _Y_2a_2n_1000_Controller.text.toString(),
                    'Y_3a_3n_1000': _Y_3a_3n_1000_Controller.text.toString(),
                    'B_1a_1n_1000': _B_1a_1n_1000_Controller.text.toString(),
                    'B_2a_2n_1000': _B_2a_2n_1000_Controller.text.toString(),
                    'B_3a_3n_1000': _B_3a_3n_1000_Controller.text.toString(),
                    'R_1a_1n_2000': _R_1a_1n_2000_Controller.text.toString(),
                    'R_2a_2n_2000': _R_2a_2n_2000_Controller.text.toString(),
                    'R_3a_3n_2000': _R_3a_3n_2000_Controller.text.toString(),
                    'Y_1a_1n_2000': _Y_1a_1n_2000_Controller.text.toString(),
                    'Y_2a_2n_2000': _Y_2a_2n_2000_Controller.text.toString(),
                    'Y_3a_3n_2000': _Y_3a_3n_2000_Controller.text.toString(),
                    'B_1a_1n_2000': _B_1a_1n_2000_Controller.text.toString(),
                    'B_2a_2n_2000': _B_2a_2n_2000_Controller.text.toString(),
                    'B_3a_3n_2000': _B_3a_3n_2000_Controller.text.toString(),
                    'R_1a_1n_3000': _R_1a_1n_3000_Controller.text.toString(),
                    'R_2a_2n_3000': _R_2a_2n_3000_Controller.text.toString(),
                    'R_3a_3n_3000': _R_3a_3n_3000_Controller.text.toString(),
                    'Y_1a_1n_3000': _Y_1a_1n_3000_Controller.text.toString(),
                    'Y_2a_2n_3000': _Y_2a_2n_3000_Controller.text.toString(),
                    'Y_3a_3n_3000': _Y_3a_3n_3000_Controller.text.toString(),
                    'B_1a_1n_3000': _B_1a_1n_3000_Controller.text.toString(),
                    'B_2a_2n_3000': _B_2a_2n_3000_Controller.text.toString(),
                    'B_3a_3n_3000': _B_3a_3n_3000_Controller.text.toString(),
                    'R_1a_1n_4000': _R_1a_1n_4000_Controller.text.toString(),
                    'R_2a_2n_4000': _R_2a_2n_4000_Controller.text.toString(),
                    'R_3a_3n_4000': _R_3a_3n_4000_Controller.text.toString(),
                    'Y_1a_1n_4000': _Y_1a_1n_4000_Controller.text.toString(),
                    'Y_2a_2n_4000': _Y_2a_2n_4000_Controller.text.toString(),
                    'Y_3a_3n_4000': _Y_3a_3n_4000_Controller.text.toString(),
                    'B_1a_1n_4000': _B_1a_1n_4000_Controller.text.toString(),
                    'B_2a_2n_4000': _B_2a_2n_4000_Controller.text.toString(),
                    'B_3a_3n_4000': _B_3a_3n_4000_Controller.text.toString(),
                    "serialNo": args['ptDatabaseID'].toString(),
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
                    final PTcoreRModel ptRReportToLocal = PTcoreRModel(
                      trNo: int.parse(_Trno_Controller.text),
                      serialNo: _serialNo_Controller.text,
                      R_1a_1n_1000: double.parse(_R_1a_1n_1000_Controller.text),
                      R_2a_2n_1000: double.parse(_R_2a_2n_1000_Controller.text),
                      R_3a_3n_1000: double.parse(_R_3a_3n_1000_Controller.text),
                      Y_1a_1n_1000: double.parse(_Y_1a_1n_1000_Controller.text),
                      Y_2a_2n_1000: double.parse(_Y_2a_2n_1000_Controller.text),
                      Y_3a_3n_1000: double.parse(_Y_3a_3n_1000_Controller.text),
                      B_1a_1n_1000: double.parse(_B_1a_1n_1000_Controller.text),
                      B_2a_2n_1000: double.parse(_B_2a_2n_1000_Controller.text),
                      B_3a_3n_1000: double.parse(_B_3a_3n_1000_Controller.text),
                      R_1a_1n_2000: double.parse(_R_1a_1n_2000_Controller.text),
                      R_2a_2n_2000: double.parse(_R_2a_2n_2000_Controller.text),
                      R_3a_3n_2000: double.parse(_R_3a_3n_2000_Controller.text),
                      Y_1a_1n_2000: double.parse(_Y_1a_1n_2000_Controller.text),
                      Y_2a_2n_2000: double.parse(_Y_2a_2n_2000_Controller.text),
                      Y_3a_3n_2000: double.parse(_Y_3a_3n_2000_Controller.text),
                      B_1a_1n_2000: double.parse(_B_1a_1n_2000_Controller.text),
                      B_2a_2n_2000: double.parse(_B_2a_2n_2000_Controller.text),
                      B_3a_3n_2000: double.parse(_B_3a_3n_2000_Controller.text),
                      R_1a_1n_3000: double.parse(_R_1a_1n_3000_Controller.text),
                      R_2a_2n_3000: double.parse(_R_2a_2n_3000_Controller.text),
                      R_3a_3n_3000: double.parse(_R_3a_3n_3000_Controller.text),
                      Y_1a_1n_3000: double.parse(_Y_1a_1n_3000_Controller.text),
                      Y_2a_2n_3000: double.parse(_Y_2a_2n_3000_Controller.text),
                      Y_3a_3n_3000: double.parse(_Y_3a_3n_3000_Controller.text),
                      B_1a_1n_3000: double.parse(_B_1a_1n_3000_Controller.text),
                      B_2a_2n_3000: double.parse(_B_2a_2n_3000_Controller.text),
                      B_3a_3n_3000: double.parse(_B_3a_3n_3000_Controller.text),
                      R_1a_1n_4000: double.parse(_R_1a_1n_4000_Controller.text),
                      R_2a_2n_4000: double.parse(_R_2a_2n_4000_Controller.text),
                      R_3a_3n_4000: double.parse(_R_3a_3n_4000_Controller.text),
                      Y_1a_1n_4000: double.parse(_Y_1a_1n_4000_Controller.text),
                      Y_2a_2n_4000: double.parse(_Y_2a_2n_4000_Controller.text),
                      Y_3a_3n_4000: double.parse(_Y_3a_3n_4000_Controller.text),
                      B_1a_1n_4000: double.parse(_B_1a_1n_4000_Controller.text),
                      B_2a_2n_4000: double.parse(_B_2a_2n_4000_Controller.text),
                      B_3a_3n_4000: double.parse(_B_3a_3n_4000_Controller.text),
                      equipmentUsed: selectedValueForEquipmentUse.toString(),
                      databaseID: ntr.databaseID,
                      updateDate: DateTime.now(),
                    );

                    getX((PTcoreRProvider x) =>
                        x.updatePTcoreR(ptRReportToLocal, args['id']));
                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_PTcoreR',
                        arguments: {
                          'id': args['id'],
                          'PT_ID': args['PT_ID'],
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
                        child: build_body(context, ntr1)),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  build_body(BuildContext context, PTModel ntr1) {
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
                  controller: _Trno_Controller,
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
                  controller: _serialNo_Controller,
                  enabled: false,
                  textAlign: TextAlign.center,
                  // hintText: 'Serial No',
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 20, 150, 10),
                  child: EquipmentTypeList(),
                ),
                ntr1.noOfCores > 1 || ntr1.noOfCores == 1
                    ? Column(
                        children: [
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'R_1a_1n_1000', _R_1a_1n_1000_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'Y_1a_1n_1000', _Y_1a_1n_1000_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'B_1a_1n_1000', _B_1a_1n_1000_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'R_1a_1n_2000', _R_1a_1n_2000_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'Y_1a_1n_2000', _Y_1a_1n_2000_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'B_1a_1n_2000', _B_1a_1n_2000_Controller),

                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'R_1a_1n_3000', _R_1a_1n_3000_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'Y_1a_1n_3000', _Y_1a_1n_3000_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'B_1a_1n_3000', _B_1a_1n_3000_Controller),

                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'R_1a_1n_4000', _R_1a_1n_4000_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'Y_1a_1n_4000', _Y_1a_1n_4000_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'B_1a_1n_4000', _B_1a_1n_4000_Controller),

                          // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                          ntr1.noOfCores > 1 && ntr1.noOfCores == 2
                              ? Column(
                                  children: [
                                    simplifiedFor_Diplay_for_all_PC_numpad(
                                        'R_2a_2n_1000',
                                        _R_2a_2n_1000_Controller),
                                    simplifiedFor_Diplay_for_all_PC_numpad(
                                        'Y_2a_2n_1000',
                                        _Y_2a_2n_1000_Controller),
                                    simplifiedFor_Diplay_for_all_PC_numpad(
                                        'B_2a_2n_1000',
                                        _B_2a_2n_1000_Controller),
                                    simplifiedFor_Diplay_for_all_PC_numpad(
                                        'R_2a_2n_2000',
                                        _R_2a_2n_2000_Controller),
                                    simplifiedFor_Diplay_for_all_PC_numpad(
                                        'Y_2a_2n_2000',
                                        _Y_2a_2n_2000_Controller),
                                    simplifiedFor_Diplay_for_all_PC_numpad(
                                        'B_2a_2n_2000',
                                        _B_2a_2n_2000_Controller),
                                    simplifiedFor_Diplay_for_all_PC_numpad(
                                        'R_2a_2n_3000',
                                        _R_2a_2n_3000_Controller),
                                    simplifiedFor_Diplay_for_all_PC_numpad(
                                        'Y_2a_2n_3000',
                                        _Y_2a_2n_3000_Controller),
                                    simplifiedFor_Diplay_for_all_PC_numpad(
                                        'B_2a_2n_3000',
                                        _B_2a_2n_3000_Controller),
                                    simplifiedFor_Diplay_for_all_PC_numpad(
                                        'R_2a_2n_4000',
                                        _R_2a_2n_4000_Controller),
                                    simplifiedFor_Diplay_for_all_PC_numpad(
                                        'Y_2a_2n_4000',
                                        _Y_2a_2n_4000_Controller),
                                    simplifiedFor_Diplay_for_all_PC_numpad(
                                        'B_2a_2n_4000',
                                        _B_2a_2n_4000_Controller),
                                    ntr1.noOfCores > 1 &&
                                            ntr1.noOfCores > 2 &&
                                            ntr1.noOfCores == 3
                                        ? Column(
                                            children: [
                                              simplifiedFor_Diplay_for_all_PC_numpad(
                                                  'R_3a_3n_1000',
                                                  _R_3a_3n_1000_Controller),
                                              simplifiedFor_Diplay_for_all_PC_numpad(
                                                  'Y_3a_3n_1000',
                                                  _Y_3a_3n_1000_Controller),
                                              simplifiedFor_Diplay_for_all_PC_numpad(
                                                  'B_3a_3n_1000',
                                                  _B_3a_3n_1000_Controller),
                                              simplifiedFor_Diplay_for_all_PC_numpad(
                                                  'R_3a_3n_2000',
                                                  _R_3a_3n_2000_Controller),
                                              simplifiedFor_Diplay_for_all_PC_numpad(
                                                  'Y_3a_3n_2000',
                                                  _Y_3a_3n_2000_Controller),
                                              simplifiedFor_Diplay_for_all_PC_numpad(
                                                  'B_3a_3n_2000',
                                                  _B_3a_3n_2000_Controller),
                                              simplifiedFor_Diplay_for_all_PC_numpad(
                                                  'R_3a_3n_3000',
                                                  _R_3a_3n_3000_Controller),
                                              simplifiedFor_Diplay_for_all_PC_numpad(
                                                  'Y_3a_3n_3000',
                                                  _Y_3a_3n_3000_Controller),
                                              simplifiedFor_Diplay_for_all_PC_numpad(
                                                  'B_3a_3n_3000',
                                                  _B_3a_3n_3000_Controller),
                                              simplifiedFor_Diplay_for_all_PC_numpad(
                                                  'R_3a_3n_4000',
                                                  _R_3a_3n_4000_Controller),
                                              simplifiedFor_Diplay_for_all_PC_numpad(
                                                  'Y_3a_3n_4000',
                                                  _Y_3a_3n_4000_Controller),
                                              simplifiedFor_Diplay_for_all_PC_numpad(
                                                  'B_3a_3n_4000',
                                                  _B_3a_3n_4000_Controller),
                                            ],
                                          )
                                        : Container(),
                                  ],
                                )
                              : Container(),
                        ],
                      )
                    : Container(),
                Divider(color: Colors.white)
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
                  controller: _Trno_Controller,
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
                  controller: _serialNo_Controller,
                  enabled: false,
                  textAlign: TextAlign.center,
                  // hintText: 'Serial No',
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child: EquipmentTypeList(),
                ),
                ntr1.noOfCores > 1 || ntr1.noOfCores == 1
                    ? Column(
                        children: [
                          //statements
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'R_1a_1n_1000', _R_1a_1n_1000_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'Y_1a_1n_1000', _Y_1a_1n_1000_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'B_1a_1n_1000', _B_1a_1n_1000_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'R_1a_1n_2000', _R_1a_1n_2000_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'Y_1a_1n_2000', _Y_1a_1n_2000_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'B_1a_1n_2000', _B_1a_1n_2000_Controller),

                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'R_1a_1n_3000', _R_1a_1n_3000_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'Y_1a_1n_3000', _Y_1a_1n_3000_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'B_1a_1n_3000', _B_1a_1n_3000_Controller),

                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'R_1a_1n_4000', _R_1a_1n_4000_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'Y_1a_1n_4000', _Y_1a_1n_4000_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'B_1a_1n_4000', _B_1a_1n_4000_Controller),

                          // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                          ntr1.noOfCores > 1 && ntr1.noOfCores == 2
                              ? Column(
                                  children: [
                                    simplifiedFor_Display_for_all_Mobile_numpad(
                                        'R_2a_2n_1000',
                                        _R_2a_2n_1000_Controller),
                                    simplifiedFor_Display_for_all_Mobile_numpad(
                                        'Y_2a_2n_1000',
                                        _Y_2a_2n_1000_Controller),
                                    simplifiedFor_Display_for_all_Mobile_numpad(
                                        'B_2a_2n_1000',
                                        _B_2a_2n_1000_Controller),
                                    simplifiedFor_Display_for_all_Mobile_numpad(
                                        'R_2a_2n_2000',
                                        _R_2a_2n_2000_Controller),
                                    simplifiedFor_Display_for_all_Mobile_numpad(
                                        'Y_2a_2n_2000',
                                        _Y_2a_2n_2000_Controller),
                                    simplifiedFor_Display_for_all_Mobile_numpad(
                                        'B_2a_2n_2000',
                                        _B_2a_2n_2000_Controller),
                                    simplifiedFor_Display_for_all_Mobile_numpad(
                                        'R_2a_2n_3000',
                                        _R_2a_2n_3000_Controller),
                                    simplifiedFor_Display_for_all_Mobile_numpad(
                                        'Y_2a_2n_3000',
                                        _Y_2a_2n_3000_Controller),
                                    simplifiedFor_Display_for_all_Mobile_numpad(
                                        'B_2a_2n_3000',
                                        _B_2a_2n_3000_Controller),
                                    simplifiedFor_Display_for_all_Mobile_numpad(
                                        'R_2a_2n_4000',
                                        _R_2a_2n_4000_Controller),
                                    simplifiedFor_Display_for_all_Mobile_numpad(
                                        'Y_2a_2n_4000',
                                        _Y_2a_2n_4000_Controller),
                                    simplifiedFor_Display_for_all_Mobile_numpad(
                                        'B_2a_2n_4000',
                                        _B_2a_2n_4000_Controller),
                                    ntr1.noOfCores > 1 &&
                                            ntr1.noOfCores > 2 &&
                                            ntr1.noOfCores == 3
                                        ? Column(
                                            children: [
                                              simplifiedFor_Display_for_all_Mobile_numpad(
                                                  'R_3a_3n_1000',
                                                  _R_3a_3n_1000_Controller),
                                              simplifiedFor_Display_for_all_Mobile_numpad(
                                                  'Y_3a_3n_1000',
                                                  _Y_3a_3n_1000_Controller),
                                              simplifiedFor_Display_for_all_Mobile_numpad(
                                                  'B_3a_3n_1000',
                                                  _B_3a_3n_1000_Controller),
                                              simplifiedFor_Display_for_all_Mobile_numpad(
                                                  'R_3a_3n_2000',
                                                  _R_3a_3n_2000_Controller),
                                              simplifiedFor_Display_for_all_Mobile_numpad(
                                                  'Y_3a_3n_2000',
                                                  _Y_3a_3n_2000_Controller),
                                              simplifiedFor_Display_for_all_Mobile_numpad(
                                                  'B_3a_3n_2000',
                                                  _B_3a_3n_2000_Controller),
                                              simplifiedFor_Display_for_all_Mobile_numpad(
                                                  'R_3a_3n_3000',
                                                  _R_3a_3n_3000_Controller),
                                              simplifiedFor_Display_for_all_Mobile_numpad(
                                                  'Y_3a_3n_3000',
                                                  _Y_3a_3n_3000_Controller),
                                              simplifiedFor_Display_for_all_Mobile_numpad(
                                                  'B_3a_3n_3000',
                                                  _B_3a_3n_3000_Controller),
                                              simplifiedFor_Display_for_all_Mobile_numpad(
                                                  'R_3a_3n_4000',
                                                  _R_3a_3n_4000_Controller),
                                              simplifiedFor_Display_for_all_Mobile_numpad(
                                                  'Y_3a_3n_4000',
                                                  _Y_3a_3n_4000_Controller),
                                              simplifiedFor_Display_for_all_Mobile_numpad(
                                                  'B_3a_3n_4000',
                                                  _B_3a_3n_4000_Controller),
                                            ],
                                          )
                                        : Container(),
                                  ],
                                )
                              : Container(),
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
}
