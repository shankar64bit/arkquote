// ignore_for_file: missing_beturn, missing_required_param, non_constant_identifier_names, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/IT/it_model.dart';
import '../../../data/models/equipment/IT/it_vg_model.dart';
import '../../providers/it_provider/it_provider.dart';
import '../../providers/it_provider/it_vg_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

final _formKey = GlobalKey<FormState>();

class AddItVgPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int itDatabaseID;
  int trDatabaseID;

  AddItVgPage(this.args, {Key key}) : super(key: key);

  final TextEditingController _Trno_Controller = TextEditingController();
  final TextEditingController _serialNo_Controller = TextEditingController();

  final TextEditingController _lv1_v1_Controller = TextEditingController();
  final TextEditingController _lv1_v2_Controller = TextEditingController();
  final TextEditingController _lv1_v3_Controller = TextEditingController();
  final TextEditingController _lv1_v4_Controller = TextEditingController();
  final TextEditingController _lv2_v1_Controller = TextEditingController();
  final TextEditingController _lv2_v2_Controller = TextEditingController();
  final TextEditingController _lv2_v3_Controller = TextEditingController();
  final TextEditingController _lv2_v4_Controller = TextEditingController();
  final TextEditingController _lv3_v1_Controller = TextEditingController();
  final TextEditingController _lv3_v2_Controller = TextEditingController();
  final TextEditingController _lv3_v3_Controller = TextEditingController();
  final TextEditingController _lv3_v4_Controller = TextEditingController();
  final TextEditingController _lv4_v1_Controller = TextEditingController();
  final TextEditingController _lv4_v2_Controller = TextEditingController();
  final TextEditingController _lv4_v3_Controller = TextEditingController();
  final TextEditingController _lv4_v4_Controller = TextEditingController();

  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  setTrNo() {
    _Trno_Controller.text = args['TrNo'].toString();
    _serialNo_Controller.text = args['serialNo'].toString();
    itDatabaseID = args['itDatabaseID'];
    trDatabaseID = args['trDatabaseID'];
  }

  @override
  Widget build(BuildContext context) {
    final ItModel ntr = watchOnly((ItProvider x) => x.itModel);

    setTrNo();
    var mob = Text('Add Inverter Transformer Vector Group Test',
        style: TextStyle(fontSize: 17));
    var desk = Text('Add Inverter Transformer Vector Group Test ',
        style: TextStyle(fontSize: 20));
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

                  if (checkVectoreGroup(ntr)) {
                    _lv3_v1_Controller.text = "0.0";
                    _lv3_v2_Controller.text = '0.0';
                    _lv3_v3_Controller.text = "0.0";
                    _lv3_v4_Controller.text = "0.0";
                    _lv4_v1_Controller.text = "0.0";
                    _lv4_v2_Controller.text = '0.0';
                    _lv4_v3_Controller.text = "0.0";
                    _lv4_v4_Controller.text = "0.0";
                  }

                  // add to local database
                  final ItVgTestModel ItVgToLocal = ItVgTestModel(
                    trNo: int.parse(_Trno_Controller.text),
                    serialNo: _serialNo_Controller.text,
                    lv1_v1: double.parse(_lv1_v1_Controller.text),
                    lv1_v2: double.parse(_lv1_v2_Controller.text),
                    lv1_v3: double.parse(_lv1_v3_Controller.text),
                    lv1_v4: double.parse(_lv1_v4_Controller.text),
                    lv2_v1: double.parse(_lv2_v1_Controller.text),
                    lv2_v2: double.parse(_lv2_v2_Controller.text),
                    lv2_v3: double.parse(_lv2_v3_Controller.text),
                    lv2_v4: double.parse(_lv2_v4_Controller.text),
                    lv3_v1: double.parse(_lv3_v1_Controller.text),
                    lv3_v2: double.parse(_lv3_v2_Controller.text),
                    lv3_v3: double.parse(_lv3_v3_Controller.text),
                    lv3_v4: double.parse(_lv3_v4_Controller.text),
                    lv4_v1: double.parse(_lv4_v1_Controller.text),
                    lv4_v2: double.parse(_lv4_v2_Controller.text),
                    lv4_v3: double.parse(_lv4_v3_Controller.text),
                    lv4_v4: double.parse(_lv4_v4_Controller.text),
                    equipmentUsed: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,
                  );
                  print(ItVgToLocal);
                  print("Stored to local Databases");
                  getX((ItVgProvider x) => x.addItVg(ItVgToLocal));
                  watchOnly((ItVgProvider x) => {});
                  Navigator.popAndPushNamed(context, '/detail_IT', arguments: {
                    'id': args['IT_ID'],
                    'itDatabaseID': itDatabaseID,
                    'trDatabaseID': trDatabaseID,
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
    final ItModel ntr = watchOnly((ItProvider x) => x.itModel);

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
                          'Trn',
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
                    //EquipmentTypeList

                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: EquipmentTypeList(),
                    ),
                    Text(
                      'LV1',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5),
                    ),
                    ntr.vectorGroup.contains('Dd0')
                        ? Card(
                            child: Column(children: [
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                '1U2w', _lv1_v1_Controller),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                '2w1W', _lv1_v2_Controller),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                '1W2w', _lv1_v3_Controller),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                '1W2v', _lv1_v4_Controller),
                          ]))
                        : Container(),
                    ntr.vectorGroup.contains('Dd6')
                        ? Card(
                            child: Column(children: [
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                '2w1U', _lv1_v1_Controller),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                '1U1W', _lv1_v2_Controller),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                '1W2v', _lv1_v3_Controller),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                '1W2w', _lv1_v4_Controller),
                          ]))
                        : Container(),

                    ntr.vectorGroup.contains('Yd1')
                        ? Card(
                            child: Column(children: [
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                '1U2v ', _lv1_v1_Controller),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                '2v1N', _lv1_v2_Controller),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                '1W2w ', _lv1_v3_Controller),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                '1V2w', _lv1_v4_Controller),
                          ]))
                        : Container(),

                    ntr.vectorGroup.contains('Yd11')
                        ? Card(
                            child: Column(children: [
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                '1U2w  ', _lv1_v1_Controller),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                '2wN', _lv1_v2_Controller),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                '1V2v  ', _lv1_v3_Controller),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                '1W2v', _lv1_v4_Controller),
                          ]))
                        : Container(),

                    Text(
                      'LV2',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5),
                    ),
                    ntr.vectorGroup.contains('Dd0')
                        ? Card(
                            child: Column(children: [
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                '1U3w', _lv2_v1_Controller),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                '3w1W', _lv2_v2_Controller),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                '1W3w', _lv2_v3_Controller),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                '1W3v', _lv2_v4_Controller),
                          ]))
                        : Container(),
                    ntr.vectorGroup.contains('Dd6')
                        ? Card(
                            child: Column(children: [
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                '3w1U', _lv2_v1_Controller),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                '1U1W', _lv2_v2_Controller),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                '1W3v', _lv2_v3_Controller),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                '1W3w', _lv2_v4_Controller),
                          ]))
                        : Container(),

                    ntr.vectorGroup.contains('Yd1')
                        ? Card(
                            child: Column(children: [
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                '1U3v', _lv2_v1_Controller),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                '3v1N', _lv2_v2_Controller),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                '1W3w', _lv2_v3_Controller),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                '1V3w', _lv2_v4_Controller),
                          ]))
                        : Container(),

                    ntr.vectorGroup.contains('Yd11')
                        ? Card(
                            child: Column(children: [
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                '1U3w', _lv2_v1_Controller),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                '3wN', _lv2_v2_Controller),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                '1V3v', _lv2_v3_Controller),
                            simplifiedFor_Diplay_for_all_PC_numpad(
                                '1W3v', _lv2_v4_Controller),
                          ]))
                        : Container(),

                    checkVectoreGroup(ntr)
                        ? Container()
                        : Card(
                            child: Column(
                            children: [
                              Text(
                                'LV3',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5),
                              ),
                              ntr.vectorGroup.contains('Dd0')
                                  ? Card(
                                      child: Column(children: [
                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                          '1U4w', _lv3_v1_Controller),
                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                          '4w1W', _lv3_v2_Controller),
                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                          '1W4w', _lv3_v3_Controller),
                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                          '1W4v', _lv3_v4_Controller),
                                    ]))
                                  : Container(),
                              ntr.vectorGroup.contains('Dd6')
                                  ? Card(
                                      child: Column(children: [
                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                          '4w1U', _lv3_v1_Controller),
                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                          '1U1W', _lv3_v2_Controller),
                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                          '1W4v', _lv3_v3_Controller),
                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                          '1W4w', _lv3_v4_Controller),
                                    ]))
                                  : Container(),
                              ntr.vectorGroup.contains('Yd1')
                                  ? Card(
                                      child: Column(children: [
                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                          '1U4v ', _lv3_v1_Controller),
                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                          '4v1N', _lv3_v2_Controller),
                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                          '1W4w ', _lv3_v3_Controller),
                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                          '1V4w', _lv3_v4_Controller),
                                    ]))
                                  : Container(),
                              ntr.vectorGroup.contains('Yd11')
                                  ? Card(
                                      child: Column(children: [
                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                          '1U4w  ', _lv3_v1_Controller),
                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                          '4wN', _lv3_v2_Controller),
                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                          '1V4v  ', _lv3_v3_Controller),
                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                          '1W4v', _lv3_v4_Controller),
                                    ]))
                                  : Container(),
                              Text(
                                'LV4',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5),
                              ),
                              ntr.vectorGroup.contains('Dd0')
                                  ? Card(
                                      child: Column(children: [
                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                          '1U5w', _lv4_v1_Controller),
                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                          '5w1W', _lv4_v2_Controller),
                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                          '1W5w', _lv4_v3_Controller),
                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                          '1W5v', _lv4_v4_Controller),
                                    ]))
                                  : Container(),
                              ntr.vectorGroup.contains('Dd6')
                                  ? Card(
                                      child: Column(children: [
                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                          '5w1U', _lv4_v1_Controller),
                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                          '1U1W', _lv4_v2_Controller),
                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                          '1W5v', _lv4_v3_Controller),
                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                          '1W5w', _lv4_v4_Controller),
                                    ]))
                                  : Container(),
                              ntr.vectorGroup.contains('Yd1')
                                  ? Card(
                                      child: Column(children: [
                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                          '1U5v', _lv4_v1_Controller),
                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                          '5v1N', _lv4_v2_Controller),
                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                          '1W5w', _lv4_v3_Controller),
                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                          '1V5w', _lv4_v4_Controller),
                                    ]))
                                  : Container(),
                              ntr.vectorGroup.contains('Yd11')
                                  ? Card(
                                      child: Column(children: [
                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                          '1U5w', _lv4_v1_Controller),
                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                          '5wN', _lv4_v2_Controller),
                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                          '1V5v', _lv4_v3_Controller),
                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                          '1W5v', _lv4_v4_Controller),
                                    ]))
                                  : Container(),
                            ],
                          ))
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
                    Text(
                      'LV1',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5),
                    ),
                    ntr.vectorGroup.contains('Dd0')
                        ? Card(
                            child: Column(children: [
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                '1U2w', _lv1_v1_Controller),
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                '2w1W', _lv1_v2_Controller),
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                '1W2w', _lv1_v3_Controller),
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                '1W2v', _lv1_v4_Controller),
                          ]))
                        : Container(),
                    ntr.vectorGroup.contains('Dd6')
                        ? Card(
                            child: Column(children: [
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                '2w1U', _lv1_v1_Controller),
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                '1U1W', _lv1_v2_Controller),
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                '1W2v', _lv1_v3_Controller),
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                '1W2w', _lv1_v4_Controller),
                          ]))
                        : Container(),
                    ntr.vectorGroup.contains('Yd1')
                        ? Card(
                            child: Column(children: [
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                '1U2v ', _lv1_v1_Controller),
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                '2v1N', _lv1_v2_Controller),
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                '1W2w ', _lv1_v3_Controller),
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                '1V2w', _lv1_v4_Controller),
                          ]))
                        : Container(),
                    ntr.vectorGroup.contains('Yd11')
                        ? Card(
                            child: Column(children: [
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                '1U2w  ', _lv1_v1_Controller),
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                '2wN', _lv1_v2_Controller),
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                '1V2v  ', _lv1_v3_Controller),
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                '1W2v', _lv1_v4_Controller),
                          ]))
                        : Container(),
                    Text(
                      'LV2',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5),
                    ),
                    ntr.vectorGroup.contains('Dd0')
                        ? Card(
                            child: Column(children: [
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                '1U3w', _lv2_v1_Controller),
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                '3w1W', _lv2_v2_Controller),
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                '1W3w', _lv2_v3_Controller),
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                '1W3v', _lv2_v4_Controller),
                          ]))
                        : Container(),
                    ntr.vectorGroup.contains('Dd6')
                        ? Card(
                            child: Column(children: [
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                '3w1U', _lv2_v1_Controller),
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                '1U1W', _lv2_v2_Controller),
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                '1W3v', _lv2_v3_Controller),
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                '1W3w', _lv2_v4_Controller),
                          ]))
                        : Container(),
                    ntr.vectorGroup.contains('Yd1')
                        ? Card(
                            child: Column(children: [
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                '1U3v', _lv2_v1_Controller),
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                '3v1N', _lv2_v2_Controller),
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                '1W3w', _lv2_v3_Controller),
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                '1V3w', _lv2_v4_Controller),
                          ]))
                        : Container(),
                    ntr.vectorGroup.contains('Yd11')
                        ? Card(
                            child: Column(children: [
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                '1U3w', _lv2_v1_Controller),
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                '3wN', _lv2_v2_Controller),
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                '1V3v', _lv2_v3_Controller),
                            simplifiedFor_Display_for_all_Mobile_numpad(
                                '1W3v', _lv2_v4_Controller),
                          ]))
                        : Container(),
                    checkVectoreGroup(ntr)
                        ? Container()
                        : Card(
                            child: Column(
                            children: [
                              Text(
                                'LV3',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5),
                              ),
                              ntr.vectorGroup.contains('Dd0')
                                  ? Card(
                                      child: Column(children: [
                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                          '1U4w', _lv3_v1_Controller),
                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                          '4w1W', _lv3_v2_Controller),
                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                          '1W4w', _lv3_v3_Controller),
                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                          '1W4v', _lv3_v4_Controller),
                                    ]))
                                  : Container(),
                              ntr.vectorGroup.contains('Dd6')
                                  ? Card(
                                      child: Column(children: [
                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                          '4w1U', _lv3_v1_Controller),
                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                          '1U1W', _lv3_v2_Controller),
                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                          '1W4v', _lv3_v3_Controller),
                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                          '1W4w', _lv3_v4_Controller),
                                    ]))
                                  : Container(),
                              ntr.vectorGroup.contains('Yd1')
                                  ? Card(
                                      child: Column(children: [
                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                          '1U4v ', _lv3_v1_Controller),
                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                          '4v1N', _lv3_v2_Controller),
                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                          '1W4w ', _lv3_v3_Controller),
                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                          '1V4w', _lv3_v4_Controller),
                                    ]))
                                  : Container(),
                              ntr.vectorGroup.contains('Yd11')
                                  ? Card(
                                      child: Column(children: [
                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                          '1U4w  ', _lv3_v1_Controller),
                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                          '4wN', _lv3_v2_Controller),
                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                          '1V4v  ', _lv3_v3_Controller),
                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                          '1W4v', _lv3_v4_Controller),
                                    ]))
                                  : Container(),
                              Text(
                                'LV4',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5),
                              ),
                              ntr.vectorGroup.contains('Dd0')
                                  ? Card(
                                      child: Column(children: [
                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                          '1U5w', _lv4_v1_Controller),
                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                          '5w1W', _lv4_v2_Controller),
                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                          '1W5w', _lv4_v3_Controller),
                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                          '1W5v', _lv4_v4_Controller),
                                    ]))
                                  : Container(),
                              ntr.vectorGroup.contains('Dd6')
                                  ? Card(
                                      child: Column(children: [
                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                          '5w1U', _lv4_v1_Controller),
                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                          '1U1W', _lv4_v2_Controller),
                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                          '1W5v', _lv4_v3_Controller),
                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                          '1W5w', _lv4_v4_Controller),
                                    ]))
                                  : Container(),
                              ntr.vectorGroup.contains('Yd1')
                                  ? Card(
                                      child: Column(children: [
                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                          '1U5v', _lv4_v1_Controller),
                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                          '5v1N', _lv4_v2_Controller),
                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                          '1W5w', _lv4_v3_Controller),
                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                          '1V5w', _lv4_v4_Controller),
                                    ]))
                                  : Container(),
                              ntr.vectorGroup.contains('Yd11')
                                  ? Card(
                                      child: Column(children: [
                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                          '1U5w', _lv4_v1_Controller),
                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                          '5wN', _lv4_v2_Controller),
                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                          '1V5v', _lv4_v3_Controller),
                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                          '1W5v', _lv4_v4_Controller),
                                    ]))
                                  : Container(),
                            ],
                          ))
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  bool checkVectoreGroup(ItModel ntr) {
    return ntr.vectorGroup.toLowerCase() == 'dd0/dd0' ||
        ntr.vectorGroup.toLowerCase() == 'dd6/dd6' ||
        ntr.vectorGroup.toLowerCase() == 'yd1d1' ||
        ntr.vectorGroup.toLowerCase() == 'yd11d11';
  }
}
