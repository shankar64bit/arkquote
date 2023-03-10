// ignore_for_file: missing_return, missing_required_param, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../../env.sample.dart';
import '../../../../data/models/equipment/Relays/AuxiliaryRelay/AR_pudo_model.dart';
import '../../../providers/Relays_providers/AuxiliaryRelay_providers/AR_pudo_provider.dart';
import '../../dropdown_All/a_as_simplified_function.dart';
import '../../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditARpudoPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditARpudoPage(this.args, {Key key}) : super(key: key);

  ARpudoModel _arpudoTestModel;
  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _trNo_controller = TextEditingController();
  final TextEditingController _arRef_controller = TextEditingController();
  final TextEditingController _coilRef_controller = TextEditingController();
  final TextEditingController _coilResistenace_controller =
      TextEditingController();
  final TextEditingController _pickUp_controller = TextEditingController();
  final TextEditingController _dropOff_controller = TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Future<void> getReport() async {
    getX((ARpudoProvider x) => x.getARpudoById(args['id']));
    _arpudoTestModel = watchOnly((ARpudoProvider x) => x.arpudo_Model);
    _IDcontroller.text = _arpudoTestModel.id.toString();
    _trNo_controller.text = _arpudoTestModel.trNo.toString();
    _arRef_controller.text = _arpudoTestModel.arRef.toString();
    _coilRef_controller.text = _arpudoTestModel.coilRef.toString();
    _coilResistenace_controller.text =
        _arpudoTestModel.coilResistenace.toString();
    _pickUp_controller.text = _arpudoTestModel.pickUp.toString();
    _dropOff_controller.text = _arpudoTestModel.dropOff.toString();
  }

  @override
  Widget build(BuildContext context) {
    final ARpudoModel ntr = watchOnly((ARpudoProvider x) => x.arpudo_Model);

    getReport();
    var mob = const Text('Edit ARpudo Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Edit ARpudo Details', style: TextStyle(fontSize: 20));

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
                  var url = Uri.parse('${Env.URL_PREFIX}/arPuDo/' +
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
                    'arRef': args['AR_ID'].toString(),
                    'coilRef': _coilRef_controller.text.toString(),
                    'coilResistenace':
                        _coilResistenace_controller.text.toString(),
                    'pickUp': _pickUp_controller.text.toString(),
                    'dropOff': _dropOff_controller.text.toString(),
                    'equipmentUsed': selectedValueForEquipmentUse.toString(),
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
                    final ARpudoModel ARpudoReportToLocal = ARpudoModel(
                      trNo: int.parse(_trNo_controller.text),
                      arRef: int.parse(_arRef_controller.text),
                      coilRef: _coilRef_controller.text,
                      coilResistenace:
                          double.parse(_coilResistenace_controller.text),
                      pickUp: int.parse(_pickUp_controller.text),
                      dropOff: _dropOff_controller.text,
                      databaseID: ntr.databaseID,
                      equipmentUsed: selectedValueForEquipmentUse.toString(),
                      updateDate: DateTime.now(),
                    );

                    getX((ARpudoProvider x) =>
                        x.updateARpudo(ARpudoReportToLocal, args['id']));

                    Navigator.popAndPushNamed(context, '/detail_ARpudo',
                        arguments: {
                          'id': args['id'],
                          'AR_ID': args['AR_ID'],
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
              elevation: 5,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(150, 10, 150, 10),
                        child: Text(
                          'ID',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5),
                        )),
                    TextFormField(
                      controller: _IDcontroller,
                      textAlign: TextAlign.center,
                      enabled: false,
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(150, 10, 150, 10),
                        child: Text(
                          'trNo',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5),
                        )),
                    TextFormField(
                      controller: _trNo_controller,
                      textAlign: TextAlign.center,
                      enabled: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: EquipmentTypeList(),
                    ),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Coil Ref', _coilRef_controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Coil Resistenace', _coilResistenace_controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Pick Up', _pickUp_controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Drop Off', _dropOff_controller),
                  ]),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              elevation: 5,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: Text(
                          'ID',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5),
                        )),
                    TextFormField(
                      controller: _IDcontroller,
                      textAlign: TextAlign.center,
                      enabled: false,
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                        child: Text(
                          'trNo',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5),
                        )),
                    TextFormField(
                      controller: _trNo_controller,
                      textAlign: TextAlign.center,
                      enabled: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: EquipmentTypeList(),
                    ),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Coil Ref', _coilRef_controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Coil Resistenace', _coilResistenace_controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Pick Up', _pickUp_controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Drop Off', _dropOff_controller),
                  ]),
            ),
          );
        }
      }),
    );
  }
}
