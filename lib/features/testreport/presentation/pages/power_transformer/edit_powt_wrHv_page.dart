import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/powt/powt_model.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/powt/powt_wrHv_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/powt_provider/powt_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/powt_provider/powt_wrHv_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditPowtWrHvPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditPowtWrHvPage(this.args, {Key key}) : super(key: key);

  final TextEditingController _IDcontroller = TextEditingController();

  final TextEditingController _Trno_Controller = TextEditingController();
  final TextEditingController _serialNo_Controller = TextEditingController();
  final TextEditingController _equipmentUsed_Controller =
      TextEditingController();
  final TextEditingController _hv_r_1u_1vn_controller = TextEditingController();
  final TextEditingController _hv_r_1v_1wn_controller = TextEditingController();
  final TextEditingController _hv_r_1w_1un_controller = TextEditingController();
  final TextEditingController _tap_controller = TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Future<void> getReport() async {
    getX((PowtwrHvProvider x) => x.getPowtwrHvById(args['id']));
    PowtwrHvModel _powtWrHvModel =
        watchOnly((PowtwrHvProvider x) => x.powtwrHv_Model);

    _IDcontroller.text = args['id'].toString();
    _Trno_Controller.text = _powtWrHvModel.trNo.toString();
    // args['TrNo'].toString();
    _serialNo_Controller.text = _powtWrHvModel.serialNo.toString();
    //args['Serial_No'];
    _hv_r_1u_1vn_controller.text = _powtWrHvModel.hv_r_1u_1vn.toString();
    _hv_r_1v_1wn_controller.text = _powtWrHvModel.hv_r_1v_1wn.toString();
    _hv_r_1w_1un_controller.text = _powtWrHvModel.hv_r_1w_1un.toString();
    _tap_controller.text = _powtWrHvModel.tapPosition.toString();
  }

  @override
  Widget build(BuildContext context) {
    final PowtModel ntr1 = watchOnly((PowtProvider x) => x.powtModel);

    final PowtwrHvModel ntr =
        watchOnly((PowtwrHvProvider x) => x.powtwrHv_Model);
    getReport();
    var mob =
        const Text('Edit powt-wr HV Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Edit powt-wr Hv Details', style: TextStyle(fontSize: 20));

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
                  var url = Uri.parse('${Env.URL_PREFIX}/powtWrHvTest/' +
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
                    'hv_r_1u_1vn': _hv_r_1u_1vn_controller.text.toString(),
                    'hv_r_1v_1wn': _hv_r_1v_1wn_controller.text.toString(),
                    'hv_r_1w_1un': _hv_r_1w_1un_controller.text.toString(),
                    'tapPosition': _tap_controller.text.toString(),
                    "serialNo": args['POWT_ID'].toString(),
                    // "equipmentUsed": selectedValueForEquipmentUse.toString(),
                    // "updateDate": DateTime.now().toString(),
                  };
                  var response = await http.put(url,
                      body: jsonEncode(payload), headers: headers);

                  if (response.statusCode == success_code ||
                      response.statusCode == success_code1) {
                    print('Response status: ${response.statusCode}');
                    print('Response body: ${response.body}');
                    print('Stored successfully');

                    //add to local database
                    final PowtwrHvModel powtwrHvReportToLocal = PowtwrHvModel(
                      trNo: int.parse(_Trno_Controller.text),
                      serialNo: _serialNo_Controller.text,
                      hv_r_1u_1vn: double.parse(_hv_r_1u_1vn_controller.text),
                      hv_r_1v_1wn: double.parse(_hv_r_1v_1wn_controller.text),
                      hv_r_1w_1un: double.parse(_hv_r_1w_1un_controller.text),
                      tapPosition: int.parse(_tap_controller.text),
                      databaseID: ntr.databaseID,
                    );

                    getX((PowtwrHvProvider x) =>
                        x.updatePowtwrHv(powtwrHvReportToLocal, args['id']));
                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_PowtwrHv',
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
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'HV Winding Measured Resistance Value (mΩ) 1U1V/1U1N',
                        _hv_r_1u_1vn_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'HV Winding Measured Resistance Value (mΩ) 1V1W/1V1N',
                        _hv_r_1v_1wn_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'HV Winding Measured Resistance Value (mΩ) 1W1U/1W1N',
                        _hv_r_1w_1un_controller),
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
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'HV Winding Measured Resistance Value (mΩ) 1U1V/1U1N',
                        _hv_r_1u_1vn_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'HV Winding Measured Resistance Value (mΩ) 1V1W/1V1N',
                        _hv_r_1v_1wn_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'HV Winding Measured Resistance Value (mΩ) 1W1U/1W1N',
                        _hv_r_1w_1un_controller),
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
