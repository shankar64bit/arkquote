// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/PT/pt_core_r_model.dart';
import '../../../data/models/equipment/PT/pt_model.dart';
import '../../providers/pt_provider/pt_core_r_provider.dart';
import '../../providers/pt_provider/pt_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

final _formKey = GlobalKey<FormState>();

class Add_PTcoreR extends StatelessWidget with GetItMixin {
  Map args = {};
  int PT_ID;
  int TR_ID;

  Add_PTcoreR(this.args, {Key key}) : super(key: key);

  final TextEditingController _Trno_Controller = TextEditingController();
  final TextEditingController _serialNo_Controller = TextEditingController();
  final TextEditingController _R_1a_1n_1000_Controller =
      TextEditingController();
  final TextEditingController _R_2a_2n_1000_Controller =
      TextEditingController();
  final TextEditingController _R_3a_3n_1000_Controller =
      TextEditingController();

  final TextEditingController _Y_1a_1n_1000_Controller =
      TextEditingController();
  final TextEditingController _Y_2a_2n_1000_Controller =
      TextEditingController();
  final TextEditingController _Y_3a_3n_1000_Controller =
      TextEditingController();

  final TextEditingController _B_1a_1n_1000_Controller =
      TextEditingController();
  final TextEditingController _B_2a_2n_1000_Controller =
      TextEditingController();
  final TextEditingController _B_3a_3n_1000_Controller =
      TextEditingController();
  // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  final TextEditingController _R_1a_1n_2000_Controller =
      TextEditingController();
  final TextEditingController _R_2a_2n_2000_Controller =
      TextEditingController();
  final TextEditingController _R_3a_3n_2000_Controller =
      TextEditingController();

  final TextEditingController _Y_1a_1n_2000_Controller =
      TextEditingController();
  final TextEditingController _Y_2a_2n_2000_Controller =
      TextEditingController();
  final TextEditingController _Y_3a_3n_2000_Controller =
      TextEditingController();

  final TextEditingController _B_1a_1n_2000_Controller =
      TextEditingController();
  final TextEditingController _B_2a_2n_2000_Controller =
      TextEditingController();
  final TextEditingController _B_3a_3n_2000_Controller =
      TextEditingController();
  // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  final TextEditingController _R_1a_1n_3000_Controller =
      TextEditingController();
  final TextEditingController _R_2a_2n_3000_Controller =
      TextEditingController();
  final TextEditingController _R_3a_3n_3000_Controller =
      TextEditingController();

  final TextEditingController _Y_1a_1n_3000_Controller =
      TextEditingController();
  final TextEditingController _Y_2a_2n_3000_Controller =
      TextEditingController();
  final TextEditingController _Y_3a_3n_3000_Controller =
      TextEditingController();

  final TextEditingController _B_1a_1n_3000_Controller =
      TextEditingController();
  final TextEditingController _B_2a_2n_3000_Controller =
      TextEditingController();
  final TextEditingController _B_3a_3n_3000_Controller =
      TextEditingController();
  // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  final TextEditingController _R_1a_1n_4000_Controller =
      TextEditingController();
  final TextEditingController _R_2a_2n_4000_Controller =
      TextEditingController();
  final TextEditingController _R_3a_3n_4000_Controller =
      TextEditingController();

  final TextEditingController _Y_1a_1n_4000_Controller =
      TextEditingController();
  final TextEditingController _Y_2a_2n_4000_Controller =
      TextEditingController();
  final TextEditingController _Y_3a_3n_4000_Controller =
      TextEditingController();

  final TextEditingController _B_1a_1n_4000_Controller =
      TextEditingController();
  final TextEditingController _B_2a_2n_4000_Controller =
      TextEditingController();
  final TextEditingController _B_3a_3n_4000_Controller =
      TextEditingController();

  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  setTrNo() {
    _Trno_Controller.text = args['TrNo'].toString();
    _serialNo_Controller.text = args['serial_no_bph'].toString();
    PT_ID = args['ptDatabaseID'];
    TR_ID = args['trDatabaseID'];
  }

  @override
  Widget build(BuildContext context) {
    final PTModel ntr = watchOnly((PTProvider x) => x.ptModel);

    setTrNo();
    var mob = Text('Add PT Ratio Test', style: TextStyle(fontSize: 17));
    var desk = Text('Add PT Ratio Test', style: TextStyle(fontSize: 20));
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

                  //variable creation for hold values

                  //////////////////////////////////////
                  if (ntr.noOfCores == 1 || ntr.noOfCores == 2) {
                    _R_3a_3n_1000_Controller.text = '0.00';
                    _R_3a_3n_2000_Controller.text = '0.00';
                    _R_3a_3n_3000_Controller.text = '0.00';
                    _R_3a_3n_4000_Controller.text = '0.00';
                    _Y_3a_3n_1000_Controller.text = '0.00';
                    _Y_3a_3n_2000_Controller.text = '0.00';
                    _Y_3a_3n_3000_Controller.text = '0.00';
                    _Y_3a_3n_4000_Controller.text = '0.00';
                    _B_3a_3n_1000_Controller.text = '0.00';
                    _B_3a_3n_2000_Controller.text = '0.00';
                    _B_3a_3n_3000_Controller.text = '0.00';
                    _B_3a_3n_4000_Controller.text = '0.00';
                  }

                  if (ntr.noOfCores == 1) {
                    _R_2a_2n_1000_Controller.text = '0.00';
                    _R_2a_2n_2000_Controller.text = '0.00';
                    _R_2a_2n_3000_Controller.text = '0.00';
                    _R_2a_2n_4000_Controller.text = '0.00';
                    _Y_2a_2n_1000_Controller.text = '0.00';
                    _Y_2a_2n_2000_Controller.text = '0.00';
                    _Y_2a_2n_3000_Controller.text = '0.00';
                    _Y_2a_2n_4000_Controller.text = '0.00';
                    _B_2a_2n_1000_Controller.text = '0.00';
                    _B_2a_2n_2000_Controller.text = '0.00';
                    _B_2a_2n_3000_Controller.text = '0.00';
                    _B_2a_2n_4000_Controller.text = '0.00';
                  }

                  // add to local database
                  final PTcoreRModel PTcoreRtoLocal = PTcoreRModel(
                    trNo: int.parse(_Trno_Controller.text),
                    serialNo: _serialNo_Controller.text,
                    R_1a_1n_1000: double.parse(_R_1a_1n_1000_Controller.text),
                    R_2a_2n_1000: double.parse(_R_2a_2n_1000_Controller.text),
                    R_3a_3n_1000: double.parse(_R_3a_3n_1000_Controller.text),
                    Y_1a_1n_1000: double.parse(_Y_1a_1n_1000_Controller.text),
                    Y_2a_2n_1000: double.parse(_Y_2a_2n_1000_Controller.text),
                    Y_3a_3n_1000: double.parse(_Y_3a_3n_1000_Controller.text),
                    B_1a_1n_1000: double.parse(_B_1a_1n_1000_Controller.text),
                    B_2a_2n_1000: double.parse(_B_2a_2n_1000_Controller.text),
                    B_3a_3n_1000: double.parse(_B_3a_3n_1000_Controller.text),
                    R_1a_1n_2000: double.parse(_R_1a_1n_2000_Controller.text),
                    R_2a_2n_2000: double.parse(_R_2a_2n_2000_Controller.text),
                    R_3a_3n_2000: double.parse(_R_3a_3n_2000_Controller.text),
                    Y_1a_1n_2000: double.parse(_Y_1a_1n_2000_Controller.text),
                    Y_2a_2n_2000: double.parse(_Y_2a_2n_2000_Controller.text),
                    Y_3a_3n_2000: double.parse(_Y_3a_3n_2000_Controller.text),
                    B_1a_1n_2000: double.parse(_B_1a_1n_2000_Controller.text),
                    B_2a_2n_2000: double.parse(_B_2a_2n_2000_Controller.text),
                    B_3a_3n_2000: double.parse(_B_3a_3n_2000_Controller.text),
                    R_1a_1n_3000: double.parse(_R_1a_1n_3000_Controller.text),
                    R_2a_2n_3000: double.parse(_R_2a_2n_3000_Controller.text),
                    R_3a_3n_3000: double.parse(_R_3a_3n_3000_Controller.text),
                    Y_1a_1n_3000: double.parse(_Y_1a_1n_3000_Controller.text),
                    Y_2a_2n_3000: double.parse(_Y_2a_2n_3000_Controller.text),
                    Y_3a_3n_3000: double.parse(_Y_3a_3n_3000_Controller.text),
                    B_1a_1n_3000: double.parse(_B_1a_1n_3000_Controller.text),
                    B_2a_2n_3000: double.parse(_B_2a_2n_3000_Controller.text),
                    B_3a_3n_3000: double.parse(_B_3a_3n_3000_Controller.text),
                    R_1a_1n_4000: double.parse(_R_1a_1n_4000_Controller.text),
                    R_2a_2n_4000: double.parse(_R_2a_2n_4000_Controller.text),
                    R_3a_3n_4000: double.parse(_R_3a_3n_4000_Controller.text),
                    Y_1a_1n_4000: double.parse(_Y_1a_1n_4000_Controller.text),
                    Y_2a_2n_4000: double.parse(_Y_2a_2n_4000_Controller.text),
                    Y_3a_3n_4000: double.parse(_Y_3a_3n_4000_Controller.text),
                    B_1a_1n_4000: double.parse(_B_1a_1n_4000_Controller.text),
                    B_2a_2n_4000: double.parse(_B_2a_2n_4000_Controller.text),
                    B_3a_3n_4000: double.parse(_B_3a_3n_4000_Controller.text),
                    equipmentUsed: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,
                    updateDate: DateTime.now(),
                  );
                  print(PTcoreRtoLocal);
                  print(PTcoreRtoLocal.trNo);
                  getX((PTcoreRProvider x) => x.addPTcoreR(PTcoreRtoLocal));
                  watchOnly((PTcoreRProvider x) => {});
                  Navigator.popAndPushNamed(context, '/detail_PT', arguments: {
                    'id': args['PT_ID'],
                    'ptDatabaseID': PT_ID,
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
    final PTModel ntr = watchOnly((PTProvider x) => x.ptModel);

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
                          'serialNo_bph',
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
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: EquipmentTypeList(),
                    ),
                    ntr.noOfCores > 1 || ntr.noOfCores == 1
                        ? Column(
                            children: [
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'R_1a_1n_1000', _R_1a_1n_1000_Controller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'Y_1a_1n_1000', _Y_1a_1n_1000_Controller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'B_1a_1n_1000', _B_1a_1n_1000_Controller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'R_1a_1n_2000', _R_1a_1n_2000_Controller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'Y_1a_1n_2000', _Y_1a_1n_2000_Controller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'B_1a_1n_2000', _B_1a_1n_2000_Controller),

                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'R_1a_1n_3000', _R_1a_1n_3000_Controller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'Y_1a_1n_3000', _Y_1a_1n_3000_Controller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'B_1a_1n_3000', _B_1a_1n_3000_Controller),

                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'R_1a_1n_4000', _R_1a_1n_4000_Controller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'Y_1a_1n_4000', _Y_1a_1n_4000_Controller),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'B_1a_1n_4000', _B_1a_1n_4000_Controller),

                              // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                              ntr.noOfCores > 2 || ntr.noOfCores == 2
                                  ? Column(
                                      children: [
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'R_2a_2n_1000',
                                            _R_2a_2n_1000_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'Y_2a_2n_1000',
                                            _Y_2a_2n_1000_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'B_2a_2n_1000',
                                            _B_2a_2n_1000_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'R_2a_2n_2000',
                                            _R_2a_2n_2000_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'Y_2a_2n_2000',
                                            _Y_2a_2n_2000_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'B_2a_2n_2000',
                                            _B_2a_2n_2000_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'R_2a_2n_3000',
                                            _R_2a_2n_3000_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'Y_2a_2n_3000',
                                            _Y_2a_2n_3000_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'B_2a_2n_3000',
                                            _B_2a_2n_3000_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'R_2a_2n_4000',
                                            _R_2a_2n_4000_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'Y_2a_2n_4000',
                                            _Y_2a_2n_4000_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'B_2a_2n_4000',
                                            _B_2a_2n_4000_Controller),
                                        ntr.noOfCores > 1 &&
                                                ntr.noOfCores > 2 &&
                                                ntr.noOfCores == 3
                                            ? Column(
                                                children: [
                                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                                      'R_3a_3n_1000',
                                                      _R_3a_3n_1000_Controller),
                                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                                      'Y_3a_3n_1000',
                                                      _Y_3a_3n_1000_Controller),
                                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                                      'B_3a_3n_1000',
                                                      _B_3a_3n_1000_Controller),
                                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                                      'R_3a_3n_2000',
                                                      _R_3a_3n_2000_Controller),
                                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                                      'Y_3a_3n_2000',
                                                      _Y_3a_3n_2000_Controller),
                                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                                      'B_3a_3n_2000',
                                                      _B_3a_3n_2000_Controller),
                                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                                      'R_3a_3n_3000',
                                                      _R_3a_3n_3000_Controller),
                                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                                      'Y_3a_3n_3000',
                                                      _Y_3a_3n_3000_Controller),
                                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                                      'B_3a_3n_3000',
                                                      _B_3a_3n_3000_Controller),
                                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                                      'R_3a_3n_4000',
                                                      _R_3a_3n_4000_Controller),
                                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                                      'Y_3a_3n_4000',
                                                      _Y_3a_3n_4000_Controller),
                                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                                      'B_3a_3n_4000',
                                                      _B_3a_3n_4000_Controller),
                                                ],
                                              )
                                            : Container(),
                                      ],
                                    )
                                  : Container(),
                            ],
                          )
                        : Container(),
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
                          'serialNo_bph',
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
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: EquipmentTypeList(),
                    ),
                    Divider(color: Colors.black, thickness: 1),
                    ntr.noOfCores > 1 || ntr.noOfCores == 1
                        ? Column(
                            children: [
                              //statements
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'R_1a_1n_1000', _R_1a_1n_1000_Controller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'Y_1a_1n_1000', _Y_1a_1n_1000_Controller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'B_1a_1n_1000', _B_1a_1n_1000_Controller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'R_1a_1n_2000', _R_1a_1n_2000_Controller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'Y_1a_1n_2000', _Y_1a_1n_2000_Controller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'B_1a_1n_2000', _B_1a_1n_2000_Controller),

                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'R_1a_1n_3000', _R_1a_1n_3000_Controller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'Y_1a_1n_3000', _Y_1a_1n_3000_Controller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'B_1a_1n_3000', _B_1a_1n_3000_Controller),

                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'R_1a_1n_4000', _R_1a_1n_4000_Controller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'Y_1a_1n_4000', _Y_1a_1n_4000_Controller),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'B_1a_1n_4000', _B_1a_1n_4000_Controller),

                              // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                              ntr.noOfCores > 2 || ntr.noOfCores == 2
                                  ? Column(
                                      children: [
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'R_2a_2n_1000',
                                            _R_2a_2n_1000_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'Y_2a_2n_1000',
                                            _Y_2a_2n_1000_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'B_2a_2n_1000',
                                            _B_2a_2n_1000_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'R_2a_2n_2000',
                                            _R_2a_2n_2000_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'Y_2a_2n_2000',
                                            _Y_2a_2n_2000_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'B_2a_2n_2000',
                                            _B_2a_2n_2000_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'R_2a_2n_3000',
                                            _R_2a_2n_3000_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'Y_2a_2n_3000',
                                            _Y_2a_2n_3000_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'B_2a_2n_3000',
                                            _B_2a_2n_3000_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'R_2a_2n_4000',
                                            _R_2a_2n_4000_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'Y_2a_2n_4000',
                                            _Y_2a_2n_4000_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'B_2a_2n_4000',
                                            _B_2a_2n_4000_Controller),
                                        ntr.noOfCores > 1 &&
                                                ntr.noOfCores > 2 &&
                                                ntr.noOfCores == 3
                                            ? Column(
                                                children: [
                                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                                      'R_3a_3n_1000',
                                                      _R_3a_3n_1000_Controller),
                                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                                      'Y_3a_3n_1000',
                                                      _Y_3a_3n_1000_Controller),
                                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                                      'B_3a_3n_1000',
                                                      _B_3a_3n_1000_Controller),
                                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                                      'R_3a_3n_2000',
                                                      _R_3a_3n_2000_Controller),
                                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                                      'Y_3a_3n_2000',
                                                      _Y_3a_3n_2000_Controller),
                                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                                      'B_3a_3n_2000',
                                                      _B_3a_3n_2000_Controller),
                                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                                      'R_3a_3n_3000',
                                                      _R_3a_3n_3000_Controller),
                                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                                      'Y_3a_3n_3000',
                                                      _Y_3a_3n_3000_Controller),
                                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                                      'B_3a_3n_3000',
                                                      _B_3a_3n_3000_Controller),
                                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                                      'R_3a_3n_4000',
                                                      _R_3a_3n_4000_Controller),
                                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                                      'Y_3a_3n_4000',
                                                      _Y_3a_3n_4000_Controller),
                                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                                      'B_3a_3n_4000',
                                                      _B_3a_3n_4000_Controller),
                                                ],
                                              )
                                            : Container(),
                                      ],
                                    )
                                  : Container(),
                            ],
                          )
                        : Container(),
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