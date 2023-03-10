// ignore_for_file: missing_return, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/isolator/iso_ir_test_model.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/isolator/iso_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/iso_provider/iso_ir_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/iso_provider/iso_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../dropdown_All/MegaGigaTeraRadioButton/ct_ir_radio_button_page.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';
import '../dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class AddIsoIrPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int TR_ID;
  int ISO_ID;

  AddIsoIrPage(this.args, {Key key}) : super(key: key);

  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _rrcontroller = TextEditingController();
  final TextEditingController _yycontroller = TextEditingController();
  final TextEditingController _bbcontroller = TextEditingController();
  final TextEditingController _rycontroller = TextEditingController();
  final TextEditingController _ybcontroller = TextEditingController();
  final TextEditingController _brcontroller = TextEditingController();
  final TextEditingController _recontroller = TextEditingController();
  final TextEditingController _yecontroller = TextEditingController();
  final TextEditingController _becontroller = TextEditingController();
  final TextEditingController _SerialNOcontroller = TextEditingController();

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

  setTrNo() {
    _nOcontroller.text = args['TrNo'].toString();
    _SerialNOcontroller.text = args['Serial_No'].toString();
    //add below, it wasnt ther before
    ISO_ID = args['isoDatabaseID'];
    TR_ID = args['trDatabaseID'];
  }

  @override
  Widget build(BuildContext context) {
    final IsoModel ntr = watchOnly((IsoProvider x) => x.isoModel);
    setTrNo();
    int id;
    var acc_token = sl<GoogleSignInController>().ACCESS_TOKEN;
    var ref_token = sl<GoogleSignInController>().REFRESH_TOKEN;
    var mob =
        const Text('Add Isolator-IR Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Add Isolator-IR Details', style: TextStyle(fontSize: 20));

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
                  // loading to add details to remote server & local server

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
                    EquipmentType: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,
                  );

                  getX((IsoIrProvider x) => x.addIsoIr(isoIrReportToLocal));
                  watchOnly((IsoIrProvider x) => {});
                  print("Isolator IR added");
                  // ignore: use_build_context_synchronously
                  Navigator.popAndPushNamed(context, '/detail_ISO',
                      arguments: {'id': args['ISO_ID'], 'trDatabaseID': TR_ID});
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
