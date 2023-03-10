// ignore_for_file: missing_return, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/LA/la_ir_test_model.dart';
import '../../../data/models/equipment/LA/la_model.dart';
import '../../providers/la_provider/la_ir_provider.dart';
import '../../providers/la_provider/la_provider.dart';
import '../dropdown_All/MegaGigaTeraRadioButton/ct_ir_radio_button_page.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';
import '../dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class AddLaIrPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int TR_ID;
  int LA_ID;

  AddLaIrPage(this.args, {Key key}) : super(key: key);

  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _sercontroller = TextEditingController();
  final TextEditingController _seycontroller = TextEditingController();
  final TextEditingController _sebcontroller = TextEditingController();
  final TextEditingController _ssrcontroller = TextEditingController();
  final TextEditingController _ssycontroller = TextEditingController();
  final TextEditingController _ssbcontroller = TextEditingController();
  final TextEditingController _SerialNOcontroller = TextEditingController();

  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Enum_ct_ir get selected_ser => Radio_peR().get_Radio_peR();
  Enum_ct_ir get selected_sey => Radio_pc1B().get_Radio_pc1B();
  Enum_ct_ir get selected_seb => Radio_pc2B().get_Radio_pc2B();
  Enum_ct_ir get selected_ssr => Radio_pc3B().get_Radio_pc3B();
  Enum_ct_ir get selected_ssy => Radio_pc4B().get_Radio_pc4B();
  Enum_ct_ir get selected_ssb => Radio_pc5B().get_Radio_pc5B();

  setTrNo() {
    _nOcontroller.text = args['TrNo'].toString();
    _SerialNOcontroller.text = args['Serial_No'].toString();
    //add below, it wasnt ther before
    LA_ID = args['laDatabaseID'];
    TR_ID = args['trDatabaseID'];
  }

  @override
  Widget build(BuildContext context) {
    final LaModel ntr = watchOnly((LaProvider x) => x.laModel);
    setTrNo();
    int id;
    var acc_token = sl<GoogleSignInController>().ACCESS_TOKEN;
    var ref_token = sl<GoogleSignInController>().REFRESH_TOKEN;
    var mob = const Text('Add Lightning Arrester-IR Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('Add Lightning Arrester-IR Details',
        style: TextStyle(fontSize: 20));

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
                    EquipmentType: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,
                  );

                  getX((LaIrProvider x) => x.addLaIr(laIrReportToLocal));
                  watchOnly((LaIrProvider x) => {});
                  print("La IR added");
                  Navigator.popAndPushNamed(context, '/detail_LA', arguments: {
                    'id': args['LA_ID'],
                    // 'trDatabaseID': args['trDatabaseID'],
                    'trDatabaseID': TR_ID
                  });
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
