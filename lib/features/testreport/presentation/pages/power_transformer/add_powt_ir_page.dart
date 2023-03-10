// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/powt/powt_ir_model.dart';
import '../../../data/models/equipment/powt/powt_model.dart';
import '../../providers/powt_provider/powt_ir_provider.dart';
import '../../providers/powt_provider/powt_provider.dart';
import '../dropdown_All/MegaGigaTeraRadioButton/ct_ir_radio_button_page.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

final _formKey = GlobalKey<FormState>();

class Add_PowtcoreIR extends StatelessWidget with GetItMixin {
  Map args = {};
  int POWT_ID;
  int TR_ID;

  Add_PowtcoreIR(this.args, {Key key}) : super(key: key);

  final TextEditingController _Trno_Controller = TextEditingController();
  final TextEditingController _serialNo_Controller = TextEditingController();
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

  setTrNo() {
    _Trno_Controller.text = args['TrNo'].toString();
    _serialNo_Controller.text = args['serial_no_bph'].toString();
    POWT_ID = args['powtDatabaseID'];
    TR_ID = args['trDatabaseID'];
  }

  @override
  Widget build(BuildContext context) {
    final PowtModel ntr = watchOnly((PowtProvider x) => x.powtModel);

    setTrNo();
    var mob = Text('Add Powt IR ', style: TextStyle(fontSize: 17));
    var desk = Text('Add Powt IR ', style: TextStyle(fontSize: 20));
    var accToken = sl<GoogleSignInController>().ACCESS_TOKEN;
    var refToken = sl<GoogleSignInController>().REFRESH_TOKEN;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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

                  // add to local database
                  final PowtcoreIRModel PowtcoreIRtoLocal = PowtcoreIRModel(
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
                    equipmentUsed: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,
                    // updateDate: DateTime.now(),
                  );
                  print(PowtcoreIRtoLocal);
                  print(PowtcoreIRtoLocal.trNo);

                  getX((PowtcoreIRProvider x) =>
                      x.addPowtcoreIR(PowtcoreIRtoLocal));
                  watchOnly((PowtcoreIRProvider x) => {});

                  Navigator.popAndPushNamed(context, '/detail_POWT',
                      arguments: {
                        'id': args['POWT_ID'],
                        'powtDatabaseID': POWT_ID,
                        'trDatabaseID': TR_ID,
                      });
                }
              },
              icon: const Icon(Icons.save)),
        ],
      ),
      // body: SingleChildScrollView(child: build_body(context)),
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
