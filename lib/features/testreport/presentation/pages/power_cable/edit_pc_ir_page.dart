import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../data/models/equipment/power_cable/pc_ir_test_model.dart';
import '../../providers/pc_provider/pc_ir_provider.dart';
import '../dropdown_All/MegaGigaTeraRadioButton/mgt_add_pc_ir_page.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditPcIrPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditPcIrPage(this.args, {Key key}) : super(key: key);
  int _pcRefID;
  PcIrTestModel _pcIrTestModel;
  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _rAcontroller = TextEditingController();
  final TextEditingController _yAcontroller = TextEditingController();
  final TextEditingController _bAcontroller = TextEditingController();
  final TextEditingController _rBcontroller = TextEditingController();
  final TextEditingController _yBcontroller = TextEditingController();
  final TextEditingController _bBcontroller = TextEditingController();
  final TextEditingController _ryAcontroller = TextEditingController();
  final TextEditingController _ybAcontroller = TextEditingController();
  final TextEditingController _brAcontroller = TextEditingController();
  final TextEditingController _ryBcontroller = TextEditingController();
  final TextEditingController _ybBcontroller = TextEditingController();
  final TextEditingController _brBcontroller = TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  GMT get selectedGMT_rb => MGT_pc_IR_rb().functionR_rb();
  GMT get selectedGMT_yb => MGT_pc_IR_yb().functionR_yb();
  GMT get selectedGMT_bb => MGT_pc_IR_bb().functionR_bb();
  GMT get selectedGMT_ryb => MGT_pc_IR_ryb().functionR_ryb();
  GMT get selectedGMT_ybb => MGT_pc_IR_ybb().functionR_ybb();
  GMT get selectedGMT_brb => MGT_pc_IR_brb().functionR_brb();
  GMT get selectedGMT_ra => MGT_pc_IR_ra().functionR_ra();
  GMT get selectedGMT_ya => MGT_pc_IR_ya().functionR_ya();
  GMT get selectedGMT_ba => MGT_pc_IR_ba().functionR_ba();
  GMT get selectedGMT_rya => MGT_pc_IR_rya().functionR_rya();
  GMT get selectedGMT_yba => MGT_pc_IR_yba().functionR_yba();
  GMT get selectedGMT_bra => MGT_pc_IR_bRa().functionR_bRa();

  Future<void> getReport() async {
    getX((PcIrProvider x) => x.getPcIrByID(args['id']));
    _pcIrTestModel = watchOnly((PcIrProvider x) => x.pcIrModel);

    _IDcontroller.text = args['id'].toString();
    _nOcontroller.text = args['TrNo'].toString();
    _rBcontroller.text = _pcIrTestModel.rB.toString();
    _yBcontroller.text = _pcIrTestModel.yB.toString();
    _bBcontroller.text = _pcIrTestModel.bB.toString();
    _rAcontroller.text = _pcIrTestModel.rA.toString();
    _yAcontroller.text = _pcIrTestModel.yA.toString();
    _bAcontroller.text = _pcIrTestModel.bA.toString();
    _brAcontroller.text = _pcIrTestModel.brA.toString();
    _ryAcontroller.text = _pcIrTestModel.ryA.toString();
    _ybAcontroller.text = _pcIrTestModel.ybA.toString();
    _brBcontroller.text = _pcIrTestModel.brB.toString();
    _ryBcontroller.text = _pcIrTestModel.ryB.toString();
    _ybBcontroller.text = _pcIrTestModel.ybB.toString();
    _pcRefID = _pcIrTestModel.pcRefId;
  }

  @override
  Widget build(BuildContext context) {
    final PcIrTestModel ntr = watchOnly((PcIrProvider x) => x.pcIrModel);
    getReport();
    var mob = const Text('Edit PC-Ir Details', style: TextStyle(fontSize: 15));
    var desk = const Text('Edit PC-Ir Details', style: TextStyle(fontSize: 20));

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

                  double rA;
                  double rB;
                  double yA;
                  double yB;
                  double bA;
                  double bB;
                  double ryA;
                  double ryB;
                  double ybA;
                  double ybB;
                  double brA;
                  double brB;

                  rA = convertValue(double.parse(_rAcontroller.text),
                      selectedGMT_ra.toString().split('.')[1]);
                  rB = convertValue(double.parse(_rBcontroller.text),
                      selectedGMT_rb.toString().split('.')[1]);
                  yA = convertValue(double.parse(_yAcontroller.text),
                      selectedGMT_ya.toString().split('.')[1]);
                  yB = convertValue(double.parse(_yBcontroller.text),
                      selectedGMT_yb.toString().split('.')[1]);
                  bA = convertValue(double.parse(_bAcontroller.text),
                      selectedGMT_ba.toString().split('.')[1]);
                  bB = convertValue(double.parse(_bBcontroller.text),
                      selectedGMT_bb.toString().split('.')[1]);
                  ryA = convertValue(double.parse(_ryAcontroller.text),
                      selectedGMT_rya.toString().split('.')[1]);
                  ryB = convertValue(double.parse(_ryBcontroller.text),
                      selectedGMT_ryb.toString().split('.')[1]);
                  ybA = convertValue(double.parse(_ybAcontroller.text),
                      selectedGMT_yba.toString().split('.')[1]);
                  ybB = convertValue(double.parse(_ybBcontroller.text),
                      selectedGMT_ybb.toString().split('.')[1]);
                  brA = convertValue(double.parse(_brAcontroller.text),
                      selectedGMT_bra.toString().split('.')[1]);
                  brB = convertValue(double.parse(_brBcontroller.text),
                      selectedGMT_brb.toString().split('.')[1]);

                  //add to remote database
                  var success_code = 201;
                  var success_code1 = 200;
                  var failed_code = 'Server Connection Lost';
                  //add to remote database
                  var url = Uri.parse('${Env.URL_PREFIX}/pcIrTest/' +
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
                    'rB': rB,
                    'yB': yB,
                    'bB': bB,
                    'rA': rA,
                    'yA': yA,
                    'bA': bA,
                    'ryA': ryA,
                    'ybA': ybA,
                    'brA': brA,
                    'ryB': ryB,
                    'ybB': ybB,
                    'brB': brB,
                    "pcRef": args['PC_ID'].toString(),
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
                    final PcIrTestModel pcIrReportToLocal = PcIrTestModel(
                      trNo: int.parse(_nOcontroller.text),
                      pcRefId: _pcRefID,
                      rA: rA,
                      yA: yA,
                      bA: bA,
                      rB: rB,
                      yB: yB,
                      bB: bB,
                      ryA: ryA,
                      ybA: ybA,
                      brA: brA,
                      ryB: ryB,
                      ybB: ybB,
                      brB: brB,
                      databaseID: ntr.databaseID,
                      EquipmentType: selectedValueForEquipmentUse.toString(),
                      lastUpdated: DateTime.now(),
                    );

                    getX((PcIrProvider x) =>
                        x.updatePcIr(pcIrReportToLocal, args['id']));

                    Navigator.popAndPushNamed(context, '/detail_PC_IR',
                        arguments: {
                          'id': args['id'],
                          'PC_ID': args['PC_ID'],
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
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 400) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                elevation: 5,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                    textAlign: TextAlign.center,
                    enabled: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                    textAlign: TextAlign.center,
                    enabled: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(150, 20, 150, 10),
                    child: EquipmentTypeList(),
                  ),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Phase-Earth Before High Voltage Test-R', _rBcontroller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Phase-Earth Before High Voltage Test-Y', _yBcontroller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Phase-Earth Before High Voltage Test-b', _bBcontroller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Phase-Earth Before High Voltage Test-RY',
                      _ryBcontroller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Phase-Earth Before High Voltage Test-YB',
                      _ybBcontroller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Phase-Earth Before High Voltage Test-BR',
                      _brBcontroller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Phase-Earth After High Voltage Test-R', _rAcontroller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Phase-Earth After High Voltage Test-Y', _yAcontroller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Phase-Earth After High Voltage Test-b', _bAcontroller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Phase-Earth After High Voltage Test-RY', _ryAcontroller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Phase-Earth After High Voltage Test-YB', _ybAcontroller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'Phase-Earth After High Voltage Test-BR', _brAcontroller),
                ]),
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                elevation: 5,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                    textAlign: TextAlign.center,
                    enabled: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                    textAlign: TextAlign.center,
                    enabled: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: EquipmentTypeList(),
                  ),
                  MGT_pc_IR_rb(),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'Phase-Earth Before High Voltage Test-R', _rBcontroller),
                  MGT_pc_IR_yb(),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'Phase-Earth Before High Voltage Test-Y', _yBcontroller),
                  MGT_pc_IR_bb(),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'Phase-Earth Before High Voltage Test-b', _bBcontroller),
                  MGT_pc_IR_ryb(),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'Phase-Earth Before High Voltage Test-RY',
                      _ryBcontroller),
                  MGT_pc_IR_ybb(),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'Phase-Earth Before High Voltage Test-YB',
                      _ybBcontroller),
                  MGT_pc_IR_brb(),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'Phase-Earth Before High Voltage Test-BR',
                      _brBcontroller),
                  MGT_pc_IR_ra(),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'Phase-Earth After High Voltage Test-R', _rAcontroller),
                  MGT_pc_IR_ya(),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'Phase-Earth After High Voltage Test-Y', _yAcontroller),
                  MGT_pc_IR_ba(),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'Phase-Earth After High Voltage Test-b', _bAcontroller),
                  MGT_pc_IR_rya(),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'Phase-Earth After High Voltage Test-RY', _ryAcontroller),
                  MGT_pc_IR_yba(),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'Phase-Earth After High Voltage Test-YB', _ybAcontroller),
                  MGT_pc_IR_bRa(),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'Phase-Earth After High Voltage Test-BR', _brAcontroller),
                ]),
              ),
            );
          }
        },
      ),
    );
  }
}
