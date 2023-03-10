import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/powt/powt_ir_model.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/powt/powt_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/powt_provider/powt_ir_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/powt_provider/powt_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../dropdown_All/MegaGigaTeraRadioButton/ct_ir_radio_button_page.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditPowtIrPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditPowtIrPage(this.args, {Key key}) : super(key: key);

  final TextEditingController _IDcontroller = TextEditingController();

  final TextEditingController _Trno_Controller = TextEditingController();
  final TextEditingController _serialNo_Controller = TextEditingController();
  final TextEditingController _equipmentUsed_Controller =
      TextEditingController();
  final TextEditingController _hvE_60_Controller = TextEditingController();
  final TextEditingController _hvE_600_Controller = TextEditingController();
  final TextEditingController _hvLV_60_Controller = TextEditingController();
  final TextEditingController _hvLV_600_Controller = TextEditingController();
  final TextEditingController _lvE_60_Controller = TextEditingController();
  final TextEditingController _lvE_600_Controller = TextEditingController();
  final TextEditingController _cE_60_Controller = TextEditingController();
  final TextEditingController _cT_60_Controller = TextEditingController();
  final TextEditingController _tE_60_Controller = TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Enum_ct_ir get selected_hvE_60 => Radio_peR().get_Radio_peR();
  Enum_ct_ir get selected_hvE_600 => Radio_peY().get_Radio_peY();
  Enum_ct_ir get selected_hvLV_60 => Radio_peB().get_Radio_peB();
  Enum_ct_ir get selected_hvLV_600 => Radio_pc1R().get_Radio_pc1R();
  Enum_ct_ir get selected_lvE_60 => Radio_pc2R().get_Radio_pc2R();
  Enum_ct_ir get selected_lvE_600 => Radio_pc3R().get_Radio_pc3R();
  Enum_ct_ir get selected_cE_60 => Radio_pc4R().get_Radio_pc4R();
  Enum_ct_ir get selected_cT_60 => Radio_pc5R().get_Radio_pc5R();
  Enum_ct_ir get selected_tE_60 => Radio_pc1Y().get_Radio_pc1Y();

  Future<void> getReport() async {
    getX((PowtcoreIRProvider x) => x.getPowtcoreIRById(args['id']));
    PowtcoreIRModel _powtIrModel =
        watchOnly((PowtcoreIRProvider x) => x.powtcoreIR_Model);

    _IDcontroller.text = args['id'].toString();
    _Trno_Controller.text = _powtIrModel.trNo.toString();
    // args['TrNo'].toString();
    _serialNo_Controller.text = _powtIrModel.serialNo.toString();
    //args['Serial_No'];
    _hvE_60_Controller.text = _powtIrModel.hvE_60.toString();
    _hvE_600_Controller.text = _powtIrModel.hvE_600.toString();
    _hvLV_60_Controller.text = _powtIrModel.hvLV_60.toString();
    _hvLV_600_Controller.text = _powtIrModel.hvLV_600.toString();
    _lvE_600_Controller.text = _powtIrModel.lvE_600.toString();
    _lvE_60_Controller.text = _powtIrModel.lvE_60.toString();
    _cE_60_Controller.text = _powtIrModel.cE_60.toString();
    _tE_60_Controller.text = _powtIrModel.tE_60.toString();
    _cT_60_Controller.text = _powtIrModel.cT_60.toString();
  }

  @override
  Widget build(BuildContext context) {
    final PowtModel ntr1 = watchOnly((PowtProvider x) => x.powtModel);

    final PowtcoreIRModel ntr =
        watchOnly((PowtcoreIRProvider x) => x.powtcoreIR_Model);
    getReport();
    var mob =
        const Text('Edit powt-IR Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Edit powt-IR Details', style: TextStyle(fontSize: 20));

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

                  double hvE_60;
                  double hvE_600;
                  double hvLV_60;
                  double hvLV_600;
                  double lvE_60;
                  double lvE_600;
                  double cE_60;
                  double cT_60;
                  double tE_60;

                  hvE_60 = convertValue(double.parse(_hvE_60_Controller.text),
                      selected_hvE_60.toString().split('.')[1]);
                  hvE_600 = convertValue(double.parse(_hvE_600_Controller.text),
                      selected_hvE_600.toString().split('.')[1]);
                  hvLV_60 = convertValue(double.parse(_hvLV_60_Controller.text),
                      selected_hvLV_60.toString().split('.')[1]);
                  hvLV_600 = convertValue(
                      double.parse(_hvLV_600_Controller.text),
                      selected_hvLV_600.toString().split('.')[1]);
                  lvE_60 = convertValue(double.parse(_lvE_60_Controller.text),
                      selected_lvE_60.toString().split('.')[1]);
                  lvE_600 = convertValue(double.parse(_lvE_600_Controller.text),
                      selected_lvE_600.toString().split('.')[1]);
                  cE_60 = convertValue(double.parse(_cE_60_Controller.text),
                      selected_cE_60.toString().split('.')[1]);
                  cT_60 = convertValue(double.parse(_cT_60_Controller.text),
                      selected_cT_60.toString().split('.')[1]);
                  tE_60 = convertValue(double.parse(_tE_60_Controller.text),
                      selected_tE_60.toString().split('.')[1]);

                  //add to remote database
                  var success_code = 201;
                  var success_code1 = 200;
                  var failed_code = 'Server Connection Lost';
                  //add to remote database
                  var url = Uri.parse('${Env.URL_PREFIX}/powtIrTest/' +
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
                    'hvE_60': hvE_60.toString(),
                    'hvE_600': hvE_600.toString(),
                    'hvLv_60': hvLV_60.toString(),
                    'hvLv_600': hvE_600.toString(),
                    'lvE_60': lvE_60.toString(),
                    'lvE_600': lvE_600.toString(),
                    'tE_60': tE_60.toString(),
                    'cE_60': cE_60.toString(),
                    'cT_60': cT_60.toString(),
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
                    final PowtcoreIRModel powtIrReportToLocal = PowtcoreIRModel(
                      trNo: int.parse(_Trno_Controller.text),
                      serialNo: _serialNo_Controller.text,
                      hvE_60: hvE_60,
                      hvE_600: hvE_600,
                      hvLV_60: hvLV_60,
                      hvLV_600: hvLV_600,
                      lvE_60: lvE_60,
                      lvE_600: lvE_600,
                      cE_60: cE_60,
                      cT_60: cT_60,
                      tE_60: tE_60,
                      databaseID: ntr.databaseID,
                      equipmentUsed: selectedValueForEquipmentUse.toString(),
                      updateDate: DateTime.now(),
                    );

                    getX((PowtcoreIRProvider x) =>
                        x.updatePowtcoreIR(powtIrReportToLocal, args['id']));
                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_PowtcoreIR',
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
      child: LayoutBuilder(
        builder: (context, constraints) {
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
                          'Trno',
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
                    Radio_peR(),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'HV-Earth 60 Sec', _hvE_60_Controller),
                    Radio_peY(),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'HV-Earth 600 Sec', _hvE_600_Controller),
                    Radio_peB(),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'HV-LV 60 Sec', _hvLV_60_Controller),
                    Radio_pc1R(),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'HV-LV 600 Sec', _hvLV_600_Controller),
                    Radio_pc2R(),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'LV-Earth 60 Sec', _lvE_60_Controller),
                    Radio_pc3R(),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'LV-Earth 600 Sec', _lvE_600_Controller),
                    Radio_pc4R(),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Core-Earth 60 Sec', _cE_60_Controller),
                    Radio_pc5R(),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Core-Tank 60 Sec', _cT_60_Controller),
                    Radio_pc1Y(),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Tank-Earth 60 Sec', _tE_60_Controller),
                    Divider(color: Colors.white)
                  ],
                ),
              ),
            );

            // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
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
                          'TrNo',
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
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: EquipmentTypeList(),
                    ),
                    Radio_peR(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'HV-Earth 60 Sec', _hvE_60_Controller),
                    Radio_peY(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'HV-Earth 600 Sec', _hvE_600_Controller),
                    Radio_peB(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'HV-LV 60 Sec', _hvLV_60_Controller),
                    Radio_pc1R(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'HV-LV 600 Sec', _hvLV_600_Controller),
                    Radio_pc2R(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'LV-Earth 60 Sec', _lvE_60_Controller),
                    Radio_pc3R(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'LV-Earth 600 Sec', _lvE_600_Controller),
                    Radio_pc4R(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Core-Earth 60 Sec', _cE_60_Controller),
                    Radio_pc5R(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Core-Tank 60 Sec', _cT_60_Controller),
                    Radio_pc1Y(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Tank-Earth 60 Sec', _tE_60_Controller),
                    Divider(color: Colors.white)
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
