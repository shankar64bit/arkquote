import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/powt/powt_bNamePlate_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/powt_provider/powt_bNamePlate_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditPowtbNamePlatePage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditPowtbNamePlatePage(this.args, {Key key}) : super(key: key);

  final TextEditingController _IDcontroller = TextEditingController();

  final TextEditingController _Trno_Controller = TextEditingController();
  final TextEditingController _serialNo_Controller = TextEditingController();
  final TextEditingController _equipmentUsed_Controller =
      TextEditingController();
  final TextEditingController _R_serialNo_controller = TextEditingController();
  final TextEditingController _R_ratedVoltage_controller =
      TextEditingController();
  final TextEditingController _R_ratedCurrent_controller =
      TextEditingController();
  final TextEditingController _R_Make_controller = TextEditingController();
  final TextEditingController _Y_serialNo_controller = TextEditingController();
  final TextEditingController _Y_ratedVoltage_controller =
      TextEditingController();
  final TextEditingController _Y_ratedCurrent_controller =
      TextEditingController();
  final TextEditingController _Y_Make_controller = TextEditingController();
  final TextEditingController _B_serialNo_controller = TextEditingController();
  final TextEditingController _B_ratedVoltage_controller =
      TextEditingController();
  final TextEditingController _B_ratedCurrent_controller =
      TextEditingController();
  final TextEditingController _B_Make_controller = TextEditingController();

  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Future<void> getReport() async {
    getX((PowtbNamePlateProvider x) => x.getPowtbNamePlateById(args['id']));
    PowtbNamePlateModel _powtbNamePlateModel =
        watchOnly((PowtbNamePlateProvider x) => x.powtbNamePlate_Model);

    _IDcontroller.text = args['id'].toString();
    _Trno_Controller.text = _powtbNamePlateModel.trNo.toString();
    // args['TrNo'].toString();
    _serialNo_Controller.text = _powtbNamePlateModel.serialNo.toString();
    //args['Serial_No'];
    _R_Make_controller.text = _powtbNamePlateModel.R_Make.toString();
    _R_ratedCurrent_controller.text =
        _powtbNamePlateModel.R_ratedCurrent.toString();
    _R_ratedVoltage_controller.text =
        _powtbNamePlateModel.R_ratedVoltage.toString();
    _R_serialNo_controller.text = _powtbNamePlateModel.R_serialNo.toString();
    _Y_Make_controller.text = _powtbNamePlateModel.Y_Make.toString();
    _Y_ratedCurrent_controller.text =
        _powtbNamePlateModel.Y_ratedCurrent.toString();
    _Y_ratedVoltage_controller.text =
        _powtbNamePlateModel.Y_ratedVoltage.toString();
    _Y_serialNo_controller.text = _powtbNamePlateModel.Y_serialNo.toString();

    _B_Make_controller.text = _powtbNamePlateModel.B_Make.toString();
    _B_ratedCurrent_controller.text =
        _powtbNamePlateModel.B_ratedCurrent.toString();
    _B_ratedVoltage_controller.text =
        _powtbNamePlateModel.B_ratedVoltage.toString();
    _B_serialNo_controller.text = _powtbNamePlateModel.B_serialNo.toString();
  }

  @override
  Widget build(BuildContext context) {
    final PowtbNamePlateModel ntr =
        watchOnly((PowtbNamePlateProvider x) => x.powtbNamePlate_Model);
    getReport();
    var mob = const Text('Edit powt-Bushings NamePlate Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('Edit powt-Bushings NamePlate Details',
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
                  var url = Uri.parse('${Env.URL_PREFIX}/powtbNamePlate/' +
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
                    'R_serialNo': _R_serialNo_controller.text.toString(),
                    'R_ratedVoltage':
                        _R_ratedVoltage_controller.text.toString(),
                    'R_ratedCurrent':
                        _R_ratedCurrent_controller.text.toString(),
                    'R_Make': _R_Make_controller.text.toString(),
                    'Y_serialNo': _Y_serialNo_controller.text.toString(),
                    'Y_ratedVoltage':
                        _Y_ratedVoltage_controller.text.toString(),
                    'Y_ratedCurrent':
                        _Y_ratedCurrent_controller.text.toString(),
                    'Y_Make': _Y_Make_controller.text.toString(),
                    'B_serialNo': _B_serialNo_controller.text.toString(),
                    'B_ratedVoltage':
                        _B_ratedVoltage_controller.text.toString(),
                    'B_ratedCurrent':
                        _B_ratedCurrent_controller.text.toString(),
                    'B_Make': _B_Make_controller.text.toString(),
                    "serialNo": args['POWT_ID'].toString(),
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
                    final PowtbNamePlateModel powtbNamePlateReportToLocal =
                        PowtbNamePlateModel(
                      trNo: int.parse(_Trno_Controller.text),
                      serialNo: _serialNo_Controller.text,
                      R_serialNo: _R_serialNo_controller.text,
                      R_ratedVoltage:
                          int.parse(_R_ratedVoltage_controller.text),
                      R_ratedCurrent:
                          int.parse(_R_ratedCurrent_controller.text),
                      R_Make: _R_Make_controller.text,
                      Y_serialNo: _Y_serialNo_controller.text,
                      Y_ratedVoltage:
                          int.parse(_Y_ratedVoltage_controller.text),
                      Y_ratedCurrent:
                          int.parse(_Y_ratedCurrent_controller.text),
                      Y_Make: _Y_Make_controller.text,
                      B_serialNo: _B_serialNo_controller.text,
                      B_ratedVoltage:
                          int.parse(_B_ratedVoltage_controller.text),
                      B_ratedCurrent:
                          int.parse(_B_ratedCurrent_controller.text),
                      B_Make: _B_Make_controller.text,
                      databaseID: ntr.databaseID,
                      // equipmentUsed: selectedValueForEquipmentUse.toString(),
                      // updateDate: DateTime.now(),
                    );

                    getX((PowtbNamePlateProvider x) => x.updatePowtbNamePlate(
                        powtbNamePlateReportToLocal, args['id']));
                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_PowtbNameplate',
                        arguments: {
                          'id': args['id'],
                          'POWT_ID': args['POWT_ID'],
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
                      controller: _Trno_Controller,
                      textAlign: TextAlign.center,
                      enabled: false,
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(150, 10, 150, 10),
                        child: Text(
                          'serialNo',
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
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'R Phase serial No', _R_serialNo_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'R Phase rated Voltage', _R_ratedVoltage_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'R Phase rated Current', _R_ratedCurrent_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'R Phase Make', _R_Make_controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Y Phase serial No', _Y_serialNo_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Y Phase rated Voltage', _Y_ratedVoltage_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Y Phase rated Current', _Y_ratedCurrent_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Y Phase Make', _Y_Make_controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'B Phase serial No', _B_serialNo_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'B Phase rated Voltage', _B_ratedVoltage_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'B Phase rated Current', _B_ratedCurrent_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'b Phase Make', _B_Make_controller),
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
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          'trNo',
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
                          'serialNo',
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
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'R Phase serial No', _R_serialNo_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'R Phase rated Voltage', _R_ratedVoltage_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'R Phase rated Current', _R_ratedCurrent_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'R Phase Make', _R_Make_controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Y Phase serial No', _Y_serialNo_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Y Phase rated Voltage', _Y_ratedVoltage_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Y Phase rated Current', _Y_ratedCurrent_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Y Phase Make', _Y_Make_controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'B Phase serial No', _B_serialNo_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'B Phase rated Voltage', _B_ratedVoltage_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'B Phase rated Current', _B_ratedCurrent_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'b Phase Make', _B_Make_controller),
                  ]),
            ),
          );
        }
      }),
    );
  }
}
