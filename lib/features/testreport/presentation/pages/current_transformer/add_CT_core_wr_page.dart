// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/ct_provider/ct_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/CT/ct_core_wr_model.dart';
import '../../../data/models/equipment/CT/ct_model.dart';
import '../../providers/ct_provider/ct_core_wr_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

final _formKey = GlobalKey<FormState>();

class Add_CTcoreWR extends StatelessWidget with GetItMixin {
  Map args = {};
  int CT_ID;
  int TR_ID;

  Add_CTcoreWR(this.args, {Key key}) : super(key: key);

  final TextEditingController _Trno_Controller = TextEditingController();
  final TextEditingController _serialNo_Controller = TextEditingController();
  final TextEditingController _R_1S1_1S2_Controller = TextEditingController();
  final TextEditingController _R_2S1_2S2_Controller = TextEditingController();
  final TextEditingController _R_3S1_3S2_Controller = TextEditingController();
  final TextEditingController _R_4S1_4S2_Controller = TextEditingController();
  final TextEditingController _R_5S1_5S2_Controller = TextEditingController();
  final TextEditingController _Y_1S1_1S2_Controller = TextEditingController();
  final TextEditingController _Y_2S1_2S2_Controller = TextEditingController();
  final TextEditingController _Y_3S1_3S2_Controller = TextEditingController();
  final TextEditingController _Y_4S1_4S2_Controller = TextEditingController();
  final TextEditingController _Y_5S1_5S2_Controller = TextEditingController();
  final TextEditingController _B_1S1_1S2_Controller = TextEditingController();
  final TextEditingController _B_2S1_2S2_Controller = TextEditingController();
  final TextEditingController _B_3S1_3S2_Controller = TextEditingController();
  final TextEditingController _B_4S1_4S2_Controller = TextEditingController();
  final TextEditingController _B_5S1_5S2_Controller = TextEditingController();
  final TextEditingController _equipmentUsed_Controller =
      TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  setTrNo() {
    _Trno_Controller.text = args['TrNo'].toString();
    _serialNo_Controller.text = args['serial_no_bph'].toString();
    CT_ID = args['ctDatabaseID'];
    TR_ID = args['trDatabaseID'];
  }

  @override
  Widget build(BuildContext context) {
    final CTModel ntr = watchOnly((CTProvider x) => x.ctModel);

    setTrNo();
    var mob = Text('Add CTcore WR ', style: TextStyle(fontSize: 17));
    var desk = Text('Add CTcore WR ', style: TextStyle(fontSize: 20));
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

                  double R_1S1_1S2;
                  double R_2S1_2S2;
                  double R_3S1_3S2;
                  double R_4S1_4S2;
                  double R_5S1_5S2;

                  double Y_1S1_1S2;
                  double Y_2S1_2S2;
                  double Y_3S1_3S2;
                  double Y_4S1_4S2;
                  double Y_5S1_5S2;

                  double B_1S1_1S2;
                  double B_2S1_2S2;
                  double B_3S1_3S2;
                  double B_4S1_4S2;
                  double B_5S1_5S2;

                  //////////////////////////////////////
                  if (ntr.noOfCores == 1) {
                    print('selected Noofcore' + ntr.noOfCores.toString());
                    R_1S1_1S2 = double.parse(_R_1S1_1S2_Controller.text);
                    R_2S1_2S2 = 0.00;
                    R_3S1_3S2 = 0.00;
                    R_4S1_4S2 = 0.00;
                    R_5S1_5S2 = 0.00;

                    Y_1S1_1S2 = double.parse(_Y_1S1_1S2_Controller.text);
                    Y_2S1_2S2 = 0.00;
                    Y_3S1_3S2 = 0.00;
                    Y_4S1_4S2 = 0.00;
                    Y_5S1_5S2 = 0.00;

                    B_1S1_1S2 = double.parse(_B_1S1_1S2_Controller.text);
                    B_2S1_2S2 = 0.00;
                    B_3S1_3S2 = 0.00;
                    B_4S1_4S2 = 0.00;
                    B_5S1_5S2 = 0.00;
                  }
                  if (ntr.noOfCores == 2) {
                    print('selected Noofcore' + ntr.noOfCores.toString());
                    R_1S1_1S2 = double.parse(_R_1S1_1S2_Controller.text);
                    R_2S1_2S2 = double.parse(_R_2S1_2S2_Controller.text);
                    R_3S1_3S2 = 0.00;
                    R_4S1_4S2 = 0.00;
                    R_5S1_5S2 = 0.00;

                    Y_1S1_1S2 = double.parse(_Y_1S1_1S2_Controller.text);
                    Y_2S1_2S2 = double.parse(_Y_2S1_2S2_Controller.text);
                    Y_3S1_3S2 = 0.00;
                    Y_4S1_4S2 = 0.00;
                    Y_5S1_5S2 = 0.00;

                    B_1S1_1S2 = double.parse(_B_1S1_1S2_Controller.text);
                    B_2S1_2S2 = double.parse(_B_2S1_2S2_Controller.text);
                    B_3S1_3S2 = 0.00;
                    B_4S1_4S2 = 0.00;
                    B_5S1_5S2 = 0.00;
                  }
                  if (ntr.noOfCores == 3) {
                    print('selected Noofcore' + ntr.noOfCores.toString());
                    R_1S1_1S2 = double.parse(_R_1S1_1S2_Controller.text);
                    R_2S1_2S2 = double.parse(_R_2S1_2S2_Controller.text);
                    R_3S1_3S2 = double.parse(_R_3S1_3S2_Controller.text);
                    R_4S1_4S2 = 0.00;
                    R_5S1_5S2 = 0.00;

                    Y_1S1_1S2 = double.parse(_Y_1S1_1S2_Controller.text);
                    Y_2S1_2S2 = double.parse(_Y_2S1_2S2_Controller.text);
                    Y_3S1_3S2 = double.parse(_Y_3S1_3S2_Controller.text);
                    Y_4S1_4S2 = 0.00;
                    Y_5S1_5S2 = 0.00;

                    B_1S1_1S2 = double.parse(_B_1S1_1S2_Controller.text);
                    B_2S1_2S2 = double.parse(_B_2S1_2S2_Controller.text);
                    B_3S1_3S2 = double.parse(_B_3S1_3S2_Controller.text);
                    B_4S1_4S2 = 0.00;
                    B_5S1_5S2 = 0.00;
                  }
                  if (ntr.noOfCores == 4) {
                    print('selected Noofcore' + ntr.noOfCores.toString());
                    R_1S1_1S2 = double.parse(_R_1S1_1S2_Controller.text);
                    R_2S1_2S2 = double.parse(_R_2S1_2S2_Controller.text);
                    R_3S1_3S2 = double.parse(_R_3S1_3S2_Controller.text);
                    R_4S1_4S2 = double.parse(_R_4S1_4S2_Controller.text);
                    R_5S1_5S2 = 0.00;

                    Y_1S1_1S2 = double.parse(_Y_1S1_1S2_Controller.text);
                    Y_2S1_2S2 = double.parse(_Y_2S1_2S2_Controller.text);
                    Y_3S1_3S2 = double.parse(_Y_3S1_3S2_Controller.text);
                    Y_4S1_4S2 = double.parse(_Y_4S1_4S2_Controller.text);
                    Y_5S1_5S2 = 0.00;

                    B_1S1_1S2 = double.parse(_B_1S1_1S2_Controller.text);
                    B_2S1_2S2 = double.parse(_B_2S1_2S2_Controller.text);
                    B_3S1_3S2 = double.parse(_B_3S1_3S2_Controller.text);
                    B_4S1_4S2 = double.parse(_B_4S1_4S2_Controller.text);
                    B_5S1_5S2 = 0.00;
                  }
                  if (ntr.noOfCores == 5) {
                    print('selected Noofcore' + ntr.noOfCores.toString());
                    R_1S1_1S2 = double.parse(_R_1S1_1S2_Controller.text);
                    R_2S1_2S2 = double.parse(_R_2S1_2S2_Controller.text);
                    R_3S1_3S2 = double.parse(_R_3S1_3S2_Controller.text);
                    R_4S1_4S2 = double.parse(_R_4S1_4S2_Controller.text);
                    R_5S1_5S2 = double.parse(_R_5S1_5S2_Controller.text);

                    Y_1S1_1S2 = double.parse(_Y_1S1_1S2_Controller.text);
                    Y_2S1_2S2 = double.parse(_Y_2S1_2S2_Controller.text);
                    Y_3S1_3S2 = double.parse(_Y_3S1_3S2_Controller.text);
                    Y_4S1_4S2 = double.parse(_Y_4S1_4S2_Controller.text);
                    Y_5S1_5S2 = double.parse(_Y_5S1_5S2_Controller.text);

                    B_1S1_1S2 = double.parse(_B_1S1_1S2_Controller.text);
                    B_2S1_2S2 = double.parse(_B_2S1_2S2_Controller.text);
                    B_3S1_3S2 = double.parse(_B_3S1_3S2_Controller.text);
                    B_4S1_4S2 = double.parse(_B_4S1_4S2_Controller.text);
                    B_5S1_5S2 = double.parse(_B_5S1_5S2_Controller.text);
                  }

                  //Values contained based on the condition of cores
                  _R_1S1_1S2_Controller.text = R_1S1_1S2.toString();
                  _R_2S1_2S2_Controller.text = R_2S1_2S2.toString();
                  _R_3S1_3S2_Controller.text = R_3S1_3S2.toString();
                  _R_4S1_4S2_Controller.text = R_4S1_4S2.toString();
                  _R_5S1_5S2_Controller.text = R_5S1_5S2.toString();
                  _Y_1S1_1S2_Controller.text = Y_1S1_1S2.toString();
                  _Y_2S1_2S2_Controller.text = Y_2S1_2S2.toString();
                  _Y_3S1_3S2_Controller.text = Y_3S1_3S2.toString();
                  _Y_4S1_4S2_Controller.text = Y_4S1_4S2.toString();
                  _Y_5S1_5S2_Controller.text = Y_5S1_5S2.toString();
                  _B_1S1_1S2_Controller.text = B_1S1_1S2.toString();
                  _B_2S1_2S2_Controller.text = B_2S1_2S2.toString();
                  _B_3S1_3S2_Controller.text = B_3S1_3S2.toString();
                  _B_4S1_4S2_Controller.text = B_4S1_4S2.toString();
                  _B_5S1_5S2_Controller.text = B_5S1_5S2.toString();

                  // add to local database
                  final CTcoreWRModel CTcoreWRtoLocal = CTcoreWRModel(
                    trNo: int.parse(_Trno_Controller.text),
                    serialNo: _serialNo_Controller.text,
                    R_1S1_1S2: double.parse(_R_1S1_1S2_Controller.text),
                    R_2S1_2S2: double.parse(_R_2S1_2S2_Controller.text),
                    R_3S1_3S2: double.parse(_R_3S1_3S2_Controller.text),
                    R_4S1_4S2: double.parse(_R_4S1_4S2_Controller.text),
                    R_5S1_5S2: double.parse(_R_5S1_5S2_Controller.text),
                    Y_1S1_1S2: double.parse(_Y_1S1_1S2_Controller.text),
                    Y_2S1_2S2: double.parse(_Y_2S1_2S2_Controller.text),
                    Y_3S1_3S2: double.parse(_Y_3S1_3S2_Controller.text),
                    Y_4S1_4S2: double.parse(_Y_4S1_4S2_Controller.text),
                    Y_5S1_5S2: double.parse(_Y_5S1_5S2_Controller.text),
                    B_1S1_1S2: double.parse(_B_1S1_1S2_Controller.text),
                    B_2S1_2S2: double.parse(_B_2S1_2S2_Controller.text),
                    B_3S1_3S2: double.parse(_B_3S1_3S2_Controller.text),
                    B_4S1_4S2: double.parse(_B_4S1_4S2_Controller.text),
                    B_5S1_5S2: double.parse(_B_5S1_5S2_Controller.text),
                    equipmentUsed: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,
                  );
                  print(CTcoreWRtoLocal);
                  print(CTcoreWRtoLocal.trNo);
                  getX((CTcoreWRProvider x) => x.addCTcoreWR(CTcoreWRtoLocal));
                  watchOnly((CTcoreWRProvider x) => {});

                  Navigator.popAndPushNamed(context, '/detail_CT', arguments: {
                    'id': args['CT_ID'],
                    'ctDatabaseID': CT_ID,
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
    final CTModel ntr = watchOnly((CTProvider x) => x.ctModel);
    final splitted = ntr.connectedTap.split('-');
    var s1 = splitted[0];
    var s2 = splitted[1];
    print(s1);
    print(s2);
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
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: EquipmentTypeList(),
                    ),

                    Divider(color: Colors.black, thickness: 1),
                    ////////////////////////////////////////////
                    ntr.connectedTap == "0" ||
                            ntr.connectedTap == "S1-S2" ||
                            ntr.connectedTap == "S1-S3" ||
                            ntr.connectedTap == "S1-S4" ||
                            ntr.connectedTap == "S1-S5"
                        ? Column(
                            children: [
                              ntr.noOfCores == 5
                                  ? Column(
                                      children: [
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'R_1' + s1 + '_1' + s2,
                                            _R_1S1_1S2_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'R_2' + s1 + '_2' + s2,
                                            _R_2S1_2S2_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'R_3' + s1 + '_3' + s2,
                                            _R_3S1_3S2_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'R_4' + s1 + '_4' + s2,
                                            _R_4S1_4S2_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'R_5' + s1 + '_5' + s2,
                                            _R_5S1_5S2_Controller),
                                        //-------------------------------------
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'Y_1' + s1 + '_1' + s2,
                                            _Y_1S1_1S2_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'Y_2' + s1 + '_2' + s2,
                                            _Y_2S1_2S2_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'Y_3' + s1 + '_3' + s2,
                                            _Y_3S1_3S2_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'Y_4' + s1 + '_4' + s2,
                                            _Y_4S1_4S2_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'Y_5' + s1 + '_5' + s2,
                                            _Y_5S1_5S2_Controller),
                                        //-------------------------------------
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'B_1' + s1 + '_1' + s2,
                                            _B_1S1_1S2_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'B_2' + s1 + '_2' + s2,
                                            _B_2S1_2S2_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'B_3' + s1 + '_3' + s2,
                                            _B_3S1_3S2_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'B_4' + s1 + '_4' + s2,
                                            _B_4S1_4S2_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'B_5' + s1 + '_5' + s2,
                                            _B_5S1_5S2_Controller),
                                      ],
                                    )
                                  : Container(),
                              /////////////////////////coreNo > 04 Started////////
                              ntr.noOfCores == 4
                                  ? Column(
                                      children: [
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'R_1' + s1 + '_1' + s2,
                                            _R_1S1_1S2_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'R_2' + s1 + '_2' + s2,
                                            _R_2S1_2S2_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'R_3' + s1 + '_3' + s2,
                                            _R_3S1_3S2_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'R_4' + s1 + '_4' + s2,
                                            _R_4S1_4S2_Controller),

                                        //-------------------------------------
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'Y_1' + s1 + '_1' + s2,
                                            _Y_1S1_1S2_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'Y_2' + s1 + '_2' + s2,
                                            _Y_2S1_2S2_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'Y_3' + s1 + '_3' + s2,
                                            _Y_3S1_3S2_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'Y_4' + s1 + '_4' + s2,
                                            _Y_4S1_4S2_Controller),

                                        //-------------------------------------
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'B_1' + s1 + '_1' + s2,
                                            _B_1S1_1S2_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'B_2' + s1 + '_2' + s2,
                                            _B_2S1_2S2_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'B_3' + s1 + '_3' + s2,
                                            _B_3S1_3S2_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'B_4' + s1 + '_4' + s2,
                                            _B_4S1_4S2_Controller),
                                      ],
                                    )
                                  : Container(),
                              //////////////////////nocore > 3 started/////////////
                              ntr.noOfCores == 3
                                  ? Column(
                                      children: [
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'R_1' + s1 + '_1' + s2,
                                            _R_1S1_1S2_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'R_2' + s1 + '_2' + s2,
                                            _R_2S1_2S2_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'R_3' + s1 + '_3' + s2,
                                            _R_3S1_3S2_Controller),

                                        //-------------------------------------
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'Y_1' + s1 + '_1' + s2,
                                            _Y_1S1_1S2_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'Y_2' + s1 + '_2' + s2,
                                            _Y_2S1_2S2_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'Y_3' + s1 + '_3' + s2,
                                            _Y_3S1_3S2_Controller),

                                        //-------------------------------------
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'B_1' + s1 + '_1' + s2,
                                            _B_1S1_1S2_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'B_2' + s1 + '_2' + s2,
                                            _B_2S1_2S2_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'B_3' + s1 + '_3' + s2,
                                            _B_3S1_3S2_Controller),
                                      ],
                                    )
                                  : Container(),
                              ///////////////////////nocore > 2 started/////////////
                              ntr.noOfCores == 2
                                  ? Column(
                                      children: [
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'R_1' + s1 + '_1' + s2,
                                            _R_1S1_1S2_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'R_2' + s1 + '_2' + s2,
                                            _R_2S1_2S2_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'Y_1' + s1 + '_1' + s2,
                                            _Y_1S1_1S2_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'Y_2' + s1 + '_2' + s2,
                                            _Y_2S1_2S2_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'B_1' + s1 + '_1' + s2,
                                            _B_1S1_1S2_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'B_2' + s1 + '_2' + s2,
                                            _B_2S1_2S2_Controller),
                                      ],
                                    )
                                  : Container(),
                              ///////////////////////nocore > 1 started/////////////
                              ntr.noOfCores == 1
                                  ? Column(
                                      children: [
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'R_1' + s1 + '_1' + s2,
                                            _R_1S1_1S2_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'Y_1' + s1 + '_1' + s2,
                                            _Y_1S1_1S2_Controller),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'B_1' + s1 + '_1' + s2,
                                            _B_1S1_1S2_Controller),
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

            // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>ELES-MOBILE-VIEW-PART>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
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
                    ////////////////////////////////////////////
                    ntr.connectedTap == "0" ||
                            ntr.connectedTap == "S1-S2" ||
                            ntr.connectedTap == "S1-S3" ||
                            ntr.connectedTap == "S1-S4" ||
                            ntr.connectedTap == "S1-S5"
                        ? Column(
                            children: [
                              ntr.noOfCores == 5
                                  ? Column(
                                      children: [
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'R_1' + s1 + '_1' + s2,
                                            _R_1S1_1S2_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'R_2' + s1 + '_2' + s2,
                                            _R_2S1_2S2_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'R_3' + s1 + '_3' + s2,
                                            _R_3S1_3S2_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'R_4' + s1 + '_4' + s2,
                                            _R_4S1_4S2_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'R_5' + s1 + '_5' + s2,
                                            _R_5S1_5S2_Controller),
                                        //-------------------------------------
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'Y_1' + s1 + '_1' + s2,
                                            _Y_1S1_1S2_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'Y_2' + s1 + '_2' + s2,
                                            _Y_2S1_2S2_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'Y_3' + s1 + '_3' + s2,
                                            _Y_3S1_3S2_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'Y_4' + s1 + '_4' + s2,
                                            _Y_4S1_4S2_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'Y_5' + s1 + '_5' + s2,
                                            _Y_5S1_5S2_Controller),
                                        //-------------------------------------
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'B_1' + s1 + '_1' + s2,
                                            _B_1S1_1S2_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'B_2' + s1 + '_2' + s2,
                                            _B_2S1_2S2_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'B_3' + s1 + '_3' + s2,
                                            _B_3S1_3S2_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'B_4' + s1 + '_4' + s2,
                                            _B_4S1_4S2_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'B_5' + s1 + '_5' + s2,
                                            _B_5S1_5S2_Controller),
                                      ],
                                    )
                                  : Container(),
                              /////////////////////////coreNo > 04 Started////////
                              ntr.noOfCores == 4
                                  ? Column(
                                      children: [
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'R_1' + s1 + '_1' + s2,
                                            _R_1S1_1S2_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'R_2' + s1 + '_2' + s2,
                                            _R_2S1_2S2_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'R_3' + s1 + '_3' + s2,
                                            _R_3S1_3S2_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'R_4' + s1 + '_4' + s2,
                                            _R_4S1_4S2_Controller),

                                        //-------------------------------------
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'Y_1' + s1 + '_1' + s2,
                                            _Y_1S1_1S2_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'Y_2' + s1 + '_2' + s2,
                                            _Y_2S1_2S2_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'Y_3' + s1 + '_3' + s2,
                                            _Y_3S1_3S2_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'Y_4' + s1 + '_4' + s2,
                                            _Y_4S1_4S2_Controller),

                                        //-------------------------------------
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'B_1' + s1 + '_1' + s2,
                                            _B_1S1_1S2_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'B_2' + s1 + '_2' + s2,
                                            _B_2S1_2S2_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'B_3' + s1 + '_3' + s2,
                                            _B_3S1_3S2_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'B_4' + s1 + '_4' + s2,
                                            _B_4S1_4S2_Controller),
                                      ],
                                    )
                                  : Container(),
                              //////////////////////nocore > 3 started/////////////
                              ntr.noOfCores == 3
                                  ? Column(
                                      children: [
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'R_1' + s1 + '_1' + s2,
                                            _R_1S1_1S2_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'R_2' + s1 + '_2' + s2,
                                            _R_2S1_2S2_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'R_3' + s1 + '_3' + s2,
                                            _R_3S1_3S2_Controller),

                                        //-------------------------------------
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'Y_1' + s1 + '_1' + s2,
                                            _Y_1S1_1S2_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'Y_2' + s1 + '_2' + s2,
                                            _Y_2S1_2S2_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'Y_3' + s1 + '_3' + s2,
                                            _Y_3S1_3S2_Controller),

                                        //-------------------------------------
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'B_1' + s1 + '_1' + s2,
                                            _B_1S1_1S2_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'B_2' + s1 + '_2' + s2,
                                            _B_2S1_2S2_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'B_3' + s1 + '_3' + s2,
                                            _B_3S1_3S2_Controller),
                                      ],
                                    )
                                  : Container(),
                              ///////////////////////nocore > 2 started/////////////
                              ntr.noOfCores == 2
                                  ? Column(
                                      children: [
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'R_1' + s1 + '_1' + s2,
                                            _R_1S1_1S2_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'R_2' + s1 + '_2' + s2,
                                            _R_2S1_2S2_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'Y_1' + s1 + '_1' + s2,
                                            _Y_1S1_1S2_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'Y_2' + s1 + '_2' + s2,
                                            _Y_2S1_2S2_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'B_1' + s1 + '_1' + s2,
                                            _B_1S1_1S2_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'B_2' + s1 + '_2' + s2,
                                            _B_2S1_2S2_Controller),
                                      ],
                                    )
                                  : Container(),
                              ///////////////////////nocore > 1 started/////////////
                              ntr.noOfCores == 1
                                  ? Column(
                                      children: [
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'R_1' + s1 + '_1' + s2,
                                            _R_1S1_1S2_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'Y_1' + s1 + '_1' + s2,
                                            _Y_1S1_1S2_Controller),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'B_1' + s1 + '_1' + s2,
                                            _B_1S1_1S2_Controller),
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
