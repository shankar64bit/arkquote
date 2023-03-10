// ignore_for_file: missing_return, missing_required_param, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../data/models/equipment/CT/ct_core_ir_model.dart';
import '../../../data/models/equipment/CT/ct_model.dart';
import '../../providers/ct_provider/ct_core_ir_provider.dart';
import '../../providers/ct_provider/ct_provider.dart';
import '../dropdown_All/MegaGigaTeraRadioButton/ct_ir_radio_button_page.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditCTirPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditCTirPage(this.args, {Key key}) : super(key: key);

  CTcoreIRModel _ctIrTestModel;
  final TextEditingController _ID_Controller = TextEditingController();
  final TextEditingController _Trno_Controller = TextEditingController();
  final TextEditingController _serialNo_Controller = TextEditingController();
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
  final TextEditingController _Equipment_Controller = TextEditingController();

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

  Future<void> getReport() async {
    getX((CTcoreIRProvider x) => x.getCTcoreIR_ById(args['id']));
    _ctIrTestModel = watchOnly((CTcoreIRProvider x) => x.ctcoreIR_Model);

    _ID_Controller.text = _ctIrTestModel.id.toString();
    _Trno_Controller.text = _ctIrTestModel.trNo.toString();
    _serialNo_Controller.text = _ctIrTestModel.serialNo.toString();
    _Equipment_Controller.text = _ctIrTestModel.equipmentUsed.toString();
    _peR_Controller.text = _ctIrTestModel.peR.toString();
    _peY_Controller.text = _ctIrTestModel.peY.toString();
    _peB_Controller.text = _ctIrTestModel.peB.toString();
    _pc1R_Controller.text = _ctIrTestModel.pc1R.toString();
    _pc2R_Controller.text = _ctIrTestModel.pc2R.toString();
    _pc3R_Controller.text = _ctIrTestModel.pc3R.toString();
    _pc4R_Controller.text = _ctIrTestModel.pc4R.toString();
    _pc5R_Controller.text = _ctIrTestModel.pc5R.toString();
    _pc1Y_Controller.text = _ctIrTestModel.pc1Y.toString();
    _pc2Y_Controller.text = _ctIrTestModel.pc2Y.toString();
    _pc3Y_Controller.text = _ctIrTestModel.pc3Y.toString();
    _pc4Y_Controller.text = _ctIrTestModel.pc4Y.toString();
    _pc5Y_Controller.text = _ctIrTestModel.pc5Y.toString();
    _pc1B_Controller.text = _ctIrTestModel.pc1B.toString();
    _pc2B_Controller.text = _ctIrTestModel.pc2B.toString();
    _pc3B_Controller.text = _ctIrTestModel.pc3B.toString();
    _pc4B_Controller.text = _ctIrTestModel.pc4B.toString();
    _pc5B_Controller.text = _ctIrTestModel.pc5B.toString();
    _c1eR_Controller.text = _ctIrTestModel.c1eR.toString();
    _c2eR_Controller.text = _ctIrTestModel.c2eR.toString();
    _c3eR_Controller.text = _ctIrTestModel.c3eR.toString();
    _c4eR_Controller.text = _ctIrTestModel.c4eR.toString();
    _c5eR_Controller.text = _ctIrTestModel.c5eR.toString();
    _c1eY_Controller.text = _ctIrTestModel.c1eY.toString();
    _c2eY_Controller.text = _ctIrTestModel.c2eY.toString();
    _c3eY_Controller.text = _ctIrTestModel.c3eY.toString();
    _c4eY_Controller.text = _ctIrTestModel.c4eY.toString();
    _c5eY_Controller.text = _ctIrTestModel.c5eY.toString();
    _c1eB_Controller.text = _ctIrTestModel.c1eB.toString();
    _c2eB_Controller.text = _ctIrTestModel.c2eB.toString();
    _c3eB_Controller.text = _ctIrTestModel.c3eB.toString();
    _c4eB_Controller.text = _ctIrTestModel.c4eB.toString();
    _c5eB_Controller.text = _ctIrTestModel.c5eB.toString();
    _c1c2R_Controller.text = _ctIrTestModel.c1c2R.toString();
    _c1c2Y_Controller.text = _ctIrTestModel.c1c2Y.toString();
    _c1c2B_Controller.text = _ctIrTestModel.c1c2B.toString();
    _c2c3R_Controller.text = _ctIrTestModel.c2c3R.toString();
    _c2c3Y_Controller.text = _ctIrTestModel.c2c3Y.toString();
    _c2c3B_Controller.text = _ctIrTestModel.c2c3B.toString();
    _c3c4R_Controller.text = _ctIrTestModel.c3c4R.toString();
    _c3c4Y_Controller.text = _ctIrTestModel.c3c4Y.toString();
    _c3c4B_Controller.text = _ctIrTestModel.c3c4B.toString();
    _c4c5R_Controller.text = _ctIrTestModel.c4c5R.toString();
    _c4c5Y_Controller.text = _ctIrTestModel.c4c5Y.toString();
    _c4c5B_Controller.text = _ctIrTestModel.c4c5B.toString();
    _clc1R_Controller.text = _ctIrTestModel.clc1R.toString();
    _clc1Y_Controller.text = _ctIrTestModel.clc1Y.toString();
    _clc1B_Controller.text = _ctIrTestModel.clc1B.toString();
  }

  @override
  Widget build(BuildContext context) {
    final CTcoreIRModel ntr =
        watchOnly((CTcoreIRProvider x) => x.ctcoreIR_Model);

    final CTModel ntr1 = watchOnly((CTProvider x) => x.ctModel);

    getReport();
    var mob = const Text('Edit CT-Ir Details', style: TextStyle(fontSize: 15));
    var desk = const Text('Edit CT-Ir Details', style: TextStyle(fontSize: 20));

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

                  if (ntr1.noOfCores == 1) {
                    print('selected Noofcore' + ntr1.noOfCores.toString());

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

                  if (ntr1.noOfCores == 1 || ntr1.noOfCores == 2) {
                    print('selected Noofcore' + ntr1.noOfCores.toString());

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

                  if (ntr1.noOfCores == 1 ||
                      ntr1.noOfCores == 2 ||
                      ntr1.noOfCores == 3) {
                    print('selected Noofcore' + ntr1.noOfCores.toString());

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

                  if (ntr1.noOfCores == 1 ||
                      ntr1.noOfCores == 2 ||
                      ntr1.noOfCores == 3 ||
                      ntr1.noOfCores == 4) {
                    print('selected Noofcore' + ntr1.noOfCores.toString());
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
                      selected_peR.toString().split('_')[3]);
                  peY = convertValue(double.parse(_peY_Controller.text),
                      selected_peY.toString().split('_')[3]);
                  peB = convertValue(double.parse(_peB_Controller.text),
                      selected_peB.toString().split('_')[3]);

                  print("????????????????????????????????????");
                  print(peR);
                  print(peY);
                  print(peB);

                  // ---------------------------------------------------------
                  pc1R = convertValue(double.parse(_pc1R_Controller.text),
                      selected_pc1R.toString().split('_')[3]);

                  if (pc2R != 0.00) {
                    pc2R = convertValue(double.parse(_pc2R_Controller.text),
                        selected_pc2R.toString().split('_')[3]);
                  }
                  if (pc3R != 0.00) {
                    pc3R = convertValue(double.parse(_pc3R_Controller.text),
                        selected_pc3R.toString().split('_')[3]);
                  }
                  if (pc4R != 0.00) {
                    pc4R = convertValue(double.parse(_pc4R_Controller.text),
                        selected_pc4R.toString().split('_')[3]);
                  }
                  if (pc5R != 0.00) {
                    pc5R = convertValue(double.parse(_pc5R_Controller.text),
                        selected_pc5R.toString().split('_')[3]);
                  }
                  // ---------------------------------------------------------
                  pc1Y = convertValue(double.parse(_pc1Y_Controller.text),
                      selected_pc1Y.toString().split('_')[3]);

                  if (pc2Y != 0.00) {
                    pc2Y = convertValue(double.parse(_pc2Y_Controller.text),
                        selected_pc2Y.toString().split('_')[3]);
                  }
                  if (pc3Y != 0.00) {
                    pc3Y = convertValue(double.parse(_pc3Y_Controller.text),
                        selected_pc3Y.toString().split('_')[3]);
                  }
                  if (pc4Y != 0.00) {
                    pc4Y = convertValue(double.parse(_pc4Y_Controller.text),
                        selected_pc4Y.toString().split('_')[3]);
                  }
                  if (pc5Y != 0.00) {
                    pc5Y = convertValue(double.parse(_pc5Y_Controller.text),
                        selected_pc5Y.toString().split('_')[3]);
                  }
                  // ---------------------------------------------------------

                  pc1B = convertValue(double.parse(_pc1B_Controller.text),
                      selected_pc1B.toString().split('_')[3]);

                  if (pc2B != 0.00) {
                    pc2B = convertValue(double.parse(_pc2B_Controller.text),
                        selected_pc2B.toString().split('_')[3]);
                  }
                  if (pc3B != 0.00) {
                    pc3B = convertValue(double.parse(_pc3B_Controller.text),
                        selected_pc3B.toString().split('_')[3]);
                  }
                  if (pc4B != 0.00) {
                    pc4B = convertValue(double.parse(_pc4B_Controller.text),
                        selected_pc4B.toString().split('_')[3]);
                  }
                  if (pc5B != 0.00) {
                    pc5B = convertValue(double.parse(_pc5B_Controller.text),
                        selected_pc5B.toString().split('_')[3]);
                  }
                  // ---------------------------------------------------------

                  c1eR = convertValue(double.parse(_c1eR_Controller.text),
                      selected_c1eR.toString().split('_')[3]);

                  if (c2eR != 0.00) {
                    c2eR = convertValue(double.parse(_c2eR_Controller.text),
                        selected_c2eR.toString().split('_')[3]);
                  }
                  if (c3eR != 0.00) {
                    c3eR = convertValue(double.parse(_c3eR_Controller.text),
                        selected_c3eR.toString().split('_')[3]);
                  }
                  if (c4eR != 0.00) {
                    c4eR = convertValue(double.parse(_c4eR_Controller.text),
                        selected_c4eR.toString().split('_')[3]);
                  }
                  if (c5eR != 0.00) {
                    c5eR = convertValue(double.parse(_c5eR_Controller.text),
                        selected_c5eR.toString().split('_')[3]);
                  }
                  // ---------------------------------------------------------

                  c1eY = convertValue(double.parse(_c1eY_Controller.text),
                      selected_c1eY.toString().split('_')[3]);

                  if (c2eY != 0.00) {
                    c2eY = convertValue(double.parse(_c2eY_Controller.text),
                        selected_c2eY.toString().split('_')[3]);
                  }
                  if (c3eY != 0.00) {
                    c3eY = convertValue(double.parse(_c3eY_Controller.text),
                        selected_c3eY.toString().split('_')[3]);
                  }
                  if (c4eY != 0.00) {
                    c4eY = convertValue(double.parse(_c4eY_Controller.text),
                        selected_c4eY.toString().split('_')[3]);
                  }
                  if (c5eY != 0.00) {
                    c5eY = convertValue(double.parse(_c5eY_Controller.text),
                        selected_c5eY.toString().split('_')[3]);
                  }

                  // ---------------------------------------------------------
                  c1eB = convertValue(double.parse(_c1eB_Controller.text),
                      selected_c1eB.toString().split('_')[3]);

                  if (c2eB != 0.00) {
                    c2eB = convertValue(double.parse(_c2eB_Controller.text),
                        selected_c2eB.toString().split('_')[3]);
                  }
                  if (c3eB != 0.00) {
                    c3eB = convertValue(double.parse(_c3eB_Controller.text),
                        selected_c3eB.toString().split('_')[3]);
                  }
                  if (c4eB != 0.00) {
                    c4eB = convertValue(double.parse(_c4eB_Controller.text),
                        selected_c4eB.toString().split('_')[3]);
                  }
                  if (c5eB != 0.00) {
                    c5eB = convertValue(double.parse(_c5eB_Controller.text),
                        selected_c5eB.toString().split('_')[3]);
                  }
                  // ---------------------------------------------------------
                  if (c1c2R != 0.00) {
                    c1c2R = convertValue(double.parse(_c1c2R_Controller.text),
                        selected_c1c2R.toString().split('_')[3]);
                  }
                  if (c1c2Y != 0.00) {
                    c1c2Y = convertValue(double.parse(_c1c2Y_Controller.text),
                        selected_c1c2Y.toString().split('_')[3]);
                  }
                  if (c1c2B != 0.00) {
                    c1c2B = convertValue(double.parse(_c1c2B_Controller.text),
                        selected_c1c2B.toString().split('_')[3]);
                  }
                  if (c2c3R != 0.00) {
                    c2c3R = convertValue(double.parse(_c2c3R_Controller.text),
                        selected_c2c3R.toString().split('_')[3]);
                  }
                  if (c2c3Y != 0.00) {
                    c2c3Y = convertValue(double.parse(_c2c3Y_Controller.text),
                        selected_c2c3Y.toString().split('_')[3]);
                  }
                  if (c2c3B != 0.00) {
                    c2c3B = convertValue(double.parse(_c2c3B_Controller.text),
                        selected_c2c3B.toString().split('_')[3]);
                  }
                  if (c3c4R != 0.00) {
                    c3c4R = convertValue(double.parse(_c3c4R_Controller.text),
                        selected_c3c4R.toString().split('_')[3]);
                  }
                  if (c3c4Y != 0.00) {
                    c3c4Y = convertValue(double.parse(_c3c4Y_Controller.text),
                        selected_c3c4Y.toString().split('_')[3]);
                  }
                  if (c3c4B != 0.00) {
                    c3c4B = convertValue(double.parse(_c3c4B_Controller.text),
                        selected_c3c4B.toString().split('_')[3]);
                  }
                  if (c4c5R != 0.00) {
                    c4c5R = convertValue(double.parse(_c4c5R_Controller.text),
                        selected_c4c5R.toString().split('_')[3]);
                  }
                  if (c4c5Y != 0.00) {
                    c4c5Y = convertValue(double.parse(_c4c5Y_Controller.text),
                        selected_c4c5Y.toString().split('_')[3]);
                  }
                  if (c4c5B != 0.00) {
                    c4c5B = convertValue(double.parse(_c4c5B_Controller.text),
                        selected_c4c5B.toString().split('_')[3]);
                  }
                  if (clc1R != 0.00) {
                    clc1R = convertValue(double.parse(_clc1R_Controller.text),
                        selected_clc1R.toString().split('_')[3]);
                  }
                  if (clc1Y != 0.00) {
                    clc1Y = convertValue(double.parse(_clc1Y_Controller.text),
                        selected_clc1Y.toString().split('_')[3]);
                  }
                  if (clc1B != 0.00) {
                    clc1B = convertValue(double.parse(_clc1B_Controller.text),
                        selected_clc1B.toString().split('_')[3]);
                  }

                  //add to remote database
                  var success_code = 201;
                  var success_code1 = 200;
                  var failed_code = 'Server Connection Lost';
                  //add to remote database
                  var url = Uri.parse('${Env.URL_PREFIX}/ctCoreIrTest/' +
                      ntr.databaseID.toString() +
                      '/');

                  Map<String, String> headers = {
                    "Content-type": "application/json",
                    "Authorization": "Bearer $acc_token",
                  };
                  print("***********");
                  print(args['trDatabaseID'].toString());

                  print(url);

                  final Map payload = {
                    'trNo': args['trDatabaseID'].toString(),
                    'serialNo': args['CT_ID'].toString(),
                    'equipmentUsed': selectedValueForEquipmentUse.toString(),
                    'peR': _peR_Controller.text.toString(),
                    'peY': _peY_Controller.text.toString(),
                    'peB': _peB_Controller.text.toString(),
                    'pc1R': _pc1R_Controller.text.toString(),
                    'pc2R': _pc2R_Controller.text.toString(),
                    'pc3R': _pc3R_Controller.text.toString(),
                    'pc4R': _pc4R_Controller.text.toString(),
                    'pc5R': _pc5R_Controller.text.toString(),
                    'pc1Y': _pc1Y_Controller.text.toString(),
                    'pc2Y': _pc2Y_Controller.text.toString(),
                    'pc3Y': _pc3Y_Controller.text.toString(),
                    'pc4Y': _pc4Y_Controller.text.toString(),
                    'pc5Y': _pc5Y_Controller.text.toString(),
                    'pc1B': _pc1B_Controller.text.toString(),
                    'pc2B': _pc2B_Controller.text.toString(),
                    'pc3B': _pc3B_Controller.text.toString(),
                    'pc4B': _pc4B_Controller.text.toString(),
                    'pc5B': _pc5B_Controller.text.toString(),
                    'c1eR': _c1eR_Controller.text.toString(),
                    'c2eR': _c2eR_Controller.text.toString(),
                    'c3eR': _c3eR_Controller.text.toString(),
                    'c4eR': _c4eR_Controller.text.toString(),
                    'c5eR': _c5eR_Controller.text.toString(),
                    'c1eY': _c1eY_Controller.text.toString(),
                    'c2eY': _c2eY_Controller.text.toString(),
                    'c3eY': _c3eY_Controller.text.toString(),
                    'c4eY': _c4eY_Controller.text.toString(),
                    'c5eY': _c5eY_Controller.text.toString(),
                    'c1eB': _c1eB_Controller.text.toString(),
                    'c2eB': _c2eB_Controller.text.toString(),
                    'c3eB': _c3eB_Controller.text.toString(),
                    'c4eB': _c4eB_Controller.text.toString(),
                    'c5eB': _c5eB_Controller.text.toString(),
                    'c1c2R': _c1c2R_Controller.text.toString(),
                    'c1c2Y': _c1c2Y_Controller.text.toString(),
                    'c1c2B': _c1c2B_Controller.text.toString(),
                    'c2c3R': _c2c3R_Controller.text.toString(),
                    'c2c3Y': _c2c3Y_Controller.text.toString(),
                    'c2c3B': _c2c3B_Controller.text.toString(),
                    'c3c4R': _c3c4R_Controller.text.toString(),
                    'c3c4Y': _c3c4Y_Controller.text.toString(),
                    'c3c4B': _c3c4B_Controller.text.toString(),
                    'c4c5R': _c4c5R_Controller.text.toString(),
                    'c4c5Y': _c4c5Y_Controller.text.toString(),
                    'c4c5B': _c4c5B_Controller.text.toString(),
                    'clc1R': _clc1R_Controller.text.toString(),
                    'clc1Y': _clc1Y_Controller.text.toString(),
                    'clc1B': _clc1B_Controller.text.toString(),
                    'updateDate': DateTime.now().toString(),
                  };
                  var response = await http.put(url,
                      body: jsonEncode(payload), headers: headers);

                  if (response.statusCode == success_code ||
                      response.statusCode == success_code1) {
                    print('Response status: ${response.statusCode}');
                    print('Response body: ${response.body}');
                    print('Stored successfully');

                    //add to local database
                    final CTcoreIRModel ctIrReportToLocal = CTcoreIRModel(
                      trNo: int.parse(_Trno_Controller.text),
                      serialNo: _serialNo_Controller.text,
                      peR: double.parse(_peR_Controller.text),
                      peY: double.parse(_peY_Controller.text),
                      peB: double.parse(_peB_Controller.text),
                      pc1R: double.parse(_pc1R_Controller.text),
                      pc2R: double.parse(_pc2R_Controller.text),
                      pc3R: double.parse(_pc3R_Controller.text),
                      pc4R: double.parse(_pc4R_Controller.text),
                      pc5R: double.parse(_pc5R_Controller.text),
                      pc1Y: double.parse(_pc1Y_Controller.text),
                      pc2Y: double.parse(_pc2Y_Controller.text),
                      pc3Y: double.parse(_pc3Y_Controller.text),
                      pc4Y: double.parse(_pc4Y_Controller.text),
                      pc5Y: double.parse(_pc5Y_Controller.text),
                      pc1B: double.parse(_pc1B_Controller.text),
                      pc2B: double.parse(_pc2B_Controller.text),
                      pc3B: double.parse(_pc3B_Controller.text),
                      pc4B: double.parse(_pc4B_Controller.text),
                      pc5B: double.parse(_pc5B_Controller.text),
                      c1eR: double.parse(_c1eR_Controller.text),
                      c2eR: double.parse(_c2eR_Controller.text),
                      c3eR: double.parse(_c3eR_Controller.text),
                      c4eR: double.parse(_c4eR_Controller.text),
                      c5eR: double.parse(_c5eR_Controller.text),
                      c1eY: double.parse(_c1eY_Controller.text),
                      c2eY: double.parse(_c2eY_Controller.text),
                      c3eY: double.parse(_c3eY_Controller.text),
                      c4eY: double.parse(_c4eY_Controller.text),
                      c5eY: double.parse(_c5eY_Controller.text),
                      c1eB: double.parse(_c1eB_Controller.text),
                      c2eB: double.parse(_c2eB_Controller.text),
                      c3eB: double.parse(_c3eB_Controller.text),
                      c4eB: double.parse(_c4eB_Controller.text),
                      c5eB: double.parse(_c5eB_Controller.text),
                      c1c2R: double.parse(_c1c2R_Controller.text),
                      c1c2Y: double.parse(_c1c2Y_Controller.text),
                      c1c2B: double.parse(_c1c2B_Controller.text),
                      c2c3R: double.parse(_c2c3R_Controller.text),
                      c2c3Y: double.parse(_c2c3Y_Controller.text),
                      c2c3B: double.parse(_c2c3B_Controller.text),
                      c3c4R: double.parse(_c3c4R_Controller.text),
                      c3c4Y: double.parse(_c3c4Y_Controller.text),
                      c3c4B: double.parse(_c3c4B_Controller.text),
                      c4c5R: double.parse(_c4c5R_Controller.text),
                      c4c5Y: double.parse(_c4c5Y_Controller.text),
                      c4c5B: double.parse(_c4c5B_Controller.text),
                      clc1R: double.parse(_clc1R_Controller.text),
                      clc1Y: double.parse(_clc1Y_Controller.text),
                      clc1B: double.parse(_clc1B_Controller.text),
                      equipmentUsed: selectedValueForEquipmentUse.toString(),
                      databaseID: ntr.databaseID,
                      updateDate: DateTime.now(),
                    );

                    getX((CTcoreIRProvider x) =>
                        x.updateCTcoreIR(ctIrReportToLocal, args['id']));

                    Navigator.popAndPushNamed(context, '/detail_CTcoreIR',
                        arguments: {
                          'id': args['id'],
                          'CT_ID': args['CT_ID'],
                          'trDatabaseID': args['trDatabaseID'],
                        });
                  } else {
                    failed_code;
                    print('Failed Response status: ${response.statusCode}');
                    print('Failed Response body: ${response.body}');
                    print('Unsuccessfully');
                  }
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
                          'ID',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5),
                        )),
                    TextFormField(
                      controller: _ID_Controller,
                      textAlign: TextAlign.center,
                      enabled: false,
                    ),
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
                          'ID',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5),
                        )),
                    TextFormField(
                      controller: _ID_Controller,
                      textAlign: TextAlign.center,
                      enabled: false,
                    ),
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
