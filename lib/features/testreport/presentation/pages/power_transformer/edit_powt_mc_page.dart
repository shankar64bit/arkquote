import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/powt/powt_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/powt_provider/powt_mc_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/powt_provider/powt_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../data/models/equipment/powt/powt_mc_model.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditPowtMcPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditPowtMcPage(this.args, {Key key}) : super(key: key);

  final TextEditingController _IDcontroller = TextEditingController();

  final TextEditingController _Trno_Controller = TextEditingController();
  final TextEditingController _serialNo_Controller = TextEditingController();
  final TextEditingController _tap_Controller = TextEditingController();

  final TextEditingController _hv_1u_1n_controller = TextEditingController();
  final TextEditingController _hv_1v_1n_controller = TextEditingController();
  final TextEditingController _hv_1w_1n_controller = TextEditingController();
  final TextEditingController _hv_1u_controller = TextEditingController();
  final TextEditingController _hv_1v_controller = TextEditingController();
  final TextEditingController _hv_1w_controller = TextEditingController();
  final TextEditingController _hv_1n_controller = TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Future<void> getReport() async {
    getX((Powt_mc_Provider x) => x.getPowt_mcById(args['id']));
    Powt_mc_Model _powtMcModel =
        watchOnly((Powt_mc_Provider x) => x.powt_mc_Model);

    _IDcontroller.text = args['id'].toString();
    _Trno_Controller.text = _powtMcModel.trNo.toString();
    // args['TrNo'].toString();
    _serialNo_Controller.text = _powtMcModel.serialNo.toString();
    //args['Serial_No'];
    _hv_1u_1n_controller.text = _powtMcModel.hv_1u_1n.toString();
    _hv_1v_1n_controller.text = _powtMcModel.hv_1v_1n.toString();
    _hv_1w_1n_controller.text = _powtMcModel.hv_1w_1n.toString();
    _hv_1u_controller.text = _powtMcModel.hv_1u.toString();
    _hv_1v_controller.text = _powtMcModel.hv_1v.toString();
    _hv_1w_controller.text = _powtMcModel.hv_1w.toString();
    _hv_1n_controller.text = _powtMcModel.hv_1n.toString();
    _tap_Controller.text = _powtMcModel.tapPosition.toString();
  }

  @override
  Widget build(BuildContext context) {
    final PowtModel ntr1 = watchOnly((PowtProvider x) => x.powtModel);

    final Powt_mc_Model ntr =
        watchOnly((Powt_mc_Provider x) => x.powt_mc_Model);
    getReport();
    var mob =
        const Text('Edit powt-MC Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Edit powt-MC Details', style: TextStyle(fontSize: 20));

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

                  double hv_1u_1n;
                  double hv_1v_1n;
                  double hv_1w_1n;
                  double hv_1u;
                  double hv_1v;
                  double hv_1w;
                  double hv_1n;

                  if (ntr1.vectorGroup == "Db0" ||
                      ntr1.vectorGroup == "Db6" ||
                      ntr1.vectorGroup == "Dyn1" ||
                      ntr1.vectorGroup == "Dyn11") {
                    hv_1u_1n = double.parse(_hv_1u_1n_controller.text);
                    hv_1v_1n = double.parse(_hv_1v_1n_controller.text);
                    hv_1w_1n = double.parse(_hv_1w_1n_controller.text);
                    hv_1u = double.parse(_hv_1u_controller.text);
                    hv_1v = double.parse(_hv_1v_controller.text);
                    hv_1w = double.parse(_hv_1w_controller.text);
                    hv_1n = 0.00;
                  }

                  if (ntr1.vectorGroup == "YNd1" ||
                      ntr1.vectorGroup == "YNd11" ||
                      ntr1.vectorGroup == "YNyn0" ||
                      ntr1.vectorGroup == "YNyn6") {
                    hv_1u_1n = double.parse(_hv_1u_1n_controller.text);
                    hv_1v_1n = double.parse(_hv_1v_1n_controller.text);
                    hv_1w_1n = double.parse(_hv_1w_1n_controller.text);
                    hv_1u = double.parse(_hv_1u_controller.text);
                    hv_1v = double.parse(_hv_1v_controller.text);
                    hv_1w = double.parse(_hv_1w_controller.text);
                    hv_1n = double.parse(_hv_1n_controller.text);
                  }

                  _hv_1u_1n_controller.text = hv_1u_1n.toString();
                  _hv_1v_1n_controller.text = hv_1v_1n.toString();
                  _hv_1w_1n_controller.text = hv_1w_1n.toString();
                  _hv_1u_controller.text = hv_1u.toString();
                  _hv_1v_controller.text = hv_1v.toString();
                  _hv_1w_controller.text = hv_1w.toString();
                  _hv_1n_controller.text = hv_1n.toString();

                  //add to remote database
                  var success_code = 201;
                  var success_code1 = 200;
                  var failed_code = 'Server Connection Lost';
                  //add to remote database
                  var url = Uri.parse('${Env.URL_PREFIX}/powtMcTest/' +
                      ntr.databaseID.toString() +
                      '/');

                  Map<String, String> headers = {
                    "Content-type": "application/json",
                    "Authorization": "Bearer $acc_token",
                  };
                  print("***********");
                  print(url);
                  print(args['trDatabaseID'].toString());
                  if (ntr1.vectorGroup.toLowerCase() == 'dyn1' ||
                      ntr1.vectorGroup.toLowerCase() == 'dyn11') {
                    _hv_1n_controller.text = '0.0';
                  }

                  final Map payload = {
                    "trNo": args['trDatabaseID'].toString(),
                    'hv_1u_1n': _hv_1u_1n_controller.text.toString(),
                    'hv_1v_1n': _hv_1v_1n_controller.text.toString(),
                    'hv_1w_1n': _hv_1w_1n_controller.text.toString(),
                    'hv_1u': _hv_1u_controller.text.toString(),
                    'hv_1v': _hv_1v_controller.text.toString(),
                    'hv_1w': _hv_1w_controller.text.toString(),
                    'hv_1n': _hv_1n_controller.text.toString(),
                    'tapPosition': _tap_Controller.text.toString(),
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
                    final Powt_mc_Model powtMcReportToLocal = Powt_mc_Model(
                      trNo: int.parse(_Trno_Controller.text),
                      serialNo: _serialNo_Controller.text,
                      hv_1u_1n: double.parse(_hv_1u_1n_controller.text),
                      hv_1v_1n: double.parse(_hv_1v_1n_controller.text),
                      hv_1w_1n: double.parse(_hv_1w_1n_controller.text),
                      hv_1u: double.parse(_hv_1u_controller.text),
                      hv_1v: double.parse(_hv_1v_controller.text),
                      hv_1w: double.parse(_hv_1w_controller.text),
                      hv_1n: double.parse(_hv_1n_controller.text),
                      tapPosition: int.parse(_tap_Controller.text),
                      databaseID: ntr.databaseID,
                      equipmentUsed: selectedValueForEquipmentUse.toString(),
                      updateDate: DateTime.now(),
                    );

                    getX((Powt_mc_Provider x) =>
                        x.updatePowt_mc(powtMcReportToLocal, args['id']));
                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_Powt_mc',
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
                        'Tap Position', _tap_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Applied Voltage HV Side - UN', _hv_1u_1n_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Applied Voltage HV Side - VN', _hv_1v_1n_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Applied Voltage HV Side - WN', _hv_1w_1n_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Measured Magnetizing Current HV Side-1U',
                        _hv_1u_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Measured Magnetizing Current HV Side-1V',
                        _hv_1v_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Measured Magnetizing Current HV Side-1W',
                        _hv_1w_controller),
                    ntr.vectorGroup.toLowerCase() == 'dyn1' ||
                            ntr.vectorGroup.toLowerCase() == 'dyn11'
                        ? Container()
                        : simplifiedFor_Diplay_for_all_PC_numpad(
                            'Measured Magnetizing Current HV Side-1N',
                            _hv_1n_controller),
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
                        'Tap Position', _tap_Controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Applied Voltage HV Side - UN', _hv_1u_1n_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Applied Voltage HV Side - VN', _hv_1v_1n_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Applied Voltage HV Side - WN', _hv_1w_1n_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Measured Magnetizing Current HV Side-1U',
                        _hv_1u_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Measured Magnetizing Current HV Side-1V',
                        _hv_1v_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Measured Magnetizing Current HV Side-1W',
                        _hv_1w_controller),
                    ntr.vectorGroup.toLowerCase() == 'dyn1' ||
                            ntr.vectorGroup.toLowerCase() == 'dyn11'
                        ? Container()
                        : simplifiedFor_Display_for_all_Mobile_numpad(
                            'Measured Magnetizing Current HV Side-1N',
                            _hv_1n_controller),
                  ]),
            ),
          );
        }
      }),
    );
  }
}
