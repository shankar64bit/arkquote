// ignore_for_file: missing_return, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/busbar/bb_cr_test_model.dart';
import '../../../data/models/equipment/busbar/bb_model.dart';
import '../../providers/busbar_provider/bb_cr_provider.dart';
import '../../providers/busbar_provider/bb_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';
import '../dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class AddBbCrPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int TR_ID;
  int BB_ID;

  AddBbCrPage(this.args, {Key key}) : super(key: key);

  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _Rcontroller = TextEditingController();
  final TextEditingController _Ycontroller = TextEditingController();
  final TextEditingController _Bcontroller = TextEditingController();
  final TextEditingController _Ncontroller = TextEditingController();

  setTrNo() {
    _nOcontroller.text = args['TrNo'].toString();
    BB_ID = args['BB_ID'];
    TR_ID = args['trDatabaseID'];
  }

  @override
  Widget build(BuildContext context) {
    final BbModel ntr = watchOnly((BbProvider x) => x.bbModel);
    setTrNo();
    int id;
    var acc_token = sl<GoogleSignInController>().ACCESS_TOKEN;
    var ref_token = sl<GoogleSignInController>().REFRESH_TOKEN;
    var mob =
        const Text('Add Busbar-CR Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Add Busbar-CR Details', style: TextStyle(fontSize: 20));

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
                  if (ntr.noOfBar == 3) _Ncontroller.text = '0.0';
                  //add to local database
                  final BbCrTestModel bbCrReportToLocal = BbCrTestModel(
                    trNo: int.parse(_nOcontroller.text),
                    bbRefId: args['id'],
                    r: double.parse(_Rcontroller.text),
                    y: double.parse(_Ycontroller.text),
                    b: double.parse(_Bcontroller.text),
                    n: double.parse(_Ncontroller.text),
                    EquipmentType: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,
                  );

                  getX((BbCrProvider x) => x.addBbCr(bbCrReportToLocal));
                  watchOnly((BbCrProvider x) => {});
                  print("Busbar Cr added");
                  Navigator.popAndPushNamed(context, '/detail_BB',
                      arguments: {'id': args['id'], 'trDatabaseID': TR_ID});
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
                        child: build_body(context, ntr)),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  build_body(BuildContext context, BbModel ntr) {
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
                  padding: const EdgeInsets.fromLTRB(150, 20, 150, 10),
                  child: EquipmentTypeList(),
                ),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'R-R\'Measured Resistance Value (µΩ)', _Rcontroller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Y-Y\'Measured Resistance Value (µΩ)', _Ycontroller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'B-B\'Measured Resistance Value (µΩ)', _Bcontroller),
                ntr.noOfBar == 4
                    ? simplifiedFor_Diplay_for_all_PC_numpad(
                        'N-N\'Measured Resistance Value (µΩ)', _Ncontroller)
                    : Container(),
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
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child: EquipmentTypeList(),
                ),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'R-R\'Measured Resistance Value (µΩ)', _Rcontroller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Y-Y\'Measured Resistance Value (µΩ)', _Ycontroller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'B-B\'Measured Resistance Value (µΩ)', _Bcontroller),
                ntr.noOfBar == 4
                    ? simplifiedFor_Display_for_all_Mobile_numpad(
                        'N-N\'Measured Resistance Value (µΩ)', _Ncontroller)
                    : Container(),
              ]),
            ),
          );
        }
      }),
    );
  }
}
