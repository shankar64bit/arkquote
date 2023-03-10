import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/powt/powt_mb_model.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/powt/powt_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/powt_provider/powt_mb_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/powt_provider/powt_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditPowtMbPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditPowtMbPage(this.args, {Key key}) : super(key: key);

  final TextEditingController _IDcontroller = TextEditingController();

  final TextEditingController _Trno_Controller = TextEditingController();
  final TextEditingController _serialNo_Controller = TextEditingController();
  final TextEditingController _equipmentUsed_Controller =
      TextEditingController();
  final TextEditingController _ry_hv_1u_1v_controller = TextEditingController();
  final TextEditingController _ry_hv_1v_1w_controller = TextEditingController();
  final TextEditingController _ry_hv_1w_1u_controller = TextEditingController();
  final TextEditingController _ry_hv_1u_1n_controller = TextEditingController();
  final TextEditingController _ry_hv_1v_1n_controller = TextEditingController();
  final TextEditingController _ry_hv_1w_1n_controller = TextEditingController();
  final TextEditingController _ry_lv_2u_2v_controller = TextEditingController();
  final TextEditingController _ry_lv_2v_2w_controller = TextEditingController();
  final TextEditingController _ry_lv_2w_2u_controller = TextEditingController();
  final TextEditingController _ry_lv_2u_2n_controller = TextEditingController();
  final TextEditingController _ry_lv_2v_2n_controller = TextEditingController();
  final TextEditingController _ry_lv_2w_2n_controller = TextEditingController();
  final TextEditingController _yb_hv_1u_1v_controller = TextEditingController();
  final TextEditingController _yb_hv_1v_1w_controller = TextEditingController();
  final TextEditingController _yb_hv_1w_1u_controller = TextEditingController();
  final TextEditingController _yb_hv_1u_1n_controller = TextEditingController();
  final TextEditingController _yb_hv_1v_1n_controller = TextEditingController();
  final TextEditingController _yb_hv_1w_1n_controller = TextEditingController();
  final TextEditingController _yb_lv_2u_2v_controller = TextEditingController();
  final TextEditingController _yb_lv_2v_2w_controller = TextEditingController();
  final TextEditingController _yb_lv_2w_2u_controller = TextEditingController();
  final TextEditingController _yb_lv_2u_2n_controller = TextEditingController();
  final TextEditingController _yb_lv_2v_2n_controller = TextEditingController();
  final TextEditingController _yb_lv_2w_2n_controller = TextEditingController();
  final TextEditingController _br_hv_1u_1v_controller = TextEditingController();
  final TextEditingController _br_hv_1v_1w_controller = TextEditingController();
  final TextEditingController _br_hv_1w_1u_controller = TextEditingController();
  final TextEditingController _br_hv_1u_1n_controller = TextEditingController();
  final TextEditingController _br_hv_1v_1n_controller = TextEditingController();
  final TextEditingController _br_hv_1w_1n_controller = TextEditingController();
  final TextEditingController _br_lv_2u_2v_controller = TextEditingController();
  final TextEditingController _br_lv_2v_2w_controller = TextEditingController();
  final TextEditingController _br_lv_2w_2u_controller = TextEditingController();
  final TextEditingController _br_lv_2u_2n_controller = TextEditingController();
  final TextEditingController _br_lv_2v_2n_controller = TextEditingController();
  final TextEditingController _br_lv_2w_2n_controller = TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Future<void> getReport() async {
    getX((Powt_mb_Provider x) => x.getPowt_mbById(args['id']));
    Powt_mb_Model _powtMbModel =
        watchOnly((Powt_mb_Provider x) => x.powt_mb_Model);

    _IDcontroller.text = args['id'].toString();
    _Trno_Controller.text = _powtMbModel.trNo.toString();
    // args['TrNo'].toString();
    _serialNo_Controller.text = _powtMbModel.serialNo.toString();
    //args['Serial_No'];
    _ry_hv_1u_1v_controller.text = _powtMbModel.ry_hv_1u_1v.toString();
    _ry_hv_1v_1w_controller.text = _powtMbModel.ry_hv_1v_1w.toString();
    _ry_hv_1w_1u_controller.text = _powtMbModel.ry_hv_1w_1u.toString();
    _ry_hv_1u_1n_controller.text = _powtMbModel.ry_hv_1u_1n.toString();
    _ry_hv_1v_1n_controller.text = _powtMbModel.ry_hv_1v_1n.toString();
    _ry_hv_1w_1n_controller.text = _powtMbModel.ry_hv_1w_1n.toString();
    _ry_lv_2u_2v_controller.text = _powtMbModel.ry_lv_2u_2v.toString();
    _ry_lv_2v_2w_controller.text = _powtMbModel.ry_lv_2v_2w.toString();
    _ry_lv_2w_2u_controller.text = _powtMbModel.ry_lv_2w_2u.toString();
    _ry_lv_2u_2n_controller.text = _powtMbModel.ry_lv_2u_2n.toString();
    _ry_lv_2v_2n_controller.text = _powtMbModel.ry_lv_2v_2n.toString();
    _ry_lv_2w_2n_controller.text = _powtMbModel.ry_lv_2w_2n.toString();

    _yb_hv_1u_1v_controller.text = _powtMbModel.yb_hv_1u_1v.toString();
    _yb_hv_1v_1w_controller.text = _powtMbModel.yb_hv_1v_1w.toString();
    _yb_hv_1w_1u_controller.text = _powtMbModel.yb_hv_1w_1u.toString();
    _yb_hv_1u_1n_controller.text = _powtMbModel.yb_hv_1u_1n.toString();
    _yb_hv_1v_1n_controller.text = _powtMbModel.yb_hv_1v_1n.toString();
    _yb_hv_1w_1n_controller.text = _powtMbModel.yb_hv_1w_1n.toString();
    _yb_lv_2u_2v_controller.text = _powtMbModel.yb_lv_2u_2v.toString();
    _yb_lv_2v_2w_controller.text = _powtMbModel.yb_lv_2v_2w.toString();
    _yb_lv_2w_2u_controller.text = _powtMbModel.yb_lv_2w_2u.toString();
    _yb_lv_2u_2n_controller.text = _powtMbModel.yb_lv_2u_2n.toString();
    _yb_lv_2v_2n_controller.text = _powtMbModel.yb_lv_2v_2n.toString();
    _yb_lv_2w_2n_controller.text = _powtMbModel.yb_lv_2w_2n.toString();

    _br_hv_1u_1v_controller.text = _powtMbModel.br_hv_1u_1v.toString();
    _br_hv_1v_1w_controller.text = _powtMbModel.br_hv_1v_1w.toString();
    _br_hv_1w_1u_controller.text = _powtMbModel.br_hv_1w_1u.toString();
    _br_hv_1u_1n_controller.text = _powtMbModel.br_hv_1u_1n.toString();
    _br_hv_1v_1n_controller.text = _powtMbModel.br_hv_1v_1n.toString();
    _br_hv_1w_1n_controller.text = _powtMbModel.br_hv_1w_1n.toString();
    _br_lv_2u_2v_controller.text = _powtMbModel.br_lv_2u_2v.toString();
    _br_lv_2v_2w_controller.text = _powtMbModel.br_lv_2v_2w.toString();
    _br_lv_2w_2u_controller.text = _powtMbModel.br_lv_2w_2u.toString();
    _br_lv_2u_2n_controller.text = _powtMbModel.br_lv_2u_2n.toString();
    _br_lv_2v_2n_controller.text = _powtMbModel.br_lv_2v_2n.toString();
    _br_lv_2w_2n_controller.text = _powtMbModel.br_lv_2w_2n.toString();
  }

  @override
  Widget build(BuildContext context) {
    final PowtModel ntr1 = watchOnly((PowtProvider x) => x.powtModel);

    final Powt_mb_Model ntr =
        watchOnly((Powt_mb_Provider x) => x.powt_mb_Model);
    getReport();
    var mob =
        const Text('Edit powt-MB Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Edit powt-MB Details', style: TextStyle(fontSize: 20));

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
                  var url = Uri.parse('${Env.URL_PREFIX}/powtMbTest/' +
                      ntr.databaseID.toString() +
                      '/');

                  Map<String, String> headers = {
                    "Content-type": "application/json",
                    "Authorization": "Bearer $acc_token",
                  };
                  print("***********");
                  print(url);
                  print(args['trDatabaseID'].toString());

                  if (ntr1.vectorGroup == "Dyn1" ||
                      ntr1.vectorGroup == "Dyn11") {
                    _ry_hv_1u_1n_controller.text = '0.00';
                    _ry_hv_1v_1n_controller.text = '0.00';
                    _ry_hv_1w_1n_controller.text = '0.00';

                    _yb_hv_1u_1n_controller.text = '0.00';
                    _yb_hv_1v_1n_controller.text = '0.00';
                    _yb_hv_1w_1n_controller.text = '0.00';

                    _br_hv_1u_1n_controller.text = '0.00';
                    _br_hv_1v_1n_controller.text = '0.00';
                    _br_hv_1w_1n_controller.text = '0.00';
                  }
                  if (ntr1.vectorGroup == "YNd1" ||
                      ntr1.vectorGroup == "YNd11") {
                    _ry_lv_2u_2n_controller.text = '0.00';
                    _ry_lv_2v_2n_controller.text = '0.00';
                    _ry_lv_2w_2n_controller.text = '0.00';

                    _yb_lv_2u_2n_controller.text = '0.00';
                    _yb_lv_2v_2n_controller.text = '0.00';
                    _yb_lv_2w_2n_controller.text = '0.00';

                    _br_lv_2u_2n_controller.text = '0.00';
                    _br_lv_2v_2n_controller.text = '0.00';
                    _br_lv_2w_2n_controller.text = '0.00';
                  }

                  final Map payload = {
                    "trNo": args['trDatabaseID'].toString(),
                    'ry_hv_1u_1v': _ry_hv_1u_1v_controller.text.toString(),
                    'ry_hv_1v_1w': _ry_hv_1v_1w_controller.text.toString(),
                    'ry_hv_1w_1u': _ry_hv_1w_1u_controller.text.toString(),
                    'ry_hv_1u_1n': _ry_hv_1u_1n_controller.text.toString(),
                    'ry_hv_1v_1n': _ry_hv_1v_1n_controller.text.toString(),
                    'ry_hv_1w_1n': _ry_hv_1w_1n_controller.text.toString(),
                    'ry_lv_2u_2v': _ry_lv_2u_2v_controller.text.toString(),
                    'ry_lv_2v_2w': _ry_lv_2v_2w_controller.text.toString(),
                    'ry_lv_2w_2u': _ry_lv_2w_2u_controller.text.toString(),
                    'ry_lv_2u_2n': _ry_lv_2u_2n_controller.text.toString(),
                    'ry_lv_2v_2n': _ry_lv_2v_2n_controller.text.toString(),
                    'ry_lv_2w_2n': _ry_lv_2w_2n_controller.text.toString(),
                    'yb_hv_1u_1v': _yb_hv_1u_1v_controller.text.toString(),
                    'yb_hv_1v_1w': _yb_hv_1v_1w_controller.text.toString(),
                    'yb_hv_1w_1u': _yb_hv_1w_1u_controller.text.toString(),
                    'yb_hv_1u_1n': _yb_hv_1u_1n_controller.text.toString(),
                    'yb_hv_1v_1n': _yb_hv_1v_1n_controller.text.toString(),
                    'yb_hv_1w_1n': _yb_hv_1w_1n_controller.text.toString(),
                    'yb_lv_2u_2v': _yb_lv_2u_2v_controller.text.toString(),
                    'yb_lv_2v_2w': _yb_lv_2v_2w_controller.text.toString(),
                    'yb_lv_2w_2u': _yb_lv_2w_2u_controller.text.toString(),
                    'yb_lv_2u_2n': _yb_lv_2u_2n_controller.text.toString(),
                    'yb_lv_2v_2n': _yb_lv_2v_2n_controller.text.toString(),
                    'yb_lv_2w_2n': _yb_lv_2w_2n_controller.text.toString(),
                    'br_hv_1u_1v': _br_hv_1u_1v_controller.text.toString(),
                    'br_hv_1v_1w': _br_hv_1v_1w_controller.text.toString(),
                    'br_hv_1w_1u': _br_hv_1w_1u_controller.text.toString(),
                    'br_hv_1u_1n': _br_hv_1u_1n_controller.text.toString(),
                    'br_hv_1v_1n': _br_hv_1v_1n_controller.text.toString(),
                    'br_hv_1w_1n': _br_hv_1w_1n_controller.text.toString(),
                    'br_lv_2u_2v': _br_lv_2u_2v_controller.text.toString(),
                    'br_lv_2v_2w': _br_lv_2v_2w_controller.text.toString(),
                    'br_lv_2w_2u': _br_lv_2w_2u_controller.text.toString(),
                    'br_lv_2u_2n': _br_lv_2u_2n_controller.text.toString(),
                    'br_lv_2v_2n': _br_lv_2v_2n_controller.text.toString(),
                    'br_lv_2w_2n': _br_lv_2w_2n_controller.text.toString(),
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
                    final Powt_mb_Model powtMbReportToLocal = Powt_mb_Model(
                      trNo: int.parse(_Trno_Controller.text),
                      serialNo: _serialNo_Controller.text,
                      ry_hv_1u_1v: double.parse(_ry_hv_1u_1v_controller.text),
                      ry_hv_1v_1w: double.parse(_ry_hv_1v_1w_controller.text),
                      ry_hv_1w_1u: double.parse(_ry_hv_1w_1u_controller.text),
                      ry_hv_1u_1n: double.parse(_ry_hv_1u_1n_controller.text),
                      ry_hv_1v_1n: double.parse(_ry_hv_1v_1n_controller.text),
                      ry_hv_1w_1n: double.parse(_ry_hv_1w_1n_controller.text),
                      ry_lv_2u_2v: double.parse(_ry_lv_2u_2v_controller.text),
                      ry_lv_2v_2w: double.parse(_ry_lv_2v_2w_controller.text),
                      ry_lv_2w_2u: double.parse(_ry_lv_2w_2u_controller.text),
                      ry_lv_2u_2n: double.parse(_ry_lv_2u_2n_controller.text),
                      ry_lv_2v_2n: double.parse(_ry_lv_2v_2n_controller.text),
                      ry_lv_2w_2n: double.parse(_ry_lv_2w_2n_controller.text),
                      yb_hv_1u_1v: double.parse(_yb_hv_1u_1v_controller.text),
                      yb_hv_1v_1w: double.parse(_yb_hv_1v_1w_controller.text),
                      yb_hv_1w_1u: double.parse(_yb_hv_1w_1u_controller.text),
                      yb_hv_1u_1n: double.parse(_yb_hv_1u_1n_controller.text),
                      yb_hv_1v_1n: double.parse(_yb_hv_1v_1n_controller.text),
                      yb_hv_1w_1n: double.parse(_yb_hv_1w_1n_controller.text),
                      yb_lv_2u_2v: double.parse(_yb_lv_2u_2v_controller.text),
                      yb_lv_2v_2w: double.parse(_yb_lv_2v_2w_controller.text),
                      yb_lv_2w_2u: double.parse(_yb_lv_2w_2u_controller.text),
                      yb_lv_2u_2n: double.parse(_yb_lv_2u_2n_controller.text),
                      yb_lv_2v_2n: double.parse(_yb_lv_2v_2n_controller.text),
                      yb_lv_2w_2n: double.parse(_yb_lv_2w_2n_controller.text),
                      br_hv_1u_1v: double.parse(_br_hv_1u_1v_controller.text),
                      br_hv_1v_1w: double.parse(_br_hv_1v_1w_controller.text),
                      br_hv_1w_1u: double.parse(_br_hv_1w_1u_controller.text),
                      br_hv_1u_1n: double.parse(_br_hv_1u_1n_controller.text),
                      br_hv_1v_1n: double.parse(_br_hv_1v_1n_controller.text),
                      br_hv_1w_1n: double.parse(_br_hv_1w_1n_controller.text),
                      br_lv_2u_2v: double.parse(_br_lv_2u_2v_controller.text),
                      br_lv_2v_2w: double.parse(_br_lv_2v_2w_controller.text),
                      br_lv_2w_2u: double.parse(_br_lv_2w_2u_controller.text),
                      br_lv_2u_2n: double.parse(_br_lv_2u_2n_controller.text),
                      br_lv_2v_2n: double.parse(_br_lv_2v_2n_controller.text),
                      br_lv_2w_2n: double.parse(_br_lv_2w_2n_controller.text),
                      databaseID: ntr.databaseID,
                      equipmentUsed: selectedValueForEquipmentUse.toString(),
                      updateDate: DateTime.now(),
                    );

                    getX((Powt_mb_Provider x) =>
                        x.updatePowt_mb(powtMbReportToLocal, args['id']));
                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_Powt_mb',
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
    final PowtModel ntr = watchOnly((PowtProvider x) => x.powtModel);
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
                      ),
                    ),
                    TextFormField(
                      controller: _serialNo_Controller,
                      textAlign: TextAlign.center,
                      enabled: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: EquipmentTypeList(),
                    ),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'RY Cut HV-Side 1U-1V', _ry_hv_1u_1v_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'RY Cut HV-Side 1V-1W', _ry_hv_1v_1w_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'RY Cut HV-Side 1W-1U', _ry_hv_1w_1u_controller),
                    ntr.vectorGroup.toLowerCase() == 'dyn1' ||
                            ntr.vectorGroup.toLowerCase() == 'dyn11'
                        ? Container()
                        : Card(
                            elevation: 2,
                            child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(children: [
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'RY Cut HV-Side 1U-1N',
                                      _ry_hv_1u_1n_controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'RY Cut HV-Side 1V-1N',
                                      _ry_hv_1v_1n_controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'RY Cut HV-Side 1W-1N',
                                      _ry_hv_1w_1n_controller),
                                ]))),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'RY Cut LV-Side 2U-2V', _ry_lv_2u_2v_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'RY Cut LV-Side 2V-2W', _ry_lv_2v_2w_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'RY Cut LV-Side 2W-2U', _ry_lv_2w_2u_controller),
                    ntr.vectorGroup.toLowerCase() == 'ynd1' ||
                            ntr.vectorGroup.toLowerCase() == 'ynd11'
                        ? Container()
                        : Card(
                            elevation: 2,
                            child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(children: [
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'RY Cut LV-Side 2U-2N',
                                      _ry_lv_2u_2n_controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'RY Cut LV-Side 2V-2N',
                                      _ry_lv_2v_2n_controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'RY Cut LV-Side 2W-2N',
                                      _ry_lv_2w_2n_controller),
                                ]))),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'YB Cut HV-Side 1U-1V', _yb_hv_1u_1v_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'YB Cut HV-Side 1V-1W', _yb_hv_1v_1w_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'YB Cut HV-Side 1W-1U', _yb_hv_1w_1u_controller),
                    ntr.vectorGroup.toLowerCase() == 'dyn1' ||
                            ntr.vectorGroup.toLowerCase() == 'dyn11'
                        ? Container()
                        : Card(
                            elevation: 2,
                            child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(children: [
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'YB Cut HV-Side 1U-1N',
                                      _yb_hv_1u_1n_controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'YB Cut HV-Side 1V-1N',
                                      _yb_hv_1v_1n_controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'YB Cut HV-Side 1W-1N',
                                      _yb_hv_1w_1n_controller),
                                ]))),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'YB Cut LV-Side 2U-2V', _yb_lv_2u_2v_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'YB Cut LV-Side 2V-2W', _yb_lv_2v_2w_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'YB Cut LV-Side 2W-2U', _yb_lv_2w_2u_controller),
                    ntr.vectorGroup.toLowerCase() == 'ynd1' ||
                            ntr.vectorGroup.toLowerCase() == 'ynd11'
                        ? Container()
                        : Card(
                            elevation: 2,
                            child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(children: [
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'YB Cut LV-Side 2U-2N',
                                      _yb_lv_2u_2n_controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'YB Cut LV-Side 2V-2N',
                                      _yb_lv_2v_2n_controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'RY Cut LV-Side 2W-2N',
                                      _yb_lv_2w_2n_controller),
                                ]))),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'BR Cut HV-Side 1U-1V', _br_hv_1u_1v_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'BR Cut HV-Side 1V-1W', _br_hv_1v_1w_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'BR Cut HV-Side 1W-1U', _br_hv_1w_1u_controller),
                    ntr.vectorGroup.toLowerCase() == 'dyn1' ||
                            ntr.vectorGroup.toLowerCase() == 'dyn11'
                        ? Container()
                        : Card(
                            elevation: 2,
                            child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(children: [
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'BR Cut HV-Side 1U-1N',
                                      _br_hv_1u_1n_controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'BR Cut HV-Side 1V-1N',
                                      _br_hv_1v_1n_controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'BR Cut HV-Side 1W-1N',
                                      _br_hv_1w_1n_controller),
                                ]))),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'BR Cut LV-Side 2U-2V', _br_lv_2u_2v_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'BR Cut LV-Side 2V-2W', _br_lv_2v_2w_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'BR Cut LV-Side 2W-2U', _br_lv_2w_2u_controller),
                    ntr.vectorGroup.toLowerCase() == 'ynd1' ||
                            ntr.vectorGroup.toLowerCase() == 'ynd11'
                        ? Container()
                        : Card(
                            elevation: 2,
                            child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(children: [
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'BR Cut LV-Side 2U-2N',
                                      _br_lv_2u_2n_controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'BR Cut LV-Side 2V-2N',
                                      _br_lv_2v_2n_controller),
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'BR Cut LV-Side 2W-2N',
                                      _br_lv_2w_2n_controller),
                                ]))),
                  ]),
            ),
          );
          //------------------------------------------------------------------------------
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                    child: EquipmentTypeList(),
                  ),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'RY Cut HV-Side 1U-1V', _ry_hv_1u_1v_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'RY Cut HV-Side 1V-1W', _ry_hv_1v_1w_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'RY Cut HV-Side 1W-1U', _ry_hv_1w_1u_controller),
                  ntr.vectorGroup.toLowerCase() == 'dyn1' ||
                          ntr.vectorGroup.toLowerCase() == 'dyn11'
                      ? Container()
                      : Card(
                          elevation: 2,
                          child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(children: [
                                simplifiedFor_Display_for_all_Mobile_numpad(
                                    'RY Cut HV-Side 1U-1N',
                                    _ry_hv_1u_1n_controller),
                                simplifiedFor_Display_for_all_Mobile_numpad(
                                    'RY Cut HV-Side 1V-1N',
                                    _ry_hv_1v_1n_controller),
                                simplifiedFor_Display_for_all_Mobile_numpad(
                                    'RY Cut HV-Side 1W-1N',
                                    _ry_hv_1w_1n_controller),
                              ]))),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'RY Cut LV-Side 2U-2V', _ry_lv_2u_2v_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'RY Cut LV-Side 2V-2W', _ry_lv_2v_2w_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'RY Cut LV-Side 2W-2U', _ry_lv_2w_2u_controller),
                  ntr.vectorGroup.toLowerCase() == 'ynd1' ||
                          ntr.vectorGroup.toLowerCase() == 'ynd11'
                      ? Container()
                      : Card(
                          elevation: 2,
                          child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(children: [
                                simplifiedFor_Display_for_all_Mobile_numpad(
                                    'RY Cut LV-Side 2U-2N',
                                    _ry_lv_2u_2n_controller),
                                simplifiedFor_Display_for_all_Mobile_numpad(
                                    'RY Cut LV-Side 2V-2N',
                                    _ry_lv_2v_2n_controller),
                                simplifiedFor_Display_for_all_Mobile_numpad(
                                    'RY Cut LV-Side 2W-2N',
                                    _ry_lv_2w_2n_controller),
                              ]))),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'YB Cut HV-Side 1U-1V', _yb_hv_1u_1v_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'YB Cut HV-Side 1V-1W', _yb_hv_1v_1w_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'YB Cut HV-Side 1W-1U', _yb_hv_1w_1u_controller),
                  ntr.vectorGroup.toLowerCase() == 'dyn1' ||
                          ntr.vectorGroup.toLowerCase() == 'dyn11'
                      ? Container()
                      : Card(
                          elevation: 2,
                          child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(children: [
                                simplifiedFor_Display_for_all_Mobile_numpad(
                                    'YB Cut HV-Side 1U-1N',
                                    _yb_hv_1u_1n_controller),
                                simplifiedFor_Display_for_all_Mobile_numpad(
                                    'YB Cut HV-Side 1V-1N',
                                    _yb_hv_1v_1n_controller),
                                simplifiedFor_Display_for_all_Mobile_numpad(
                                    'YB Cut HV-Side 1W-1N',
                                    _yb_hv_1w_1n_controller),
                              ]))),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'YB Cut LV-Side 2U-2V', _yb_lv_2u_2v_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'YB Cut LV-Side 2V-2W', _yb_lv_2v_2w_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'YB Cut LV-Side 2W-2U', _yb_lv_2w_2u_controller),
                  ntr.vectorGroup.toLowerCase() == 'ynd1' ||
                          ntr.vectorGroup.toLowerCase() == 'ynd11'
                      ? Container()
                      : Card(
                          elevation: 2,
                          child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(children: [
                                simplifiedFor_Display_for_all_Mobile_numpad(
                                    'YB Cut LV-Side 2U-2N',
                                    _yb_lv_2u_2n_controller),
                                simplifiedFor_Display_for_all_Mobile_numpad(
                                    'YB Cut LV-Side 2V-2N',
                                    _yb_lv_2v_2n_controller),
                                simplifiedFor_Display_for_all_Mobile_numpad(
                                    'RY Cut LV-Side 2W-2N',
                                    _yb_lv_2w_2n_controller),
                              ]))),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'BR Cut HV-Side 1U-1V', _br_hv_1u_1v_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'BR Cut HV-Side 1V-1W', _br_hv_1v_1w_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'BR Cut HV-Side 1W-1U', _br_hv_1w_1u_controller),
                  ntr.vectorGroup.toLowerCase() == 'dyn1' ||
                          ntr.vectorGroup.toLowerCase() == 'dyn11'
                      ? Container()
                      : Card(
                          elevation: 2,
                          child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(children: [
                                simplifiedFor_Display_for_all_Mobile_numpad(
                                    'BR Cut HV-Side 1U-1N',
                                    _br_hv_1u_1n_controller),
                                simplifiedFor_Display_for_all_Mobile_numpad(
                                    'BR Cut HV-Side 1V-1N',
                                    _br_hv_1v_1n_controller),
                                simplifiedFor_Display_for_all_Mobile_numpad(
                                    'BR Cut HV-Side 1W-1N',
                                    _br_hv_1w_1n_controller),
                              ]))),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'BR Cut LV-Side 2U-2V', _br_lv_2u_2v_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'BR Cut LV-Side 2V-2W', _br_lv_2v_2w_controller),
                  simplifiedFor_Display_for_all_Mobile_numpad(
                      'BR Cut LV-Side 2W-2U', _br_lv_2w_2u_controller),
                  ntr.vectorGroup.toLowerCase() == 'ynd1' ||
                          ntr.vectorGroup.toLowerCase() == 'ynd11'
                      ? Container()
                      : Card(
                          elevation: 2,
                          child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(children: [
                                simplifiedFor_Display_for_all_Mobile_numpad(
                                    'BR Cut LV-Side 2U-2N',
                                    _br_lv_2u_2n_controller),
                                simplifiedFor_Display_for_all_Mobile_numpad(
                                    'BR Cut LV-Side 2V-2N',
                                    _br_lv_2v_2n_controller),
                                simplifiedFor_Display_for_all_Mobile_numpad(
                                    'BR Cut LV-Side 2W-2N',
                                    _br_lv_2w_2n_controller),
                              ]))),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
