import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/powt/powt_model.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/powt/powt_sc_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/powt_provider/powt_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/powt_provider/powt_sc_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditPowtScPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditPowtScPage(this.args, {Key key}) : super(key: key);

  final TextEditingController _IDcontroller = TextEditingController();

  final TextEditingController _Trno_Controller = TextEditingController();
  final TextEditingController _serialNo_Controller = TextEditingController();
  final TextEditingController _equipmentUsed_Controller =
      TextEditingController();
  final TextEditingController _hv_1u_controller = TextEditingController();
  final TextEditingController _hv_1v_controller = TextEditingController();
  final TextEditingController _hv_1w_controller = TextEditingController();
  final TextEditingController _hv_1n_controller = TextEditingController();
  final TextEditingController _lv_2u_controller = TextEditingController();
  final TextEditingController _lv_2v_controller = TextEditingController();
  final TextEditingController _lv_2w_controller = TextEditingController();
  final TextEditingController _lv_2n_controller = TextEditingController();
  final TextEditingController _tap_controller = TextEditingController();

  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Future<void> getReport() async {
    getX((Powtsc_Provider x) => x.getPowtscById(args['id']));
    PowtscModel _powtscModel = watchOnly((Powtsc_Provider x) => x.powtsc_Model);

    _IDcontroller.text = args['id'].toString();
    _Trno_Controller.text = _powtscModel.trNo.toString();
    // args['TrNo'].toString();
    _serialNo_Controller.text = _powtscModel.serialNo.toString();
    //args['Serial_No'];
    _hv_1u_controller.text = _powtscModel.hv_1u.toString();
    _hv_1v_controller.text = _powtscModel.hv_1v.toString();
    _hv_1w_controller.text = _powtscModel.hv_1w.toString();
    _hv_1n_controller.text = _powtscModel.hv_1n.toString();
    _lv_2u_controller.text = _powtscModel.lv_2u.toString();
    _lv_2v_controller.text = _powtscModel.lv_2v.toString();
    _lv_2w_controller.text = _powtscModel.lv_2w.toString();
    _lv_2n_controller.text = _powtscModel.lv_2n.toString();
    _tap_controller.text = _powtscModel.tapPosition.toString();
  }

  @override
  Widget build(BuildContext context) {
    final PowtModel ntr1 = watchOnly((PowtProvider x) => x.powtModel);

    final PowtscModel ntr = watchOnly((Powtsc_Provider x) => x.powtsc_Model);
    getReport();
    var mob =
        const Text('Edit powt-SC Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Edit powt-SC Details', style: TextStyle(fontSize: 20));

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
                  var url = Uri.parse('${Env.URL_PREFIX}/powtScTest/' +
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
                    _hv_1n_controller.text = '0.00';
                  }
                  if (ntr1.vectorGroup == "YNd1" ||
                      ntr1.vectorGroup == "YNd11") {
                    _lv_2n_controller.text = '0.00';
                  }

                  final Map payload = {
                    "trNo": args['trDatabaseID'].toString(),
                    'hv_1u': _hv_1u_controller.text.toString(),
                    'hv_1v': _hv_1v_controller.text.toString(),
                    'hv_1w': _hv_1w_controller.text.toString(),
                    'hv_1n': _hv_1n_controller.text.toString(),
                    'lv_2u': _lv_2u_controller.text.toString(),
                    'lv_2v': _lv_2v_controller.text.toString(),
                    'lv_2w': _lv_2w_controller.text.toString(),
                    'lv_2n': _lv_2n_controller.text.toString(),
                    'tapPosition': _tap_controller.text.toString(),
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
                    final PowtscModel powtScReportToLocal = PowtscModel(
                      trNo: int.parse(_Trno_Controller.text),
                      serialNo: _serialNo_Controller.text,
                      hv_1u: double.parse(_hv_1u_controller.text),
                      hv_1v: double.parse(_hv_1v_controller.text),
                      hv_1w: double.parse(_hv_1w_controller.text),
                      hv_1n: double.parse(_hv_1n_controller.text),
                      lv_2u: double.parse(_lv_2u_controller.text),
                      lv_2v: double.parse(_lv_2v_controller.text),
                      lv_2w: double.parse(_lv_2w_controller.text),
                      lv_2n: double.parse(_lv_2n_controller.text),
                      tapPosition: int.parse(_tap_controller.text),
                      databaseID: ntr.databaseID,
                      equipmentUsed: selectedValueForEquipmentUse.toString(),
                      updateDate: DateTime.now(),
                    );

                    getX((Powtsc_Provider x) =>
                        x.updatePowtsc(powtScReportToLocal, args['id']));
                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_Powtsc',
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
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'HV-Side 1U', _hv_1u_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'HV-Side 1V', _hv_1v_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'HV-Side 1W', _hv_1w_controller),
                    ntr.vectorGroup.toLowerCase() == 'dyn1' ||
                            ntr.vectorGroup.toLowerCase() == 'dyn11'
                        ? Container()
                        : Card(
                            elevation: 2,
                            child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(children: [
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'HV-Side 1N', _hv_1n_controller),
                                ]))),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'LV-Side 2U', _lv_2u_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'LV-Side 2V', _lv_2v_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'LV-Side 2W', _lv_2w_controller),
                    ntr.vectorGroup.toLowerCase() == 'ynd1' ||
                            ntr.vectorGroup.toLowerCase() == 'ynd11'
                        ? Container()
                        : Card(
                            elevation: 2,
                            child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(children: [
                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                      'LV-Side 2N', _lv_2n_controller),
                                ]))),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Tap Position', _tap_controller),
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: EquipmentTypeList(),
                    ),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'HV-Side 1U', _hv_1u_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'HV-Side 1V', _hv_1v_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'HV-Side 1W', _hv_1w_controller),
                    ntr.vectorGroup.toLowerCase() == 'dyn1' ||
                            ntr.vectorGroup.toLowerCase() == 'dyn11'
                        ? Container()
                        : Card(
                            elevation: 2,
                            child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(children: [
                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                      'HV-Side 1N', _hv_1n_controller),
                                ]))),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'LV-Side 2U', _lv_2u_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'LV-Side 2V', _lv_2v_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'LV-Side 2W', _lv_2w_controller),
                    ntr.vectorGroup.toLowerCase() == 'ynd1' ||
                            ntr.vectorGroup.toLowerCase() == 'ynd11'
                        ? Container()
                        : Card(
                            elevation: 2,
                            child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(children: [
                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                      'LV-Side 2N', _lv_2n_controller),
                                ]))),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Tap Position', _tap_controller),
                  ]),
            ),
          );
        }
      }),
    );
  }
}
