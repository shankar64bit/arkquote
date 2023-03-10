import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/powt_3_winding/powt3win_tsc_model.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/powt_3_winding/powt3winding_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/powt_3_winding/powt3win_tsc_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/powt_3_winding/powt_3_winding_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditPowt3winTscPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditPowt3winTscPage(this.args, {Key key}) : super(key: key);

  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _trNo_controller = TextEditingController();
  final TextEditingController _serialNo_controller = TextEditingController();
  final TextEditingController _hv_voltage_controller = TextEditingController();
  final TextEditingController _hv_current_Onan_controller =
      TextEditingController();
  final TextEditingController _hv_current_Onaf_controller =
      TextEditingController();
  final TextEditingController _hv_current_Ofaf_controller =
      TextEditingController();
  final TextEditingController _equipmentUsed_controller =
      TextEditingController();
  final TextEditingController _tap_controller = TextEditingController();

  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Future<void> getReport() async {
    getX((Powt3wintscProvider x) => x.getPowt3wintscById(args['id']));
    Powt3wintscModel _powt3WindingTesModel =
        watchOnly((Powt3wintscProvider x) => x.powt3wintsc_Model);

    _IDcontroller.text = args['id'].toString();
    _trNo_controller.text = _powt3WindingTesModel.trNo.toString();
    _serialNo_controller.text = _powt3WindingTesModel.serialNo.toString();
    _hv_voltage_controller.text = _powt3WindingTesModel.hv_voltage.toString();
    _hv_current_Onan_controller.text =
        _powt3WindingTesModel.hv_current_Onan.toString();
    _hv_current_Onaf_controller.text =
        _powt3WindingTesModel.hv_current_Onaf.toString();
    _hv_current_Ofaf_controller.text =
        _powt3WindingTesModel.hv_current_Ofaf.toString();
    _tap_controller.text = _powt3WindingTesModel.tapPosition.toString();
  }

  @override
  Widget build(BuildContext context) {
    final Powt3WindingModel ntr1 =
        watchOnly((Powt3WindingProvider x) => x.powt3WindingModel);

    final Powt3wintscModel ntr =
        watchOnly((Powt3wintscProvider x) => x.powt3wintsc_Model);
    getReport();
    var mob = const Text('Edit Powt_3_win_tsc Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('Edit Powt_3_win_tsc Details',
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
                  var url = Uri.parse('${Env.URL_PREFIX}/powt3wTscTest/' +
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
                    'hv_voltage': _hv_voltage_controller.text.toString(),
                    'hv_current_Onan':
                        _hv_current_Onan_controller.text.toString(),
                    'hv_current_Onaf':
                        _hv_current_Onaf_controller.text.toString(),
                    'hv_current_Ofaf':
                        _hv_current_Ofaf_controller.text.toString(),
                    'tapPosition': _tap_controller.text.toString(),
                    "serialNo": args['POWT3WIN_ID'].toString(),
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
                    final Powt3wintscModel powt3winTscReportToLocal =
                        Powt3wintscModel(
                            trNo: int.parse(_trNo_controller.text),
                            serialNo: _serialNo_controller.text,
                            hv_voltage: int.parse(_hv_voltage_controller.text),
                            hv_current_Onan:
                                double.parse(_hv_current_Onan_controller.text),
                            hv_current_Onaf:
                                double.parse(_hv_current_Onaf_controller.text),
                            hv_current_Ofaf:
                                double.parse(_hv_current_Ofaf_controller.text),
                            tapPosition: int.parse(_tap_controller.text),
                            databaseID: ntr.databaseID,
                            equipmentUsed:
                                selectedValueForEquipmentUse.toString()
                            // updateDate: DateTime.now(),
                            );

                    getX((Powt3wintscProvider x) => x.updatePowt3wintsc(
                        powt3winTscReportToLocal, args['id']));
                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_POWT3WIN_tsc',
                        arguments: {
                          'id': args['id'],
                          'POWT3WIN_ID': args['POWT3WIN_ID'],
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
      child: LayoutBuilder(builder: (context, raints) {
        if (raints.maxWidth > 400) {
          return Padding(
            padding: EdgeInsets.all(5.0),
            child: Card(
              elevation: 5,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(150, 10, 150, 10),
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
                        padding: EdgeInsets.fromLTRB(150, 10, 150, 10),
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
                      padding: EdgeInsets.fromLTRB(150, 10, 150, 10),
                      child: Text(
                        'serialNo',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      ),
                    ),
                    TextFormField(
                      controller: _serialNo_controller,
                      textAlign: TextAlign.center,
                      enabled: false,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: EquipmentTypeList(),
                    ),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'HV Side current_Onan', _hv_current_Onan_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'HV Side current_Onaf', _hv_current_Onaf_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'HV Side current_Ofaf', _hv_current_Ofaf_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'HV Side voltage', _hv_voltage_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'tapPosition', _tap_controller),
                  ]),
            ),
          );
        } else {
          return Padding(
            padding: EdgeInsets.all(5.0),
            child: Card(
              elevation: 5,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          'serialNo',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5),
                        )),
                    TextFormField(
                      controller: _serialNo_controller,
                      textAlign: TextAlign.center,
                      enabled: false,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: EquipmentTypeList(),
                    ),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'HV Side current_Onan', _hv_current_Onan_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'HV Side current_Onaf', _hv_current_Onaf_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'HV Side current_Ofaf', _hv_current_Ofaf_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'HV Side voltage', _hv_voltage_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'tapPosition', _tap_controller),
                  ]),
            ),
          );
        }
      }),
    );
  }
}
