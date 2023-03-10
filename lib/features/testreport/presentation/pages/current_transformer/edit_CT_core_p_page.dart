// ignore_for_file: missing_return, missing_required_param, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../data/models/equipment/CT/ct_core_p_model.dart';
import '../../providers/ct_provider/ct_core_p_provider.dart';
import '../dropdown_All/MegaGigaTeraRadioButton/simplified_MGT_polarityCT.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditCTpPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditCTpPage(this.args, {Key key}) : super(key: key);

  CTcorePModel _ctpTestModel;
  final TextEditingController _ID_Controller = TextEditingController();
  final TextEditingController _Trno_Controller = TextEditingController();
  final TextEditingController _serialNo_Controller = TextEditingController();
  final TextEditingController _R_1S1_1S2_Controller = TextEditingController();
  final TextEditingController _R_2S1_2S2_Controller = TextEditingController();
  final TextEditingController _R_3S1_3S2_Controller = TextEditingController();
  final TextEditingController _R_4S1_4S2_Controller = TextEditingController();
  final TextEditingController _R_5S1_5S2_Controller = TextEditingController();
  final TextEditingController _Y_1S1_1S2_Controller = TextEditingController();
  final TextEditingController _Y_2S1_2S2_Controller = TextEditingController();
  final TextEditingController _Y_3S1_3S2_Controller = TextEditingController();
  final TextEditingController _Y_4S1_4S2_Controller = TextEditingController();
  final TextEditingController _Y_5S1_5S2_Controller = TextEditingController();
  final TextEditingController _B_1S1_1S2_Controller = TextEditingController();
  final TextEditingController _B_2S1_2S2_Controller = TextEditingController();
  final TextEditingController _B_3S1_3S2_Controller = TextEditingController();
  final TextEditingController _B_4S1_4S2_Controller = TextEditingController();
  final TextEditingController _B_5S1_5S2_Controller = TextEditingController();
  final TextEditingController _equipmentUsed_Controller =
      TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  GMT get functionR_1S1_1S2 => MGT().functionR_1S1_1S2();
  GMT get functionR_2S1_2S2 => MGT().functionR_2S1_2S2();
  GMT get functionR_3S1_3S2 => MGT().functionR_3S1_3S2();
  GMT get functionR_4S1_4S2 => MGT().functionR_4S1_4S2();
  GMT get functionR_5S1_5S2 => MGT().functionR_5S1_5S2();
  GMT get functionY_1S1_1S2 => MGT().functionY_1S1_1S2();
  GMT get functionY_2S1_2S2 => MGT().functionY_2S1_2S2();
  GMT get functionY_3S1_3S2 => MGT().functionY_3S1_3S2();
  GMT get functionY_4S1_4S2 => MGT().functionY_4S1_4S2();
  GMT get functionY_5S1_5S2 => MGT().functionY_5S1_5S2();
  GMT get functionB_1S1_1S2 => MGT().functionB_1S1_1S2();
  GMT get functionB_2S1_2S2 => MGT().functionB_2S1_2S2();
  GMT get functionB_3S1_3S2 => MGT().functionB_3S1_3S2();
  GMT get functionB_4S1_4S2 => MGT().functionB_4S1_4S2();
  GMT get functionB_5S1_5S2 => MGT().functionB_5S1_5S2();

  Future<void> getReport() async {
    getX((CTcorePProvider x) => x.getCTcoreP_ById(args['id']));
    _ctpTestModel = watchOnly((CTcorePProvider x) => x.ctcoreP_Model);

    _ID_Controller.text = _ctpTestModel.id.toString();
    _Trno_Controller.text = _ctpTestModel.trNo.toString();
    _serialNo_Controller.text = _ctpTestModel.serialNo.toString();
    _equipmentUsed_Controller.text = _ctpTestModel.equipmentUsed.toString();
    _R_1S1_1S2_Controller.text = _ctpTestModel.R_1S1_1S2.toString();
    _R_2S1_2S2_Controller.text = _ctpTestModel.R_2S1_2S2.toString();
    _R_3S1_3S2_Controller.text = _ctpTestModel.R_3S1_3S2.toString();
    _R_4S1_4S2_Controller.text = _ctpTestModel.R_4S1_4S2.toString();
    _R_5S1_5S2_Controller.text = _ctpTestModel.R_5S1_5S2.toString();
    _Y_1S1_1S2_Controller.text = _ctpTestModel.Y_1S1_1S2.toString();
    _Y_2S1_2S2_Controller.text = _ctpTestModel.Y_2S1_2S2.toString();
    _Y_3S1_3S2_Controller.text = _ctpTestModel.Y_3S1_3S2.toString();
    _Y_4S1_4S2_Controller.text = _ctpTestModel.Y_4S1_4S2.toString();
    _Y_5S1_5S2_Controller.text = _ctpTestModel.Y_5S1_5S2.toString();
    _B_1S1_1S2_Controller.text = _ctpTestModel.B_1S1_1S2.toString();
    _B_2S1_2S2_Controller.text = _ctpTestModel.B_2S1_2S2.toString();
    _B_3S1_3S2_Controller.text = _ctpTestModel.B_3S1_3S2.toString();
    _B_4S1_4S2_Controller.text = _ctpTestModel.B_4S1_4S2.toString();
    _B_5S1_5S2_Controller.text = _ctpTestModel.B_5S1_5S2.toString();
  }

  @override
  Widget build(BuildContext context) {
    final CTcorePModel ntr = watchOnly((CTcorePProvider x) => x.ctcoreP_Model);
    getReport();
    var mob = const Text('Edit CT-P Details', style: TextStyle(fontSize: 15));
    var desk = const Text('Edit CT-P Details', style: TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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

                  //variable creation for hold values

                  var R_1S1_1S2;
                  var R_2S1_2S2;
                  var R_3S1_3S2;
                  var R_4S1_4S2;
                  var R_5S1_5S2;

                  var Y_1S1_1S2;
                  var Y_2S1_2S2;
                  var Y_3S1_3S2;
                  var Y_4S1_4S2;
                  var Y_5S1_5S2;

                  var B_1S1_1S2;
                  var B_2S1_2S2;
                  var B_3S1_3S2;
                  var B_4S1_4S2;
                  var B_5S1_5S2;

                  //////////////////////////////////////

                  // ----------------------------------------------
                  if (functionR_1S1_1S2 == GMT.reverse_R_1S1_1S2) {
                    R_1S1_1S2 = 'reverse';
                  } else if (functionR_1S1_1S2 == GMT.forward_R_1S1_1S2) {
                    R_1S1_1S2 = 'forward';
                  } else {
                    R_1S1_1S2 = '0';
                  }

                  if (functionR_2S1_2S2 == GMT.reverse_R_2S1_2S2) {
                    R_2S1_2S2 = 'reverse';
                  } else if (functionR_2S1_2S2 == GMT.forward_R_2S1_2S2) {
                    R_2S1_2S2 = 'forward';
                  } else {
                    R_2S1_2S2 = '0';
                  }

                  if (functionR_3S1_3S2 == GMT.reverse_R_3S1_3S2) {
                    R_3S1_3S2 = 'reverse';
                  } else if (functionR_3S1_3S2 == GMT.forward_R_3S1_3S2) {
                    R_3S1_3S2 = 'forward';
                  } else {
                    R_3S1_3S2 = '0';
                  }

                  if (functionR_4S1_4S2 == GMT.reverse_R_4S1_4S2) {
                    R_4S1_4S2 = 'reverse';
                  } else if (functionR_4S1_4S2 == GMT.forward_R_4S1_4S2) {
                    R_4S1_4S2 = 'forward';
                  } else {
                    R_4S1_4S2 = '0';
                  }

                  if (functionR_5S1_5S2 == GMT.reverse_R_5S1_5S2) {
                    R_5S1_5S2 = 'reverse';
                  } else if (functionR_5S1_5S2 == GMT.forward_R_5S1_5S2) {
                    R_5S1_5S2 = 'forward';
                  } else {
                    R_5S1_5S2 = '0';
                  }

                  if (functionY_1S1_1S2 == GMT.reverse_Y_1S1_1S2) {
                    Y_1S1_1S2 = 'reverse';
                  } else if (functionY_1S1_1S2 == GMT.forward_Y_1S1_1S2) {
                    Y_1S1_1S2 = 'forward';
                  } else {
                    Y_1S1_1S2 = '0';
                  }

                  if (functionY_2S1_2S2 == GMT.reverse_Y_2S1_2S2) {
                    Y_2S1_2S2 = 'reverse';
                  } else if (functionY_2S1_2S2 == GMT.forward_Y_2S1_2S2) {
                    Y_2S1_2S2 = 'forward';
                  } else {
                    Y_2S1_2S2 = '0';
                  }

                  if (functionY_3S1_3S2 == GMT.reverse_Y_3S1_3S2) {
                    Y_3S1_3S2 = 'reverse';
                  } else if (functionY_3S1_3S2 == GMT.forward_Y_3S1_3S2) {
                    Y_3S1_3S2 = 'forward';
                  } else {
                    Y_3S1_3S2 = '0';
                  }

                  if (functionY_4S1_4S2 == GMT.reverse_Y_4S1_4S2) {
                    Y_4S1_4S2 = 'reverse';
                  } else if (functionY_4S1_4S2 == GMT.forward_Y_4S1_4S2) {
                    Y_4S1_4S2 = 'forward';
                  } else {
                    Y_4S1_4S2 = '0';
                  }

                  if (functionY_5S1_5S2 == GMT.reverse_Y_5S1_5S2) {
                    Y_5S1_5S2 = 'reverse';
                  } else if (functionY_5S1_5S2 == GMT.forward_Y_5S1_5S2) {
                    Y_5S1_5S2 = 'forward';
                  } else {
                    Y_5S1_5S2 = '0';
                  }

                  if (functionB_1S1_1S2 == GMT.reverse_B_1S1_1S2) {
                    B_1S1_1S2 = 'reverse';
                  } else if (functionB_1S1_1S2 == GMT.forward_B_1S1_1S2) {
                    B_1S1_1S2 = 'forward';
                  } else {
                    B_1S1_1S2 = '0';
                  }

                  if (functionB_2S1_2S2 == GMT.reverse_B_2S1_2S2) {
                    B_2S1_2S2 = 'reverse';
                  } else if (functionB_2S1_2S2 == GMT.forward_B_2S1_2S2) {
                    B_2S1_2S2 = 'forward';
                  } else {
                    B_2S1_2S2 = '0';
                  }

                  if (functionB_3S1_3S2 == GMT.reverse_B_3S1_3S2) {
                    B_3S1_3S2 = 'reverse';
                  } else if (functionB_3S1_3S2 == GMT.forward_B_3S1_3S2) {
                    B_3S1_3S2 = 'forward';
                  } else {
                    B_3S1_3S2 = '0';
                  }

                  if (functionB_4S1_4S2 == GMT.reverse_B_4S1_4S2) {
                    B_4S1_4S2 = 'reverse';
                  } else if (functionB_4S1_4S2 == GMT.forward_B_4S1_4S2) {
                    B_4S1_4S2 = 'forward';
                  } else {
                    B_4S1_4S2 = '0';
                  }

                  if (functionB_5S1_5S2 == GMT.reverse_B_5S1_5S2) {
                    B_5S1_5S2 = 'reverse';
                  } else if (functionB_5S1_5S2 == GMT.forward_B_5S1_5S2) {
                    B_5S1_5S2 = 'forward';
                  } else {
                    B_5S1_5S2 = '0';
                  }

                  //Values contained based on the condition of cores
                  _R_1S1_1S2_Controller.text = R_1S1_1S2;
                  _R_2S1_2S2_Controller.text = R_2S1_2S2;
                  _R_3S1_3S2_Controller.text = R_3S1_3S2;
                  _R_4S1_4S2_Controller.text = R_4S1_4S2;
                  _R_5S1_5S2_Controller.text = R_5S1_5S2;
                  _Y_1S1_1S2_Controller.text = Y_1S1_1S2;
                  _Y_2S1_2S2_Controller.text = Y_2S1_2S2;
                  _Y_3S1_3S2_Controller.text = Y_3S1_3S2;
                  _Y_4S1_4S2_Controller.text = Y_4S1_4S2;
                  _Y_5S1_5S2_Controller.text = Y_5S1_5S2;
                  _B_1S1_1S2_Controller.text = B_1S1_1S2;
                  _B_2S1_2S2_Controller.text = B_2S1_2S2;
                  _B_3S1_3S2_Controller.text = B_3S1_3S2;
                  _B_4S1_4S2_Controller.text = B_4S1_4S2;
                  _B_5S1_5S2_Controller.text = B_5S1_5S2;

                  //add to remote database
                  var success_code = 201;
                  var success_code1 = 200;
                  var failed_code = 'Server Connection Lost';
                  //add to remote database
                  var url = Uri.parse('${Env.URL_PREFIX}/ctCorePTest/' +
                      ntr.databaseID.toString() +
                      '/');

                  Map<String, String> headers = {
                    "Content-type": "application/json",
                    "Authorization": "Bearer $acc_token",
                  };
                  print("***********");
                  print(args['trDatabaseID'].toString());

                  print(url);

                  final Map payload = {
                    'trNo': args['trDatabaseID'].toString(),
                    'serialNo': args['CT_ID'].toString(),
                    'equipmentUsed': selectedValueForEquipmentUse.toString(),
                    'R_1S1_1S2': _R_1S1_1S2_Controller.text.toString(),
                    'R_2S1_2S2': _R_2S1_2S2_Controller.text.toString(),
                    'R_3S1_3S2': _R_3S1_3S2_Controller.text.toString(),
                    'R_4S1_4S2': _R_4S1_4S2_Controller.text.toString(),
                    'R_5S1_5S2': _R_5S1_5S2_Controller.text.toString(),
                    'Y_1S1_1S2': _Y_1S1_1S2_Controller.text.toString(),
                    'Y_2S1_2S2': _Y_2S1_2S2_Controller.text.toString(),
                    'Y_3S1_3S2': _Y_3S1_3S2_Controller.text.toString(),
                    'Y_4S1_4S2': _Y_4S1_4S2_Controller.text.toString(),
                    'Y_5S1_5S2': _Y_5S1_5S2_Controller.text.toString(),
                    'B_1S1_1S2': _B_1S1_1S2_Controller.text.toString(),
                    'B_2S1_2S2': _B_2S1_2S2_Controller.text.toString(),
                    'B_3S1_3S2': _B_3S1_3S2_Controller.text.toString(),
                    'B_4S1_4S2': _B_4S1_4S2_Controller.text.toString(),
                    'B_5S1_5S2': _B_5S1_5S2_Controller.text.toString(),
                    'updateDate': DateTime.now().toString(),
                  };
                  var response = await http.put(url,
                      body: jsonEncode(payload), headers: headers);

                  if (response.statusCode == success_code ||
                      response.statusCode == success_code1) {
                    print('Response status: ${response.statusCode}');
                    print('Response body: ${response.body}');
                    print('Stored successfully');

                    //add to local database
                    final CTcorePModel ctpReportToLocal = CTcorePModel(
                      trNo: int.parse(_Trno_Controller.text),
                      serialNo: _serialNo_Controller.text,
                      R_1S1_1S2: _R_1S1_1S2_Controller.text.toString(),
                      R_2S1_2S2: _R_2S1_2S2_Controller.text.toString(),
                      R_3S1_3S2: _R_3S1_3S2_Controller.text.toString(),
                      R_4S1_4S2: _R_4S1_4S2_Controller.text.toString(),
                      R_5S1_5S2: _R_5S1_5S2_Controller.text.toString(),
                      Y_1S1_1S2: _Y_1S1_1S2_Controller.text.toString(),
                      Y_2S1_2S2: _Y_2S1_2S2_Controller.text.toString(),
                      Y_3S1_3S2: _Y_3S1_3S2_Controller.text.toString(),
                      Y_4S1_4S2: _Y_4S1_4S2_Controller.text.toString(),
                      Y_5S1_5S2: _Y_5S1_5S2_Controller.text.toString(),
                      B_1S1_1S2: _B_1S1_1S2_Controller.text.toString(),
                      B_2S1_2S2: _B_2S1_2S2_Controller.text.toString(),
                      B_3S1_3S2: _B_3S1_3S2_Controller.text.toString(),
                      B_4S1_4S2: _B_4S1_4S2_Controller.text.toString(),
                      B_5S1_5S2: _B_5S1_5S2_Controller.text.toString(),
                      equipmentUsed: selectedValueForEquipmentUse.toString(),
                      databaseID: ntr.databaseID,
                      updateDate: DateTime.now(),
                    );

                    getX((CTcorePProvider x) =>
                        x.updateCTcoreP(ctpReportToLocal, args['id']));

                    Navigator.popAndPushNamed(context, '/detail_CTcoreP',
                        arguments: {
                          'id': args['id'],
                          'CT_ID': args['CT_ID'],
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(150, 10, 150, 10),
                        child: Text(
                          'Trno',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5),
                        )),
                    TextFormField(
                      controller: _Trno_Controller,
                      textAlign: TextAlign.center,
                      enabled: false,
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(150, 10, 150, 10),
                        child: Text(
                          'serialNo_bph',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5),
                        )),
                    TextFormField(
                      controller: _serialNo_Controller,
                      textAlign: TextAlign.center,
                      enabled: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: EquipmentTypeList(),
                    ),
                    Divider(color: Colors.black, thickness: 1),
                    MGT(),
                  ],
                ),
              ),
            );
            // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>ELSE-MOBILE-VIEW-PART>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
          } else {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          'TrNo',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5),
                        )),
                    TextFormField(
                      controller: _Trno_Controller,
                      textAlign: TextAlign.center,
                      enabled: false,
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          'serialNo_bph',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5),
                        )),
                    TextFormField(
                      controller: _serialNo_Controller,
                      textAlign: TextAlign.center,
                      enabled: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: EquipmentTypeList(),
                    ),
                    Divider(color: Colors.black, thickness: 1),
                    MGT(),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
