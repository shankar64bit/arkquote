// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/ct_provider/ct_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/CT/ct_core_ir_model.dart';
import '../../../data/models/equipment/CT/ct_model.dart';
import '../../providers/ct_provider/ct_core_ir_provider.dart';
import '../dropdown_All/MegaGigaTeraRadioButton/ct_ir_radio_button_page.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

final _formKey = GlobalKey<FormState>();

class Add_CTcoreIR extends StatelessWidget with GetItMixin {
  Map args = {};
  int CT_ID;
  int TR_ID;

  Add_CTcoreIR(this.args, {Key key}) : super(key: key);

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
  final TextEditingController _pc4R_Controller = TextEditingController();
  final TextEditingController _pc5R_Controller = TextEditingController();
  final TextEditingController _pc1Y_Controller = TextEditingController();
  final TextEditingController _pc2Y_Controller = TextEditingController();
  final TextEditingController _pc3Y_Controller = TextEditingController();
  final TextEditingController _pc4Y_Controller = TextEditingController();
  final TextEditingController _pc5Y_Controller = TextEditingController();
  final TextEditingController _pc1B_Controller = TextEditingController();
  final TextEditingController _pc2B_Controller = TextEditingController();
  final TextEditingController _pc3B_Controller = TextEditingController();
  final TextEditingController _pc4B_Controller = TextEditingController();
  final TextEditingController _pc5B_Controller = TextEditingController();
  final TextEditingController _c1eR_Controller = TextEditingController();
  final TextEditingController _c2eR_Controller = TextEditingController();
  final TextEditingController _c3eR_Controller = TextEditingController();
  final TextEditingController _c4eR_Controller = TextEditingController();
  final TextEditingController _c5eR_Controller = TextEditingController();
  final TextEditingController _c1eY_Controller = TextEditingController();
  final TextEditingController _c2eY_Controller = TextEditingController();
  final TextEditingController _c3eY_Controller = TextEditingController();
  final TextEditingController _c4eY_Controller = TextEditingController();
  final TextEditingController _c5eY_Controller = TextEditingController();
  final TextEditingController _c1eB_Controller = TextEditingController();
  final TextEditingController _c2eB_Controller = TextEditingController();
  final TextEditingController _c3eB_Controller = TextEditingController();
  final TextEditingController _c4eB_Controller = TextEditingController();
  final TextEditingController _c5eB_Controller = TextEditingController();
  final TextEditingController _c1c2R_Controller = TextEditingController();
  final TextEditingController _c1c2Y_Controller = TextEditingController();
  final TextEditingController _c1c2B_Controller = TextEditingController();
  final TextEditingController _c2c3R_Controller = TextEditingController();
  final TextEditingController _c2c3Y_Controller = TextEditingController();
  final TextEditingController _c2c3B_Controller = TextEditingController();
  final TextEditingController _c3c4R_Controller = TextEditingController();
  final TextEditingController _c3c4Y_Controller = TextEditingController();
  final TextEditingController _c3c4B_Controller = TextEditingController();
  final TextEditingController _c4c5R_Controller = TextEditingController();
  final TextEditingController _c4c5Y_Controller = TextEditingController();
  final TextEditingController _c4c5B_Controller = TextEditingController();
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
  Enum_ct_ir get selected_pc4R => Radio_pc4R().get_Radio_pc4R();
  Enum_ct_ir get selected_pc5R => Radio_pc5R().get_Radio_pc5R();
  Enum_ct_ir get selected_pc1Y => Radio_pc1Y().get_Radio_pc1Y();
  Enum_ct_ir get selected_pc2Y => Radio_pc2Y().get_Radio_pc2Y();
  Enum_ct_ir get selected_pc3Y => Radio_pc3Y().get_Radio_pc3Y();
  Enum_ct_ir get selected_pc4Y => Radio_pc4Y().get_Radio_pc4Y();
  Enum_ct_ir get selected_pc5Y => Radio_pc5Y().get_Radio_pc5Y();
  Enum_ct_ir get selected_pc1B => Radio_pc1B().get_Radio_pc1B();
  Enum_ct_ir get selected_pc2B => Radio_pc2B().get_Radio_pc2B();
  Enum_ct_ir get selected_pc3B => Radio_pc3B().get_Radio_pc3B();
  Enum_ct_ir get selected_pc4B => Radio_pc4B().get_Radio_pc4B();
  Enum_ct_ir get selected_pc5B => Radio_pc5B().get_Radio_pc5B();
  Enum_ct_ir get selected_c1eR => Radio_c1eR().get_Radio_c1eR();
  Enum_ct_ir get selected_c2eR => Radio_c2eR().get_Radio_c2eR();
  Enum_ct_ir get selected_c3eR => Radio_c3eR().get_Radio_c3eR();
  Enum_ct_ir get selected_c4eR => Radio_c4eR().get_Radio_c4eR();
  Enum_ct_ir get selected_c5eR => Radio_c5eR().get_Radio_c5eR();
  Enum_ct_ir get selected_c1eY => Radio_c1eY().get_Radio_c1eY();
  Enum_ct_ir get selected_c2eY => Radio_c2eY().get_Radio_c2eY();
  Enum_ct_ir get selected_c3eY => Radio_c3eY().get_Radio_c3eY();
  Enum_ct_ir get selected_c4eY => Radio_c4eY().get_Radio_c4eY();
  Enum_ct_ir get selected_c5eY => Radio_c5eY().get_Radio_c5eY();
  Enum_ct_ir get selected_c1eB => Radio_c1eB().get_Radio_c1eB();
  Enum_ct_ir get selected_c2eB => Radio_c2eB().get_Radio_c2eB();
  Enum_ct_ir get selected_c3eB => Radio_c3eB().get_Radio_c3eB();
  Enum_ct_ir get selected_c4eB => Radio_c4eB().get_Radio_c4eB();
  Enum_ct_ir get selected_c5eB => Radio_c5eB().get_Radio_c5eB();
  Enum_ct_ir get selected_c1c2R => Radio_c1c2R().get_Radio_c1c2R();
  Enum_ct_ir get selected_c1c2Y => Radio_c1c2Y().get_Radio_c1c2Y();
  Enum_ct_ir get selected_c1c2B => Radio_c1c2B().get_Radio_c1c2B();
  Enum_ct_ir get selected_c2c3R => Radio_c2c3R().get_Radio_c2c3R();
  Enum_ct_ir get selected_c2c3Y => Radio_c2c3Y().get_Radio_c2c3Y();
  Enum_ct_ir get selected_c2c3B => Radio_c2c3B().get_Radio_c2c3B();
  Enum_ct_ir get selected_c3c4R => Radio_c3c4R().get_Radio_c3c4R();
  Enum_ct_ir get selected_c3c4Y => Radio_c3c4Y().get_Radio_c3c4Y();
  Enum_ct_ir get selected_c3c4B => Radio_c3c4B().get_Radio_c3c4B();
  Enum_ct_ir get selected_c4c5R => Radio_c4c5R().get_Radio_c4c5R();
  Enum_ct_ir get selected_c4c5Y => Radio_c4c5Y().get_Radio_c4c5Y();
  Enum_ct_ir get selected_c4c5B => Radio_c4c5B().get_Radio_c4c5B();
  Enum_ct_ir get selected_clc1R => Radio_clc1R().get_Radio_clc1R();
  Enum_ct_ir get selected_clc1Y => Radio_clc1Y().get_Radio_clc1Y();
  Enum_ct_ir get selected_clc1B => Radio_clc1B().get_Radio_clc1B();

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
    var mob = Text('Add CTcore IR ', style: TextStyle(fontSize: 17));
    var desk = Text('Add CTcore IR ', style: TextStyle(fontSize: 20));
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

                  double pc1R;
                  double pc2R;
                  double pc3R;
                  double pc4R;
                  double pc5R;
                  double pc1Y;
                  double pc2Y;
                  double pc3Y;
                  double pc4Y;
                  double pc5Y;
                  double pc1B;
                  double pc2B;
                  double pc3B;
                  double pc4B;
                  double pc5B;
                  double c1eR;
                  double c2eR;
                  double c3eR;
                  double c4eR;
                  double c5eR;
                  double c1eY;
                  double c2eY;
                  double c3eY;
                  double c4eY;
                  double c5eY;
                  double c1eB;
                  double c2eB;
                  double c3eB;
                  double c4eB;
                  double c5eB;
                  double c1c2R;
                  double c1c2Y;
                  double c1c2B;
                  double c2c3R;
                  double c2c3Y;
                  double c2c3B;
                  double c3c4R;
                  double c3c4Y;
                  double c3c4B;
                  double c4c5R;
                  double c4c5Y;
                  double c4c5B;
                  double clc1R;
                  double clc1Y;
                  double clc1B;

                  if (ntr.noOfCores == 1) {
                    print('selected Noofcore' + ntr.noOfCores.toString());

                    pc2R = 0.00;
                    pc3R = 0.00;
                    pc4R = 0.00;
                    pc5R = 0.00;

                    pc2Y = 0.00;
                    pc3Y = 0.00;
                    pc4Y = 0.00;
                    pc5Y = 0.00;

                    pc2B = 0.00;
                    pc3B = 0.00;
                    pc4B = 0.00;
                    pc5B = 0.00;

                    c2eR = 0.00;
                    c3eR = 0.00;
                    c4eR = 0.00;
                    c5eR = 0.00;

                    c2eY = 0.00;
                    c3eY = 0.00;
                    c4eY = 0.00;
                    c5eY = 0.00;

                    c2eB = 0.00;
                    c3eB = 0.00;
                    c4eB = 0.00;
                    c5eB = 0.00;

                    c1c2R = 0.00;
                    c1c2Y = 0.00;
                    c1c2B = 0.00;

                    c2c3R = 0.00;
                    c2c3Y = 0.00;
                    c2c3B = 0.00;

                    c3c4R = 0.00;
                    c3c4Y = 0.00;
                    c3c4B = 0.00;

                    c4c5R = 0.00;
                    c4c5Y = 0.00;
                    c4c5B = 0.00;

                    clc1R = 0.00;
                    clc1Y = 0.00;
                    clc1B = 0.00;

                    _pc2R_Controller.text = '0.00';
                    _pc3R_Controller.text = '0.00';
                    _pc4R_Controller.text = '0.00';
                    _pc5R_Controller.text = '0.00';

                    _pc2Y_Controller.text = '0.00';
                    _pc3Y_Controller.text = '0.00';
                    _pc4Y_Controller.text = '0.00';
                    _pc5Y_Controller.text = '0.00';

                    _pc2B_Controller.text = '0.00';
                    _pc3B_Controller.text = '0.00';
                    _pc4B_Controller.text = '0.00';
                    _pc5B_Controller.text = '0.00';

                    _c2eR_Controller.text = '0.00';
                    _c3eR_Controller.text = '0.00';
                    _c4eR_Controller.text = '0.00';
                    _c5eR_Controller.text = '0.00';

                    _c2eY_Controller.text = '0.00';
                    _c3eY_Controller.text = '0.00';
                    _c4eY_Controller.text = '0.00';
                    _c5eY_Controller.text = '0.00';

                    _c2eB_Controller.text = '0.00';
                    _c3eB_Controller.text = '0.00';
                    _c4eB_Controller.text = '0.00';
                    _c5eB_Controller.text = '0.00';

                    _c1c2R_Controller.text = '0.00';
                    _c1c2Y_Controller.text = '0.00';
                    _c1c2B_Controller.text = '0.00';

                    _c2c3R_Controller.text = '0.00';
                    _c2c3Y_Controller.text = '0.00';
                    _c2c3B_Controller.text = '0.00';

                    _c3c4R_Controller.text = '0.00';
                    _c3c4Y_Controller.text = '0.00';
                    _c3c4B_Controller.text = '0.00';

                    _c4c5R_Controller.text = '0.00';
                    _c4c5Y_Controller.text = '0.00';
                    _c4c5B_Controller.text = '0.00';

                    _clc1R_Controller.text = '0.00';
                    _clc1Y_Controller.text = '0.00';
                    _clc1B_Controller.text = '0.00';
                  }

                  if (ntr.noOfCores == 1 || ntr.noOfCores == 2) {
                    print('selected Noofcore' + ntr.noOfCores.toString());

                    pc3R = 0.00;
                    pc4R = 0.00;
                    pc5R = 0.00;

                    pc3Y = 0.00;
                    pc4Y = 0.00;
                    pc5Y = 0.00;

                    pc3B = 0.00;
                    pc4B = 0.00;
                    pc5B = 0.00;

                    c3eR = 0.00;
                    c4eR = 0.00;
                    c5eR = 0.00;

                    c3eY = 0.00;
                    c4eY = 0.00;
                    c5eY = 0.00;

                    c3eB = 0.00;
                    c4eB = 0.00;
                    c5eB = 0.00;

                    c3c4R = 0.00;
                    c3c4Y = 0.00;
                    c3c4B = 0.00;

                    c4c5R = 0.00;
                    c4c5Y = 0.00;
                    c4c5B = 0.00;

                    clc1R = 0.00;
                    clc1Y = 0.00;
                    clc1B = 0.00;

                    _pc3R_Controller.text = '0.00';
                    _pc4R_Controller.text = '0.00';
                    _pc5R_Controller.text = '0.00';

                    _pc3Y_Controller.text = '0.00';
                    _pc4Y_Controller.text = '0.00';
                    _pc5Y_Controller.text = '0.00';

                    _pc3B_Controller.text = '0.00';
                    _pc4B_Controller.text = '0.00';
                    _pc5B_Controller.text = '0.00';

                    _c3eR_Controller.text = '0.00';
                    _c4eR_Controller.text = '0.00';
                    _c5eR_Controller.text = '0.00';

                    _c3eY_Controller.text = '0.00';
                    _c4eY_Controller.text = '0.00';
                    _c5eY_Controller.text = '0.00';

                    _c3eB_Controller.text = '0.00';
                    _c4eB_Controller.text = '0.00';
                    _c5eB_Controller.text = '0.00';

                    _c3c4R_Controller.text = '0.00';
                    _c3c4Y_Controller.text = '0.00';
                    _c3c4B_Controller.text = '0.00';

                    _c4c5R_Controller.text = '0.00';
                    _c4c5Y_Controller.text = '0.00';
                    _c4c5B_Controller.text = '0.00';

                    _clc1R_Controller.text = '0.00';
                    _clc1Y_Controller.text = '0.00';
                    _clc1B_Controller.text = '0.00';
                  }

                  if (ntr.noOfCores == 1 ||
                      ntr.noOfCores == 2 ||
                      ntr.noOfCores == 3) {
                    print('selected Noofcore' + ntr.noOfCores.toString());

                    pc4R = 0.00;
                    pc5R = 0.00;

                    pc4Y = 0.00;
                    pc5Y = 0.00;

                    pc4B = 0.00;
                    pc5B = 0.00;

                    c4eR = 0.00;
                    c5eR = 0.00;

                    c4eY = 0.00;
                    c5eY = 0.00;

                    c4eB = 0.00;
                    c5eB = 0.00;

                    c4c5R = 0.00;
                    c4c5Y = 0.00;
                    c4c5B = 0.00;

                    clc1R = 0.00;
                    clc1Y = 0.00;
                    clc1B = 0.00;

                    _pc4R_Controller.text = '0.00';
                    _pc5R_Controller.text = '0.00';

                    _pc4Y_Controller.text = '0.00';
                    _pc5Y_Controller.text = '0.00';

                    _pc4B_Controller.text = '0.00';
                    _pc5B_Controller.text = '0.00';

                    _c4eR_Controller.text = '0.00';
                    _c5eR_Controller.text = '0.00';

                    _c4eY_Controller.text = '0.00';
                    _c5eY_Controller.text = '0.00';

                    _c4eB_Controller.text = '0.00';
                    _c5eB_Controller.text = '0.00';

                    _c4c5R_Controller.text = '0.00';
                    _c4c5Y_Controller.text = '0.00';
                    _c4c5B_Controller.text = '0.00';

                    _clc1R_Controller.text = '0.00';
                    _clc1Y_Controller.text = '0.00';
                    _clc1B_Controller.text = '0.00';
                  }

                  if (ntr.noOfCores == 1 ||
                      ntr.noOfCores == 2 ||
                      ntr.noOfCores == 3 ||
                      ntr.noOfCores == 4) {
                    print('selected Noofcore' + ntr.noOfCores.toString());
                    pc5R = 0.00;
                    pc5Y = 0.00;
                    pc5B = 0.00;
                    c5eR = 0.00;
                    c5eY = 0.00;
                    c5eB = 0.00;
                    clc1R = 0.00;
                    clc1Y = 0.00;
                    clc1B = 0.00;
                    _pc5R_Controller.text = '0.00';
                    _pc5Y_Controller.text = '0.00';
                    _pc5B_Controller.text = '0.00';
                    _c5eR_Controller.text = '0.00';
                    _c5eY_Controller.text = '0.00';
                    _c5eB_Controller.text = '0.00';
                    _clc1R_Controller.text = '0.00';
                    _clc1Y_Controller.text = '0.00';
                    _clc1B_Controller.text = '0.00';
                  }

                  peR = convertValue(double.parse(_peR_Controller.text),
                      selected_peR.toString().split('.')[1]);
                  peY = convertValue(double.parse(_peY_Controller.text),
                      selected_peY.toString().split('.')[1]);
                  peB = convertValue(double.parse(_peB_Controller.text),
                      selected_peB.toString().split('.')[1]);

                  print("????????????????????????????????????");
                  print(peR);
                  print(peY);
                  print(peB);

                  // ---------------------------------------------------------
                  pc1R = convertValue(double.parse(_pc1R_Controller.text),
                      selected_pc1R.toString().split('.')[1]);

                  if (pc2R != 0.00) {
                    pc2R = convertValue(double.parse(_pc2R_Controller.text),
                        selected_pc2R.toString().split('.')[1]);
                  }
                  if (pc3R != 0.00) {
                    pc3R = convertValue(double.parse(_pc3R_Controller.text),
                        selected_pc3R.toString().split('.')[1]);
                  }
                  if (pc4R != 0.00) {
                    pc4R = convertValue(double.parse(_pc4R_Controller.text),
                        selected_pc4R.toString().split('.')[1]);
                  }
                  if (pc5R != 0.00) {
                    pc5R = convertValue(double.parse(_pc5R_Controller.text),
                        selected_pc5R.toString().split('.')[1]);
                  }
                  // ---------------------------------------------------------
                  pc1Y = convertValue(double.parse(_pc1Y_Controller.text),
                      selected_pc1Y.toString().split('.')[1]);

                  if (pc2Y != 0.00) {
                    pc2Y = convertValue(double.parse(_pc2Y_Controller.text),
                        selected_pc2Y.toString().split('.')[1]);
                  }
                  if (pc3Y != 0.00) {
                    pc3Y = convertValue(double.parse(_pc3Y_Controller.text),
                        selected_pc3Y.toString().split('.')[1]);
                  }
                  if (pc4Y != 0.00) {
                    pc4Y = convertValue(double.parse(_pc4Y_Controller.text),
                        selected_pc4Y.toString().split('.')[1]);
                  }
                  if (pc5Y != 0.00) {
                    pc5Y = convertValue(double.parse(_pc5Y_Controller.text),
                        selected_pc5Y.toString().split('.')[1]);
                  }
                  // ---------------------------------------------------------

                  pc1B = convertValue(double.parse(_pc1B_Controller.text),
                      selected_pc1B.toString().split('.')[1]);

                  if (pc2B != 0.00) {
                    pc2B = convertValue(double.parse(_pc2B_Controller.text),
                        selected_pc2B.toString().split('.')[1]);
                  }
                  if (pc3B != 0.00) {
                    pc3B = convertValue(double.parse(_pc3B_Controller.text),
                        selected_pc3B.toString().split('.')[1]);
                  }
                  if (pc4B != 0.00) {
                    pc4B = convertValue(double.parse(_pc4B_Controller.text),
                        selected_pc4B.toString().split('.')[1]);
                  }
                  if (pc5B != 0.00) {
                    pc5B = convertValue(double.parse(_pc5B_Controller.text),
                        selected_pc5B.toString().split('.')[1]);
                  }
                  // ---------------------------------------------------------

                  c1eR = convertValue(double.parse(_c1eR_Controller.text),
                      selected_c1eR.toString().split('.')[1]);

                  if (c2eR != 0.00) {
                    c2eR = convertValue(double.parse(_c2eR_Controller.text),
                        selected_c2eR.toString().split('.')[1]);
                  }
                  if (c3eR != 0.00) {
                    c3eR = convertValue(double.parse(_c3eR_Controller.text),
                        selected_c3eR.toString().split('.')[1]);
                  }
                  if (c4eR != 0.00) {
                    c4eR = convertValue(double.parse(_c4eR_Controller.text),
                        selected_c4eR.toString().split('.')[1]);
                  }
                  if (c5eR != 0.00) {
                    c5eR = convertValue(double.parse(_c5eR_Controller.text),
                        selected_c5eR.toString().split('.')[1]);
                  }
                  // ---------------------------------------------------------

                  c1eY = convertValue(double.parse(_c1eY_Controller.text),
                      selected_c1eY.toString().split('.')[1]);

                  if (c2eY != 0.00) {
                    c2eY = convertValue(double.parse(_c2eY_Controller.text),
                        selected_c2eY.toString().split('.')[1]);
                  }
                  if (c3eY != 0.00) {
                    c3eY = convertValue(double.parse(_c3eY_Controller.text),
                        selected_c3eY.toString().split('.')[1]);
                  }
                  if (c4eY != 0.00) {
                    c4eY = convertValue(double.parse(_c4eY_Controller.text),
                        selected_c4eY.toString().split('.')[1]);
                  }
                  if (c5eY != 0.00) {
                    c5eY = convertValue(double.parse(_c5eY_Controller.text),
                        selected_c5eY.toString().split('.')[1]);
                  }

                  // ---------------------------------------------------------
                  c1eB = convertValue(double.parse(_c1eB_Controller.text),
                      selected_c1eB.toString().split('.')[1]);

                  if (c2eB != 0.00) {
                    c2eB = convertValue(double.parse(_c2eB_Controller.text),
                        selected_c2eB.toString().split('.')[1]);
                  }
                  if (c3eB != 0.00) {
                    c3eB = convertValue(double.parse(_c3eB_Controller.text),
                        selected_c3eB.toString().split('.')[1]);
                  }
                  if (c4eB != 0.00) {
                    c4eB = convertValue(double.parse(_c4eB_Controller.text),
                        selected_c4eB.toString().split('.')[1]);
                  }
                  if (c5eB != 0.00) {
                    c5eB = convertValue(double.parse(_c5eB_Controller.text),
                        selected_c5eB.toString().split('.')[1]);
                  }
                  // ---------------------------------------------------------
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
                  if (c3c4R != 0.00) {
                    c3c4R = convertValue(double.parse(_c3c4R_Controller.text),
                        selected_c3c4R.toString().split('.')[1]);
                  }
                  if (c3c4Y != 0.00) {
                    c3c4Y = convertValue(double.parse(_c3c4Y_Controller.text),
                        selected_c3c4Y.toString().split('.')[1]);
                  }
                  if (c3c4B != 0.00) {
                    c3c4B = convertValue(double.parse(_c3c4B_Controller.text),
                        selected_c3c4B.toString().split('.')[1]);
                  }
                  if (c4c5R != 0.00) {
                    c4c5R = convertValue(double.parse(_c4c5R_Controller.text),
                        selected_c4c5R.toString().split('.')[1]);
                  }
                  if (c4c5Y != 0.00) {
                    c4c5Y = convertValue(double.parse(_c4c5Y_Controller.text),
                        selected_c4c5Y.toString().split('.')[1]);
                  }
                  if (c4c5B != 0.00) {
                    c4c5B = convertValue(double.parse(_c4c5B_Controller.text),
                        selected_c4c5B.toString().split('.')[1]);
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
                  final CTcoreIRModel CTcoreIRtoLocal = CTcoreIRModel(
                    trNo: int.parse(_Trno_Controller.text),
                    serialNo: _serialNo_Controller.text,
                    peR: peR,
                    peY: peY,
                    peB: peB,
                    pc1R: pc1R,
                    pc2R: pc2R,
                    pc3R: pc3R,
                    pc4R: pc4R,
                    pc5R: pc5R,
                    pc1Y: pc1Y,
                    pc2Y: pc2Y,
                    pc3Y: pc3Y,
                    pc4Y: pc4Y,
                    pc5Y: pc5Y,
                    pc1B: pc1B,
                    pc2B: pc2B,
                    pc3B: pc3B,
                    pc4B: pc4B,
                    pc5B: pc5B,
                    c1eR: c1eR,
                    c2eR: c2eR,
                    c3eR: c3eR,
                    c4eR: c4eR,
                    c5eR: c5eR,
                    c1eY: c1eY,
                    c2eY: c2eY,
                    c3eY: c3eY,
                    c4eY: c4eY,
                    c5eY: c5eY,
                    c1eB: c1eB,
                    c2eB: c2eB,
                    c3eB: c3eB,
                    c4eB: c4eB,
                    c5eB: c5eB,
                    c1c2R: c1c2R,
                    c1c2Y: c1c2Y,
                    c1c2B: c1c2B,
                    c2c3R: c2c3R,
                    c2c3Y: c2c3Y,
                    c2c3B: c2c3B,
                    c3c4R: c3c4R,
                    c3c4Y: c3c4Y,
                    c3c4B: c3c4B,
                    c4c5R: c4c5R,
                    c4c5Y: c4c5Y,
                    c4c5B: c4c5B,
                    clc1R: clc1R,
                    clc1Y: clc1Y,
                    clc1B: clc1B,
                    equipmentUsed: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,
                  );
                  print(CTcoreIRtoLocal);
                  print(CTcoreIRtoLocal.trNo);
                  getX((CTcoreIRProvider x) => x.addCTcoreIR(CTcoreIRtoLocal));
                  watchOnly((CTcoreIRProvider x) => {});

                  Navigator.popAndPushNamed(context, '/detail_CT', arguments: {
                    'id': args['CT_ID'],
                    'trDatabaseID': TR_ID,
                  });
                }
              },
              icon: const Icon(Icons.save)),
        ],
      ),
      // body: SingleChildScrollView(child: build_body(context)),
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
                        'peR', _peR_Controller),
                    Radio_peY(),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'peY', _peY_Controller),
                    Radio_peB(),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'peB', _peB_Controller),

                    Divider(height: 10, color: Colors.black, thickness: 2),
                    SizedBox(height: 10),
                    ////////////////////////////////////////////
                    ntr.noOfCores > 1 || ntr.noOfCores == 1
                        ? Column(
                            children: [
                              Radio_pc1R(),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'pc1R', _pc1R_Controller),
                              Radio_pc1Y(),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'pc1Y', _pc1Y_Controller),
                              Radio_pc1B(),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'pc1B', _pc1B_Controller),
                              Radio_c1eR(),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'c1eR', _c1eR_Controller),
                              Radio_c1eY(),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'c1eY', _c1eY_Controller),
                              Radio_c1eB(),
                              simplifiedFor_Diplay_for_all_PC_numpad(
                                  'c1eB', _c1eB_Controller),
                              Divider(
                                  height: 10,
                                  color: Colors.black,
                                  thickness: 2),
                              SizedBox(height: 10),
                              // ----------------------------
                              ntr.noOfCores > 1 && ntr.noOfCores > 2 ||
                                      ntr.noOfCores == 2
                                  ? Column(
                                      children: [
                                        Radio_pc2R(),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'pc2R', _pc2R_Controller),
                                        Radio_pc2Y(),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'pc2Y', _pc2Y_Controller),
                                        Radio_pc2B(),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'pc2B', _pc2B_Controller),
                                        Radio_c2eR(),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'c2eR', _c2eR_Controller),
                                        Radio_c2eY(),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'c2eY', _c2eY_Controller),
                                        Radio_c2eB(),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'c2eB', _c2eB_Controller),
                                        Radio_c1c2R(),

                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'c1c2R', _c1c2R_Controller),
                                        Radio_c1c2Y(),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'c1c2Y', _c1c2Y_Controller),
                                        Radio_c1c2B(),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'c1c2B', _c1c2B_Controller),
                                        Radio_c2c3R(),

                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'c2c3R', _c2c3R_Controller),
                                        Radio_c2c3Y(),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'c2c3Y', _c2c3Y_Controller),
                                        Radio_c2c3B(),
                                        simplifiedFor_Diplay_for_all_PC_numpad(
                                            'c2c3B', _c2c3B_Controller),
                                        Divider(
                                            height: 10,
                                            color: Colors.black,
                                            thickness: 2),
                                        SizedBox(height: 10),
                                        // ---------------------------------------
                                        ntr.noOfCores > 1 &&
                                                    ntr.noOfCores > 2 &&
                                                    ntr.noOfCores > 3 ||
                                                ntr.noOfCores == 3
                                            ? Column(
                                                children: [
                                                  Radio_pc3R(),
                                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                                      'pc3R', _pc3R_Controller),
                                                  Radio_pc3Y(),
                                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                                      'pc3Y', _pc3Y_Controller),
                                                  Radio_pc3B(),
                                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                                      'pc3B', _pc3B_Controller),
                                                  Radio_c3eR(),
                                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                                      'c3eR', _c3eR_Controller),
                                                  Radio_c3eY(),
                                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                                      'c3eY', _c3eY_Controller),
                                                  Radio_c3eB(),
                                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                                      'c3eB', _c3eB_Controller),
                                                  Radio_c3c4R(),
                                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                                      'c3c4R',
                                                      _c3c4R_Controller),
                                                  Radio_c3c4Y(),
                                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                                      'c3c4Y',
                                                      _c3c4Y_Controller),
                                                  Radio_c3c4B(),
                                                  simplifiedFor_Diplay_for_all_PC_numpad(
                                                      'c3c4B',
                                                      _c3c4B_Controller),

                                                  Divider(
                                                      height: 10,
                                                      color: Colors.black,
                                                      thickness: 2),
                                                  SizedBox(height: 10),
                                                  // -----------------------------------
                                                  ntr.noOfCores > 1 &&
                                                              ntr.noOfCores >
                                                                  2 &&
                                                              ntr.noOfCores >
                                                                  3 &&
                                                              ntr.noOfCores >
                                                                  4 ||
                                                          ntr.noOfCores == 4
                                                      ? Column(
                                                          children: [
                                                            Radio_pc4R(),
                                                            simplifiedFor_Diplay_for_all_PC_numpad(
                                                                'pc4R',
                                                                _pc4R_Controller),
                                                            Radio_pc4Y(),
                                                            simplifiedFor_Diplay_for_all_PC_numpad(
                                                                'pc4Y',
                                                                _pc4Y_Controller),
                                                            Radio_pc4B(),
                                                            simplifiedFor_Diplay_for_all_PC_numpad(
                                                                'pc4B',
                                                                _pc4B_Controller),
                                                            Radio_c4eR(),
                                                            simplifiedFor_Diplay_for_all_PC_numpad(
                                                                'c4eR',
                                                                _c4eR_Controller),
                                                            Radio_c4eY(),
                                                            simplifiedFor_Diplay_for_all_PC_numpad(
                                                                'c4eY',
                                                                _c4eY_Controller),
                                                            Radio_c4eB(),
                                                            simplifiedFor_Diplay_for_all_PC_numpad(
                                                                'c4eB',
                                                                _c4eB_Controller),
                                                            Radio_c4c5R(),
                                                            simplifiedFor_Diplay_for_all_PC_numpad(
                                                                'c4c5R',
                                                                _c4c5R_Controller),
                                                            Radio_c4c5Y(),
                                                            simplifiedFor_Diplay_for_all_PC_numpad(
                                                                'c4c5Y',
                                                                _c4c5Y_Controller),
                                                            Radio_c4c5B(),
                                                            simplifiedFor_Diplay_for_all_PC_numpad(
                                                                'c4c5B',
                                                                _c4c5B_Controller),
                                                            Divider(
                                                                height: 10,
                                                                color: Colors
                                                                    .black,
                                                                thickness: 2),
                                                            SizedBox(
                                                                height: 10),

                                                            // -----------------------------------
                                                            ntr.noOfCores > 1 &&
                                                                        ntr.noOfCores >
                                                                            2 &&
                                                                        ntr.noOfCores >
                                                                            3 &&
                                                                        ntr.noOfCores >
                                                                            4 &&
                                                                        ntr.noOfCores >
                                                                            5 ||
                                                                    ntr.noOfCores ==
                                                                        5
                                                                ? Column(
                                                                    children: [
                                                                      Radio_pc5R(),
                                                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                                                          'pc5R',
                                                                          _pc5R_Controller),
                                                                      Radio_pc5Y(),
                                                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                                                          'pc5Y',
                                                                          _pc5Y_Controller),
                                                                      Radio_pc5B(),
                                                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                                                          'pc5B',
                                                                          _pc5B_Controller),
                                                                      Radio_c5eR(),
                                                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                                                          'c5eR',
                                                                          _c5eR_Controller),
                                                                      Radio_c5eY(),
                                                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                                                          'c5eY',
                                                                          _c5eY_Controller),
                                                                      Radio_c5eB(),
                                                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                                                          'c5eB',
                                                                          _c5eB_Controller),
                                                                      Radio_clc1R(),
                                                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                                                          'clc1R',
                                                                          _clc1R_Controller),
                                                                      Radio_clc1Y(),
                                                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                                                          'clc1Y',
                                                                          _clc1Y_Controller),
                                                                      Radio_clc1B(),
                                                                      simplifiedFor_Diplay_for_all_PC_numpad(
                                                                          'clc1B',
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
                        'peR', _peR_Controller),
                    Radio_peY(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'peY', _peY_Controller),
                    Radio_peB(),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'peB', _peB_Controller),

                    Divider(height: 10, color: Colors.black, thickness: 2),
                    SizedBox(height: 10),
                    ////////////////////////////////////////////
                    ntr.noOfCores > 1 || ntr.noOfCores == 1
                        ? Column(
                            children: [
                              Radio_pc1R(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'pc1R', _pc1R_Controller),
                              Radio_pc1Y(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'pc1Y', _pc1Y_Controller),
                              Radio_pc1B(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'pc1B', _pc1B_Controller),
                              Radio_c1eR(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'c1eR', _c1eR_Controller),
                              Radio_c1eY(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'c1eY', _c1eY_Controller),
                              Radio_c1eB(),
                              simplifiedFor_Display_for_all_Mobile_numpad(
                                  'c1eB', _c1eB_Controller),
                              Divider(
                                  height: 10,
                                  color: Colors.black,
                                  thickness: 2),
                              SizedBox(height: 10),
                              // ----------------------------
                              ntr.noOfCores > 1 && ntr.noOfCores > 2 ||
                                      ntr.noOfCores == 2
                                  ? Column(
                                      children: [
                                        Radio_pc2R(),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'pc2R', _pc2R_Controller),
                                        Radio_pc2Y(),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'pc2Y', _pc2Y_Controller),
                                        Radio_pc2B(),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'pc2B', _pc2B_Controller),
                                        Radio_c2eR(),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'c2eR', _c2eR_Controller),
                                        Radio_c2eY(),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'c2eY', _c2eY_Controller),
                                        Radio_c2eB(),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'c2eB', _c2eB_Controller),
                                        Radio_c1c2R(),

                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'c1c2R', _c1c2R_Controller),
                                        Radio_c1c2Y(),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'c1c2Y', _c1c2Y_Controller),
                                        Radio_c1c2B(),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'c1c2B', _c1c2B_Controller),
                                        Radio_c2c3R(),

                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'c2c3R', _c2c3R_Controller),
                                        Radio_c2c3Y(),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'c2c3Y', _c2c3Y_Controller),
                                        Radio_c2c3B(),
                                        simplifiedFor_Display_for_all_Mobile_numpad(
                                            'c2c3B', _c2c3B_Controller),
                                        Divider(
                                            height: 10,
                                            color: Colors.black,
                                            thickness: 2),
                                        SizedBox(height: 10),
                                        // ---------------------------------------
                                        ntr.noOfCores > 1 &&
                                                    ntr.noOfCores > 2 &&
                                                    ntr.noOfCores > 3 ||
                                                ntr.noOfCores == 3
                                            ? Column(
                                                children: [
                                                  Radio_pc3R(),
                                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                                      'pc3R', _pc3R_Controller),
                                                  Radio_pc3Y(),
                                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                                      'pc3Y', _pc3Y_Controller),
                                                  Radio_pc3B(),
                                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                                      'pc3B', _pc3B_Controller),
                                                  Radio_c3eR(),
                                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                                      'c3eR', _c3eR_Controller),
                                                  Radio_c3eY(),
                                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                                      'c3eY', _c3eY_Controller),
                                                  Radio_c3eB(),
                                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                                      'c3eB', _c3eB_Controller),
                                                  Radio_c3c4R(),
                                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                                      'c3c4R',
                                                      _c3c4R_Controller),
                                                  Radio_c3c4Y(),
                                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                                      'c3c4Y',
                                                      _c3c4Y_Controller),
                                                  Radio_c3c4B(),
                                                  simplifiedFor_Display_for_all_Mobile_numpad(
                                                      'c3c4B',
                                                      _c3c4B_Controller),

                                                  Divider(
                                                      height: 10,
                                                      color: Colors.black,
                                                      thickness: 2),
                                                  SizedBox(height: 10),
                                                  // -----------------------------------
                                                  ntr.noOfCores > 1 &&
                                                              ntr.noOfCores >
                                                                  2 &&
                                                              ntr.noOfCores >
                                                                  3 &&
                                                              ntr.noOfCores >
                                                                  4 ||
                                                          ntr.noOfCores == 4
                                                      ? Column(
                                                          children: [
                                                            Radio_pc4R(),
                                                            simplifiedFor_Display_for_all_Mobile_numpad(
                                                                'pc4R',
                                                                _pc4R_Controller),
                                                            Radio_pc4Y(),
                                                            simplifiedFor_Display_for_all_Mobile_numpad(
                                                                'pc4Y',
                                                                _pc4Y_Controller),
                                                            Radio_pc4B(),
                                                            simplifiedFor_Display_for_all_Mobile_numpad(
                                                                'pc4B',
                                                                _pc4B_Controller),
                                                            Radio_c4eR(),
                                                            simplifiedFor_Display_for_all_Mobile_numpad(
                                                                'c4eR',
                                                                _c4eR_Controller),
                                                            Radio_c4eY(),
                                                            simplifiedFor_Display_for_all_Mobile_numpad(
                                                                'c4eY',
                                                                _c4eY_Controller),
                                                            Radio_c4eB(),
                                                            simplifiedFor_Display_for_all_Mobile_numpad(
                                                                'c4eB',
                                                                _c4eB_Controller),
                                                            Radio_c4c5R(),
                                                            simplifiedFor_Display_for_all_Mobile_numpad(
                                                                'c4c5R',
                                                                _c4c5R_Controller),
                                                            Radio_c4c5Y(),
                                                            simplifiedFor_Display_for_all_Mobile_numpad(
                                                                'c4c5Y',
                                                                _c4c5Y_Controller),
                                                            Radio_c4c5B(),
                                                            simplifiedFor_Display_for_all_Mobile_numpad(
                                                                'c4c5B',
                                                                _c4c5B_Controller),
                                                            Divider(
                                                                height: 10,
                                                                color: Colors
                                                                    .black,
                                                                thickness: 2),
                                                            SizedBox(
                                                                height: 10),

                                                            // -----------------------------------
                                                            ntr.noOfCores > 1 &&
                                                                        ntr.noOfCores >
                                                                            2 &&
                                                                        ntr.noOfCores >
                                                                            3 &&
                                                                        ntr.noOfCores >
                                                                            4 &&
                                                                        ntr.noOfCores >
                                                                            5 ||
                                                                    ntr.noOfCores ==
                                                                        5
                                                                ? Column(
                                                                    children: [
                                                                      Radio_pc5R(),
                                                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                                                          'pc5R',
                                                                          _pc5R_Controller),
                                                                      Radio_pc5Y(),
                                                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                                                          'pc5Y',
                                                                          _pc5Y_Controller),
                                                                      Radio_pc5B(),
                                                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                                                          'pc5B',
                                                                          _pc5B_Controller),
                                                                      Radio_c5eR(),
                                                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                                                          'c5eR',
                                                                          _c5eR_Controller),
                                                                      Radio_c5eY(),
                                                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                                                          'c5eY',
                                                                          _c5eY_Controller),
                                                                      Radio_c5eB(),
                                                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                                                          'c5eB',
                                                                          _c5eB_Controller),
                                                                      Radio_clc1R(),
                                                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                                                          'clc1R',
                                                                          _clc1R_Controller),
                                                                      Radio_clc1Y(),
                                                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                                                          'clc1Y',
                                                                          _clc1Y_Controller),
                                                                      Radio_clc1B(),
                                                                      simplifiedFor_Display_for_all_Mobile_numpad(
                                                                          'clc1B',
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
