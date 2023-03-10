// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/PT/pt_ir_model.dart';
import '../../../data/models/equipment/PT/pt_model.dart';
import '../../providers/pt_provider/pt_ir_provider.dart';
import '../../providers/pt_provider/pt_provider.dart';
import '../dropdown_All/MegaGigaTeraRadioButton/ct_ir_radio_button_page.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

final _formKey = GlobalKey<FormState>();

class Add_PTcoreIR extends StatelessWidget with GetItMixin {
  Map args = {};
  int PT_ID;
  int TR_ID;

  Add_PTcoreIR(this.args, {Key key}) : super(key: key);

  final TextEditingController _Trno_Controller = TextEditingController();
  final TextEditingController _serialNo_Controller = TextEditingController();
  final TextEditingController _equipmentUsed_Controller =
      TextEditingController();
  final TextEditingController _peR_Controller = TextEditingController();
  final TextEditingController _peY_Controller = TextEditingController();
  final TextEditingController _peB_Controller = TextEditingController();
  final TextEditingController _pc1R_Controller = TextEditingController();
  final TextEditingController _pc2R_Controller = TextEditingController();
  final TextEditingController _pc3R_Controller = TextEditingController();

  final TextEditingController _pc1Y_Controller = TextEditingController();
  final TextEditingController _pc2Y_Controller = TextEditingController();
  final TextEditingController _pc3Y_Controller = TextEditingController();

  final TextEditingController _pc1B_Controller = TextEditingController();
  final TextEditingController _pc2B_Controller = TextEditingController();
  final TextEditingController _pc3B_Controller = TextEditingController();

  final TextEditingController _c1eR_Controller = TextEditingController();
  final TextEditingController _c2eR_Controller = TextEditingController();
  final TextEditingController _c3eR_Controller = TextEditingController();

  final TextEditingController _c1eY_Controller = TextEditingController();
  final TextEditingController _c2eY_Controller = TextEditingController();
  final TextEditingController _c3eY_Controller = TextEditingController();

  final TextEditingController _c1eB_Controller = TextEditingController();
  final TextEditingController _c2eB_Controller = TextEditingController();
  final TextEditingController _c3eB_Controller = TextEditingController();

  final TextEditingController _c1c2R_Controller = TextEditingController();
  final TextEditingController _c1c2Y_Controller = TextEditingController();
  final TextEditingController _c1c2B_Controller = TextEditingController();

  final TextEditingController _c2c3R_Controller = TextEditingController();
  final TextEditingController _c2c3Y_Controller = TextEditingController();
  final TextEditingController _c2c3B_Controller = TextEditingController();

  final TextEditingController _clc1R_Controller = TextEditingController();
  final TextEditingController _clc1Y_Controller = TextEditingController();
  final TextEditingController _clc1B_Controller = TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Enum_ct_ir get selected_peR => Radio_peR().get_Radio_peR();
  Enum_ct_ir get selected_peY => Radio_peY().get_Radio_peY();
  Enum_ct_ir get selected_peB => Radio_peB().get_Radio_peB();
  Enum_ct_ir get selected_pc1R => Radio_pc1R().get_Radio_pc1R();
  Enum_ct_ir get selected_pc2R => Radio_pc2R().get_Radio_pc2R();
  Enum_ct_ir get selected_pc3R => Radio_pc3R().get_Radio_pc3R();
  Enum_ct_ir get selected_pc1Y => Radio_pc1Y().get_Radio_pc1Y();
  Enum_ct_ir get selected_pc2Y => Radio_pc2Y().get_Radio_pc2Y();
  Enum_ct_ir get selected_pc3Y => Radio_pc3Y().get_Radio_pc3Y();
  Enum_ct_ir get selected_pc1B => Radio_pc1B().get_Radio_pc1B();
  Enum_ct_ir get selected_pc2B => Radio_pc2B().get_Radio_pc2B();
  Enum_ct_ir get selected_pc3B => Radio_pc3B().get_Radio_pc3B();
  Enum_ct_ir get selected_c1eR => Radio_c1eR().get_Radio_c1eR();
  Enum_ct_ir get selected_c2eR => Radio_c2eR().get_Radio_c2eR();
  Enum_ct_ir get selected_c3eR => Radio_c3eR().get_Radio_c3eR();
  Enum_ct_ir get selected_c1eY => Radio_c1eY().get_Radio_c1eY();
  Enum_ct_ir get selected_c2eY => Radio_c2eY().get_Radio_c2eY();
  Enum_ct_ir get selected_c3eY => Radio_c3eY().get_Radio_c3eY();
  Enum_ct_ir get selected_c1eB => Radio_c1eB().get_Radio_c1eB();
  Enum_ct_ir get selected_c2eB => Radio_c2eB().get_Radio_c2eB();
  Enum_ct_ir get selected_c3eB => Radio_c3eB().get_Radio_c3eB();
  Enum_ct_ir get selected_c1c2R => Radio_c1c2R().get_Radio_c1c2R();
  Enum_ct_ir get selected_c1c2Y => Radio_c1c2Y().get_Radio_c1c2Y();
  Enum_ct_ir get selected_c1c2B => Radio_c1c2B().get_Radio_c1c2B();
  Enum_ct_ir get selected_c2c3R => Radio_c2c3R().get_Radio_c2c3R();
  Enum_ct_ir get selected_c2c3Y => Radio_c2c3Y().get_Radio_c2c3Y();
  Enum_ct_ir get selected_c2c3B => Radio_c2c3B().get_Radio_c2c3B();
  Enum_ct_ir get selected_clc1R => Radio_clc1R().get_Radio_clc1R();
  Enum_ct_ir get selected_clc1Y => Radio_clc1Y().get_Radio_clc1Y();
  Enum_ct_ir get selected_clc1B => Radio_clc1B().get_Radio_clc1B();

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
    var mob = Text('Add PT IR ', style: TextStyle(fontSize: 17));
    var desk = Text('Add PT IR ', style: TextStyle(fontSize: 20));
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

                  double peR;
                  double peY;
                  double peB;
                  double pc1R;
                  double pc2R;
                  double pc3R;
                  double pc1Y;
                  double pc2Y;
                  double pc3Y;
                  double pc1B;
                  double pc2B;
                  double pc3B;
                  double c1eR;
                  double c2eR;
                  double c3eR;
                  double c1eY;
                  double c2eY;
                  double c3eY;
                  double c1eB;
                  double c2eB;
                  double c3eB;
                  double c1c2R;
                  double c1c2Y;
                  double c1c2B;
                  double c2c3R;
                  double c2c3Y;
                  double c2c3B;
                  double clc1R;
                  double clc1Y;
                  double clc1B;

                  if (ntr.noOfCores == 1) {
                    print('selected Noofcore' + ntr.noOfCores.toString());

                    pc2R = 0.00;
                    pc2Y = 0.00;
                    pc2B = 0.00;
                    c2eR = 0.00;
                    c2eY = 0.00;
                    c2eB = 0.00;

                    pc3R = 0.00;
                    pc3Y = 0.00;
                    pc3B = 0.00;
                    c3eR = 0.00;
                    c3eY = 0.00;
                    c3eB = 0.00;

                    c1c2R = 0.00;
                    c1c2Y = 0.00;
                    c1c2B = 0.00;
                    c2c3R = 0.00;
                    c2c3Y = 0.00;
                    c2c3B = 0.00;
                    clc1R = 0.00;
                    clc1Y = 0.00;
                    clc1B = 0.00;

                    _pc2R_Controller.text = '0.00';
                    _pc2Y_Controller.text = '0.00';
                    _pc2B_Controller.text = '0.00';
                    _c2eR_Controller.text = '0.00';
                    _c2eY_Controller.text = '0.00';
                    _c2eB_Controller.text = '0.00';

                    _pc3R_Controller.text = '0.00';
                    _pc3Y_Controller.text = '0.00';
                    _pc3B_Controller.text = '0.00';

                    _c3eR_Controller.text = '0.00';
                    _c3eY_Controller.text = '0.00';
                    _c3eB_Controller.text = '0.00';

                    _c1c2R_Controller.text = '0.00';
                    _c1c2Y_Controller.text = '0.00';
                    _c1c2B_Controller.text = '0.00';
                    _c2c3R_Controller.text = '0.00';
                    _c2c3Y_Controller.text = '0.00';
                    _c2c3B_Controller.text = '0.00';
                    _clc1R_Controller.text = '0.00';
                    _clc1Y_Controller.text = '0.00';
                    _clc1B_Controller.text = '0.00';
                  }

                  if (ntr.noOfCores == 2) {
                    print('selected Noofcore' + ntr.noOfCores.toString());
                    _pc3R_Controller.text = '0.00';
                    _pc3Y_Controller.text = '0.00';
                    _pc3B_Controller.text = '0.00';

                    _c3eR_Controller.text = '0.00';
                    _c3eY_Controller.text = '0.00';
                    _c3eB_Controller.text = '0.00';
                    _c2c3R_Controller.text = '0.00';
                    _c2c3Y_Controller.text = '0.00';
                    _c2c3B_Controller.text = '0.00';
                    _clc1R_Controller.text = '0.00';
                    _clc1Y_Controller.text = '0.00';
                    _clc1B_Controller.text = '0.00';

                    pc3R = 0.00;
                    pc3Y = 0.00;
                    pc3B = 0.00;
                    c3eR = 0.00;
                    c3eY = 0.00;
                    c3eB = 0.00;
                    c2c3R = 0.00;
                    c2c3Y = 0.00;
                    c2c3B = 0.00;
                    clc1R = 0.00;
                    clc1Y = 0.00;
                    clc1B = 0.00;
                  }

                  if (peR != 0.00) {
                    peR = convertValue(double.parse(_peR_Controller.text),
                        selected_peR.toString().split('.')[1]);
                  }
                  if (peY != 0.00) {
                    peY = convertValue(double.parse(_peY_Controller.text),
                        selected_peY.toString().split('.')[1]);
                  }
                  if (peB != 0.00) {
                    peB = convertValue(double.parse(_peB_Controller.text),
                        selected_peB.toString().split('.')[1]);
                  }
                  if (pc1R != 0.00) {
                    pc1R = convertValue(double.parse(_pc1R_Controller.text),
                        selected_pc1R.toString().split('.')[1]);
                  }
                  if (pc2R != 0.00) {
                    pc2R = convertValue(double.parse(_pc2R_Controller.text),
                        selected_pc2R.toString().split('.')[1]);
                  }
                  if (pc3R != 0.00) {
                    pc3R = convertValue(double.parse(_pc3R_Controller.text),
                        selected_pc3R.toString().split('.')[1]);
                  }
                  if (pc1Y != 0.00) {
                    pc1Y = convertValue(double.parse(_pc1Y_Controller.text),
                        selected_pc1Y.toString().split('.')[1]);
                  }
                  if (pc2Y != 0.00) {
                    pc2Y = convertValue(double.parse(_pc2Y_Controller.text),
                        selected_pc2Y.toString().split('.')[1]);
                  }
                  if (pc3Y != 0.00) {
                    pc3Y = convertValue(double.parse(_pc3Y_Controller.text),
                        selected_pc3Y.toString().split('.')[1]);
                  }
                  if (pc1B != 0.00) {
                    pc1B = convertValue(double.parse(_pc1B_Controller.text),
                        selected_pc1B.toString().split('.')[1]);
                  }
                  if (pc2B != 0.00) {
                    pc2B = convertValue(double.parse(_pc2B_Controller.text),
                        selected_pc2B.toString().split('.')[1]);
                  }
                  if (pc3B != 0.00) {
                    pc3B = convertValue(double.parse(_pc3B_Controller.text),
                        selected_pc3B.toString().split('.')[1]);
                  }
                  if (c1eR != 0.00) {
                    c1eR = convertValue(double.parse(_c1eR_Controller.text),
                        selected_c1eR.toString().split('.')[1]);
                  }
                  if (c2eR != 0.00) {
                    c2eR = convertValue(double.parse(_c2eR_Controller.text),
                        selected_c2eR.toString().split('.')[1]);
                  }
                  if (c3eR != 0.00) {
                    c3eR = convertValue(double.parse(_c3eR_Controller.text),
                        selected_c3eR.toString().split('.')[1]);
                  }
                  if (c1eY != 0.00) {
                    c1eY = convertValue(double.parse(_c1eY_Controller.text),
                        selected_c1eY.toString().split('.')[1]);
                  }
                  if (c2eY != 0.00) {
                    c2eY = convertValue(double.parse(_c2eY_Controller.text),
                        selected_c2eY.toString().split('.')[1]);
                  }
                  if (c3eY != 0.00) {
                    c3eY = convertValue(double.parse(_c3eY_Controller.text),
                        selected_c3eY.toString().split('.')[1]);
                  }
                  if (c1eB != 0.00) {
                    c1eB = convertValue(double.parse(_c1eB_Controller.text),
                        selected_c1eB.toString().split('.')[1]);
                  }
                  if (c2eB != 0.00) {
                    c2eB = convertValue(double.parse(_c2eB_Controller.text),
                        selected_c2eB.toString().split('.')[1]);
                  }
                  if (c3eB != 0.00) {
                    c3eB = convertValue(double.parse(_c3eB_Controller.text),
                        selected_c3eB.toString().split('.')[1]);
                  }

                  if (c1c2R != 0.00) {
                    c1c2R = convertValue(double.parse(_c1c2R_Controller.text),
                        selected_c1c2R.toString().split('.')[1]);
                  }

                  if (c1c2Y != 0.00) {
                    c1c2Y = convertValue(double.parse(_c1c2Y_Controller.text),
                        selected_c1c2Y.toString().split('.')[1]);
                  }
                  if (c1c2B != 0.00) {
                    c1c2B = convertValue(double.parse(_c1c2B_Controller.text),
                        selected_c1c2B.toString().split('.')[1]);
                  }
                  if (c2c3R != 0.00) {
                    c2c3R = convertValue(double.parse(_c2c3R_Controller.text),
                        selected_c2c3R.toString().split('.')[1]);
                  }
                  if (c2c3Y != 0.00) {
                    c2c3Y = convertValue(double.parse(_c2c3Y_Controller.text),
                        selected_c2c3Y.toString().split('.')[1]);
                  }
                  if (c2c3B != 0.00) {
                    c2c3B = convertValue(double.parse(_c2c3B_Controller.text),
                        selected_c2c3B.toString().split('.')[1]);
                  }
                  if (clc1R != 0.00) {
                    clc1R = convertValue(double.parse(_clc1R_Controller.text),
                        selected_clc1R.toString().split('.')[1]);
                  }
                  if (clc1Y != 0.00) {
                    clc1Y = convertValue(double.parse(_clc1Y_Controller.text),
                        selected_clc1Y.toString().split('.')[1]);
                  }
                  if (clc1B != 0.00) {
                    clc1B = convertValue(double.parse(_clc1B_Controller.text),
                        selected_clc1B.toString().split('.')[1]);
                  }

                  // add to local database
                  final PTcoreIRModel PTcoreIRtoLocal = PTcoreIRModel(
                    trNo: int.parse(_Trno_Controller.text),
                    serialNo: _serialNo_Controller.text,
                    peR: peR,
                    peY: peY,
                    peB: peB,
                    pc1R: pc1R,
                    pc2R: pc2R,
                    pc3R: pc3R,
                    pc1Y: pc1Y,
                    pc2Y: pc2Y,
                    pc3Y: pc3Y,
                    pc1B: pc1B,
                    pc2B: pc2B,
                    pc3B: pc3B,
                    c1eR: c1eR,
                    c2eR: c2eR,
                    c3eR: c3eR,
                    c1eY: c1eY,
                    c2eY: c2eY,
                    c3eY: c3eY,
                    c1eB: c1eB,
                    c2eB: c2eB,
                    c3eB: c3eB,
                    c1c2R: c1c2R,
                    c1c2Y: c1c2Y,
                    c1c2B: c1c2B,
                    c2c3R: c2c3R,
                    c2c3Y: c2c3Y,
                    c2c3B: c2c3B,
                    clc1R: clc1R,
                    clc1Y: clc1Y,
                    clc1B: clc1B,
                    equipmentUsed: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,
                  );
                  print(PTcoreIRtoLocal);
                  print(PTcoreIRtoLocal.trNo);
                  getX((PTcoreIRProvider x) => x.addPTcoreIR(PTcoreIRtoLocal));
                  watchOnly((PTcoreIRProvider x) => {});

                  Navigator.popAndPushNamed(context, '/detail_PT', arguments: {
                    'id': args['PT_ID'],
                    // 'ptDatabaseID': PT_ID,
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
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: EquipmentTypeList(),
                    ),
                    Radio_peR(),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Primary to Earth R-Phase', _peR_Controller),
                    Radio_peY(),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Primary to Earth Y-Phase', _peY_Controller),
                    Radio_peB(),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Primary to Earth B-Phase', _peB_Controller),

                    Divider(color: Colors.black, thickness: 1),
                    ////////////////////////////////////////////
                    ntr.noOfCores > 1 || ntr.noOfCores == 1
                        ? Column(
                            children: [
                              //statements
                              Radio_pc1R(),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'Primary to core 1 R-Phase',
                                  _pc1R_Controller),
                              Radio_pc1Y(),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'Primary to core 1 Y-Phase',
                                  _pc1Y_Controller),
                              Radio_pc1B(),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'Primary to core 1 B-Phase',
                                  _pc1B_Controller),
                              Radio_c1eR(),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'core 1 to Earth R-Phase', _c1eR_Controller),
                              Radio_c1eY(),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'core 1 to Earth Y-Phase', _c1eY_Controller),
                              Radio_c1eB(),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'core 1 to Earth B-Phase', _c1eB_Controller),

                              // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                              ntr.noOfCores > 1 && ntr.noOfCores == 2
                                  ? Column(
                                      children: [
                                        //statements
                                        Radio_pc2R(),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'Primary to core 2 R-Phase',
                                            _pc2R_Controller),
                                        Radio_pc2Y(),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'Primary to core 2 Y-Phase',
                                            _pc2Y_Controller),
                                        Radio_pc2B(),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'Primary to core 2 B-Phase',
                                            _pc2B_Controller),

                                        Radio_c2eR(),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'core 2 to Earth R-Phase',
                                            _c2eR_Controller),
                                        Radio_c2eY(),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'core 2 to Earth Y-Phase',
                                            _c2eY_Controller),
                                        Radio_c2eB(),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'core 2 to Earth B-Phase',
                                            _c2eB_Controller),

                                        Radio_c1c2R(),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'core 1 to core 2 R-Phase',
                                            _c1c2R_Controller),
                                        Radio_c1c2Y(),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'core 1 to core 2 Y-Phase',
                                            _c1c2Y_Controller),
                                        Radio_c1c2B(),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'core 1 to core 2 B-Phase',
                                            _c1c2B_Controller),

                                        // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                        ntr.noOfCores > 1 &&
                                                ntr.noOfCores > 2 &&
                                                ntr.noOfCores == 3
                                            ? Column(
                                                children: [
                                                  //statemets
                                                  Radio_pc3R(),
                                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                                      'Primary to core 3 R-Phase',
                                                      _pc3R_Controller),
                                                  Radio_pc3Y(),
                                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                                      'Primary to core 3 Y-Phase',
                                                      _pc3Y_Controller),
                                                  Radio_pc3B(),
                                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                                      'Primary to core 3 B-Phase',
                                                      _pc3B_Controller),

                                                  Radio_c3eR(),
                                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                                      'core 3 to Earth R-Phase',
                                                      _c3eR_Controller),
                                                  Radio_c3eY(),
                                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                                      'core 3 to Earth Y-Phase',
                                                      _c3eY_Controller),
                                                  Radio_c3eB(),
                                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                                      'core 3 to Earth B-Phase',
                                                      _c3eB_Controller),

                                                  Radio_c2c3R(),
                                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                                      'core 2 to core 3 R-Phase',
                                                      _c2c3R_Controller),
                                                  Radio_c2c3Y(),
                                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                                      'core 2 to core 3 Y-Phase',
                                                      _c2c3Y_Controller),
                                                  Radio_c2c3B(),
                                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                                      'core 2 to core 3 B-Phase',
                                                      _c2c3B_Controller),
                                                  Radio_c2c3R(),

                                                  Radio_clc1R(),
                                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                                      'core 3 to core 1 R-Phase',
                                                      _clc1R_Controller),
                                                  Radio_clc1Y(),
                                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                                      'core 3 to core 1 Y-Phase',
                                                      _clc1Y_Controller),
                                                  Radio_clc1B(),
                                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                                      'core 3 to core 1 B-Phase',
                                                      _clc1B_Controller),
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
                    Radio_peR(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Primary to Earth R-Phase', _peR_Controller),
                    Radio_peY(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Primary to Earth Y-Phase', _peY_Controller),
                    Radio_peB(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Primary to Earth B-Phase', _peB_Controller),

                    Divider(color: Colors.black, thickness: 1),
                    ////////////////////////////////////////////
                    ntr.noOfCores > 1 || ntr.noOfCores == 1
                        ? Column(
                            children: [
                              //statements
                              Radio_pc1R(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'Primary to core 1 R-Phase',
                                  _pc1R_Controller),
                              Radio_pc1Y(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'Primary to core 1 Y-Phase',
                                  _pc1Y_Controller),
                              Radio_pc1B(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'Primary to core 1 B-Phase',
                                  _pc1B_Controller),
                              Radio_c1eR(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'core 1 to Earth R-Phase', _c1eR_Controller),
                              Radio_c1eY(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'core 1 to Earth Y-Phase', _c1eY_Controller),
                              Radio_c1eB(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'core 1 to Earth B-Phase', _c1eB_Controller),

                              // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                              ntr.noOfCores > 1 && ntr.noOfCores == 2
                                  ? Column(
                                      children: [
                                        //statements
                                        Radio_pc2R(),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'Primary to core 2 R-Phase',
                                            _pc2R_Controller),
                                        Radio_pc2Y(),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'Primary to core 2 Y-Phase',
                                            _pc2Y_Controller),
                                        Radio_pc2B(),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'Primary to core 2 B-Phase',
                                            _pc2B_Controller),

                                        Radio_c2eR(),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'core 2 to Earth R-Phase',
                                            _c2eR_Controller),
                                        Radio_c2eY(),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'core 2 to Earth Y-Phase',
                                            _c2eY_Controller),
                                        Radio_c2eB(),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'core 2 to Earth B-Phase',
                                            _c2eB_Controller),

                                        Radio_c1c2R(),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'core 1 to core 2 R-Phase',
                                            _c1c2R_Controller),
                                        Radio_c1c2Y(),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'core 1 to core 2 Y-Phase',
                                            _c1c2Y_Controller),
                                        Radio_c1c2B(),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'core 1 to core 2 B-Phase',
                                            _c1c2B_Controller),

                                        // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                                        ntr.noOfCores > 1 &&
                                                ntr.noOfCores > 2 &&
                                                ntr.noOfCores == 3
                                            ? Column(
                                                children: [
                                                  //statemets
                                                  Radio_pc3R(),
                                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                                      'Primary to core 3 R-Phase',
                                                      _pc3R_Controller),
                                                  Radio_pc3Y(),
                                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                                      'Primary to core 3 Y-Phase',
                                                      _pc3Y_Controller),
                                                  Radio_pc3B(),
                                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                                      'Primary to core 3 B-Phase',
                                                      _pc3B_Controller),

                                                  Radio_c3eR(),
                                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                                      'core 3 to Earth R-Phase',
                                                      _c3eR_Controller),
                                                  Radio_c3eY(),
                                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                                      'core 3 to Earth Y-Phase',
                                                      _c3eY_Controller),
                                                  Radio_c3eB(),
                                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                                      'core 3 to Earth B-Phase',
                                                      _c3eB_Controller),

                                                  Radio_c2c3R(),
                                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                                      'core 2 to core 3 R-Phase',
                                                      _c2c3R_Controller),
                                                  Radio_c2c3Y(),
                                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                                      'core 2 to core 3 Y-Phase',
                                                      _c2c3Y_Controller),
                                                  Radio_c2c3B(),
                                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                                      'core 2 to core 3 B-Phase',
                                                      _c2c3B_Controller),
                                                  Radio_c2c3R(),

                                                  Radio_clc1R(),
                                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                                      'core 3 to core 1 R-Phase',
                                                      _clc1R_Controller),
                                                  Radio_clc1Y(),
                                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                                      'core 3 to core 1 Y-Phase',
                                                      _clc1Y_Controller),
                                                  Radio_clc1B(),
                                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                                      'core 3 to core 1 B-Phase',
                                                      _clc1B_Controller),
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
