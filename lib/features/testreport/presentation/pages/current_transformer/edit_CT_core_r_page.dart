// ignore_for_file: missing_return, missing_required_param, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/Auser_input_validation_exnt.dart/validation_extension_methods.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../data/models/equipment/CT/ct_core_model.dart';
import '../../../data/models/equipment/CT/ct_core_r_model.dart';
import '../../../data/models/equipment/CT/ct_tap_model.dart';
import '../../providers/ct_provider/ct_core_provider.dart';
import '../../providers/ct_provider/ct_core_r_provider.dart';
import '../../providers/ct_provider/ct_provider.dart';
import '../../providers/ct_provider/ct_tap_provider.dart';
import '../../widgets/custom_text_form_field_For_number.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';
import '../../../data/models/equipment/CT/ct_model.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditCTrPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditCTrPage(this.args, {Key key}) : super(key: key);

  CTcoreRModel _ctRTestModel;
  final TextEditingController _ID_Controller = TextEditingController();
  final TextEditingController _Trno_Controller = TextEditingController();
  final TextEditingController _serialNo_Controller = TextEditingController();
  final TextEditingController _R_1S1_1S2_200_Controller =
      TextEditingController();
  final TextEditingController _R_2S1_2S2_200_Controller =
      TextEditingController();
  final TextEditingController _R_3S1_3S2_200_Controller =
      TextEditingController();
  final TextEditingController _R_4S1_4S2_200_Controller =
      TextEditingController();
  final TextEditingController _R_5S1_5S2_200_Controller =
      TextEditingController();
  final TextEditingController _Y_1S1_1S2_200_Controller =
      TextEditingController();
  final TextEditingController _Y_2S1_2S2_200_Controller =
      TextEditingController();
  final TextEditingController _Y_3S1_3S2_200_Controller =
      TextEditingController();
  final TextEditingController _Y_4S1_4S2_200_Controller =
      TextEditingController();
  final TextEditingController _Y_5S1_5S2_200_Controller =
      TextEditingController();
  final TextEditingController _B_1S1_1S2_200_Controller =
      TextEditingController();
  final TextEditingController _B_2S1_2S2_200_Controller =
      TextEditingController();
  final TextEditingController _B_3S1_3S2_200_Controller =
      TextEditingController();
  final TextEditingController _B_4S1_4S2_200_Controller =
      TextEditingController();
  final TextEditingController _B_5S1_5S2_200_Controller =
      TextEditingController();
  final TextEditingController _R_1S1_1S2_400_Controller =
      TextEditingController();
  final TextEditingController _R_2S1_2S2_400_Controller =
      TextEditingController();
  final TextEditingController _R_3S1_3S2_400_Controller =
      TextEditingController();
  final TextEditingController _R_4S1_4S2_400_Controller =
      TextEditingController();
  final TextEditingController _R_5S1_5S2_400_Controller =
      TextEditingController();
  final TextEditingController _Y_1S1_1S2_400_Controller =
      TextEditingController();
  final TextEditingController _Y_2S1_2S2_400_Controller =
      TextEditingController();
  final TextEditingController _Y_3S1_3S2_400_Controller =
      TextEditingController();
  final TextEditingController _Y_4S1_4S2_400_Controller =
      TextEditingController();
  final TextEditingController _Y_5S1_5S2_400_Controller =
      TextEditingController();
  final TextEditingController _B_1S1_1S2_400_Controller =
      TextEditingController();
  final TextEditingController _B_2S1_2S2_400_Controller =
      TextEditingController();
  final TextEditingController _B_3S1_3S2_400_Controller =
      TextEditingController();
  final TextEditingController _B_4S1_4S2_400_Controller =
      TextEditingController();
  final TextEditingController _B_5S1_5S2_400_Controller =
      TextEditingController();
  final TextEditingController _R_1S1_1S2_600_Controller =
      TextEditingController();
  final TextEditingController _R_2S1_2S2_600_Controller =
      TextEditingController();
  final TextEditingController _R_3S1_3S2_600_Controller =
      TextEditingController();
  final TextEditingController _R_4S1_4S2_600_Controller =
      TextEditingController();
  final TextEditingController _R_5S1_5S2_600_Controller =
      TextEditingController();
  final TextEditingController _Y_1S1_1S2_600_Controller =
      TextEditingController();
  final TextEditingController _Y_2S1_2S2_600_Controller =
      TextEditingController();
  final TextEditingController _Y_3S1_3S2_600_Controller =
      TextEditingController();
  final TextEditingController _Y_4S1_4S2_600_Controller =
      TextEditingController();
  final TextEditingController _Y_5S1_5S2_600_Controller =
      TextEditingController();
  final TextEditingController _B_1S1_1S2_600_Controller =
      TextEditingController();
  final TextEditingController _B_2S1_2S2_600_Controller =
      TextEditingController();
  final TextEditingController _B_3S1_3S2_600_Controller =
      TextEditingController();
  final TextEditingController _B_4S1_4S2_600_Controller =
      TextEditingController();
  final TextEditingController _B_5S1_5S2_600_Controller =
      TextEditingController();
  final TextEditingController _R_1S1_1S2_800_Controller =
      TextEditingController();
  final TextEditingController _R_2S1_2S2_800_Controller =
      TextEditingController();
  final TextEditingController _R_3S1_3S2_800_Controller =
      TextEditingController();
  final TextEditingController _R_4S1_4S2_800_Controller =
      TextEditingController();
  final TextEditingController _R_5S1_5S2_800_Controller =
      TextEditingController();
  final TextEditingController _Y_1S1_1S2_800_Controller =
      TextEditingController();
  final TextEditingController _Y_2S1_2S2_800_Controller =
      TextEditingController();
  final TextEditingController _Y_3S1_3S2_800_Controller =
      TextEditingController();
  final TextEditingController _Y_4S1_4S2_800_Controller =
      TextEditingController();
  final TextEditingController _Y_5S1_5S2_800_Controller =
      TextEditingController();
  final TextEditingController _B_1S1_1S2_800_Controller =
      TextEditingController();
  final TextEditingController _B_2S1_2S2_800_Controller =
      TextEditingController();
  final TextEditingController _B_3S1_3S2_800_Controller =
      TextEditingController();
  final TextEditingController _B_4S1_4S2_800_Controller =
      TextEditingController();
  final TextEditingController _B_5S1_5S2_800_Controller =
      TextEditingController();
  final TextEditingController _equipmentUsed_Controller =
      TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Future<void> getReport() async {
    getX((CTcoreRProvider x) => x.getCTcoreR_ById(args['id']));
    _ctRTestModel = watchOnly((CTcoreRProvider x) => x.ctcoreR_Model);

    _ID_Controller.text = _ctRTestModel.id.toString();
    _Trno_Controller.text = _ctRTestModel.trNo.toString();
    _serialNo_Controller.text = _ctRTestModel.serialNo.toString();
    _equipmentUsed_Controller.text = _ctRTestModel.equipmentUsed.toString();
    _R_1S1_1S2_200_Controller.text = _ctRTestModel.R_1S1_1S2_200.toString();
    _R_2S1_2S2_200_Controller.text = _ctRTestModel.R_2S1_2S2_200.toString();
    _R_3S1_3S2_200_Controller.text = _ctRTestModel.R_3S1_3S2_200.toString();
    _R_4S1_4S2_200_Controller.text = _ctRTestModel.R_4S1_4S2_200.toString();
    _R_5S1_5S2_200_Controller.text = _ctRTestModel.R_5S1_5S2_200.toString();
    _Y_1S1_1S2_200_Controller.text = _ctRTestModel.Y_1S1_1S2_200.toString();
    _Y_2S1_2S2_200_Controller.text = _ctRTestModel.Y_2S1_2S2_200.toString();
    _Y_3S1_3S2_200_Controller.text = _ctRTestModel.Y_3S1_3S2_200.toString();
    _Y_4S1_4S2_200_Controller.text = _ctRTestModel.Y_4S1_4S2_200.toString();
    _Y_5S1_5S2_200_Controller.text = _ctRTestModel.Y_5S1_5S2_200.toString();
    _B_1S1_1S2_200_Controller.text = _ctRTestModel.B_1S1_1S2_200.toString();
    _B_2S1_2S2_200_Controller.text = _ctRTestModel.B_2S1_2S2_200.toString();
    _B_3S1_3S2_200_Controller.text = _ctRTestModel.B_3S1_3S2_200.toString();
    _B_4S1_4S2_200_Controller.text = _ctRTestModel.B_4S1_4S2_200.toString();
    _B_5S1_5S2_200_Controller.text = _ctRTestModel.B_5S1_5S2_200.toString();
    _R_1S1_1S2_400_Controller.text = _ctRTestModel.R_1S1_1S2_400.toString();
    _R_2S1_2S2_400_Controller.text = _ctRTestModel.R_2S1_2S2_400.toString();
    _R_3S1_3S2_400_Controller.text = _ctRTestModel.R_3S1_3S2_400.toString();
    _R_4S1_4S2_400_Controller.text = _ctRTestModel.R_4S1_4S2_400.toString();
    _R_5S1_5S2_400_Controller.text = _ctRTestModel.R_5S1_5S2_400.toString();
    _Y_1S1_1S2_400_Controller.text = _ctRTestModel.Y_1S1_1S2_400.toString();
    _Y_2S1_2S2_400_Controller.text = _ctRTestModel.Y_2S1_2S2_400.toString();
    _Y_3S1_3S2_400_Controller.text = _ctRTestModel.Y_3S1_3S2_400.toString();
    _Y_4S1_4S2_400_Controller.text = _ctRTestModel.Y_4S1_4S2_400.toString();
    _Y_5S1_5S2_400_Controller.text = _ctRTestModel.Y_5S1_5S2_400.toString();
    _B_1S1_1S2_400_Controller.text = _ctRTestModel.B_1S1_1S2_400.toString();
    _B_2S1_2S2_400_Controller.text = _ctRTestModel.B_2S1_2S2_400.toString();
    _B_3S1_3S2_400_Controller.text = _ctRTestModel.B_3S1_3S2_400.toString();
    _B_4S1_4S2_400_Controller.text = _ctRTestModel.B_4S1_4S2_400.toString();
    _B_5S1_5S2_400_Controller.text = _ctRTestModel.B_5S1_5S2_400.toString();
    _R_1S1_1S2_600_Controller.text = _ctRTestModel.R_1S1_1S2_600.toString();
    _R_2S1_2S2_600_Controller.text = _ctRTestModel.R_2S1_2S2_600.toString();
    _R_3S1_3S2_600_Controller.text = _ctRTestModel.R_3S1_3S2_600.toString();
    _R_4S1_4S2_600_Controller.text = _ctRTestModel.R_4S1_4S2_600.toString();
    _R_5S1_5S2_600_Controller.text = _ctRTestModel.R_5S1_5S2_600.toString();
    _Y_1S1_1S2_600_Controller.text = _ctRTestModel.Y_1S1_1S2_600.toString();
    _Y_2S1_2S2_600_Controller.text = _ctRTestModel.Y_2S1_2S2_600.toString();
    _Y_3S1_3S2_600_Controller.text = _ctRTestModel.Y_3S1_3S2_600.toString();
    _Y_4S1_4S2_600_Controller.text = _ctRTestModel.Y_4S1_4S2_600.toString();
    _Y_5S1_5S2_600_Controller.text = _ctRTestModel.Y_5S1_5S2_600.toString();
    _B_1S1_1S2_600_Controller.text = _ctRTestModel.B_1S1_1S2_600.toString();
    _B_2S1_2S2_600_Controller.text = _ctRTestModel.B_2S1_2S2_600.toString();
    _B_3S1_3S2_600_Controller.text = _ctRTestModel.B_3S1_3S2_600.toString();
    _B_4S1_4S2_600_Controller.text = _ctRTestModel.B_4S1_4S2_600.toString();
    _B_5S1_5S2_600_Controller.text = _ctRTestModel.B_5S1_5S2_600.toString();
    _R_1S1_1S2_800_Controller.text = _ctRTestModel.R_1S1_1S2_800.toString();
    _R_2S1_2S2_800_Controller.text = _ctRTestModel.R_2S1_2S2_800.toString();
    _R_3S1_3S2_800_Controller.text = _ctRTestModel.R_3S1_3S2_800.toString();
    _R_4S1_4S2_800_Controller.text = _ctRTestModel.R_4S1_4S2_800.toString();
    _R_5S1_5S2_800_Controller.text = _ctRTestModel.R_5S1_5S2_800.toString();
    _Y_1S1_1S2_800_Controller.text = _ctRTestModel.Y_1S1_1S2_800.toString();
    _Y_2S1_2S2_800_Controller.text = _ctRTestModel.Y_2S1_2S2_800.toString();
    _Y_3S1_3S2_800_Controller.text = _ctRTestModel.Y_3S1_3S2_800.toString();
    _Y_4S1_4S2_800_Controller.text = _ctRTestModel.Y_4S1_4S2_800.toString();
    _Y_5S1_5S2_800_Controller.text = _ctRTestModel.Y_5S1_5S2_800.toString();
    _B_1S1_1S2_800_Controller.text = _ctRTestModel.B_1S1_1S2_800.toString();
    _B_2S1_2S2_800_Controller.text = _ctRTestModel.B_2S1_2S2_800.toString();
    _B_3S1_3S2_800_Controller.text = _ctRTestModel.B_3S1_3S2_800.toString();
    _B_4S1_4S2_800_Controller.text = _ctRTestModel.B_4S1_4S2_800.toString();
    _B_5S1_5S2_800_Controller.text = _ctRTestModel.B_5S1_5S2_800.toString();
  }

  @override
  Widget build(BuildContext context) {
    final CTcoreRModel ntr = watchOnly((CTcoreRProvider x) => x.ctcoreR_Model);

    final CTModel ntr1 = watchOnly((CTProvider x) => x.ctModel);

    getReport();
    var mob = const Text('Edit CT-R Details', style: TextStyle(fontSize: 15));
    var desk = const Text('Edit CT-R Details', style: TextStyle(fontSize: 20));

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

                  double R_1S1_1S2_200;
                  double R_2S1_2S2_200;
                  double R_3S1_3S2_200;
                  double R_4S1_4S2_200;
                  double R_5S1_5S2_200;

                  double Y_1S1_1S2_200;
                  double Y_2S1_2S2_200;
                  double Y_3S1_3S2_200;
                  double Y_4S1_4S2_200;
                  double Y_5S1_5S2_200;

                  double B_1S1_1S2_200;
                  double B_2S1_2S2_200;
                  double B_3S1_3S2_200;
                  double B_4S1_4S2_200;
                  double B_5S1_5S2_200;
                  /////////////////////
                  double R_1S1_1S2_400;
                  double R_2S1_2S2_400;
                  double R_3S1_3S2_400;
                  double R_4S1_4S2_400;
                  double R_5S1_5S2_400;

                  double Y_1S1_1S2_400;
                  double Y_2S1_2S2_400;
                  double Y_3S1_3S2_400;
                  double Y_4S1_4S2_400;
                  double Y_5S1_5S2_400;

                  double B_1S1_1S2_400;
                  double B_2S1_2S2_400;
                  double B_3S1_3S2_400;
                  double B_4S1_4S2_400;
                  double B_5S1_5S2_400;
                  ////////////////////
                  double R_1S1_1S2_600;
                  double R_2S1_2S2_600;
                  double R_3S1_3S2_600;
                  double R_4S1_4S2_600;
                  double R_5S1_5S2_600;

                  double Y_1S1_1S2_600;
                  double Y_2S1_2S2_600;
                  double Y_3S1_3S2_600;
                  double Y_4S1_4S2_600;
                  double Y_5S1_5S2_600;

                  double B_1S1_1S2_600;
                  double B_2S1_2S2_600;
                  double B_3S1_3S2_600;
                  double B_4S1_4S2_600;
                  double B_5S1_5S2_600;
                  ////////////////////
                  double R_1S1_1S2_800;
                  double R_2S1_2S2_800;
                  double R_3S1_3S2_800;
                  double R_4S1_4S2_800;
                  double R_5S1_5S2_800;

                  double Y_1S1_1S2_800;
                  double Y_2S1_2S2_800;
                  double Y_3S1_3S2_800;
                  double Y_4S1_4S2_800;
                  double Y_5S1_5S2_800;

                  double B_1S1_1S2_800;
                  double B_2S1_2S2_800;
                  double B_3S1_3S2_800;
                  double B_4S1_4S2_800;
                  double B_5S1_5S2_800;

                  //////////////////////////////////////
                  if (ntr1.noOfCores == 1) {
                    print('selected Noofcore' + ntr1.noOfCores.toString());
                    R_1S1_1S2_200 =
                        double.parse(_R_1S1_1S2_200_Controller.text);
                    R_2S1_2S2_200 = 0.00;
                    R_3S1_3S2_200 = 0.00;
                    R_4S1_4S2_200 = 0.00;
                    R_5S1_5S2_200 = 0.00;

                    Y_1S1_1S2_200 =
                        double.parse(_Y_1S1_1S2_200_Controller.text);
                    Y_2S1_2S2_200 = 0.00;
                    Y_3S1_3S2_200 = 0.00;
                    Y_4S1_4S2_200 = 0.00;
                    Y_5S1_5S2_200 = 0.00;

                    B_1S1_1S2_200 =
                        double.parse(_B_1S1_1S2_200_Controller.text);
                    B_2S1_2S2_200 = 0.00;
                    B_3S1_3S2_200 = 0.00;
                    B_4S1_4S2_200 = 0.00;
                    B_5S1_5S2_200 = 0.00;

                    /////////////////////////////////////////////////

                    R_1S1_1S2_400 =
                        double.parse(_R_1S1_1S2_400_Controller.text);
                    R_2S1_2S2_400 = 0.00;
                    R_3S1_3S2_400 = 0.00;
                    R_4S1_4S2_400 = 0.00;
                    R_5S1_5S2_400 = 0.00;

                    Y_1S1_1S2_400 =
                        double.parse(_Y_1S1_1S2_400_Controller.text);
                    Y_2S1_2S2_400 = 0.00;
                    Y_3S1_3S2_400 = 0.00;
                    Y_4S1_4S2_400 = 0.00;
                    Y_5S1_5S2_400 = 0.00;

                    B_1S1_1S2_400 =
                        double.parse(_B_1S1_1S2_400_Controller.text);
                    B_2S1_2S2_400 = 0.00;
                    B_3S1_3S2_400 = 0.00;
                    B_4S1_4S2_400 = 0.00;
                    B_5S1_5S2_400 = 0.00;

                    /////////////////////////////////////////////////

                    R_1S1_1S2_600 =
                        double.parse(_R_1S1_1S2_600_Controller.text);
                    R_2S1_2S2_600 = 0.00;
                    R_3S1_3S2_600 = 0.00;
                    R_4S1_4S2_600 = 0.00;
                    R_5S1_5S2_600 = 0.00;

                    Y_1S1_1S2_600 =
                        double.parse(_Y_1S1_1S2_600_Controller.text);
                    Y_2S1_2S2_600 = 0.00;
                    Y_3S1_3S2_600 = 0.00;
                    Y_4S1_4S2_600 = 0.00;
                    Y_5S1_5S2_600 = 0.00;

                    B_1S1_1S2_600 =
                        double.parse(_B_1S1_1S2_600_Controller.text);
                    B_2S1_2S2_600 = 0.00;
                    B_3S1_3S2_600 = 0.00;
                    B_4S1_4S2_600 = 0.00;
                    B_5S1_5S2_600 = 0.00;

                    R_1S1_1S2_800 =
                        double.parse(_R_1S1_1S2_800_Controller.text);
                    R_2S1_2S2_800 = 0.00;
                    R_3S1_3S2_800 = 0.00;
                    R_4S1_4S2_800 = 0.00;
                    R_5S1_5S2_800 = 0.00;

                    Y_1S1_1S2_800 =
                        double.parse(_Y_1S1_1S2_800_Controller.text);
                    Y_2S1_2S2_800 = 0.00;
                    Y_3S1_3S2_800 = 0.00;
                    Y_4S1_4S2_800 = 0.00;
                    Y_5S1_5S2_800 = 0.00;

                    B_1S1_1S2_800 =
                        double.parse(_B_1S1_1S2_800_Controller.text);
                    B_2S1_2S2_800 = 0.00;
                    B_3S1_3S2_800 = 0.00;
                    B_4S1_4S2_800 = 0.00;
                    B_5S1_5S2_800 = 0.00;
                  }
                  // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                  if (ntr1.noOfCores == 2) {
                    print('selected Noofcore' + ntr1.noOfCores.toString());
                    R_1S1_1S2_200 =
                        double.parse(_R_1S1_1S2_200_Controller.text);
                    R_2S1_2S2_200 =
                        double.parse(_R_2S1_2S2_200_Controller.text);
                    R_3S1_3S2_200 = 0.00;
                    R_4S1_4S2_200 = 0.00;
                    R_5S1_5S2_200 = 0.00;

                    Y_1S1_1S2_200 =
                        double.parse(_Y_1S1_1S2_200_Controller.text);
                    Y_2S1_2S2_200 =
                        double.parse(_Y_2S1_2S2_200_Controller.text);
                    Y_3S1_3S2_200 = 0.00;
                    Y_4S1_4S2_200 = 0.00;
                    Y_5S1_5S2_200 = 0.00;

                    B_1S1_1S2_200 =
                        double.parse(_B_1S1_1S2_200_Controller.text);
                    B_2S1_2S2_200 =
                        double.parse(_B_2S1_2S2_200_Controller.text);
                    B_3S1_3S2_200 = 0.00;
                    B_4S1_4S2_200 = 0.00;
                    B_5S1_5S2_200 = 0.00;
                    ///////////////////////////////////////////////

                    R_1S1_1S2_400 =
                        double.parse(_R_1S1_1S2_400_Controller.text);
                    R_2S1_2S2_400 =
                        double.parse(_R_2S1_2S2_400_Controller.text);
                    R_3S1_3S2_400 = 0.00;
                    R_4S1_4S2_400 = 0.00;
                    R_5S1_5S2_400 = 0.00;

                    Y_1S1_1S2_400 =
                        double.parse(_Y_1S1_1S2_400_Controller.text);
                    Y_2S1_2S2_400 =
                        double.parse(_Y_2S1_2S2_400_Controller.text);
                    Y_3S1_3S2_400 = 0.00;
                    Y_4S1_4S2_400 = 0.00;
                    Y_5S1_5S2_400 = 0.00;

                    B_1S1_1S2_400 =
                        double.parse(_B_1S1_1S2_400_Controller.text);
                    B_2S1_2S2_400 =
                        double.parse(_B_2S1_2S2_400_Controller.text);
                    B_3S1_3S2_400 = 0.00;
                    B_4S1_4S2_400 = 0.00;
                    B_5S1_5S2_400 = 0.00;

                    ///////////////////////////////////////////////

                    R_1S1_1S2_600 =
                        double.parse(_R_1S1_1S2_600_Controller.text);
                    R_2S1_2S2_600 =
                        double.parse(_R_2S1_2S2_600_Controller.text);
                    R_3S1_3S2_600 = 0.00;
                    R_4S1_4S2_600 = 0.00;
                    R_5S1_5S2_600 = 0.00;

                    Y_1S1_1S2_600 =
                        double.parse(_Y_1S1_1S2_600_Controller.text);
                    Y_2S1_2S2_600 =
                        double.parse(_Y_2S1_2S2_600_Controller.text);
                    Y_3S1_3S2_600 = 0.00;
                    Y_4S1_4S2_600 = 0.00;
                    Y_5S1_5S2_600 = 0.00;

                    B_1S1_1S2_600 =
                        double.parse(_B_1S1_1S2_600_Controller.text);
                    B_2S1_2S2_600 =
                        double.parse(_B_2S1_2S2_600_Controller.text);
                    B_3S1_3S2_600 = 0.00;
                    B_4S1_4S2_600 = 0.00;
                    B_5S1_5S2_600 = 0.00;

                    ///////////////////////////////////////////////

                    R_1S1_1S2_800 =
                        double.parse(_R_1S1_1S2_800_Controller.text);
                    R_2S1_2S2_800 =
                        double.parse(_R_2S1_2S2_800_Controller.text);
                    R_3S1_3S2_800 = 0.00;
                    R_4S1_4S2_800 = 0.00;
                    R_5S1_5S2_800 = 0.00;

                    Y_1S1_1S2_800 =
                        double.parse(_Y_1S1_1S2_800_Controller.text);
                    Y_2S1_2S2_800 =
                        double.parse(_Y_2S1_2S2_800_Controller.text);
                    Y_3S1_3S2_800 = 0.00;
                    Y_4S1_4S2_800 = 0.00;
                    Y_5S1_5S2_800 = 0.00;

                    B_1S1_1S2_800 =
                        double.parse(_B_1S1_1S2_800_Controller.text);
                    B_2S1_2S2_800 =
                        double.parse(_B_2S1_2S2_800_Controller.text);
                    B_3S1_3S2_800 = 0.00;
                    B_4S1_4S2_800 = 0.00;
                    B_5S1_5S2_800 = 0.00;
                  }
                  // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                  if (ntr1.noOfCores == 3) {
                    print('selected Noofcore' + ntr1.noOfCores.toString());
                    R_1S1_1S2_200 =
                        double.parse(_R_1S1_1S2_200_Controller.text);
                    R_2S1_2S2_200 =
                        double.parse(_R_2S1_2S2_200_Controller.text);
                    R_3S1_3S2_200 =
                        double.parse(_R_3S1_3S2_200_Controller.text);
                    R_4S1_4S2_200 = 0.00;
                    R_5S1_5S2_200 = 0.00;

                    Y_1S1_1S2_200 =
                        double.parse(_Y_1S1_1S2_200_Controller.text);
                    Y_2S1_2S2_200 =
                        double.parse(_Y_2S1_2S2_200_Controller.text);
                    Y_3S1_3S2_200 =
                        double.parse(_Y_3S1_3S2_200_Controller.text);
                    Y_4S1_4S2_200 = 0.00;
                    Y_5S1_5S2_200 = 0.00;

                    B_1S1_1S2_200 =
                        double.parse(_B_1S1_1S2_200_Controller.text);
                    B_2S1_2S2_200 =
                        double.parse(_B_2S1_2S2_200_Controller.text);
                    B_3S1_3S2_200 =
                        double.parse(_B_3S1_3S2_200_Controller.text);
                    B_4S1_4S2_200 = 0.00;
                    B_5S1_5S2_200 = 0.00;

                    //////////////////////////////////////////////

                    R_1S1_1S2_400 =
                        double.parse(_R_1S1_1S2_400_Controller.text);
                    R_2S1_2S2_400 =
                        double.parse(_R_2S1_2S2_400_Controller.text);
                    R_3S1_3S2_400 =
                        double.parse(_R_3S1_3S2_400_Controller.text);
                    R_4S1_4S2_400 = 0.00;
                    R_5S1_5S2_400 = 0.00;

                    Y_1S1_1S2_400 =
                        double.parse(_Y_1S1_1S2_400_Controller.text);
                    Y_2S1_2S2_400 =
                        double.parse(_Y_2S1_2S2_400_Controller.text);
                    Y_3S1_3S2_400 =
                        double.parse(_Y_3S1_3S2_400_Controller.text);
                    Y_4S1_4S2_400 = 0.00;
                    Y_5S1_5S2_400 = 0.00;

                    B_1S1_1S2_400 =
                        double.parse(_B_1S1_1S2_400_Controller.text);
                    B_2S1_2S2_400 =
                        double.parse(_B_2S1_2S2_400_Controller.text);
                    B_3S1_3S2_400 =
                        double.parse(_B_3S1_3S2_400_Controller.text);
                    B_4S1_4S2_400 = 0.00;
                    B_5S1_5S2_400 = 0.00;

                    /////////////////////////////////////////////////

                    R_1S1_1S2_600 =
                        double.parse(_R_1S1_1S2_600_Controller.text);
                    R_2S1_2S2_600 =
                        double.parse(_R_2S1_2S2_600_Controller.text);
                    R_3S1_3S2_600 =
                        double.parse(_R_3S1_3S2_600_Controller.text);
                    R_4S1_4S2_600 = 0.00;
                    R_5S1_5S2_600 = 0.00;

                    Y_1S1_1S2_600 =
                        double.parse(_Y_1S1_1S2_600_Controller.text);
                    Y_2S1_2S2_600 =
                        double.parse(_Y_2S1_2S2_600_Controller.text);
                    Y_3S1_3S2_600 =
                        double.parse(_Y_3S1_3S2_600_Controller.text);
                    Y_4S1_4S2_600 = 0.00;
                    Y_5S1_5S2_600 = 0.00;

                    B_1S1_1S2_600 =
                        double.parse(_B_1S1_1S2_600_Controller.text);
                    B_2S1_2S2_600 =
                        double.parse(_B_2S1_2S2_600_Controller.text);
                    B_3S1_3S2_600 =
                        double.parse(_B_3S1_3S2_600_Controller.text);
                    B_4S1_4S2_600 = 0.00;
                    B_5S1_5S2_600 = 0.00;

                    ////////////////////////////////////////////////

                    R_1S1_1S2_800 =
                        double.parse(_R_1S1_1S2_800_Controller.text);
                    R_2S1_2S2_800 =
                        double.parse(_R_2S1_2S2_800_Controller.text);
                    R_3S1_3S2_800 =
                        double.parse(_R_3S1_3S2_800_Controller.text);
                    R_4S1_4S2_800 = 0.00;
                    R_5S1_5S2_800 = 0.00;

                    Y_1S1_1S2_800 =
                        double.parse(_Y_1S1_1S2_800_Controller.text);
                    Y_2S1_2S2_800 =
                        double.parse(_Y_2S1_2S2_800_Controller.text);
                    Y_3S1_3S2_800 =
                        double.parse(_Y_3S1_3S2_800_Controller.text);
                    Y_4S1_4S2_800 = 0.00;
                    Y_5S1_5S2_800 = 0.00;

                    B_1S1_1S2_800 =
                        double.parse(_B_1S1_1S2_800_Controller.text);
                    B_2S1_2S2_800 =
                        double.parse(_B_2S1_2S2_800_Controller.text);
                    B_3S1_3S2_800 =
                        double.parse(_B_3S1_3S2_800_Controller.text);
                    B_4S1_4S2_800 = 0.00;
                    B_5S1_5S2_800 = 0.00;
                  }
                  // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                  if (ntr1.noOfCores == 4) {
                    print('selected Noofcore' + ntr1.noOfCores.toString());
                    R_1S1_1S2_200 =
                        double.parse(_R_1S1_1S2_200_Controller.text);
                    R_2S1_2S2_200 =
                        double.parse(_R_2S1_2S2_200_Controller.text);
                    R_3S1_3S2_200 =
                        double.parse(_R_3S1_3S2_200_Controller.text);
                    R_4S1_4S2_200 =
                        double.parse(_R_4S1_4S2_200_Controller.text);
                    R_5S1_5S2_200 = 0.00;

                    Y_1S1_1S2_200 =
                        double.parse(_Y_1S1_1S2_200_Controller.text);
                    Y_2S1_2S2_200 =
                        double.parse(_Y_2S1_2S2_200_Controller.text);
                    Y_3S1_3S2_200 =
                        double.parse(_Y_3S1_3S2_200_Controller.text);
                    Y_4S1_4S2_200 =
                        double.parse(_Y_4S1_4S2_200_Controller.text);
                    Y_5S1_5S2_200 = 0.00;

                    B_1S1_1S2_200 =
                        double.parse(_B_1S1_1S2_200_Controller.text);
                    B_2S1_2S2_200 =
                        double.parse(_B_2S1_2S2_200_Controller.text);
                    B_3S1_3S2_200 =
                        double.parse(_B_3S1_3S2_200_Controller.text);
                    B_4S1_4S2_200 =
                        double.parse(_B_4S1_4S2_200_Controller.text);
                    B_5S1_5S2_200 = 0.00;

                    ////////////////////////////////////////////////

                    R_1S1_1S2_400 =
                        double.parse(_R_1S1_1S2_400_Controller.text);
                    R_2S1_2S2_400 =
                        double.parse(_R_2S1_2S2_400_Controller.text);
                    R_3S1_3S2_400 =
                        double.parse(_R_3S1_3S2_400_Controller.text);
                    R_4S1_4S2_400 =
                        double.parse(_R_4S1_4S2_400_Controller.text);
                    R_5S1_5S2_400 = 0.00;

                    Y_1S1_1S2_400 =
                        double.parse(_Y_1S1_1S2_400_Controller.text);
                    Y_2S1_2S2_400 =
                        double.parse(_Y_2S1_2S2_400_Controller.text);
                    Y_3S1_3S2_400 =
                        double.parse(_Y_3S1_3S2_400_Controller.text);
                    Y_4S1_4S2_400 =
                        double.parse(_Y_4S1_4S2_400_Controller.text);
                    Y_5S1_5S2_400 = 0.00;

                    B_1S1_1S2_400 =
                        double.parse(_B_1S1_1S2_400_Controller.text);
                    B_2S1_2S2_400 =
                        double.parse(_B_2S1_2S2_400_Controller.text);
                    B_3S1_3S2_400 =
                        double.parse(_B_3S1_3S2_400_Controller.text);
                    B_4S1_4S2_400 =
                        double.parse(_B_4S1_4S2_400_Controller.text);
                    B_5S1_5S2_400 = 0.00;

                    ////////////////////////////////////////////////

                    R_1S1_1S2_600 =
                        double.parse(_R_1S1_1S2_600_Controller.text);
                    R_2S1_2S2_600 =
                        double.parse(_R_2S1_2S2_600_Controller.text);
                    R_3S1_3S2_600 =
                        double.parse(_R_3S1_3S2_600_Controller.text);
                    R_4S1_4S2_600 =
                        double.parse(_R_4S1_4S2_600_Controller.text);
                    R_5S1_5S2_600 = 0.00;

                    Y_1S1_1S2_600 =
                        double.parse(_Y_1S1_1S2_600_Controller.text);
                    Y_2S1_2S2_600 =
                        double.parse(_Y_2S1_2S2_600_Controller.text);
                    Y_3S1_3S2_600 =
                        double.parse(_Y_3S1_3S2_600_Controller.text);
                    Y_4S1_4S2_600 =
                        double.parse(_Y_4S1_4S2_600_Controller.text);
                    Y_5S1_5S2_600 = 0.00;

                    B_1S1_1S2_600 =
                        double.parse(_B_1S1_1S2_600_Controller.text);
                    B_2S1_2S2_600 =
                        double.parse(_B_2S1_2S2_600_Controller.text);
                    B_3S1_3S2_600 =
                        double.parse(_B_3S1_3S2_600_Controller.text);
                    B_4S1_4S2_600 =
                        double.parse(_B_4S1_4S2_600_Controller.text);
                    B_5S1_5S2_600 = 0.00;

                    ///////////////////////////////////////////

                    R_1S1_1S2_800 =
                        double.parse(_R_1S1_1S2_800_Controller.text);
                    R_2S1_2S2_800 =
                        double.parse(_R_2S1_2S2_800_Controller.text);
                    R_3S1_3S2_800 =
                        double.parse(_R_3S1_3S2_800_Controller.text);
                    R_4S1_4S2_800 =
                        double.parse(_R_4S1_4S2_800_Controller.text);
                    R_5S1_5S2_800 = 0.00;

                    Y_1S1_1S2_800 =
                        double.parse(_Y_1S1_1S2_800_Controller.text);
                    Y_2S1_2S2_800 =
                        double.parse(_Y_2S1_2S2_800_Controller.text);
                    Y_3S1_3S2_800 =
                        double.parse(_Y_3S1_3S2_800_Controller.text);
                    Y_4S1_4S2_800 =
                        double.parse(_Y_4S1_4S2_800_Controller.text);
                    Y_5S1_5S2_800 = 0.00;

                    B_1S1_1S2_800 =
                        double.parse(_B_1S1_1S2_800_Controller.text);
                    B_2S1_2S2_800 =
                        double.parse(_B_2S1_2S2_800_Controller.text);
                    B_3S1_3S2_800 =
                        double.parse(_B_3S1_3S2_800_Controller.text);
                    B_4S1_4S2_800 =
                        double.parse(_B_4S1_4S2_800_Controller.text);
                    B_5S1_5S2_800 = 0.00;
                  }
                  // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                  if (ntr1.noOfCores != 5) {
                    // //Values contained based on the condition of cores
                    _R_1S1_1S2_200_Controller.text = R_1S1_1S2_200.toString();
                    _R_2S1_2S2_200_Controller.text = R_2S1_2S2_200.toString();
                    _R_3S1_3S2_200_Controller.text = R_3S1_3S2_200.toString();
                    _R_4S1_4S2_200_Controller.text = R_4S1_4S2_200.toString();
                    _R_5S1_5S2_200_Controller.text = R_5S1_5S2_200.toString();
                    _Y_1S1_1S2_200_Controller.text = Y_1S1_1S2_200.toString();
                    _Y_2S1_2S2_200_Controller.text = Y_2S1_2S2_200.toString();
                    _Y_3S1_3S2_200_Controller.text = Y_3S1_3S2_200.toString();
                    _Y_4S1_4S2_200_Controller.text = Y_4S1_4S2_200.toString();
                    _Y_5S1_5S2_200_Controller.text = Y_5S1_5S2_200.toString();
                    _B_1S1_1S2_200_Controller.text = B_1S1_1S2_200.toString();
                    _B_2S1_2S2_200_Controller.text = B_2S1_2S2_200.toString();
                    _B_3S1_3S2_200_Controller.text = B_3S1_3S2_200.toString();
                    _B_4S1_4S2_200_Controller.text = B_4S1_4S2_200.toString();
                    _B_5S1_5S2_200_Controller.text = B_5S1_5S2_200.toString();
                    _R_1S1_1S2_400_Controller.text = R_1S1_1S2_400.toString();
                    _R_2S1_2S2_400_Controller.text = R_2S1_2S2_400.toString();
                    _R_3S1_3S2_400_Controller.text = R_3S1_3S2_400.toString();
                    _R_4S1_4S2_400_Controller.text = R_4S1_4S2_400.toString();
                    _R_5S1_5S2_400_Controller.text = R_5S1_5S2_400.toString();
                    _Y_1S1_1S2_400_Controller.text = Y_1S1_1S2_400.toString();
                    _Y_2S1_2S2_400_Controller.text = Y_2S1_2S2_400.toString();
                    _Y_3S1_3S2_400_Controller.text = Y_3S1_3S2_400.toString();
                    _Y_4S1_4S2_400_Controller.text = Y_4S1_4S2_400.toString();
                    _Y_5S1_5S2_400_Controller.text = Y_5S1_5S2_400.toString();
                    _B_1S1_1S2_400_Controller.text = B_1S1_1S2_400.toString();
                    _B_2S1_2S2_400_Controller.text = B_2S1_2S2_400.toString();
                    _B_3S1_3S2_400_Controller.text = B_3S1_3S2_400.toString();
                    _B_4S1_4S2_400_Controller.text = B_4S1_4S2_400.toString();
                    _B_5S1_5S2_400_Controller.text = B_5S1_5S2_400.toString();
                    _R_1S1_1S2_600_Controller.text = R_1S1_1S2_600.toString();
                    _R_2S1_2S2_600_Controller.text = R_2S1_2S2_600.toString();
                    _R_3S1_3S2_600_Controller.text = R_3S1_3S2_600.toString();
                    _R_4S1_4S2_600_Controller.text = R_4S1_4S2_600.toString();
                    _R_5S1_5S2_600_Controller.text = R_5S1_5S2_600.toString();
                    _Y_1S1_1S2_600_Controller.text = Y_1S1_1S2_600.toString();
                    _Y_2S1_2S2_600_Controller.text = Y_2S1_2S2_600.toString();
                    _Y_3S1_3S2_600_Controller.text = Y_3S1_3S2_600.toString();
                    _Y_4S1_4S2_600_Controller.text = Y_4S1_4S2_600.toString();
                    _Y_5S1_5S2_600_Controller.text = Y_5S1_5S2_600.toString();
                    _B_1S1_1S2_600_Controller.text = B_1S1_1S2_600.toString();
                    _B_2S1_2S2_600_Controller.text = B_2S1_2S2_600.toString();
                    _B_3S1_3S2_600_Controller.text = B_3S1_3S2_600.toString();
                    _B_4S1_4S2_600_Controller.text = B_4S1_4S2_600.toString();
                    _B_5S1_5S2_600_Controller.text = B_5S1_5S2_600.toString();
                    _R_1S1_1S2_800_Controller.text = R_1S1_1S2_800.toString();
                    _R_2S1_2S2_800_Controller.text = R_2S1_2S2_800.toString();
                    _R_3S1_3S2_800_Controller.text = R_3S1_3S2_800.toString();
                    _R_4S1_4S2_800_Controller.text = R_4S1_4S2_800.toString();
                    _R_5S1_5S2_800_Controller.text = R_5S1_5S2_800.toString();
                    _Y_1S1_1S2_800_Controller.text = Y_1S1_1S2_800.toString();
                    _Y_2S1_2S2_800_Controller.text = Y_2S1_2S2_800.toString();
                    _Y_3S1_3S2_800_Controller.text = Y_3S1_3S2_800.toString();
                    _Y_4S1_4S2_800_Controller.text = Y_4S1_4S2_800.toString();
                    _Y_5S1_5S2_800_Controller.text = Y_5S1_5S2_800.toString();
                    _B_1S1_1S2_800_Controller.text = B_1S1_1S2_800.toString();
                    _B_2S1_2S2_800_Controller.text = B_2S1_2S2_800.toString();
                    _B_3S1_3S2_800_Controller.text = B_3S1_3S2_800.toString();
                    _B_4S1_4S2_800_Controller.text = B_4S1_4S2_800.toString();
                    _B_5S1_5S2_800_Controller.text = B_5S1_5S2_800.toString();
                  }

                  //add to remote database
                  var success_code = 201;
                  var success_code1 = 200;
                  var failed_code = 'Server Connection Lost';
                  //add to remote database
                  var url = Uri.parse('${Env.URL_PREFIX}/ctCoreRTest/' +
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
                    'R_1S1_1S2_200': _R_1S1_1S2_200_Controller.text.toString(),
                    'R_2S1_2S2_200': _R_2S1_2S2_200_Controller.text.toString(),
                    'R_3S1_3S2_200': _R_3S1_3S2_200_Controller.text.toString(),
                    'R_4S1_4S2_200': _R_4S1_4S2_200_Controller.text.toString(),
                    'R_5S1_5S2_200': _R_5S1_5S2_200_Controller.text.toString(),
                    'Y_1S1_1S2_200': _Y_1S1_1S2_200_Controller.text.toString(),
                    'Y_2S1_2S2_200': _Y_2S1_2S2_200_Controller.text.toString(),
                    'Y_3S1_3S2_200': _Y_3S1_3S2_200_Controller.text.toString(),
                    'Y_4S1_4S2_200': _Y_4S1_4S2_200_Controller.text.toString(),
                    'Y_5S1_5S2_200': _Y_5S1_5S2_200_Controller.text.toString(),
                    'B_1S1_1S2_200': _B_1S1_1S2_200_Controller.text.toString(),
                    'B_2S1_2S2_200': _B_2S1_2S2_200_Controller.text.toString(),
                    'B_3S1_3S2_200': _B_3S1_3S2_200_Controller.text.toString(),
                    'B_4S1_4S2_200': _B_4S1_4S2_200_Controller.text.toString(),
                    'B_5S1_5S2_200': _B_5S1_5S2_200_Controller.text.toString(),
                    'R_1S1_1S2_400': _R_1S1_1S2_400_Controller.text.toString(),
                    'R_2S1_2S2_400': _R_2S1_2S2_400_Controller.text.toString(),
                    'R_3S1_3S2_400': _R_3S1_3S2_400_Controller.text.toString(),
                    'R_4S1_4S2_400': _R_4S1_4S2_400_Controller.text.toString(),
                    'R_5S1_5S2_400': _R_5S1_5S2_400_Controller.text.toString(),
                    'Y_1S1_1S2_400': _Y_1S1_1S2_400_Controller.text.toString(),
                    'Y_2S1_2S2_400': _Y_2S1_2S2_400_Controller.text.toString(),
                    'Y_3S1_3S2_400': _Y_3S1_3S2_400_Controller.text.toString(),
                    'Y_4S1_4S2_400': _Y_4S1_4S2_400_Controller.text.toString(),
                    'Y_5S1_5S2_400': _Y_5S1_5S2_400_Controller.text.toString(),
                    'B_1S1_1S2_400': _B_1S1_1S2_400_Controller.text.toString(),
                    'B_2S1_2S2_400': _B_2S1_2S2_400_Controller.text.toString(),
                    'B_3S1_3S2_400': _B_3S1_3S2_400_Controller.text.toString(),
                    'B_4S1_4S2_400': _B_4S1_4S2_400_Controller.text.toString(),
                    'B_5S1_5S2_400': _B_5S1_5S2_400_Controller.text.toString(),
                    'R_1S1_1S2_600': _R_1S1_1S2_600_Controller.text.toString(),
                    'R_2S1_2S2_600': _R_2S1_2S2_600_Controller.text.toString(),
                    'R_3S1_3S2_600': _R_3S1_3S2_600_Controller.text.toString(),
                    'R_4S1_4S2_600': _R_4S1_4S2_600_Controller.text.toString(),
                    'R_5S1_5S2_600': _R_5S1_5S2_600_Controller.text.toString(),
                    'Y_1S1_1S2_600': _Y_1S1_1S2_600_Controller.text.toString(),
                    'Y_2S1_2S2_600': _Y_2S1_2S2_600_Controller.text.toString(),
                    'Y_3S1_3S2_600': _Y_3S1_3S2_600_Controller.text.toString(),
                    'Y_4S1_4S2_600': _Y_4S1_4S2_600_Controller.text.toString(),
                    'Y_5S1_5S2_600': _Y_5S1_5S2_600_Controller.text.toString(),
                    'B_1S1_1S2_600': _B_1S1_1S2_600_Controller.text.toString(),
                    'B_2S1_2S2_600': _B_2S1_2S2_600_Controller.text.toString(),
                    'B_3S1_3S2_600': _B_3S1_3S2_600_Controller.text.toString(),
                    'B_4S1_4S2_600': _B_4S1_4S2_600_Controller.text.toString(),
                    'B_5S1_5S2_600': _B_5S1_5S2_600_Controller.text.toString(),
                    'R_1S1_1S2_800': _R_1S1_1S2_800_Controller.text.toString(),
                    'R_2S1_2S2_800': _R_2S1_2S2_800_Controller.text.toString(),
                    'R_3S1_3S2_800': _R_3S1_3S2_800_Controller.text.toString(),
                    'R_4S1_4S2_800': _R_4S1_4S2_800_Controller.text.toString(),
                    'R_5S1_5S2_800': _R_5S1_5S2_800_Controller.text.toString(),
                    'Y_1S1_1S2_800': _Y_1S1_1S2_800_Controller.text.toString(),
                    'Y_2S1_2S2_800': _Y_2S1_2S2_800_Controller.text.toString(),
                    'Y_3S1_3S2_800': _Y_3S1_3S2_800_Controller.text.toString(),
                    'Y_4S1_4S2_800': _Y_4S1_4S2_800_Controller.text.toString(),
                    'Y_5S1_5S2_800': _Y_5S1_5S2_800_Controller.text.toString(),
                    'B_1S1_1S2_800': _B_1S1_1S2_800_Controller.text.toString(),
                    'B_2S1_2S2_800': _B_2S1_2S2_800_Controller.text.toString(),
                    'B_3S1_3S2_800': _B_3S1_3S2_800_Controller.text.toString(),
                    'B_4S1_4S2_800': _B_4S1_4S2_800_Controller.text.toString(),
                    'B_5S1_5S2_800': _B_5S1_5S2_800_Controller.text.toString(),
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
                    final CTcoreRModel ctrReportToLocal = CTcoreRModel(
                      trNo: int.parse(_Trno_Controller.text),
                      serialNo: _serialNo_Controller.text,
                      R_1S1_1S2_200:
                          double.parse(_R_1S1_1S2_200_Controller.text),
                      R_2S1_2S2_200:
                          double.parse(_R_2S1_2S2_200_Controller.text),
                      R_3S1_3S2_200:
                          double.parse(_R_3S1_3S2_200_Controller.text),
                      R_4S1_4S2_200:
                          double.parse(_R_4S1_4S2_200_Controller.text),
                      R_5S1_5S2_200:
                          double.parse(_R_5S1_5S2_200_Controller.text),
                      Y_1S1_1S2_200:
                          double.parse(_Y_1S1_1S2_200_Controller.text),
                      Y_2S1_2S2_200:
                          double.parse(_Y_2S1_2S2_200_Controller.text),
                      Y_3S1_3S2_200:
                          double.parse(_Y_3S1_3S2_200_Controller.text),
                      Y_4S1_4S2_200:
                          double.parse(_Y_4S1_4S2_200_Controller.text),
                      Y_5S1_5S2_200:
                          double.parse(_Y_5S1_5S2_200_Controller.text),
                      B_1S1_1S2_200:
                          double.parse(_B_1S1_1S2_200_Controller.text),
                      B_2S1_2S2_200:
                          double.parse(_B_2S1_2S2_200_Controller.text),
                      B_3S1_3S2_200:
                          double.parse(_B_3S1_3S2_200_Controller.text),
                      B_4S1_4S2_200:
                          double.parse(_B_4S1_4S2_200_Controller.text),
                      B_5S1_5S2_200:
                          double.parse(_B_5S1_5S2_200_Controller.text),
                      R_1S1_1S2_400:
                          double.parse(_R_1S1_1S2_400_Controller.text),
                      R_2S1_2S2_400:
                          double.parse(_R_2S1_2S2_400_Controller.text),
                      R_3S1_3S2_400:
                          double.parse(_R_3S1_3S2_400_Controller.text),
                      R_4S1_4S2_400:
                          double.parse(_R_4S1_4S2_400_Controller.text),
                      R_5S1_5S2_400:
                          double.parse(_R_5S1_5S2_400_Controller.text),
                      Y_1S1_1S2_400:
                          double.parse(_Y_1S1_1S2_400_Controller.text),
                      Y_2S1_2S2_400:
                          double.parse(_Y_2S1_2S2_400_Controller.text),
                      Y_3S1_3S2_400:
                          double.parse(_Y_3S1_3S2_400_Controller.text),
                      Y_4S1_4S2_400:
                          double.parse(_Y_4S1_4S2_400_Controller.text),
                      Y_5S1_5S2_400:
                          double.parse(_Y_5S1_5S2_400_Controller.text),
                      B_1S1_1S2_400:
                          double.parse(_B_1S1_1S2_400_Controller.text),
                      B_2S1_2S2_400:
                          double.parse(_B_2S1_2S2_400_Controller.text),
                      B_3S1_3S2_400:
                          double.parse(_B_3S1_3S2_400_Controller.text),
                      B_4S1_4S2_400:
                          double.parse(_B_4S1_4S2_400_Controller.text),
                      B_5S1_5S2_400:
                          double.parse(_B_5S1_5S2_400_Controller.text),
                      R_1S1_1S2_600:
                          double.parse(_R_1S1_1S2_600_Controller.text),
                      R_2S1_2S2_600:
                          double.parse(_R_2S1_2S2_600_Controller.text),
                      R_3S1_3S2_600:
                          double.parse(_R_3S1_3S2_600_Controller.text),
                      R_4S1_4S2_600:
                          double.parse(_R_4S1_4S2_600_Controller.text),
                      R_5S1_5S2_600:
                          double.parse(_R_5S1_5S2_600_Controller.text),
                      Y_1S1_1S2_600:
                          double.parse(_Y_1S1_1S2_600_Controller.text),
                      Y_2S1_2S2_600:
                          double.parse(_Y_2S1_2S2_600_Controller.text),
                      Y_3S1_3S2_600:
                          double.parse(_Y_3S1_3S2_600_Controller.text),
                      Y_4S1_4S2_600:
                          double.parse(_Y_4S1_4S2_600_Controller.text),
                      Y_5S1_5S2_600:
                          double.parse(_Y_5S1_5S2_600_Controller.text),
                      B_1S1_1S2_600:
                          double.parse(_B_1S1_1S2_600_Controller.text),
                      B_2S1_2S2_600:
                          double.parse(_B_2S1_2S2_600_Controller.text),
                      B_3S1_3S2_600:
                          double.parse(_B_3S1_3S2_600_Controller.text),
                      B_4S1_4S2_600:
                          double.parse(_B_4S1_4S2_600_Controller.text),
                      B_5S1_5S2_600:
                          double.parse(_B_5S1_5S2_600_Controller.text),
                      R_1S1_1S2_800:
                          double.parse(_R_1S1_1S2_800_Controller.text),
                      R_2S1_2S2_800:
                          double.parse(_R_2S1_2S2_800_Controller.text),
                      R_3S1_3S2_800:
                          double.parse(_R_3S1_3S2_800_Controller.text),
                      R_4S1_4S2_800:
                          double.parse(_R_4S1_4S2_800_Controller.text),
                      R_5S1_5S2_800:
                          double.parse(_R_5S1_5S2_800_Controller.text),
                      Y_1S1_1S2_800:
                          double.parse(_Y_1S1_1S2_800_Controller.text),
                      Y_2S1_2S2_800:
                          double.parse(_Y_2S1_2S2_800_Controller.text),
                      Y_3S1_3S2_800:
                          double.parse(_Y_3S1_3S2_800_Controller.text),
                      Y_4S1_4S2_800:
                          double.parse(_Y_4S1_4S2_800_Controller.text),
                      Y_5S1_5S2_800:
                          double.parse(_Y_5S1_5S2_800_Controller.text),
                      B_1S1_1S2_800:
                          double.parse(_B_1S1_1S2_800_Controller.text),
                      B_2S1_2S2_800:
                          double.parse(_B_2S1_2S2_800_Controller.text),
                      B_3S1_3S2_800:
                          double.parse(_B_3S1_3S2_800_Controller.text),
                      B_4S1_4S2_800:
                          double.parse(_B_4S1_4S2_800_Controller.text),
                      B_5S1_5S2_800:
                          double.parse(_B_5S1_5S2_800_Controller.text),
                      equipmentUsed: selectedValueForEquipmentUse.toString(),
                      databaseID: ntr.databaseID,
                      updateDate: DateTime.now(),
                    );

                    getX((CTcoreRProvider x) =>
                        x.updateCTcoreR(ctrReportToLocal, args['id']));

                    Navigator.popAndPushNamed(context, '/detail_CTcoreR',
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
        builder: (context, raints) {
          if (raints.maxWidth > 400) {
            return Padding(
              padding: EdgeInsets.all(5.0),
              child: Card(
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(150, 10, 150, 10),
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
                        padding: EdgeInsets.fromLTRB(150, 10, 150, 10),
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
                      padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: EquipmentTypeList(),
                    ),
                    Divider(color: Colors.black, thickness: 1),
                    ntr.connectedTap == "0" ||
                            ntr.connectedTap == "S1-S2" ||
                            ntr.connectedTap == "S1-S3" ||
                            ntr.connectedTap == "S1-S4" ||
                            ntr.connectedTap == "S1-S5"
                        ? Column(
                            children: [
                              ntr.noOfCores > 1 || ntr.noOfCores == 1
                                  ? Column(
                                      children: [
                                        newMethod_Core1(
                                            150.0, 0.0, 150.0, 10.0),
                                        ntr.noOfCores > 1 && ntr.noOfCores <= 2
                                            ? Column(
                                                children: [
                                                  newMethod_Core2(
                                                      150.0, 0.0, 150.0, 10.0),
                                                  ntr.noOfCores > 2 &&
                                                          ntr.noOfCores <= 3
                                                      ? Column(
                                                          children: [
                                                            newMethod_Core3(
                                                                150.0,
                                                                0.0,
                                                                150.0,
                                                                10.0),
                                                            ntr.noOfCores > 3 &&
                                                                    ntr.noOfCores <=
                                                                        4
                                                                ? Column(
                                                                    children: [
                                                                      newMethod_Core4(
                                                                          150.0,
                                                                          0.0,
                                                                          150.0,
                                                                          10.0),
                                                                      ntr.noOfCores > 4 ||
                                                                              ntr.noOfCores <= 5
                                                                          ? Column(
                                                                              children: [
                                                                                newMethod_Core5(150.0, 0.0, 150.0, 10.0)
                                                                              ],
                                                                            )
                                                                          : Container()
                                                                    ],
                                                                  )
                                                                : Container()
                                                          ],
                                                        )
                                                      : Container()
                                                ],
                                              )
                                            : Container()
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
            // >>>>>>>>>>>>MOBILE-View>>>>>>>>>>>>>
          } else {
            return Padding(
              padding: EdgeInsets.all(5.0),
              child: Card(
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // ignore: prefer_const_constructors
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: EquipmentTypeList(),
                    ),

                    Divider(color: Colors.black, thickness: 1),
                    ntr.connectedTap == "0" ||
                            ntr.connectedTap == "S1-S2" ||
                            ntr.connectedTap == "S1-S3" ||
                            ntr.connectedTap == "S1-S4" ||
                            ntr.connectedTap == "S1-S5"
                        ? Column(
                            children: [
                              ntr.noOfCores > 1 || ntr.noOfCores == 1
                                  ? Column(
                                      children: [
                                        newMethod_Core1(10.0, 0.0, 10.0, 10.0),
                                        ntr.noOfCores > 1 &&
                                                    ntr.noOfCores > 2 ||
                                                ntr.noOfCores == 2
                                            ? Column(
                                                children: [
                                                  newMethod_Core2(
                                                      10.0, 0.0, 10.0, 10.0),
                                                  ntr.noOfCores > 1 &&
                                                              ntr.noOfCores >
                                                                  2 &&
                                                              ntr.noOfCores >
                                                                  3 ||
                                                          ntr.noOfCores == 3
                                                      ? Column(
                                                          children: [
                                                            newMethod_Core3(
                                                                10.0,
                                                                0.0,
                                                                10.0,
                                                                10.0),
                                                            ntr.noOfCores > 1 &&
                                                                        ntr.noOfCores >
                                                                            2 &&
                                                                        ntr.noOfCores >
                                                                            3 &&
                                                                        ntr.noOfCores >
                                                                            4 ||
                                                                    ntr.noOfCores ==
                                                                        4
                                                                ? Column(
                                                                    children: [
                                                                      newMethod_Core4(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          10.0),
                                                                      ntr.noOfCores > 1 && ntr.noOfCores > 2 && ntr.noOfCores > 3 && ntr.noOfCores > 4 && ntr.noOfCores > 5 ||
                                                                              ntr.noOfCores == 5
                                                                          ? Column(
                                                                              children: [
                                                                                newMethod_Core5(10.0, 0.0, 10.0, 10.0)
                                                                              ],
                                                                            )
                                                                          : Container()
                                                                    ],
                                                                  )
                                                                : Container()
                                                          ],
                                                        )
                                                      : Container()
                                                ],
                                              )
                                            : Container()
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

  Column newMethod_Core1(double l, t, r, b) {
    Map args = {};
    final CTModel ntr = watchOnly((CTProvider x) => x.ctModel);
    final CT_core_Model ntr_core =
        watchOnly((CT_core_Provider x) => x.ct_core_Model);
    final CT_tap_Model ntr_tap =
        watchOnly((CT_tap_Provider x) => x.ct_tap_Model);

    var ratio_value = ntr.pRatio;
    final splitted = ntr.connectedTap.split('-');
    var s1 = splitted[0];
    var s2 = splitted[1];

    return Column(
      children: [
        Text('\nnoOfcore 1 started\n'),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _R_1S1_1S2_200_Controller,
            hintText: 'R_1' +
                s1 +
                '_1' +
                s2 +
                '_' +
                (ratio_value * 1 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _Y_1S1_1S2_200_Controller,
            // hintText: 'Y_1S1_1S2_25%',
            hintText: 'Y_1' +
                s1 +
                '_1' +
                s2 +
                '_' +
                (ratio_value * 1 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _B_1S1_1S2_200_Controller,
            // hintText: 'B_1S1_1S2_25%',
            hintText: 'B_1' +
                s1 +
                '_1' +
                s2 +
                '_' +
                (ratio_value * 1 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _R_1S1_1S2_400_Controller,
            // hintText: 'R_1S1_1S2_50%',
            hintText: 'R_1' +
                s1 +
                '_1' +
                s2 +
                '_' +
                (ratio_value * 2 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _Y_1S1_1S2_400_Controller,
            // hintText: 'Y_1S1_1S2_50%',
            hintText: 'Y_1' +
                s1 +
                '_1' +
                s2 +
                '_' +
                (ratio_value * 2 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _B_1S1_1S2_400_Controller,
            // hintText: 'B_1S1_1S2_50%',
            hintText: 'B_1' +
                s1 +
                '_1' +
                s2 +
                '_' +
                (ratio_value * 2 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _R_1S1_1S2_600_Controller,
            // hintText: 'R_1S1_1S2_75%',
            hintText: 'R_1' +
                s1 +
                '_1' +
                s2 +
                '_' +
                (ratio_value * 3 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _Y_1S1_1S2_600_Controller,
            // hintText: 'Y_1S1_1S2_75%',
            hintText: 'Y_1' +
                s1 +
                '_1' +
                s2 +
                '_' +
                (ratio_value * 3 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _B_1S1_1S2_600_Controller,
            // hintText: 'B_1S1_1S2_75%',
            hintText: 'B_1' +
                s1 +
                '_1' +
                s2 +
                '_' +
                (ratio_value * 3 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _R_1S1_1S2_800_Controller,
            // hintText: 'R_1S1_1S2_100%',
            hintText: 'R_1' +
                s1 +
                '_1' +
                s2 +
                '_' +
                (ratio_value * 4 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _Y_1S1_1S2_800_Controller,
            // hintText: 'Y_1S1_1S2_100%',
            hintText: 'Y_1' +
                s1 +
                '_1' +
                s2 +
                '_' +
                (ratio_value * 4 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _B_1S1_1S2_800_Controller,
            // hintText: 'B_1S1_1S2_100%',
            hintText: 'B_1' +
                s1 +
                '_1' +
                s2 +
                '_' +
                (ratio_value * 4 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
      ],
    );
  }

  //------------------------------------------------------------------

  Column newMethod_Core2(double l, t, r, b) {
    Map args = {};
    final CTModel ntr = watchOnly((CTProvider x) => x.ctModel);
    final CT_core_Model ntr_core =
        watchOnly((CT_core_Provider x) => x.ct_core_Model);
    final CT_tap_Model ntr_tap =
        watchOnly((CT_tap_Provider x) => x.ct_tap_Model);

    var ratio_value = ntr.pRatio;
    final splitted = ntr.connectedTap.split('-');
    var s1 = splitted[0];
    var s2 = splitted[1];
    return Column(
      children: [
        Text('\nnoOfcore 2 started\n'),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _R_2S1_2S2_200_Controller,
            // hintText: 'R_2S1_2S2_25%',
            hintText: 'R_2' +
                s1 +
                '_2' +
                s2 +
                '_' +
                (ratio_value * 1 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _Y_2S1_2S2_200_Controller,
            // hintText: 'Y_2S1_2S2_25%',
            hintText: 'Y_2' +
                s1 +
                '_2' +
                s2 +
                '_' +
                (ratio_value * 1 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _B_2S1_2S2_200_Controller,
            // hintText: 'B_2S1_2S2_25%',
            hintText: 'B_2' +
                s1 +
                '_2' +
                s2 +
                '_' +
                (ratio_value * 1 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _R_2S1_2S2_400_Controller,
            // hintText: 'R_2S1_2S2_50%',
            hintText: 'R_2' +
                s1 +
                '_2' +
                s2 +
                '_' +
                (ratio_value * 2 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _Y_2S1_2S2_400_Controller,
            // hintText: 'Y_2S1_2S2_50%',
            hintText: 'Y_2' +
                s1 +
                '_2' +
                s2 +
                '_' +
                (ratio_value * 2 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _B_2S1_2S2_400_Controller,
            // hintText: 'B_2S1_2S2_50%',
            hintText: 'B_2' +
                s1 +
                '_2' +
                s2 +
                '_' +
                (ratio_value * 2 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _R_2S1_2S2_600_Controller,
            // hintText: 'R_2S1_2S2_75%',
            hintText: 'R_2' +
                s1 +
                '_2' +
                s2 +
                '_' +
                (ratio_value * 3 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _Y_2S1_2S2_600_Controller,
            // hintText: 'Y_2S1_2S2_75%',
            hintText: 'Y_2' +
                s1 +
                '_2' +
                s2 +
                '_' +
                (ratio_value * 3 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _B_2S1_2S2_600_Controller,
            // hintText: 'B_2S1_2S2_75%',
            hintText: 'B_2' +
                s1 +
                '_2' +
                s2 +
                '_' +
                (ratio_value * 3 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _R_2S1_2S2_800_Controller,
            // hintText: 'R_2S1_2S2_100%',
            hintText: 'R_2' +
                s1 +
                '_2' +
                s2 +
                '_' +
                (ratio_value * 4 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _Y_2S1_2S2_800_Controller,
            // hintText: 'Y_2S1_2S2_100%',
            hintText: 'Y_2' +
                s1 +
                '_2' +
                s2 +
                '_' +
                (ratio_value * 4 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _B_2S1_2S2_800_Controller,
            // hintText: 'B_2S1_2S2_100%',
            hintText: 'B_2' +
                s1 +
                '_2' +
                s2 +
                '_' +
                (ratio_value * 4 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
      ],
    );
  }

  //----------------------------------------------------
  Column newMethod_Core3(double l, t, r, b) {
    Map args = {};
    final CTModel ntr = watchOnly((CTProvider x) => x.ctModel);
    final CT_core_Model ntr_core =
        watchOnly((CT_core_Provider x) => x.ct_core_Model);
    final CT_tap_Model ntr_tap =
        watchOnly((CT_tap_Provider x) => x.ct_tap_Model);

    var ratio_value = ntr.pRatio;
    final splitted = ntr.connectedTap.split('-');
    var s1 = splitted[0];
    var s2 = splitted[1];
    return Column(
      children: [
        Text('\nnoOfcore 3 started\n'),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _R_3S1_3S2_200_Controller,
            // hintText: 'R_3S1_3S2_25%',
            hintText: 'R_3' +
                s1 +
                '_3' +
                s2 +
                '_' +
                (ratio_value * 1 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _Y_3S1_3S2_200_Controller,
            // hintText: 'Y_3S1_3S2_25%',
            hintText: 'Y_3' +
                s1 +
                '_3' +
                s2 +
                '_' +
                (ratio_value * 1 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _B_3S1_3S2_200_Controller,
            // hintText: 'B_3S1_3S2_25%',
            hintText: 'B_3' +
                s1 +
                '_3' +
                s2 +
                '_' +
                (ratio_value * 1 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _R_3S1_3S2_400_Controller,
            // hintText: 'R_3S1_3S2_50%',
            hintText: 'R_3' +
                s1 +
                '_3' +
                s2 +
                '_' +
                (ratio_value * 2 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _Y_3S1_3S2_400_Controller,
            // hintText: 'Y_3S1_3S2_50%',
            hintText: 'Y_3' +
                s1 +
                '_3' +
                s2 +
                '_' +
                (ratio_value * 2 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _B_3S1_3S2_400_Controller,
            // hintText: 'B_3S1_3S2_50%',
            hintText: 'B_3' +
                s1 +
                '_3' +
                s2 +
                '_' +
                (ratio_value * 2 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _R_3S1_3S2_600_Controller,
            // hintText: 'R_3S1_3S2_75%',
            hintText: 'R_3' +
                s1 +
                '_3' +
                s2 +
                '_' +
                (ratio_value * 3 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _Y_3S1_3S2_600_Controller,
            // hintText: 'Y_3S1_3S2_75%',
            hintText: 'Y_3' +
                s1 +
                '_3' +
                s2 +
                '_' +
                (ratio_value * 3 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _B_3S1_3S2_600_Controller,
            // hintText: 'B_3S1_3S2_75%',
            hintText: 'B_3' +
                s1 +
                '_3' +
                s2 +
                '_' +
                (ratio_value * 3 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _R_3S1_3S2_800_Controller,
            // hintText: 'R_3S1_3S2_100%',
            hintText: 'R_3' +
                s1 +
                '_3' +
                s2 +
                '_' +
                (ratio_value * 4 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _Y_3S1_3S2_800_Controller,
            // hintText: 'Y_3S1_3S2_100%',
            hintText: 'Y_3' +
                s1 +
                '_3' +
                s2 +
                '_' +
                (ratio_value * 4 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _B_3S1_3S2_800_Controller,
            // hintText: 'B_3S1_3S2_100%',
            hintText: 'B_3' +
                s1 +
                '_3' +
                s2 +
                '_' +
                (ratio_value * 4 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
      ],
    );
  }
  //----------------------------------------------------------

  Column newMethod_Core4(double l, t, r, b) {
    Map args = {};
    final CTModel ntr = watchOnly((CTProvider x) => x.ctModel);
    final CT_core_Model ntr_core =
        watchOnly((CT_core_Provider x) => x.ct_core_Model);
    final CT_tap_Model ntr_tap =
        watchOnly((CT_tap_Provider x) => x.ct_tap_Model);

    var ratio_value = ntr.pRatio;
    final splitted = ntr.connectedTap.split('-');
    var s1 = splitted[0];
    var s2 = splitted[1];
    return Column(
      children: [
        Text('\nnoOfcore 4 started\n'),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _R_4S1_4S2_200_Controller,
            // hintText: 'R_4S1_4S2_25%',
            hintText: 'R_4' +
                s1 +
                '_4' +
                s2 +
                '_' +
                (ratio_value * 1 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _Y_4S1_4S2_200_Controller,
            // hintText: 'Y_4S1_4S2_25%',
            hintText: 'Y_4' +
                s1 +
                '_4' +
                s2 +
                '_' +
                (ratio_value * 1 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _B_4S1_4S2_200_Controller,
            // hintText: 'B_4S1_4S2_25%',
            hintText: 'B_4' +
                s1 +
                '_4' +
                s2 +
                '_' +
                (ratio_value * 1 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _R_4S1_4S2_400_Controller,
            // hintText: 'R_4S1_4S2_50%',
            hintText: 'R_4' +
                s1 +
                '_4' +
                s2 +
                '_' +
                (ratio_value * 2 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _Y_4S1_4S2_400_Controller,
            // hintText: 'Y_4S1_4S2_50%',
            hintText: 'Y_4' +
                s1 +
                '_4' +
                s2 +
                '_' +
                (ratio_value * 2 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _B_4S1_4S2_400_Controller,
            // hintText: 'B_4S1_4S2_50%',
            hintText: 'B_4' +
                s1 +
                '_4' +
                s2 +
                '_' +
                (ratio_value * 2 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _R_4S1_4S2_600_Controller,
            // hintText: 'R_4S1_4S2_75%',
            hintText: 'R_4' +
                s1 +
                '_4' +
                s2 +
                '_' +
                (ratio_value * 3 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _Y_4S1_4S2_600_Controller,
            // hintText: 'Y_4S1_4S2_75%',
            hintText: 'Y_4' +
                s1 +
                '_4' +
                s2 +
                '_' +
                (ratio_value * 3 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _B_4S1_4S2_600_Controller,
            // hintText: 'B_4S1_4S2_75%',
            hintText: 'B_4' +
                s1 +
                '_4' +
                s2 +
                '_' +
                (ratio_value * 3 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _R_4S1_4S2_800_Controller,
            // hintText: 'R_4S1_4S2_100%',
            hintText: 'R_4' +
                s1 +
                '_4' +
                s2 +
                '_' +
                (ratio_value * 4 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _Y_4S1_4S2_800_Controller,
            // hintText: 'Y_4S1_4S2_100%',
            hintText: 'Y_4' +
                s1 +
                '_4' +
                s2 +
                '_' +
                (ratio_value * 4 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _B_4S1_4S2_800_Controller,
            // hintText: 'B_4S1_4S2_100%',
            hintText: 'B_4' +
                s1 +
                '_4' +
                s2 +
                '_' +
                (ratio_value * 4 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
      ],
    );
  }

  Column newMethod_Core5(double l, t, r, b) {
    Map args = {};
    final CTModel ntr = watchOnly((CTProvider x) => x.ctModel);
    final CT_core_Model ntr_core =
        watchOnly((CT_core_Provider x) => x.ct_core_Model);
    final CT_tap_Model ntr_tap =
        watchOnly((CT_tap_Provider x) => x.ct_tap_Model);

    var ratio_value = ntr.pRatio;
    final splitted = ntr.connectedTap.split('-');
    var s1 = splitted[0];
    var s2 = splitted[1];
    return Column(
      children: [
        Text('\nnoOfcore 5 started\n'),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _R_5S1_5S2_200_Controller,
            // hintText: 'R_5S1_5S2_25%',
            hintText: 'R_5' +
                s1 +
                '_5' +
                s2 +
                '_' +
                (ratio_value * 1 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _Y_5S1_5S2_200_Controller,
            // hintText: 'Y_5S1_5S2_25%',
            hintText: 'Y_5' +
                s1 +
                '_5' +
                s2 +
                '_' +
                (ratio_value * 1 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _B_5S1_5S2_200_Controller,
            // hintText: 'B_5S1_5S2_25%',
            hintText: 'B_5' +
                s1 +
                '_5' +
                s2 +
                '_' +
                (ratio_value * 1 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _R_5S1_5S2_400_Controller,
            // hintText: 'R_5S1_5S2_50%',
            hintText: 'R_5' +
                s1 +
                '_5' +
                s2 +
                '_' +
                (ratio_value * 2 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _Y_5S1_5S2_400_Controller,
            // hintText: 'Y_5S1_5S2_50%',
            hintText: 'Y_5' +
                s1 +
                '_5' +
                s2 +
                '_' +
                (ratio_value * 2 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _B_5S1_5S2_400_Controller,
            // hintText: 'B_5S1_5S2_50%',
            hintText: 'B_5' +
                s1 +
                '_5' +
                s2 +
                '_' +
                (ratio_value * 2 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _R_5S1_5S2_600_Controller,
            // hintText: 'R_5S1_5S2_75%',
            hintText: 'R_5' +
                s1 +
                '_5' +
                s2 +
                '_' +
                (ratio_value * 3 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _Y_5S1_5S2_600_Controller,
            // hintText: 'Y_5S1_5S2_75%',
            hintText: 'Y_5' +
                s1 +
                '_5' +
                s2 +
                '_' +
                (ratio_value * 3 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _B_5S1_5S2_600_Controller,
            // hintText: 'B_5S1_5S2_75%',
            hintText: 'B_5' +
                s1 +
                '_5' +
                s2 +
                '_' +
                (ratio_value * 3 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _R_5S1_5S2_800_Controller,
            // hintText: 'R_5S1_5S2_100%',
            hintText: 'R_5' +
                s1 +
                '_5' +
                s2 +
                '_' +
                (ratio_value * 4 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _Y_5S1_5S2_800_Controller,
            // hintText: 'Y_5S1_5S2_100%',
            hintText: 'Y_5' +
                s1 +
                '_5' +
                s2 +
                '_' +
                (ratio_value * 4 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _B_5S1_5S2_800_Controller,
            // hintText: 'B_5S1_5S2_100%',
            hintText: 'B_5' +
                s1 +
                '_5' +
                s2 +
                '_' +
                (ratio_value * 4 / 4).toStringAsFixed(0),
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
      ],
    );
  }
}
