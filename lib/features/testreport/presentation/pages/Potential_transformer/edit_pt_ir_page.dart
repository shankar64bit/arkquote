import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/PT/pt_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../data/models/equipment/PT/pt_ir_model.dart';
import '../../providers/pt_provider/pt_ir_provider.dart';
import '../../providers/pt_provider/pt_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditPtIrPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditPtIrPage(this.args, {Key key}) : super(key: key);

  final TextEditingController _IDcontroller = TextEditingController();

  final TextEditingController _Trno_Controller = TextEditingController();
  final TextEditingController _serialNo_Controller = TextEditingController();
  final TextEditingController _peR_Controller = TextEditingController();
  final TextEditingController _peY_Controller = TextEditingController();
  final TextEditingController _peB_Controller = TextEditingController();
  final TextEditingController _pc1R_Controller = TextEditingController();
  final TextEditingController _pc2R_Controller = TextEditingController();
  final TextEditingController _pc3R_Controller = TextEditingController();

  final TextEditingController _pc1Y_Controller = TextEditingController();
  final TextEditingController _pc2Y_Controller = TextEditingController();
  final TextEditingController _pc3Y_Controller = TextEditingController();

  final TextEditingController _pc1B_Controller = TextEditingController();
  final TextEditingController _pc2B_Controller = TextEditingController();
  final TextEditingController _pc3B_Controller = TextEditingController();

  final TextEditingController _c1eR_Controller = TextEditingController();
  final TextEditingController _c2eR_Controller = TextEditingController();
  final TextEditingController _c3eR_Controller = TextEditingController();

  final TextEditingController _c1eY_Controller = TextEditingController();
  final TextEditingController _c2eY_Controller = TextEditingController();
  final TextEditingController _c3eY_Controller = TextEditingController();

  final TextEditingController _c1eB_Controller = TextEditingController();
  final TextEditingController _c2eB_Controller = TextEditingController();
  final TextEditingController _c3eB_Controller = TextEditingController();

  final TextEditingController _c1c2R_Controller = TextEditingController();
  final TextEditingController _c1c2Y_Controller = TextEditingController();
  final TextEditingController _c1c2B_Controller = TextEditingController();

  final TextEditingController _c2c3R_Controller = TextEditingController();
  final TextEditingController _c2c3Y_Controller = TextEditingController();
  final TextEditingController _c2c3B_Controller = TextEditingController();

  final TextEditingController _clc1R_Controller = TextEditingController();
  final TextEditingController _clc1Y_Controller = TextEditingController();
  final TextEditingController _clc1B_Controller = TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Future<void> getReport() async {
    getX((PTcoreIRProvider x) => x.getPTcoreIR_ById(args['id']));
    PTcoreIRModel _ptIrModel =
        watchOnly((PTcoreIRProvider x) => x.ptcoreIR_Model);

    _IDcontroller.text = args['id'].toString();
    _Trno_Controller.text = _ptIrModel.trNo.toString();
    // args['TrNo'].toString();
    _serialNo_Controller.text = _ptIrModel.serialNo.toString();
    //args['Serial_No'];
    _peR_Controller.text = _ptIrModel.peR.toString();
    _peY_Controller.text = _ptIrModel.peY.toString();
    _peB_Controller.text = _ptIrModel.peB.toString();
    _pc1R_Controller.text = _ptIrModel.pc1R.toString();
    _pc1Y_Controller.text = _ptIrModel.pc1Y.toString();
    _pc1B_Controller.text = _ptIrModel.pc1B.toString();

    _pc2R_Controller.text = _ptIrModel.pc2R.toString();
    _pc2Y_Controller.text = _ptIrModel.pc2Y.toString();
    _pc2B_Controller.text = _ptIrModel.pc2B.toString();

    _pc3R_Controller.text = _ptIrModel.pc3R.toString();
    _pc3Y_Controller.text = _ptIrModel.pc3Y.toString();
    _pc3B_Controller.text = _ptIrModel.pc3B.toString();

    _c1eR_Controller.text = _ptIrModel.c1eR.toString();
    _c2eR_Controller.text = _ptIrModel.c2eR.toString();
    _c3eR_Controller.text = _ptIrModel.c3eR.toString();

    _c1eY_Controller.text = _ptIrModel.c1eY.toString();
    _c2eY_Controller.text = _ptIrModel.c2eY.toString();
    _c3eY_Controller.text = _ptIrModel.c3eY.toString();

    _c1eB_Controller.text = _ptIrModel.c1eB.toString();
    _c2eB_Controller.text = _ptIrModel.c2eB.toString();
    _c3eB_Controller.text = _ptIrModel.c3eB.toString();

    _c1c2R_Controller.text = _ptIrModel.c1c2R.toString();
    _c1c2Y_Controller.text = _ptIrModel.c1c2Y.toString();
    _c1c2B_Controller.text = _ptIrModel.c1c2B.toString();

    _c2c3R_Controller.text = _ptIrModel.c2c3R.toString();
    _c2c3Y_Controller.text = _ptIrModel.c2c3Y.toString();
    _c2c3B_Controller.text = _ptIrModel.c2c3B.toString();
    _clc1R_Controller.text = _ptIrModel.clc1R.toString();
    _clc1Y_Controller.text = _ptIrModel.clc1Y.toString();
    _clc1B_Controller.text = _ptIrModel.clc1B.toString();
  }

  @override
  Widget build(BuildContext context) {
    final PTModel ntr1 = watchOnly((PTProvider x) => x.ptModel);
    getX((PTcoreIRProvider x) => x.getPTcoreIR_ById(args['id']));
    final PTcoreIRModel ntr =
        watchOnly((PTcoreIRProvider x) => x.ptcoreIR_Model);
    getReport();
    var mob = const Text('Edit PT-IR Details', style: TextStyle(fontSize: 15));
    var desk = const Text('Edit PT-IR Details', style: TextStyle(fontSize: 20));

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
                  var url = Uri.parse(
                      '${Env.URL_PREFIX}/ptIrTest/${ntr.databaseID}/');

                  if (ntr1.noOfCores == 1 || ntr1.noOfCores == 2) {
                    // print('selected Noofcore' + ntr1.noOfCores.toString());
                    _pc3R_Controller.text = '0.00';
                    _pc3Y_Controller.text = '0.00';
                    _pc3B_Controller.text = '0.00';
                    _c3eR_Controller.text = '0.00';
                    _c3eY_Controller.text = '0.00';
                    _c3eB_Controller.text = '0.00';
                    _c2c3R_Controller.text = '0.00';
                    _c2c3Y_Controller.text = '0.00';
                    _c2c3B_Controller.text = '0.00';
                    _clc1R_Controller.text = '0.00';
                    _clc1Y_Controller.text = '0.00';
                    _clc1B_Controller.text = '0.00';
                  }
                  if (ntr1.noOfCores == 1) {
                    // print('selected Noofcore' + ntr1.noOfCores.toString());
                    _pc2R_Controller.text = '0.00';
                    _pc2Y_Controller.text = '0.00';
                    _pc2B_Controller.text = '0.00';
                    _c2eR_Controller.text = '0.00';
                    _c2eY_Controller.text = '0.00';
                    _c2eB_Controller.text = '0.00';
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
                    'peR': _peR_Controller.text.toString(),
                    'peY': _peY_Controller.text.toString(),
                    'peB': _peB_Controller.text.toString(),
                    'pc1R': _pc1R_Controller.text.toString(),
                    'pc2R': _pc2R_Controller.text.toString(),
                    'pc3R': _pc3R_Controller.text.toString(),
                    'pc1Y': _pc1Y_Controller.text.toString(),
                    'pc2Y': _pc2Y_Controller.text.toString(),
                    'pc3Y': _pc3Y_Controller.text.toString(),
                    'pc1B': _pc1B_Controller.text.toString(),
                    'pc2B': _pc2B_Controller.text.toString(),
                    'pc3B': _pc3B_Controller.text.toString(),
                    'c1eR': _c1eR_Controller.text.toString(),
                    'c2eR': _c2eR_Controller.text.toString(),
                    'c3eR': _c3eR_Controller.text.toString(),
                    'c1eY': _c1eY_Controller.text.toString(),
                    'c2eY': _c2eY_Controller.text.toString(),
                    'c3eY': _c3eY_Controller.text.toString(),
                    'c1eB': _c1eB_Controller.text.toString(),
                    'c2eB': _c2eB_Controller.text.toString(),
                    'c3eB': _c3eB_Controller.text.toString(),
                    'c1c2R': _c1c2R_Controller.text.toString(),
                    'c1c2Y': _c1c2Y_Controller.text.toString(),
                    'c1c2B': _c1c2B_Controller.text.toString(),
                    'c2c3R': _c2c3R_Controller.text.toString(),
                    'c2c3Y': _c2c3Y_Controller.text.toString(),
                    'c2c3B': _c2c3B_Controller.text.toString(),
                    'clc1R': _clc1R_Controller.text.toString(),
                    'clc1Y': _clc1Y_Controller.text.toString(),
                    'clc1B': _clc1B_Controller.text.toString(),
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
                    final PTcoreIRModel ptRReportToLocal = PTcoreIRModel(
                      trNo: int.parse(_Trno_Controller.text),
                      serialNo: _serialNo_Controller.text,
                      peR: double.parse(_peR_Controller.text),
                      peY: double.parse(_peY_Controller.text),
                      peB: double.parse(_peB_Controller.text),
                      pc1R: double.parse(_pc1R_Controller.text),
                      pc2R: double.parse(_pc2R_Controller.text),
                      pc3R: double.parse(_pc3R_Controller.text),
                      pc1Y: double.parse(_pc1Y_Controller.text),
                      pc2Y: double.parse(_pc2Y_Controller.text),
                      pc3Y: double.parse(_pc3Y_Controller.text),
                      pc1B: double.parse(_pc1B_Controller.text),
                      pc2B: double.parse(_pc2B_Controller.text),
                      pc3B: double.parse(_pc3B_Controller.text),
                      c1eR: double.parse(_c1eR_Controller.text),
                      c2eR: double.parse(_c2eR_Controller.text),
                      c3eR: double.parse(_c3eR_Controller.text),
                      c1eY: double.parse(_c1eY_Controller.text),
                      c2eY: double.parse(_c2eY_Controller.text),
                      c3eY: double.parse(_c3eY_Controller.text),
                      c1eB: double.parse(_c1eB_Controller.text),
                      c2eB: double.parse(_c2eB_Controller.text),
                      c3eB: double.parse(_c3eB_Controller.text),
                      c1c2R: double.parse(_c1c2R_Controller.text),
                      c1c2Y: double.parse(_c1c2Y_Controller.text),
                      c1c2B: double.parse(_c1c2B_Controller.text),
                      c2c3R: double.parse(_c2c3R_Controller.text),
                      c2c3Y: double.parse(_c2c3Y_Controller.text),
                      c2c3B: double.parse(_c2c3B_Controller.text),
                      clc1R: double.parse(_clc1R_Controller.text),
                      clc1Y: double.parse(_clc1Y_Controller.text),
                      clc1B: double.parse(_clc1B_Controller.text),
                      equipmentUsed: selectedValueForEquipmentUse.toString(),
                      databaseID: ntr.databaseID,
                      updateDate: DateTime.now(),
                    );

                    getX((PTcoreIRProvider x) =>
                        x.updatePTcoreIR(ptRReportToLocal, args['id']));
                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_PTcoreIR',
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

  build_body(BuildContext context, PTModel ntr) {
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
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Primary to Earth R-Phase', _peR_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Primary to Earth Y-Phase', _peY_Controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Primary to Earth B-Phase', _peB_Controller),

                Divider(color: Colors.black, thickness: 1),
                ////////////////////////////////////////////
                ntr.noOfCores > 1 || ntr.noOfCores == 1
                    ? Column(
                        children: [
                          //statements
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'Primary to core1 R-Phase', _pc1R_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'Primary to core1 Y-Phase', _pc1Y_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'Primary to core1 B-Phase', _pc1B_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'core 1 to Earth R-Phase', _c1eR_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'core 1 to Earth Y-Phase', _c1eY_Controller),
                          simplifiedFor_Diplay_for_all_PC_numpad(
                              'core 1 to Earth B-Phase', _c1eB_Controller),

                          // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                          ntr.noOfCores > 1 && ntr.noOfCores == 2
                              ? Column(
                                  children: [
                                    //statements
                                    simplifiedFor_Diplay_for_all_PC_numpad(
                                        'Primary to core 2 R-Phase',
                                        _pc2R_Controller),
                                    simplifiedFor_Diplay_for_all_PC_numpad(
                                        'Primary to core 2 Y-Phase',
                                        _pc2Y_Controller),
                                    simplifiedFor_Diplay_for_all_PC_numpad(
                                        'Primary to core 2 B-Phase',
                                        _pc2B_Controller),

                                    simplifiedFor_Diplay_for_all_PC_numpad(
                                        'core 2 to Earth R-Phase',
                                        _c2eR_Controller),
                                    simplifiedFor_Diplay_for_all_PC_numpad(
                                        'core 2 to Earth Y-Phase',
                                        _c2eY_Controller),
                                    simplifiedFor_Diplay_for_all_PC_numpad(
                                        'core 2 to Earth B-Phase',
                                        _c2eB_Controller),
                                    simplifiedFor_Diplay_for_all_PC_numpad(
                                        'core 1 to core 2 R-Phase',
                                        _c1c2R_Controller),
                                    simplifiedFor_Diplay_for_all_PC_numpad(
                                        'core 1 to core 2 Y-Phase',
                                        _c1c2Y_Controller),
                                    simplifiedFor_Diplay_for_all_PC_numpad(
                                        'core 1 to core 2 B-Phase',
                                        _c1c2B_Controller),

                                    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                    ntr.noOfCores > 1 &&
                                            ntr.noOfCores > 2 &&
                                            ntr.noOfCores == 3
                                        ? Column(
                                            children: [
                                              //statemets
                                              simplifiedFor_Diplay_for_all_PC_numpad(
                                                  'Primary to core 3 R-Phase',
                                                  _pc3R_Controller),
                                              simplifiedFor_Diplay_for_all_PC_numpad(
                                                  'Primary to core 3 Y-Phase',
                                                  _pc3Y_Controller),
                                              simplifiedFor_Diplay_for_all_PC_numpad(
                                                  'Primary to core 3 B-Phase',
                                                  _pc3B_Controller),
                                              simplifiedFor_Diplay_for_all_PC_numpad(
                                                  'core 3 to Earth R-Phase',
                                                  _c3eR_Controller),
                                              simplifiedFor_Diplay_for_all_PC_numpad(
                                                  'core 3 to Earth Y-Phase',
                                                  _c3eY_Controller),
                                              simplifiedFor_Diplay_for_all_PC_numpad(
                                                  'core 3 to Earth B-Phase',
                                                  _c3eB_Controller),
                                              simplifiedFor_Diplay_for_all_PC_numpad(
                                                  'core 2 to core 3 R-Phase',
                                                  _c2c3R_Controller),
                                              simplifiedFor_Diplay_for_all_PC_numpad(
                                                  'core 2 to core 3 Y-Phase',
                                                  _c2c3Y_Controller),
                                              simplifiedFor_Diplay_for_all_PC_numpad(
                                                  'core 2 to core 3 B-Phase',
                                                  _c2c3B_Controller),
                                              simplifiedFor_Diplay_for_all_PC_numpad(
                                                  'core 3 to core 1 R-Phase',
                                                  _clc1R_Controller),
                                              simplifiedFor_Diplay_for_all_PC_numpad(
                                                  'core 3 to core 1 Y-Phase',
                                                  _clc1Y_Controller),
                                              simplifiedFor_Diplay_for_all_PC_numpad(
                                                  'core 3 to core 1 B-Phase',
                                                  _clc1B_Controller),
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

                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Primary to Earth R-Phase', _peR_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Primary to Earth Y-Phase', _peY_Controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Primary to Earth B-Phase', _peB_Controller),

                Divider(color: Colors.black, thickness: 1),
                ////////////////////////////////////////////
                ntr.noOfCores > 1 || ntr.noOfCores == 1
                    ? Column(
                        children: [
                          //statements
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'Primary to core 1 R-Phase', _pc1R_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'Primary to core 1 Y-Phase', _pc1Y_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'Primary to core 1 B-Phase', _pc1B_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'core 1 to Earth R-Phase', _c1eR_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'core 1 to Earth Y-Phase', _c1eY_Controller),
                          simplifiedFor_Display_for_all_Mobile_numpad(
                              'core 1 to Earth B-Phase', _c1eB_Controller),

                          // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                          ntr.noOfCores > 1 && ntr.noOfCores == 2
                              ? Column(
                                  children: [
                                    //statements
                                    simplifiedFor_Display_for_all_Mobile_numpad(
                                        'Primary to core 2 R-Phase',
                                        _pc2R_Controller),
                                    simplifiedFor_Display_for_all_Mobile_numpad(
                                        'Primary to core 2 Y-Phase',
                                        _pc2Y_Controller),
                                    simplifiedFor_Display_for_all_Mobile_numpad(
                                        'Primary to core 2 B-Phase',
                                        _pc2B_Controller),

                                    simplifiedFor_Display_for_all_Mobile_numpad(
                                        'core 2 to Earth R-Phase',
                                        _c2eR_Controller),
                                    simplifiedFor_Display_for_all_Mobile_numpad(
                                        'core 2 to Earth Y-Phase',
                                        _c2eY_Controller),
                                    simplifiedFor_Display_for_all_Mobile_numpad(
                                        'core 2 to Earth B-Phase',
                                        _c2eB_Controller),

                                    simplifiedFor_Display_for_all_Mobile_numpad(
                                        'core 1 to core 2 R-Phase',
                                        _c1c2R_Controller),
                                    simplifiedFor_Display_for_all_Mobile_numpad(
                                        'core 1 to core 2 Y-Phase',
                                        _c1c2Y_Controller),
                                    simplifiedFor_Display_for_all_Mobile_numpad(
                                        'core 1 to core 2 B-Phase',
                                        _c1c2B_Controller),

                                    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                    ntr.noOfCores > 1 &&
                                            ntr.noOfCores > 2 &&
                                            ntr.noOfCores == 3
                                        ? Column(
                                            children: [
                                              //statemets
                                              simplifiedFor_Display_for_all_Mobile_numpad(
                                                  'Primary to core 3 R-Phase',
                                                  _pc3R_Controller),
                                              simplifiedFor_Display_for_all_Mobile_numpad(
                                                  'Primary to core 3 Y-Phase',
                                                  _pc3Y_Controller),
                                              simplifiedFor_Display_for_all_Mobile_numpad(
                                                  'Primary to core 3 B-Phase',
                                                  _pc3B_Controller),
                                              simplifiedFor_Display_for_all_Mobile_numpad(
                                                  'core 3 to Earth R-Phase',
                                                  _c3eR_Controller),
                                              simplifiedFor_Display_for_all_Mobile_numpad(
                                                  'core 3 to Earth Y-Phase',
                                                  _c3eY_Controller),
                                              simplifiedFor_Display_for_all_Mobile_numpad(
                                                  'core 3 to Earth B-Phase',
                                                  _c3eB_Controller),

                                              simplifiedFor_Display_for_all_Mobile_numpad(
                                                  'core 2 to core 3 R-Phase',
                                                  _c2c3R_Controller),
                                              simplifiedFor_Display_for_all_Mobile_numpad(
                                                  'core 2 to core 3 Y-Phase',
                                                  _c2c3Y_Controller),
                                              simplifiedFor_Display_for_all_Mobile_numpad(
                                                  'core 2 to core 3 B-Phase',
                                                  _c2c3B_Controller),
                                              simplifiedFor_Display_for_all_Mobile_numpad(
                                                  'core 3 to core 1 R-Phase',
                                                  _clc1R_Controller),
                                              simplifiedFor_Display_for_all_Mobile_numpad(
                                                  'core 3 to core 1 Y-Phase',
                                                  _clc1Y_Controller),
                                              simplifiedFor_Display_for_all_Mobile_numpad(
                                                  'core 3 to core 1 B-Phase',
                                                  _clc1B_Controller),
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
