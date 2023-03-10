import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../data/models/equipment/IT/it_model.dart';
import '../../../data/models/equipment/IT/it_wr_model.dart';
import '../../providers/it_provider/it_provider.dart';
import '../../providers/it_provider/it_wr_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';
import '../dropdown_All/it_wr_hvlv_option.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditItWrPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditItWrPage(this.args, {Key key}) : super(key: key);
  String optChoose;
  ItWrTestModel _itWrTestModel;
  final TextEditingController _IDcontroller = TextEditingController();

  final TextEditingController _Trno_Controller = TextEditingController();
  final TextEditingController _serialNo_Controller = TextEditingController();
  final TextEditingController _uVController = TextEditingController();
  final TextEditingController _vWController = TextEditingController();
  final TextEditingController _wUController = TextEditingController();
  final TextEditingController _tapPositionController = TextEditingController();

  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Future<void> getReport() async {
    getX((ItWrProvider x) => x.getItWrByID(args['id']));
    _itWrTestModel = watchOnly((ItWrProvider x) => x.itWrModel);

    _IDcontroller.text = args['id'].toString();
    _Trno_Controller.text = args['TrNo'].toString();
    _serialNo_Controller.text = args['SerialNo'];
    _uVController.text = _itWrTestModel.uV.toString();
    _vWController.text = _itWrTestModel.vW.toString();
    _wUController.text = _itWrTestModel.wU.toString();
    _tapPositionController.text = _itWrTestModel.tapPosition;
  }

  @override
  Widget build(BuildContext context) {
    final ItModel ntr1 = watchOnly((ItProvider x) => x.itModel);

    final ItWrTestModel ntr = watchOnly((ItWrProvider x) => x.itWrModel);
    getReport();
    var mob = const Text('Edit IT-WR Details', style: TextStyle(fontSize: 15));
    var desk = const Text('Edit IT-WR Details', style: TextStyle(fontSize: 20));

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
                  optChoose = HVLV().get_HVLV().toString().split('.')[1];

                  if (checkVectoreGroup(ntr1) &&
                      (optChoose == 'lv3' || optChoose == 'lv4')) {
                    _showAlertDialog(context);
                  } else {
                    //add to remote database
                    var success_code = 201;
                    var success_code1 = 200;
                    var failed_code = 'Server Connection Lost';

                    //add to remote database
                    var url = Uri.parse('${Env.URL_PREFIX}/itWrTest/' +
                        ntr.databaseID.toString() +
                        '/');

                    Map<String, String> headers = {
                      "Content-type": "application/json",
                      "Authorization": "Bearer $acc_token",
                    };
                    print("***********");
                    print(args['trDatabaseID'].toString());

                    final Map payload = {
                      'trNo': args['trDatabaseID'].toString(),
                      'serialNo': ntr1.databaseID.toString(),
                      // 'serialNo': args['itDatabaseID'].toString(),
                      'equipmentUsed': selectedValueForEquipmentUse.toString(),
                      'uV': _uVController.text,
                      'vW': _vWController.text,
                      'wU': _wUController.text,
                      'tapPosition': _tapPositionController.text,
                      'hvLVOpt': optChoose,
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
                      final ItWrTestModel itWrReportToLocal = ItWrTestModel(
                        trNo: int.parse(_Trno_Controller.text),
                        serialNo: _serialNo_Controller.text,
                        uV: double.parse(_uVController.text),
                        vW: double.parse(_vWController.text),
                        wU: double.parse(_wUController.text),
                        tapPosition: _tapPositionController.text,
                        hvLVOpt: optChoose,
                        databaseID: ntr.databaseID,
                        equipmentUsed: selectedValueForEquipmentUse.toString(),
                        updateDate: DateTime.now(),
                      );

                      getX((ItWrProvider x) =>
                          x.updateItWr(itWrReportToLocal, args['id']));
                      Navigator.pop(context);

                      Navigator.popAndPushNamed(context, '/detail_IT_WR',
                          arguments: {
                            'id': args['id'],
                            'itirDatabaseID': ntr.databaseID,
                            'serialNo': args['serialNo'],
                            'itDatabaseID': args['itDatabaseID'],
                            'trDatabaseID': args['trDatabaseID'],
                          });
                    } else {
                      failed_code;
                      print('Failed Response status: ${response.statusCode}');
                      print('Failed Response body: ${response.body}');
                      print('Unsuccessfully');
                    }
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
    final ItModel ntr = watchOnly((ItProvider x) => x.itModel);

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
                simplifiedFor_Diplay_for_all_PC_numpad('uV', _uVController),
                simplifiedFor_Diplay_for_all_PC_numpad('vW', _vWController),
                simplifiedFor_Diplay_for_all_PC_numpad('wU', _wUController),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'tap Position', _tapPositionController),
                HVLV(),
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
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: EquipmentTypeList(),
                ),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'uV', _uVController),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'vW', _vWController),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'wU', _wUController),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'tap Position', _tapPositionController),
                HVLV(),
              ]),
            ),
          );
        }
      }),
    );
  }

  bool checkVectoreGroup(ItModel ntr) {
    return ntr.vectorGroup.toLowerCase() == 'dd0/dd0' ||
        ntr.vectorGroup.toLowerCase() == 'dd6/dd6' ||
        ntr.vectorGroup.toLowerCase() == 'yd1d1' ||
        ntr.vectorGroup.toLowerCase() == 'yd11d11';
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
                content: const Text(
                    'you can not add Lv3 or Lv4 details to this vector group?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Ok',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
