// ignore_for_file: missing_return, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/SC/sc_c_test_model.dart';
import '../../../data/models/equipment/SC/sc_model.dart';
import '../../providers/sc_provider/sc_c_provider.dart';
import '../../providers/sc_provider/sc_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';
import '../dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class AddScCPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int TR_ID;
  int SC_ID;

  AddScCPage(this.args, {Key key}) : super(key: key);

  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _racontroller = TextEditingController();
  final TextEditingController _rbcontroller = TextEditingController();
  final TextEditingController _yacontroller = TextEditingController();
  final TextEditingController _ybcontroller = TextEditingController();
  final TextEditingController _bacontroller = TextEditingController();
  final TextEditingController _bbcontroller = TextEditingController();
  final TextEditingController _SerialNOcontroller = TextEditingController();

  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  setTrNo() {
    _nOcontroller.text = args['TrNo'].toString();
    _SerialNOcontroller.text = args['Serial_No'].toString();
    //add below, it wasnt ther before
    TR_ID = args['trDatabaseID'];
  }

  @override
  Widget build(BuildContext context) {
    final ScModel ntr = watchOnly((ScProvider x) => x.scModel);
    setTrNo();
    int id;
    var acc_token = sl<GoogleSignInController>().ACCESS_TOKEN;
    var ref_token = sl<GoogleSignInController>().REFRESH_TOKEN;
    var mob = const Text('Add Surge Counter-Counter test Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('Add Surge Counter-Counter test Details',
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

                  //add to local database
                  final ScCTestModel scCReportToLocal = ScCTestModel(
                    trNo: int.parse(_nOcontroller.text),
                    serialNo: _SerialNOcontroller.text,
                    rA: double.parse(_racontroller.text),
                    rB: double.parse(_rbcontroller.text),
                    yA: double.parse(_yacontroller.text),
                    yB: double.parse(_ybcontroller.text),
                    bA: double.parse(_bacontroller.text),
                    bB: double.parse(_bbcontroller.text),
                    EquipmentType: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,
                  );

                  getX((ScCProvider x) => x.addScC(scCReportToLocal));
                  watchOnly((ScCProvider x) => {});
                  print("SC-C added");

                  // ignore: use_build_context_synchronously
                  Navigator.popAndPushNamed(context, '/detail_SC', arguments: {
                    'id': args['SC_ID'],
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
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Primary-Earth R Before', _rbcontroller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Primary-Earth R After', _racontroller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Primary-Earth Y Before', _ybcontroller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Primary-Earth Y After', _yacontroller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Primary-Earth B Before', _bbcontroller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Primary-Earth B After', _bacontroller),
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
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Primary-Earth R Before', _rbcontroller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Primary-Earth R After', _racontroller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Primary-Earth Y Before', _ybcontroller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Primary-Earth Y After', _yacontroller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Primary-Earth B Before', _bbcontroller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Primary-Earth B After', _bacontroller),
              ]),
            ),
          );
        }
      }),
    );
  }
}
