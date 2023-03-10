// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/AT/AT_ir_model.dart';
import '../../../data/models/equipment/AT/AT_model.dart';
import '../../providers/at_provider/at_ir_provider.dart';
import '../../providers/at_provider/at_provider.dart';
import '../dropdown_All/MegaGigaTeraRadioButton/ct_wr_radio_button_page.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

final _formKey = GlobalKey<FormState>();

class Add_ATcoreIR extends StatelessWidget with GetItMixin {
  Map args = {};
  int AT_ID;
  int TR_ID;

  Add_ATcoreIR(this.args, {Key key}) : super(key: key);

  final TextEditingController _Trno_Controller = TextEditingController();
  final TextEditingController _serialNo_Controller = TextEditingController();
  final TextEditingController _equipmentUsed_Controller =
      TextEditingController();
  final TextEditingController _hvE_1min_Controller = TextEditingController();
  final TextEditingController _hvE_10min_Controller = TextEditingController();
  final TextEditingController _hvE_PImin_Controller = TextEditingController();

  final TextEditingController _hvLV_1min_Controller = TextEditingController();
  final TextEditingController _hvLV_10min_Controller = TextEditingController();
  final TextEditingController _hvLV_PImin_Controller = TextEditingController();

  final TextEditingController _lvE_1min_Controller = TextEditingController();
  final TextEditingController _lvE_10min_Controller = TextEditingController();
  final TextEditingController _lvE_PImin_Controller = TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Enum_ct_wr get selected_hvE_1min => Radio_R_1S1_1S2().get_Radio_R_1S1_1S2();
  Enum_ct_wr get selected_hvE_10min => Radio_R_2S1_2S2().get_Radio_R_2S1_2S2();
  Enum_ct_wr get selected_hvE_PImin => Radio_R_3S1_3S2().get_Radio_R_3S1_3S2();

  Enum_ct_wr get selected_hvLV_1min => Radio_Y_1S1_1S2().get_Radio_Y_1S1_1S2();
  Enum_ct_wr get selected_hvLV_10min => Radio_Y_2S1_2S2().get_Radio_Y_2S1_2S2();
  Enum_ct_wr get selected_hvLV_PImin => Radio_Y_3S1_3S2().get_Radio_Y_3S1_3S2();

  Enum_ct_wr get selected_lvE_1min => Radio_B_1S1_1S2().get_Radio_B_1S1_1S2();
  Enum_ct_wr get selected_lvE_10min => Radio_B_2S1_2S2().get_Radio_B_2S1_2S2();
  Enum_ct_wr get selected_lvE_PImin => Radio_B_3S1_3S2().get_Radio_B_3S1_3S2();

  setTrNo() {
    _Trno_Controller.text = args['TrNo'].toString();
    _serialNo_Controller.text = args['serial_no_bph'].toString();
    AT_ID = args['atDatabaseID'];
    TR_ID = args['trDatabaseID'];
  }

  @override
  Widget build(BuildContext context) {
    final ATModel ntr = watchOnly((ATProvider x) => x.atModel);

    setTrNo();
    var mob = Text('Add ATcore IR ', style: TextStyle(fontSize: 17));
    var desk = Text('Add ATcore IR ', style: TextStyle(fontSize: 20));
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

                  double hvE_1min;
                  double hvE_10min;
                  double hvE_PImin;
                  double hvLV_1min;
                  double hvLV_10min;
                  double hvLV_PImin;
                  double lvE_1min;
                  double lvE_10min;
                  double lvE_PImin;

                  hvE_1min = convertValue(
                      double.parse(_hvE_1min_Controller.text),
                      selected_hvE_1min.toString().split('.')[1]);

                  hvE_10min = convertValue(
                      double.parse(_hvE_10min_Controller.text),
                      selected_hvE_10min.toString().split('.')[1]);

                  hvE_PImin = convertValue(
                      double.parse(_hvE_PImin_Controller.text),
                      selected_hvE_PImin.toString().split('.')[1]);

                  hvLV_1min = convertValue(
                      double.parse(_hvLV_1min_Controller.text),
                      selected_hvLV_1min.toString().split('.')[1]);

                  hvLV_10min = convertValue(
                      double.parse(_hvLV_10min_Controller.text),
                      selected_hvLV_10min.toString().split('.')[1]);

                  hvLV_PImin = convertValue(
                      double.parse(_hvLV_PImin_Controller.text),
                      selected_hvLV_PImin.toString().split('.')[1]);

                  lvE_1min = convertValue(
                      double.parse(_lvE_1min_Controller.text),
                      selected_lvE_1min.toString().split('.')[1]);

                  lvE_10min = convertValue(
                      double.parse(_lvE_10min_Controller.text),
                      selected_lvE_10min.toString().split('.')[1]);

                  lvE_PImin = convertValue(
                      double.parse(_lvE_PImin_Controller.text),
                      selected_lvE_PImin.toString().split('.')[1]);

                  // add to local database
                  final ATcoreIRModel ATcoreIRtoLocal = ATcoreIRModel(
                    trNo: int.parse(_Trno_Controller.text),
                    serialNo: _serialNo_Controller.text,
                    hvE_1min: hvE_1min,
                    hvE_10min: hvE_10min,
                    hvE_PImin: hvE_PImin,
                    hvLV_1min: hvLV_1min,
                    hvLV_10min: hvLV_10min,
                    hvLV_PImin: hvLV_PImin,
                    lvE_1min: lvE_1min,
                    lvE_10min: lvE_10min,
                    lvE_PImin: lvE_PImin,
                    equipmentUsed: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,
                  );
                  print(ATcoreIRtoLocal);
                  print(ATcoreIRtoLocal.trNo);
                  getX((ATcoreIRProvider x) => x.addATcoreIR(ATcoreIRtoLocal));
                  watchOnly((ATcoreIRProvider x) => {});
                  Navigator.popAndPushNamed(context, '/detail_AT', arguments: {
                    'id': args['AT_ID'],
                    'atDatabaseID': AT_ID,
                    'trDatabaseID': TR_ID,
                  });
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
                    Divider(color: Colors.black, thickness: 1),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: EquipmentTypeList(),
                    ),
                    Radio_R_1S1_1S2(), //hvE_1min
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'hvE_1min', _hvE_1min_Controller),
                    Radio_R_2S1_2S2(), //hvE_10min
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'hvE_10min', _hvE_10min_Controller),
                    Radio_R_3S1_3S2(), //hvE_PImin
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'hvE_PImin', _hvE_PImin_Controller),
                    Radio_Y_1S1_1S2(), //hvLV_1min
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'hvLV_1min', _hvLV_1min_Controller),
                    Radio_Y_2S1_2S2(), //hvLV_10min
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'hvLV_10min', _hvLV_10min_Controller),
                    Radio_Y_3S1_3S2(), //hvLV_PImin
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'hvLV_PImin', _hvLV_PImin_Controller),
                    Radio_B_1S1_1S2(), //lvE_1min
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'lvE_1min', _lvE_1min_Controller),
                    Radio_B_2S1_2S2(), //lvE_10min
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'lvE_10min', _lvE_10min_Controller),
                    Radio_B_3S1_3S2(), //lvE_PImin
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'lvE_PImin', _lvE_PImin_Controller),
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
                    Radio_R_1S1_1S2(), //hvE_1min
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'hvE_1min', _hvE_1min_Controller),
                    Radio_R_2S1_2S2(), //hvE_10min
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'hvE_10min', _hvE_10min_Controller),
                    Radio_R_3S1_3S2(), //hvE_PImin
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'hvE_PImin', _hvE_PImin_Controller),
                    Radio_Y_1S1_1S2(), //hvLV_1min
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'hvLV_1min', _hvLV_1min_Controller),
                    Radio_Y_2S1_2S2(), //hvLV_10min
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'hvLV_10min', _hvLV_10min_Controller),
                    Radio_Y_3S1_3S2(), //hvLV_PImin
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'hvLV_PImin', _hvLV_PImin_Controller),
                    Radio_B_1S1_1S2(), //lvE_1min
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'lvE_1min', _lvE_1min_Controller),
                    Radio_B_2S1_2S2(), //lvE_10min
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'lvE_10min', _lvE_10min_Controller),
                    Radio_B_3S1_3S2(), //lvE_PImin
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'lvE_PImin', _lvE_PImin_Controller),
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
