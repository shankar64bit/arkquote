// ignore_for_file: missing_return, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/DG/dg_ir_test_model.dart';
import '../../providers/dg_provider/dg_ir_provider.dart';
import '../dropdown_All/MegaGigaTeraRadioButton/ct_wr_radio_button_page.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';
import '../dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';

final _formKey = GlobalKey<FormState>();

class AddDgIrPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int TR_ID;
  int DG_ID;

  AddDgIrPage(this.args, {Key key}) : super(key: key);

  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _re_MResistancecontroller =
      TextEditingController();
  final TextEditingController _ye_MResistancecontroller =
      TextEditingController();
  final TextEditingController _be_MResistancecontroller =
      TextEditingController();
  final TextEditingController _SerialNOcontroller = TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Enum_ct_wr get selected__re_MResistance =>
      Radio_B_1S1_1S2().get_Radio_B_1S1_1S2();
  Enum_ct_wr get selected__ye_MResistance =>
      Radio_B_2S1_2S2().get_Radio_B_2S1_2S2();
  Enum_ct_wr get selected__be_MResistance =>
      Radio_B_3S1_3S2().get_Radio_B_3S1_3S2();

  setTrNo() {
    _nOcontroller.text = args['TrNo'].toString();
    _SerialNOcontroller.text = args['Serial_No'].toString();
    DG_ID = args['dgDatabaseID'];
    TR_ID = args['trDatabaseID'];
  }

  @override
  Widget build(BuildContext context) {
    setTrNo();
    int id;
    var acc_token = sl<GoogleSignInController>().ACCESS_TOKEN;
    var ref_token = sl<GoogleSignInController>().REFRESH_TOKEN;
    var mob = const Text('Add DG-IR Details', style: TextStyle(fontSize: 15));
    var desk = const Text('Add DG-IR Details', style: TextStyle(fontSize: 20));

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

                  double re;
                  double ye;
                  double be;

                  re = convertValue(
                      double.parse(_re_MResistancecontroller.text),
                      selected__re_MResistance.toString().split('.')[1]);
                  ye = convertValue(
                      double.parse(_ye_MResistancecontroller.text),
                      selected__ye_MResistance.toString().split('.')[1]);
                  be = convertValue(
                      double.parse(_be_MResistancecontroller.text),
                      selected__be_MResistance.toString().split('.')[1]);

                  //add to local database
                  final DgIrTestModel dgIrReportToLocal = DgIrTestModel(
                    trNo: int.parse(_nOcontroller.text),
                    serialNo: _SerialNOcontroller.text,
                    re_mResistance: re,
                    ye_mResistance: ye,
                    be_mResistance: be,
                    EquipmentType: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,
                  );

                  getX((DgIrProvider x) => x.addDgIr(dgIrReportToLocal));
                  watchOnly((DgIrProvider x) => {});
                  print("Dg IR added");

                  Navigator.popAndPushNamed(context, '/detail_DG',
                      arguments: {'id': args['DG_ID'], 'trDatabaseID': TR_ID});
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
              elevation: 5,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                  textAlign: TextAlign.center,
                  enabled: false,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                  textAlign: TextAlign.center,
                  enabled: false,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 20, 150, 0),
                  child: EquipmentTypeList(),
                ),
                Radio_B_1S1_1S2(),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'R-E Measured Resistance', _re_MResistancecontroller),
                Radio_B_2S1_2S2(),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Y-E Measured Resistance', _ye_MResistancecontroller),
                Radio_B_3S1_3S2(),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'B-E Measured Resistance', _be_MResistancecontroller),
              ]),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              elevation: 5,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                  textAlign: TextAlign.center,
                  enabled: false,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                  textAlign: TextAlign.center,
                  enabled: false,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child: EquipmentTypeList(),
                ),
                Radio_B_1S1_1S2(),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'R-E Measured Resistance', _re_MResistancecontroller),
                Radio_B_2S1_2S2(),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Y-E Measured Resistance', _ye_MResistancecontroller),
                Radio_B_3S1_3S2(),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'B-E Measured Resistance', _be_MResistancecontroller),
              ]),
            ),
          );
        }
      }),
    );
  }
}
