import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/powt_3_winding/powt3winding_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/powt_3_winding/powt_3_winding_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';

import '../../../data/models/equipment/powt_3_winding/powt3win_mb_model.dart';
import '../../providers/powt_3_winding/powt3win_mb_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditPowt3winMbPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditPowt3winMbPage(this.args, {Key key}) : super(key: key);

  final TextEditingController _IDcontroller = TextEditingController();

  final TextEditingController _trNo_controller = TextEditingController();
  final TextEditingController _serialNo_controller = TextEditingController();
  final TextEditingController _r_hv_un_controller = TextEditingController();
  final TextEditingController _r_hv_vn_controller = TextEditingController();
  final TextEditingController _r_hv_wn_controller = TextEditingController();
  final TextEditingController _y_hv_un_controller = TextEditingController();
  final TextEditingController _y_hv_vn_controller = TextEditingController();
  final TextEditingController _y_hv_wn_controller = TextEditingController();
  final TextEditingController _b_hv_un_controller = TextEditingController();
  final TextEditingController _b_hv_vn_controller = TextEditingController();
  final TextEditingController _b_hv_wn_controller = TextEditingController();

  final TextEditingController _r_lv_un_controller = TextEditingController();
  final TextEditingController _r_lv_vn_controller = TextEditingController();
  final TextEditingController _r_lv_wn_controller = TextEditingController();
  final TextEditingController _y_lv_un_controller = TextEditingController();
  final TextEditingController _y_lv_vn_controller = TextEditingController();
  final TextEditingController _y_lv_wn_controller = TextEditingController();
  final TextEditingController _b_lv_un_controller = TextEditingController();
  final TextEditingController _b_lv_vn_controller = TextEditingController();
  final TextEditingController _b_lv_wn_controller = TextEditingController();

  final TextEditingController _r_ivt_un_controller = TextEditingController();
  final TextEditingController _r_ivt_vn_controller = TextEditingController();
  final TextEditingController _r_ivt_wn_controller = TextEditingController();
  final TextEditingController _y_ivt_un_controller = TextEditingController();
  final TextEditingController _y_ivt_vn_controller = TextEditingController();
  final TextEditingController _y_ivt_wn_controller = TextEditingController();
  final TextEditingController _b_ivt_un_controller = TextEditingController();
  final TextEditingController _b_ivt_vn_controller = TextEditingController();
  final TextEditingController _b_ivt_wn_controller = TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Future<void> getReport() async {
    final Powt3WindingModel ntr_equip =
        watchOnly((Powt3WindingProvider x) => x.powt3WindingModel);

    getX((Powt3win_mb_Provider x) => x.getPowt3win_mbById(args['id']));
    Powt3win_mb_Model ntr =
        watchOnly((Powt3win_mb_Provider x) => x.powt3win_mb_Model);

    _IDcontroller.text = args['id'].toString();
    _trNo_controller.text = args['TrNo'].toString();
    _serialNo_controller.text = args['Serial_No'];
    _r_hv_un_controller.text = ntr.r_hv_un.toString();
    _r_hv_vn_controller.text = ntr.r_hv_vn.toString();
    _r_hv_wn_controller.text = ntr.r_hv_wn.toString();
    _y_hv_un_controller.text = ntr.y_hv_un.toString();
    _y_hv_vn_controller.text = ntr.y_hv_vn.toString();
    _y_hv_wn_controller.text = ntr.y_hv_wn.toString();
    _b_hv_un_controller.text = ntr.b_hv_un.toString();
    _b_hv_vn_controller.text = ntr.b_hv_vn.toString();
    _b_hv_wn_controller.text = ntr.b_hv_wn.toString();

    _r_lv_un_controller.text = ntr.r_lv_un.toString();
    _r_lv_vn_controller.text = ntr.r_lv_vn.toString();
    _r_lv_wn_controller.text = ntr.r_lv_wn.toString();
    _y_lv_un_controller.text = ntr.y_lv_un.toString();
    _y_lv_vn_controller.text = ntr.y_lv_vn.toString();
    _y_lv_wn_controller.text = ntr.y_lv_wn.toString();
    _b_lv_un_controller.text = ntr.b_lv_un.toString();
    _b_lv_vn_controller.text = ntr.b_lv_vn.toString();
    _b_lv_wn_controller.text = ntr.b_lv_wn.toString();

    _r_ivt_un_controller.text = ntr.r_ivt_un.toString();
    _r_ivt_vn_controller.text = ntr.r_ivt_vn.toString();
    _r_ivt_wn_controller.text = ntr.r_ivt_wn.toString();
    _y_ivt_un_controller.text = ntr.y_ivt_un.toString();
    _y_ivt_vn_controller.text = ntr.y_ivt_vn.toString();
    _y_ivt_wn_controller.text = ntr.y_ivt_wn.toString();
    _b_ivt_un_controller.text = ntr.b_ivt_un.toString();
    _b_ivt_vn_controller.text = ntr.b_ivt_vn.toString();
    _b_ivt_wn_controller.text = ntr.b_ivt_wn.toString();
  }

  @override
  Widget build(BuildContext context) {
    final Powt3WindingModel ntr_equip =
        watchOnly((Powt3WindingProvider x) => x.powt3WindingModel);

    getX((Powt3win_mb_Provider x) => x.getPowt3win_mbById(args['id']));
    Powt3win_mb_Model ntr =
        watchOnly((Powt3win_mb_Provider x) => x.powt3win_mb_Model);

    getReport();

    var mob = const Text('Edit powt3winding-MB Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('Edit powt3winding-MB Details',
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
                  var url = Uri.parse('${Env.URL_PREFIX}/powt3wMbTest/' +
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
                    'serialNo': args['POWT3WIN_ID'].toString(),
                    'r_hv_un': _r_hv_un_controller.text.toString(),
                    'r_hv_vn': _r_hv_vn_controller.text.toString(),
                    'r_hv_wn': _r_hv_wn_controller.text.toString(),
                    'y_hv_un': _y_hv_un_controller.text.toString(),
                    'y_hv_vn': _y_hv_vn_controller.text.toString(),
                    'y_hv_wn': _y_hv_wn_controller.text.toString(),
                    'b_hv_un': _b_hv_un_controller.text.toString(),
                    'b_hv_vn': _b_hv_vn_controller.text.toString(),
                    'b_hv_wn': _b_hv_wn_controller.text.toString(),
                    'r_lv_un': _r_lv_un_controller.text.toString(),
                    'r_lv_vn': _r_lv_vn_controller.text.toString(),
                    'r_lv_wn': _r_lv_wn_controller.text.toString(),
                    'y_lv_un': _y_lv_un_controller.text.toString(),
                    'y_lv_vn': _y_lv_vn_controller.text.toString(),
                    'y_lv_wn': _y_lv_wn_controller.text.toString(),
                    'b_lv_un': _b_lv_un_controller.text.toString(),
                    'b_lv_vn': _b_lv_vn_controller.text.toString(),
                    'b_lv_wn': _b_lv_wn_controller.text.toString(),
                    'r_ivt_un': _r_ivt_un_controller.text.toString(),
                    'r_ivt_vn': _r_ivt_vn_controller.text.toString(),
                    'r_ivt_wn': _r_ivt_wn_controller.text.toString(),
                    'y_ivt_un': _y_ivt_un_controller.text.toString(),
                    'y_ivt_vn': _y_ivt_vn_controller.text.toString(),
                    'y_ivt_wn': _y_ivt_wn_controller.text.toString(),
                    'b_ivt_un': _b_ivt_un_controller.text.toString(),
                    'b_ivt_vn': _b_ivt_vn_controller.text.toString(),
                    'b_ivt_wn': _b_ivt_wn_controller.text.toString(),
                    'equipmentUsed': selectedValueForEquipmentUse.toString(),
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
                    final Powt3win_mb_Model powt3winmbReportToLocal =
                        Powt3win_mb_Model(
                      trNo: int.parse(_trNo_controller.text),
                      serialNo: _serialNo_controller.text,
                      r_hv_un: double.parse(_r_hv_un_controller.text),
                      r_hv_vn: double.parse(_r_hv_vn_controller.text),
                      r_hv_wn: double.parse(_r_hv_wn_controller.text),
                      y_hv_un: double.parse(_y_hv_un_controller.text),
                      y_hv_vn: double.parse(_y_hv_vn_controller.text),
                      y_hv_wn: double.parse(_y_hv_wn_controller.text),
                      b_hv_un: double.parse(_b_hv_un_controller.text),
                      b_hv_vn: double.parse(_b_hv_vn_controller.text),
                      b_hv_wn: double.parse(_b_hv_wn_controller.text),
                      r_lv_un: double.parse(_r_lv_un_controller.text),
                      r_lv_vn: double.parse(_r_lv_vn_controller.text),
                      r_lv_wn: double.parse(_r_lv_wn_controller.text),
                      y_lv_un: double.parse(_y_lv_un_controller.text),
                      y_lv_vn: double.parse(_y_lv_vn_controller.text),
                      y_lv_wn: double.parse(_y_lv_wn_controller.text),
                      b_lv_un: double.parse(_b_lv_un_controller.text),
                      b_lv_vn: double.parse(_b_lv_vn_controller.text),
                      b_lv_wn: double.parse(_b_lv_wn_controller.text),
                      r_ivt_un: double.parse(_r_ivt_un_controller.text),
                      r_ivt_vn: double.parse(_r_ivt_vn_controller.text),
                      r_ivt_wn: double.parse(_r_ivt_wn_controller.text),
                      y_ivt_un: double.parse(_y_ivt_un_controller.text),
                      y_ivt_vn: double.parse(_y_ivt_vn_controller.text),
                      y_ivt_wn: double.parse(_y_ivt_wn_controller.text),
                      b_ivt_un: double.parse(_b_ivt_un_controller.text),
                      b_ivt_vn: double.parse(_b_ivt_vn_controller.text),
                      b_ivt_wn: double.parse(_b_ivt_wn_controller.text),
                      equipmentUsed: selectedValueForEquipmentUse.toString(),
                      databaseID: ntr.databaseID,

                      // updateDate: DateTime.now(),
                    );

                    getX((Powt3win_mb_Provider x) => x.updatePowt3win_mb(
                        powt3winmbReportToLocal, args['id']));
                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_POWT3WIN_mb',
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
    final Powt3WindingModel ntr =
        watchOnly((Powt3WindingProvider x) => x.powt3WindingModel);

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
                      padding: const EdgeInsets.fromLTRB(150, 10, 150, 10),
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
                    padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                    child: EquipmentTypeList(),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(150, 10, 150, 10),
                      child: Text(
                        'HV Side',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      )),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'RY-CUT  U-N', _r_hv_un_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'RY-CUT  V-N', _r_hv_vn_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'RY-CUT  W-N', _r_hv_wn_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'YB-CUT  U-N', _y_hv_un_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'YB-CUT  V-N', _y_hv_vn_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'YB-CUT  W-N', _y_hv_wn_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'BR-CUT  U-N', _b_hv_un_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'BR-CUT  V-N', _b_hv_vn_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'BR-CUT  W-N', _b_hv_wn_controller),
                  Divider(color: Colors.black),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(150, 10, 150, 10),
                      child: Text(
                        'LV Side',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      )),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'RY-CUT  U-N', _r_lv_un_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'RY-CUT  V-N', _r_lv_vn_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'RY-CUT  W-N', _r_lv_wn_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'YB-CUT  U-N', _y_lv_un_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'YB-CUT  V-N', _y_lv_vn_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'YB-CUT  W-N', _y_lv_wn_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'BR-CUT  U-N', _b_lv_un_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'BR-CUT  V-N', _b_lv_vn_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'BR-CUT  W-N', _b_lv_wn_controller),
                  Divider(color: Colors.black),
                  ntr.vectorGroup.toLowerCase() == 'yna0d11'
                      ? Padding(
                          padding: const EdgeInsets.fromLTRB(150, 10, 150, 10),
                          child: Text(
                            'IV Side',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5),
                          ))
                      : Padding(
                          padding: const EdgeInsets.fromLTRB(150, 10, 150, 10),
                          child: Text(
                            'Tertiary Side Side',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5),
                          ),
                        ),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'RY-CUT  U-N', _r_ivt_un_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'RY-CUT  V-N', _r_ivt_vn_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'RY-CUT  W-N', _r_ivt_wn_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'YB-CUT  U-N', _y_ivt_un_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'YB-CUT  V-N', _y_ivt_vn_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'YB-CUT  W-N', _y_ivt_wn_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'BR-CUT  U-N', _b_ivt_un_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'BR-CUT  V-N', _b_ivt_vn_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'BR-CUT  W-N', _b_ivt_wn_controller),
                ],
              ),
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
                    controller: _trNo_controller,
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
                    controller: _serialNo_controller,
                    textAlign: TextAlign.center,
                    enabled: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: EquipmentTypeList(),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(150, 10, 150, 10),
                      child: Text(
                        'HV Side',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      )),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'RY-CUT  U-N', _r_hv_un_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'RY-CUT  V-N', _r_hv_vn_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'RY-CUT  W-N', _r_hv_wn_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'YB-CUT  U-N', _y_hv_un_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'YB-CUT  V-N', _y_hv_vn_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'YB-CUT W-N', _y_hv_wn_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'BR-CUT  U-N', _b_hv_un_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'BR-CUT  V-N', _b_hv_vn_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'BR-CUT  W-N', _b_hv_wn_controller),
                  Divider(color: Colors.black),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(150, 10, 150, 10),
                      child: Text(
                        'LV Side',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      )),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'RY-CUT  U-N', _r_lv_un_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'RY-CUT  V-N', _r_lv_vn_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'RY-CUT  W-N', _r_lv_wn_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'YB-CUT  U-N', _y_lv_un_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'YB-CUT  V-N', _y_lv_vn_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'YB-CUT  W-N', _y_lv_wn_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'BR-CUT  U-N', _b_lv_un_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'BR-CUT  V-N', _b_lv_vn_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'BR-CUT  W-N', _b_lv_wn_controller),
                  Divider(color: Colors.black),
                  ntr.vectorGroup.toLowerCase() == 'yna0d11'
                      ? Padding(
                          padding: const EdgeInsets.fromLTRB(150, 10, 150, 10),
                          child: Text(
                            'IV Side',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5),
                          ))
                      : Padding(
                          padding: const EdgeInsets.fromLTRB(150, 10, 150, 10),
                          child: Text(
                            'Tertiary Side',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5),
                          ),
                        ),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'RY-CUT  U-N', _r_ivt_un_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'RY-CUT  V-N', _r_ivt_vn_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'RY-CUT  W-N', _r_ivt_wn_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'YB-CUT  U-N', _y_ivt_un_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'YB-CUT  V-N', _y_ivt_vn_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'YB-CUT  W-N', _y_ivt_wn_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'BR-CUT  U-N', _b_ivt_un_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'BR-CUT  V-N', _b_ivt_vn_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'BR-CUT  W-N', _b_ivt_wn_controller),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
