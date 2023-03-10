import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/PT/pt_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/pt_provider/pt_core_wr_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../data/models/equipment/PT/pt_core_wr_model.dart';
import '../../providers/pt_provider/pt_provider.dart';
import '../dropdown_All/MegaGigaTeraRadioButton/ct_wr_radio_button_page.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditPtWrPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditPtWrPage(this.args, {Key key}) : super(key: key);

  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _Trno_Controller = TextEditingController();
  final TextEditingController _serialNo_Controller = TextEditingController();
  final TextEditingController _R_1a_1n_Controller = TextEditingController();
  final TextEditingController _R_2a_2n_Controller = TextEditingController();
  final TextEditingController _R_3a_3n_Controller = TextEditingController();
  final TextEditingController _Y_1a_1n_Controller = TextEditingController();
  final TextEditingController _Y_2a_2n_Controller = TextEditingController();
  final TextEditingController _Y_3a_3n_Controller = TextEditingController();
  final TextEditingController _B_1a_1n_Controller = TextEditingController();
  final TextEditingController _B_2a_2n_Controller = TextEditingController();
  final TextEditingController _B_3a_3n_Controller = TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Enum_ct_wr get selected_R_1a_1n => Radio_R_1S1_1S2().get_Radio_R_1S1_1S2();
  Enum_ct_wr get selected_R_2a_2n => Radio_R_2S1_2S2().get_Radio_R_2S1_2S2();
  Enum_ct_wr get selected_R_3a_3n => Radio_R_3S1_3S2().get_Radio_R_3S1_3S2();

  Enum_ct_wr get selected_Y_1a_1n => Radio_Y_1S1_1S2().get_Radio_Y_1S1_1S2();
  Enum_ct_wr get selected_Y_2a_2n => Radio_Y_2S1_2S2().get_Radio_Y_2S1_2S2();
  Enum_ct_wr get selected_Y_3a_3n => Radio_Y_3S1_3S2().get_Radio_Y_3S1_3S2();

  Enum_ct_wr get selected_B_1a_1n => Radio_B_1S1_1S2().get_Radio_B_1S1_1S2();
  Enum_ct_wr get selected_B_2a_2n => Radio_B_2S1_2S2().get_Radio_B_2S1_2S2();
  Enum_ct_wr get selected_B_3a_3n => Radio_B_3S1_3S2().get_Radio_B_3S1_3S2();

  Future<void> getReport() async {
    getX((PTcoreWRProvider x) => x.getPTcoreWR_ById(args['id']));
    PTcoreWRModel _ptWRModel =
        watchOnly((PTcoreWRProvider x) => x.ptcoreWR_Model);

    _IDcontroller.text = args['id'].toString();
    _Trno_Controller.text = _ptWRModel.trNo.toString();
    _serialNo_Controller.text = _ptWRModel.serialNo.toString();
    _R_1a_1n_Controller.text = _ptWRModel.R_1a_1n.toString();
    _R_2a_2n_Controller.text = _ptWRModel.R_2a_2n.toString();
    _R_3a_3n_Controller.text = _ptWRModel.R_3a_3n.toString();
    _Y_1a_1n_Controller.text = _ptWRModel.Y_1a_1n.toString();
    _Y_2a_2n_Controller.text = _ptWRModel.Y_2a_2n.toString();
    _Y_3a_3n_Controller.text = _ptWRModel.Y_3a_3n.toString();
    _B_1a_1n_Controller.text = _ptWRModel.B_1a_1n.toString();
    _B_2a_2n_Controller.text = _ptWRModel.B_2a_2n.toString();
    _B_3a_3n_Controller.text = _ptWRModel.B_3a_3n.toString();
  }

  @override
  Widget build(BuildContext context) {
    final PTModel ntr1 = watchOnly((PTProvider x) => x.ptModel);
    getX((PTcoreWRProvider x) => x.getPTcoreWR_ById(args['id']));
    final PTcoreWRModel ntr =
        watchOnly((PTcoreWRProvider x) => x.ptcoreWR_Model);
    getReport();
    var mob = const Text('Edit PT-WR Details', style: TextStyle(fontSize: 15));
    var desk = const Text('Edit PT-WR Details', style: TextStyle(fontSize: 20));

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

                  double R_1a_1n;
                  double R_2a_2n;
                  double R_3a_3n;
                  double Y_1a_1n;
                  double Y_2a_2n;
                  double Y_3a_3n;
                  double B_1a_1n;
                  double B_2a_2n;
                  double B_3a_3n;

                  //////////////////////////////////////
                  if (ntr1.noOfCores == 1 || ntr1.noOfCores == 2) {
                    print('selected Noofcore' + ntr1.noOfCores.toString());
                    _R_3a_3n_Controller.text = '0.00';
                    _Y_3a_3n_Controller.text = '0.00';
                    _B_3a_3n_Controller.text = '0.00';
                    R_3a_3n = 0.00;
                    Y_3a_3n = 0.00;
                    B_3a_3n = 0.00;
                  }

                  if (ntr1.noOfCores == 1) {
                    print('selected Noofcore' + ntr1.noOfCores.toString());
                    _R_2a_2n_Controller.text = '0.00';
                    _Y_2a_2n_Controller.text = '0.00';
                    _B_2a_2n_Controller.text = '0.00';
                    R_2a_2n = 0.00;
                    Y_2a_2n = 0.00;
                    B_2a_2n = 0.00;
                  }

                  R_1a_1n = convertValue(double.parse(_R_1a_1n_Controller.text),
                      selected_R_1a_1n.toString().split('.')[1]);
                  if (R_2a_2n != 0) {
                    R_2a_2n = convertValue(
                        double.parse(_R_2a_2n_Controller.text),
                        selected_R_2a_2n.toString().split('.')[1]);
                  }
                  if (R_3a_3n != 0) {
                    R_3a_3n = convertValue(
                        double.parse(_R_3a_3n_Controller.text),
                        selected_R_3a_3n.toString().split('.')[1]);
                  }

                  Y_1a_1n = convertValue(double.parse(_Y_1a_1n_Controller.text),
                      selected_Y_1a_1n.toString().split('.')[1]);
                  if (Y_2a_2n != 0) {
                    Y_2a_2n = convertValue(
                        double.parse(_Y_2a_2n_Controller.text),
                        selected_Y_2a_2n.toString().split('.')[1]);
                  }
                  if (Y_3a_3n != 0) {
                    Y_3a_3n = convertValue(
                        double.parse(_Y_3a_3n_Controller.text),
                        selected_Y_3a_3n.toString().split('.')[1]);
                  }

                  B_1a_1n = convertValue(double.parse(_B_1a_1n_Controller.text),
                      selected_B_1a_1n.toString().split('.')[1]);
                  if (B_2a_2n != 0) {
                    B_2a_2n = convertValue(
                        double.parse(_B_2a_2n_Controller.text),
                        selected_B_2a_2n.toString().split('.')[1]);
                  }
                  if (B_3a_3n != 0) {
                    B_3a_3n = convertValue(
                        double.parse(_B_3a_3n_Controller.text),
                        selected_B_3a_3n.toString().split('.')[1]);
                  }

                  //add to remote database
                  var url = Uri.parse('${Env.URL_PREFIX}/ptWrTest/' +
                      ntr.databaseID.toString() +
                      '/');

                  Map<String, String> headers = {
                    "Content-type": "application/json",
                    "Authorization": "Bearer $acc_token",
                  };
                  print("***********");
                  print(url);
                  print(args['trDatabaseID'].toString());

                  final Map payload = {
                    "trNo": args['trDatabaseID'].toString(),
                    'R_1a_1n': R_1a_1n.toString(),
                    'R_2a_2n': R_2a_2n.toString(),
                    'R_3a_3n': R_3a_3n.toString(),
                    'Y_1a_1n': Y_1a_1n.toString(),
                    'Y_2a_2n': Y_2a_2n.toString(),
                    'Y_3a_3n': Y_3a_3n.toString(),
                    'B_1a_1n': B_1a_1n.toString(),
                    'B_2a_2n': B_2a_2n.toString(),
                    'B_3a_3n': B_3a_3n.toString(),
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
                    final PTcoreWRModel ptWrReportToLocal = PTcoreWRModel(
                      trNo: int.parse(_Trno_Controller.text),
                      serialNo: _serialNo_Controller.text,
                      R_1a_1n: R_1a_1n,
                      //double.parse(_R_1a_1n_Controller.text),
                      R_2a_2n: R_2a_2n,
                      R_3a_3n: R_3a_3n,
                      Y_1a_1n: Y_1a_1n,
                      Y_2a_2n: Y_2a_2n,
                      Y_3a_3n: Y_3a_3n,
                      B_1a_1n: B_1a_1n,
                      B_2a_2n: B_2a_2n,
                      B_3a_3n: B_3a_3n,
                      equipmentUsed: selectedValueForEquipmentUse.toString(),
                      databaseID: ntr.databaseID,
                      updateDate: DateTime.now(),
                    );

                    getX((PTcoreWRProvider x) =>
                        x.updatePTcoreWR(ptWrReportToLocal, args['id']));
                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_PTcoreWR',
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
                          ntr1.noOfCores > 1 || ntr1.noOfCores == 1
                              ? Column(
                                  children: [
                                    //statements
                                    Radio_R_1S1_1S2(),
                                    simplifiedFor_Diplay_for_all_PC_numpad(
                                        'R-Phase 1a_1n', _R_1a_1n_Controller),

                                    Radio_Y_1S1_1S2(),
                                    simplifiedFor_Diplay_for_all_PC_numpad(
                                        'Y-Phase 1a_1n', _Y_1a_1n_Controller),

                                    Radio_B_1S1_1S2(),
                                    simplifiedFor_Diplay_for_all_PC_numpad(
                                        'B-Phase 1a_1n', _B_1a_1n_Controller),

                                    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                    ntr1.noOfCores > 1 && ntr1.noOfCores == 2
                                        ? Column(
                                            children: [
                                              //statements
                                              Radio_R_2S1_2S2(),
                                              simplifiedFor_Diplay_for_all_PC_numpad(
                                                  'R-Phase 2a_2n',
                                                  _R_2a_2n_Controller),

                                              Radio_Y_2S1_2S2(),
                                              simplifiedFor_Diplay_for_all_PC_numpad(
                                                  'Y-Phase 2a_2n',
                                                  _Y_2a_2n_Controller),

                                              Radio_B_2S1_2S2(),
                                              simplifiedFor_Diplay_for_all_PC_numpad(
                                                  'B-Phase 2a_2n',
                                                  _B_2a_2n_Controller),

                                              // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                              ntr1.noOfCores > 1 &&
                                                      ntr1.noOfCores > 2 &&
                                                      ntr1.noOfCores == 3
                                                  ? Column(
                                                      children: [
                                                        //statements
                                                        Radio_R_3S1_3S2(),
                                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                                            'R-Phase 3a_3n',
                                                            _R_3a_3n_Controller),

                                                        Radio_Y_3S1_3S2(),
                                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                                            'Y-Phase 3a_3n',
                                                            _Y_3a_3n_Controller),

                                                        Radio_B_3S1_3S2(),
                                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                                            'B-Phase 3a_3n',
                                                            _B_3a_3n_Controller),
                                                      ],
                                                    )
                                                  : Container(),
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
                          ntr1.noOfCores > 1 || ntr1.noOfCores == 1
                              ? Column(
                                  children: [
                                    //statements
                                    Radio_R_1S1_1S2(),
                                    simplifiedFor_Display_for_all_Mobile_numpad(
                                        'R-Phase 1a_1n', _R_1a_1n_Controller),

                                    Radio_Y_1S1_1S2(),
                                    simplifiedFor_Display_for_all_Mobile_numpad(
                                        'Y-Phase 1a_1n', _Y_1a_1n_Controller),

                                    Radio_B_1S1_1S2(),
                                    simplifiedFor_Display_for_all_Mobile_numpad(
                                        'B-Phase 1a_1n', _B_1a_1n_Controller),

                                    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                    ntr1.noOfCores > 1 && ntr1.noOfCores == 2
                                        ? Column(
                                            children: [
                                              //statements
                                              Radio_R_2S1_2S2(),
                                              simplifiedFor_Display_for_all_Mobile_numpad(
                                                  'R-Phase 2a_2n',
                                                  _R_2a_2n_Controller),

                                              Radio_Y_2S1_2S2(),
                                              simplifiedFor_Display_for_all_Mobile_numpad(
                                                  'Y-Phase 2a_2n',
                                                  _Y_2a_2n_Controller),

                                              Radio_B_2S1_2S2(),
                                              simplifiedFor_Display_for_all_Mobile_numpad(
                                                  'B-Phase 2a_2n',
                                                  _B_2a_2n_Controller),

                                              // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                              ntr1.noOfCores > 1 &&
                                                      ntr1.noOfCores > 2 &&
                                                      ntr1.noOfCores == 3
                                                  ? Column(
                                                      children: [
                                                        //statements
                                                        Radio_R_3S1_3S2(),
                                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                                            'R-Phase 3a_3n',
                                                            _R_3a_3n_Controller),

                                                        Radio_Y_3S1_3S2(),
                                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                                            'Y-Phase 3a_3n',
                                                            _Y_3a_3n_Controller),

                                                        Radio_B_3S1_3S2(),
                                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                                            'B-Phase 3a_3n',
                                                            _B_3a_3n_Controller),
                                                      ],
                                                    )
                                                  : Container(),
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

  convertValue(double value, String selected) {
    if (selected == 'mega') {
      value = value * 1;
    } else if (selected == 'giga') {
      value = value * 1000;
    } else if (selected == 'terra') {
      value = value * 1000000;
    }
    return value;
  }
}
