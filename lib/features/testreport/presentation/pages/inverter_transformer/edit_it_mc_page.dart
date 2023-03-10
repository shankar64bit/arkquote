import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/Auser_input_validation_exnt.dart/validation_extension_methods.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/widgets/custom_text_form_field.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../data/models/equipment/IT/it_mc_model.dart';
import '../../../data/models/equipment/IT/it_model.dart';
import '../../providers/it_provider/it_mc_provider.dart';
import '../../providers/it_provider/it_provider.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditItMcPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditItMcPage(this.args, {Key key}) : super(key: key);

  ItMcTestModel _itMcTestModel;

  final TextEditingController _Trno_Controller = TextEditingController();
  final TextEditingController _serialNo_Controller = TextEditingController();
  final TextEditingController _tapPosition_Controller = TextEditingController();
  final TextEditingController _uv_Controller = TextEditingController();
  final TextEditingController _vw_Controller = TextEditingController();
  final TextEditingController _wu_Controller = TextEditingController();
  final TextEditingController _u_Controller = TextEditingController();
  final TextEditingController _v_Controller = TextEditingController();
  final TextEditingController _w_Controller = TextEditingController();

  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Future<void> getReport() async {
    getX((ItMcProvider x) => x.getItMcByID(args['id']));
    _itMcTestModel = watchOnly((ItMcProvider x) => x.itMcModel);

    _Trno_Controller.text = args['TrNo'].toString();
    _serialNo_Controller.text = args['SerialNo'];
    _tapPosition_Controller.text = _itMcTestModel.tapPosition;
    _uv_Controller.text = _itMcTestModel.uv.toString();
    _vw_Controller.text = _itMcTestModel.vw.toString();
    _wu_Controller.text = _itMcTestModel.wu.toString();
    _u_Controller.text = _itMcTestModel.uv.toString();
    _v_Controller.text = _itMcTestModel.vw.toString();
    _w_Controller.text = _itMcTestModel.wu.toString();
  }

  @override
  Widget build(BuildContext context) {
    final ItModel ntr1 = watchOnly((ItProvider x) => x.itModel);

    final ItMcTestModel ntr = watchOnly((ItMcProvider x) => x.itMcModel);
    getReport();
    var mob = const Text('Edit IT-Mc Details', style: TextStyle(fontSize: 15));
    var desk = const Text('Edit IT-Mc Details', style: TextStyle(fontSize: 20));

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
                  var url = Uri.parse('${Env.URL_PREFIX}/itMcTest/' +
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
                    'tapPosition': _tapPosition_Controller.text,
                    'uv': _uv_Controller.text.toString(),
                    'vw': _vw_Controller.text.toString(),
                    'wu': _wu_Controller.text.toString(),
                    'U': _u_Controller.text.toString(),
                    'V': _v_Controller.text.toString(),
                    'w': _w_Controller.text.toString(),
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
                    final ItMcTestModel itMcReportToLocal = ItMcTestModel(
                      trNo: int.parse(_Trno_Controller.text),
                      serialNo: _serialNo_Controller.text,
                      tapPosition: _tapPosition_Controller.text,
                      uv: double.parse(_uv_Controller.text),
                      vw: double.parse(_vw_Controller.text),
                      wu: double.parse(_wu_Controller.text),
                      u: double.parse(_u_Controller.text),
                      v: double.parse(_v_Controller.text),
                      w: double.parse(_w_Controller.text),
                      databaseID: ntr.databaseID,
                      equipmentUsed: selectedValueForEquipmentUse.toString(),
                      updateDate: DateTime.now(),
                    );
                    print("Added to local DB");
                    print(itMcReportToLocal);
                    getX((ItMcProvider x) =>
                        x.updateItMc(itMcReportToLocal, args['id']));

                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_IT_MC',
                        arguments: {
                          'id': args['id'],
                          'itRDatabaseID': ntr.databaseID,
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
                  controller: _Trno_Controller,
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
                DisplayfieldDesk('Tap Position', _tapPosition_Controller),
                DisplayfieldDesk(
                    'Applied Voltage HV Side (V)-U-V', _uv_Controller),
                DisplayfieldDesk(
                    'Applied Voltage HV Side (V)-V-W', _vw_Controller),
                DisplayfieldDesk(
                    'Applied Voltage HV Side (V)-W-U', _wu_Controller),
                DisplayfieldDesk('Measured Magnetizing Current HV Side (mA)-U',
                    _u_Controller),
                DisplayfieldDesk('Measured Magnetizing Current HV Side (mA)-V',
                    _v_Controller),
                DisplayfieldDesk('Measured Magnetizing Current HV Side (mA)-W',
                    _w_Controller),
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
                  controller: _Trno_Controller,
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
                DisplayfieldMob('Tap Position', _tapPosition_Controller),
                DisplayfieldMob(
                    'Applied Voltage HV Side (V)-U-V', _uv_Controller),
                DisplayfieldMob(
                    'Applied Voltage HV Side (V)-V-W', _vw_Controller),
                DisplayfieldMob(
                    'Applied Voltage HV Side (V)-W-U', _wu_Controller),
                DisplayfieldMob('Measured Magnetizing Current HV Side (mA)-U',
                    _u_Controller),
                DisplayfieldMob('Measured Magnetizing Current HV Side (mA)-V',
                    _v_Controller),
                DisplayfieldMob('Measured Magnetizing Current HV Side (mA)-W',
                    _w_Controller),
              ]),
            ),
          );
        }
      }),
    );
  }

  DisplayfieldDesk(String hinttext, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
      child: CustomTextFormField(
        controller: controller,
        hintText: hinttext,
        validator: (val) {
          if (!val.IsValueEmpty) {
            return 'Field should not be empty';
          }
        },
      ),
    );
  }

  DisplayfieldMob(String hinttext, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: CustomTextFormField(
        controller: controller,
        hintText: hinttext,
        validator: (val) {
          if (!val.IsValueEmpty) {
            return 'Field should not be empty';
          }
        },
      ),
    );
  }
}
