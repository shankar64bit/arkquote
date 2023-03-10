import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/isolator/iso_ir_test_model.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/isolator/iso_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/Auser_input_validation_exnt.dart/validation_extension_methods.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/iso_provider/iso_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/widgets/custom_text_form_field.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../providers/iso_provider/iso_ir_provider.dart';
import '../dropdown_All/MegaGigaTeraRadioButton/ct_ir_radio_button_page.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';
import '../dropdown_All/responsive_tool/google_sign_in_out/login_page.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditIsoIrPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditIsoIrPage(this.args, {Key key}) : super(key: key);

  IsoIrTestModel _isoIrTestModel;
  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _SerialNOcontroller = TextEditingController();
  final TextEditingController _rrcontroller = TextEditingController();
  final TextEditingController _yycontroller = TextEditingController();
  final TextEditingController _bbcontroller = TextEditingController();
  final TextEditingController _rycontroller = TextEditingController();
  final TextEditingController _ybcontroller = TextEditingController();
  final TextEditingController _brcontroller = TextEditingController();
  final TextEditingController _recontroller = TextEditingController();
  final TextEditingController _yecontroller = TextEditingController();
  final TextEditingController _becontroller = TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Enum_ct_ir get selected_rr => Radio_peR().get_Radio_peR();
  Enum_ct_ir get selected_yy => Radio_pc1B().get_Radio_pc1B();
  Enum_ct_ir get selected_bb => Radio_pc2B().get_Radio_pc2B();
  Enum_ct_ir get selected_re => Radio_pc3B().get_Radio_pc3B();
  Enum_ct_ir get selected_ye => Radio_pc4B().get_Radio_pc4B();
  Enum_ct_ir get selected_be => Radio_pc5B().get_Radio_pc5B();
  Enum_ct_ir get selected_ry => Radio_pc1R().get_Radio_pc1R();
  Enum_ct_ir get selected_yb => Radio_pc2R().get_Radio_pc2R();
  Enum_ct_ir get selected_br => Radio_pc3R().get_Radio_pc3R();

  Future<void> getReport() async {
    getX((IsoIrProvider x) => x.getIsoIrByID(args['id']));
    _isoIrTestModel = watchOnly((IsoIrProvider x) => x.isoIrModel);

    _IDcontroller.text = args['id'].toString();
    _nOcontroller.text = args['TrNo'].toString();
    _SerialNOcontroller.text = args['Serial_No'];
    _brcontroller.text = _isoIrTestModel.br.toString();
    _rrcontroller.text = _isoIrTestModel.rr.toString();
    _yycontroller.text = _isoIrTestModel.yy.toString();
    _bbcontroller.text = _isoIrTestModel.bb.toString();
    _recontroller.text = _isoIrTestModel.re.toString();
    _yecontroller.text = _isoIrTestModel.ye.toString();
    _becontroller.text = _isoIrTestModel.be.toString();
    _rycontroller.text = _isoIrTestModel.ry.toString();
    _ybcontroller.text = _isoIrTestModel.yb.toString();
  }

  @override
  Widget build(BuildContext context) {
    final IsoIrTestModel ntr = watchOnly((IsoIrProvider x) => x.isoIrModel);
    getReport();
    var mob = const Text('Edit ISO-IR Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Edit ISO-IR Details', style: TextStyle(fontSize: 20));

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

                  double rr;
                  double yy;
                  double bb;
                  double re;
                  double ye;
                  double be;
                  double ry;
                  double yb;
                  double br;

                  rr = convertValue(double.parse(_rrcontroller.text),
                      selected_rr.toString().split('.')[1]);
                  yy = convertValue(double.parse(_yycontroller.text),
                      selected_yy.toString().split('.')[1]);
                  bb = convertValue(double.parse(_bbcontroller.text),
                      selected_bb.toString().split('.')[1]);
                  re = convertValue(double.parse(_recontroller.text),
                      selected_re.toString().split('.')[1]);
                  ye = convertValue(double.parse(_yecontroller.text),
                      selected_ye.toString().split('.')[1]);
                  be = convertValue(double.parse(_becontroller.text),
                      selected_be.toString().split('.')[1]);
                  ry = convertValue(double.parse(_rycontroller.text),
                      selected_ry.toString().split('.')[1]);
                  yb = convertValue(double.parse(_ybcontroller.text),
                      selected_yb.toString().split('.')[1]);
                  br = convertValue(double.parse(_brcontroller.text),
                      selected_br.toString().split('.')[1]);

                  //add to remote database
                  var success_code = 201;
                  var success_code1 = 200;
                  var failed_code = 'Server Connection Lost';
                  //add to remote database
                  var url = Uri.parse('${Env.URL_PREFIX}/isoIrTest/' +
                      ntr.databaseID.toString() +
                      '/');

                  Map<String, String> headers = {
                    "Content-type": "application/json",
                    "Authorization": "Bearer $acc_token",
                  };
                  print("***********");
                  print(args['trDatabaseID'].toString());

                  final Map payload = {
                    "trNo": args['trDatabaseID'].toString(),
                    'rr': rr.toString(),
                    'yy': yy.toString(),
                    'bb': bb.toString(),
                    're': re.toString(),
                    'ye': ye.toString(),
                    'be': be.toString(),
                    'ry': ry.toString(),
                    'yb': yb.toString(),
                    'br': br.toString(),
                    "serialNo": args['ISO_ID'].toString(),
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
                    final IsoIrTestModel isoIrReportToLocal = IsoIrTestModel(
                      trNo: int.parse(_nOcontroller.text),
                      serialNo: _SerialNOcontroller.text,
                      rr: rr,
                      yy: yy,
                      bb: bb,
                      re: re,
                      ye: ye,
                      be: be,
                      ry: ry,
                      yb: yb,
                      br: br,
                      databaseID: ntr.databaseID,
                      EquipmentType: selectedValueForEquipmentUse.toString(),
                      lastUpdated: DateTime.now(),
                    );

                    getX((IsoIrProvider x) =>
                        x.updateIsoIr(isoIrReportToLocal, args['id']));
                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_ISO_IR',
                        arguments: {
                          'id': args['id'],
                          'ISO_ID': args['ISO_ID'],
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
                simplifiedFor_Diplay_for_all_PC_numpad('rr', _rrcontroller),
                Radio_pc1B(),
                simplifiedFor_Diplay_for_all_PC_numpad('yy', _yycontroller),
                Radio_pc2B(),
                simplifiedFor_Diplay_for_all_PC_numpad('bb', _bbcontroller),
                Radio_pc3B(),
                simplifiedFor_Diplay_for_all_PC_numpad('re', _recontroller),
                Radio_pc4B(),
                simplifiedFor_Diplay_for_all_PC_numpad('ye', _yecontroller),
                Radio_pc5B(),
                simplifiedFor_Diplay_for_all_PC_numpad('be', _becontroller),
                Radio_pc1R(),
                simplifiedFor_Diplay_for_all_PC_numpad('ry', _rycontroller),
                Radio_pc2R(),
                simplifiedFor_Diplay_for_all_PC_numpad('yb', _ybcontroller),
                Radio_pc3R(),
                simplifiedFor_Diplay_for_all_PC_numpad('br', _brcontroller),
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
                  padding: const EdgeInsets.fromLTRB(150, 20, 150, 10),
                  child: EquipmentTypeList(),
                ),
                Radio_peR(),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'rr', _rrcontroller),
                Radio_pc1B(),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'yy', _yycontroller),
                Radio_pc2B(),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'bb', _bbcontroller),
                Radio_pc3B(),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    're', _recontroller),
                Radio_pc4B(),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'ye', _yecontroller),
                Radio_pc5B(),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'be', _becontroller),
                Radio_pc1R(),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'ry', _rycontroller),
                Radio_pc2R(),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'yb', _ybcontroller),
                Radio_pc3R(),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'br', _brcontroller),
              ]),
            ),
          );
        }
      }),
    );
  }
}
