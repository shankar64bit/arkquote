import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../data/models/equipment/LA/la_ir_test_model.dart';
import '../../providers/la_provider/la_ir_provider.dart';
import '../dropdown_All/MegaGigaTeraRadioButton/ct_ir_radio_button_page.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditLaIrPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditLaIrPage(this.args, {Key key}) : super(key: key);

  LaIrTestModel _laIrTestModel;
  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _SerialNOcontroller = TextEditingController();
  final TextEditingController _sercontroller = TextEditingController();
  final TextEditingController _seycontroller = TextEditingController();
  final TextEditingController _sebcontroller = TextEditingController();
  final TextEditingController _ssrcontroller = TextEditingController();
  final TextEditingController _ssycontroller = TextEditingController();
  final TextEditingController _ssbcontroller = TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Enum_ct_ir get selected_ser => Radio_peR().get_Radio_peR();
  Enum_ct_ir get selected_sey => Radio_pc1B().get_Radio_pc1B();
  Enum_ct_ir get selected_seb => Radio_pc2B().get_Radio_pc2B();
  Enum_ct_ir get selected_ssr => Radio_pc3B().get_Radio_pc3B();
  Enum_ct_ir get selected_ssy => Radio_pc4B().get_Radio_pc4B();
  Enum_ct_ir get selected_ssb => Radio_pc5B().get_Radio_pc5B();

  Future<void> getReport() async {
    getX((LaIrProvider x) => x.getLaIrByID(args['id']));
    _laIrTestModel = watchOnly((LaIrProvider x) => x.laIrModel);

    _IDcontroller.text = args['id'].toString();
    _nOcontroller.text = args['TrNo'].toString();
    _SerialNOcontroller.text = args['Serial_No'];
    _sercontroller.text = _laIrTestModel.seR.toString();
    _seycontroller.text = _laIrTestModel.seY.toString();
    _sebcontroller.text = _laIrTestModel.seB.toString();
    _ssrcontroller.text = _laIrTestModel.ssR.toString();
    _ssycontroller.text = _laIrTestModel.ssY.toString();
    _ssbcontroller.text = _laIrTestModel.ssB.toString();
  }

  @override
  Widget build(BuildContext context) {
    final LaIrTestModel ntr = watchOnly((LaIrProvider x) => x.laIrModel);
    getReport();
    var mob = const Text('Edit LA-IR Details', style: TextStyle(fontSize: 15));
    var desk = const Text('Edit LA-IR Details', style: TextStyle(fontSize: 20));

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

                  double ser;
                  double sey;
                  double seb;
                  double ssr;
                  double ssy;
                  double ssb;

                  ser = convertValue(double.parse(_sercontroller.text),
                      selected_ser.toString().split('.')[1]);
                  sey = convertValue(double.parse(_seycontroller.text),
                      selected_sey.toString().split('.')[1]);
                  seb = convertValue(double.parse(_sebcontroller.text),
                      selected_seb.toString().split('.')[1]);
                  ssr = convertValue(double.parse(_ssrcontroller.text),
                      selected_ssr.toString().split('.')[1]);
                  ssy = convertValue(double.parse(_ssycontroller.text),
                      selected_ssy.toString().split('.')[1]);
                  ssb = convertValue(double.parse(_ssbcontroller.text),
                      selected_ssb.toString().split('.')[1]);

                  //add to remote database
                  var success_code = 201;
                  var success_code1 = 200;
                  var failed_code = 'Server Connection Lost';
                  //add to remote database
                  var url = Uri.parse('${Env.URL_PREFIX}/laIrTest/' +
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
                    'seR': ser.toString(),
                    'seY': sey.toString(),
                    'seB': seb.toString(),
                    'ssR': ssr.toString(),
                    'ssY': ssy.toString(),
                    'ssB': ssb.toString(),
                    "serialNo": args['LA_ID'].toString(),
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
                    final LaIrTestModel laIrReportToLocal = LaIrTestModel(
                      trNo: int.parse(_nOcontroller.text),
                      serialNo: _SerialNOcontroller.text,
                      seR: ser,
                      seY: sey,
                      seB: seb,
                      ssR: ssr,
                      ssY: ssy,
                      ssB: ssb,
                      databaseID: ntr.databaseID,
                      EquipmentType: selectedValueForEquipmentUse.toString(),
                      lastUpdated: DateTime.now(),
                    );

                    getX((LaIrProvider x) =>
                        x.updateLaIr(laIrReportToLocal, args['id']));

                    Navigator.popAndPushNamed(context, '/detail_LA_IR',
                        arguments: {
                          'id': args['id'],
                          'LA_ID': args['LA_ID'],
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
                  controller: _IDcontroller,
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
                  controller: _nOcontroller,
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
                  controller: _SerialNOcontroller,
                  enabled: false,
                  textAlign: TextAlign.center,
                  // hintText: 'Serial No',
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 20, 150, 10),
                  child: EquipmentTypeList(),
                ),
                Radio_peR(),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Stack-Earth R', _sercontroller),
                Radio_pc1B(),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Stack-Earth Y', _seycontroller),
                Radio_pc2B(),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Stack-Earth B', _sebcontroller),
                Radio_pc3B(),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Stack-Stack R', _ssrcontroller),
                Radio_pc4B(),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Stack-Stack Y', _ssycontroller),
                Radio_pc5B(),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Stack-Stack B', _ssbcontroller),
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
                  controller: _IDcontroller,
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
                  controller: _nOcontroller,
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
                  controller: _SerialNOcontroller,
                  enabled: false,
                  textAlign: TextAlign.center,
                  // hintText: 'Serial No',
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child: EquipmentTypeList(),
                ),
                Radio_peR(),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Stack-Earth R', _sercontroller),
                Radio_pc1B(),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Stack-Earth Y', _seycontroller),
                Radio_pc2B(),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Stack-Earth B', _sebcontroller),
                Radio_pc3B(),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Stack-Stack R', _ssrcontroller),
                Radio_pc4B(),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Stack-Stack Y', _ssycontroller),
                Radio_pc5B(),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Stack-Stack B', _ssbcontroller),
              ]),
            ),
          );
        }
      }),
    );
  }
}
