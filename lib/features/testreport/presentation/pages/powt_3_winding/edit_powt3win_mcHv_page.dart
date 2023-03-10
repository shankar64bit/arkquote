import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/powt_3_winding/powt3win_mcHv_model.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/powt_3_winding/powt3winding_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/powt_3_winding/powt3win_mcHv_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/powt_3_winding/powt_3_winding_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditPowt3winmcHvPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditPowt3winmcHvPage(this.args, {Key key}) : super(key: key);

  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _trNo_controller = TextEditingController();
  final TextEditingController _serialNo_controller = TextEditingController();
  final TextEditingController _hv_1u_1vn_controller = TextEditingController();
  final TextEditingController _hv_1v_1wn_controller = TextEditingController();
  final TextEditingController _hv_1w_1un_controller = TextEditingController();
  final TextEditingController _hv_1u_controller = TextEditingController();
  final TextEditingController _hv_1v_controller = TextEditingController();
  final TextEditingController _hv_1w_controller = TextEditingController();
  final TextEditingController _hv_1n_controller = TextEditingController();
  final TextEditingController _tap_controller = TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Future<void> getReport() async {
    getX((Powt3win_mcHv_Provider x) => x.getPowt3win_mcHvById(args['id']));
    Powt3win_mcHv_Model _powt3WindingmcHvModel =
        watchOnly((Powt3win_mcHv_Provider x) => x.powt3win_mcHv_Model);

    _IDcontroller.text = args['id'].toString();
    _trNo_controller.text = _powt3WindingmcHvModel.trNo.toString();
    _serialNo_controller.text = _powt3WindingmcHvModel.serialNo.toString();
    _hv_1u_1vn_controller.text = _powt3WindingmcHvModel.hv_1u_1vn.toString();
    _hv_1v_1wn_controller.text = _powt3WindingmcHvModel.hv_1v_1wn.toString();
    _hv_1w_1un_controller.text = _powt3WindingmcHvModel.hv_1w_1un.toString();
    _hv_1n_controller.text = _powt3WindingmcHvModel.hv_1n.toString();
    _hv_1u_controller.text = _powt3WindingmcHvModel.hv_1u.toString();
    _hv_1v_controller.text = _powt3WindingmcHvModel.hv_1v.toString();
    _hv_1w_controller.text = _powt3WindingmcHvModel.hv_1w.toString();
    _tap_controller.text = _powt3WindingmcHvModel.tapPosition.toString();
  }

  setDefaultValue(Powt3WindingModel ntr) {
    if (ntr.vectorGroup == 'yna0d11') {
      _hv_1n_controller.text = '0.0';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Powt3WindingModel ntr1 =
        watchOnly((Powt3WindingProvider x) => x.powt3WindingModel);

    final Powt3win_mcHv_Model ntr =
        watchOnly((Powt3win_mcHv_Provider x) => x.powt3win_mcHv_Model);
    getReport();
    var mob = const Text('Edit powt3winding-Mc HV Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('Edit powt3winding-Mc HV Details',
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
                  var url = Uri.parse('${Env.URL_PREFIX}/powt3wMcHvTest/' +
                      ntr.databaseID.toString() +
                      '/');
                  setDefaultValue(ntr1);

                  Map<String, String> headers = {
                    "Content-type": "application/json",
                    "Authorization": "Bearer $acc_token",
                  };
                  print("***********");
                  print(url);
                  print(args['trDatabaseID'].toString());

                  final Map payload = {
                    "trNo": args['trDatabaseID'].toString(),
                    'hv_1u_1vn': _hv_1u_1vn_controller.text.toString(),
                    'hv_1v_1wn': _hv_1v_1wn_controller.text.toString(),
                    'hv_1w_1un': _hv_1w_1un_controller.text.toString(),
                    'hv_1u': _hv_1u_controller.text.toString(),
                    'hv_1v': _hv_1v_controller.text.toString(),
                    'hv_1w': _hv_1w_controller.text.toString(),
                    'hv_1n': _hv_1n_controller.text.toString(),
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
                    final Powt3win_mcHv_Model powt3winMcHvReportToLocal =
                        Powt3win_mcHv_Model(
                      trNo: int.parse(_trNo_controller.text),
                      serialNo: _serialNo_controller.text,
                      hv_1u_1vn: double.parse(_hv_1u_1vn_controller.text),
                      hv_1v_1wn: double.parse(_hv_1v_1wn_controller.text),
                      hv_1w_1un: double.parse(_hv_1w_1un_controller.text),
                      hv_1u: double.parse(_hv_1u_controller.text),
                      hv_1v: double.parse(_hv_1v_controller.text),
                      hv_1w: double.parse(_hv_1w_controller.text),
                      hv_1n: double.parse(_hv_1n_controller.text),
                      tapPosition: int.parse(_tap_controller.text),
                      databaseID: ntr.databaseID,
                      // updateDate: DateTime.now(),
                    );

                    getX((Powt3win_mcHv_Provider x) => x.updatePowt3win_mcHv(
                        powt3winMcHvReportToLocal, args['id']));
                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_POWT3WIN_mcHv',
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
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'HV side 1UN/UV', _hv_1u_1vn_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'HV side 1VN/VW', _hv_1v_1wn_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'HV side 1WN/WU', _hv_1w_1un_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'HV Side 1U', _hv_1u_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'HV Side 1V', _hv_1v_controller),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'HV Side 1W', _hv_1w_controller),
                  ntr.vectorGroup.toLowerCase() == "ynyn0d11"
                      ? simplifiedFor_Diplay_for_all_PC_numpad(
                          'HV Side 1N', _hv_1n_controller)
                      : Container(),
                  simplifiedFor_Diplay_for_all_PC_numpad(
                      'tapPosition', _tap_controller),
                  Divider(color: Colors.white)
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
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'HV side 1UN/UV', _hv_1u_1vn_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'HV side 1VN/VW', _hv_1v_1wn_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'HV side 1WN/WU', _hv_1w_1un_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'HV Side 1U', _hv_1u_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'HV Side 1V', _hv_1v_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'HV Side 1W', _hv_1w_controller),
                    ntr.vectorGroup == "ynyn0d11"
                        ? simplifiedFor_Display_for_all_Mobile_numpad(
                            'HV Side 1N', _hv_1n_controller)
                        : Container(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'tapPosition', _tap_controller),
                    Divider(color: Colors.white)
                  ]),
            ),
          );
        }
      }),
    );
  }
}
