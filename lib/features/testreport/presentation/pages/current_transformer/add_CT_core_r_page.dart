// ignore_for_file: missing_return, missing_required_param, non_ant_identifier_names, unused_field, prefer__ructors, prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/Auser_input_validation_exnt.dart/validation_extension_methods.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/ct_provider/ct_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/CT/ct_core_model.dart';
import '../../../data/models/equipment/CT/ct_core_r_model.dart';
import '../../../data/models/equipment/CT/ct_model.dart';
import '../../../data/models/equipment/CT/ct_tap_model.dart';
import '../../providers/ct_provider/ct_core_provider.dart';
import '../../providers/ct_provider/ct_core_r_provider.dart';
import '../../providers/ct_provider/ct_tap_provider.dart';
import '../../widgets/custom_text_form_field_For_number.dart';
import '../dropdown_All/equipmentUsed.dart';

final _formKey = GlobalKey<FormState>();

class Add_CTcoreR extends StatelessWidget with GetItMixin {
  Map args = {};
  int CT_ID;
  int TR_ID;

  Add_CTcoreR(this.args, {Key key}) : super(key: key);

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
    var mob = Text('Add CTcore R ', style: TextStyle(fontSize: 17));
    var desk = Text('Add CTcore R ', style: TextStyle(fontSize: 20));
    var accToken = sl<GoogleSignInController>().ACCESS_TOKEN;
    var refToken = sl<GoogleSignInController>().REFRESH_TOKEN;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: LayoutBuilder(builder: (context, raints) {
          if (raints.maxWidth > 400) {
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
                  if (ntr.noOfCores == 1) {
                    print('selected Noofcore' + ntr.noOfCores.toString());
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
                  if (ntr.noOfCores == 2) {
                    print('selected Noofcore' + ntr.noOfCores.toString());
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
                  if (ntr.noOfCores == 3) {
                    print('selected Noofcore' + ntr.noOfCores.toString());
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
                  if (ntr.noOfCores == 4) {
                    print('selected Noofcore' + ntr.noOfCores.toString());
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

                  // add to local database
                  final CTcoreRModel CTcoreRtoLocal = CTcoreRModel(
                    trNo: int.parse(_Trno_Controller.text),
                    serialNo: _serialNo_Controller.text,
                    R_1S1_1S2_200: double.parse(_R_1S1_1S2_200_Controller.text),
                    R_2S1_2S2_200: double.parse(_R_2S1_2S2_200_Controller.text),
                    R_3S1_3S2_200: double.parse(_R_3S1_3S2_200_Controller.text),
                    R_4S1_4S2_200: double.parse(_R_4S1_4S2_200_Controller.text),
                    R_5S1_5S2_200: double.parse(_R_5S1_5S2_200_Controller.text),
                    Y_1S1_1S2_200: double.parse(_Y_1S1_1S2_200_Controller.text),
                    Y_2S1_2S2_200: double.parse(_Y_2S1_2S2_200_Controller.text),
                    Y_3S1_3S2_200: double.parse(_Y_3S1_3S2_200_Controller.text),
                    Y_4S1_4S2_200: double.parse(_Y_4S1_4S2_200_Controller.text),
                    Y_5S1_5S2_200: double.parse(_Y_5S1_5S2_200_Controller.text),
                    B_1S1_1S2_200: double.parse(_B_1S1_1S2_200_Controller.text),
                    B_2S1_2S2_200: double.parse(_B_2S1_2S2_200_Controller.text),
                    B_3S1_3S2_200: double.parse(_B_3S1_3S2_200_Controller.text),
                    B_4S1_4S2_200: double.parse(_B_4S1_4S2_200_Controller.text),
                    B_5S1_5S2_200: double.parse(_B_5S1_5S2_200_Controller.text),
                    R_1S1_1S2_400: double.parse(_R_1S1_1S2_400_Controller.text),
                    R_2S1_2S2_400: double.parse(_R_2S1_2S2_400_Controller.text),
                    R_3S1_3S2_400: double.parse(_R_3S1_3S2_400_Controller.text),
                    R_4S1_4S2_400: double.parse(_R_4S1_4S2_400_Controller.text),
                    R_5S1_5S2_400: double.parse(_R_5S1_5S2_400_Controller.text),
                    Y_1S1_1S2_400: double.parse(_Y_1S1_1S2_400_Controller.text),
                    Y_2S1_2S2_400: double.parse(_Y_2S1_2S2_400_Controller.text),
                    Y_3S1_3S2_400: double.parse(_Y_3S1_3S2_400_Controller.text),
                    Y_4S1_4S2_400: double.parse(_Y_4S1_4S2_400_Controller.text),
                    Y_5S1_5S2_400: double.parse(_Y_5S1_5S2_400_Controller.text),
                    B_1S1_1S2_400: double.parse(_B_1S1_1S2_400_Controller.text),
                    B_2S1_2S2_400: double.parse(_B_2S1_2S2_400_Controller.text),
                    B_3S1_3S2_400: double.parse(_B_3S1_3S2_400_Controller.text),
                    B_4S1_4S2_400: double.parse(_B_4S1_4S2_400_Controller.text),
                    B_5S1_5S2_400: double.parse(_B_5S1_5S2_400_Controller.text),
                    R_1S1_1S2_600: double.parse(_R_1S1_1S2_600_Controller.text),
                    R_2S1_2S2_600: double.parse(_R_2S1_2S2_600_Controller.text),
                    R_3S1_3S2_600: double.parse(_R_3S1_3S2_600_Controller.text),
                    R_4S1_4S2_600: double.parse(_R_4S1_4S2_600_Controller.text),
                    R_5S1_5S2_600: double.parse(_R_5S1_5S2_600_Controller.text),
                    Y_1S1_1S2_600: double.parse(_Y_1S1_1S2_600_Controller.text),
                    Y_2S1_2S2_600: double.parse(_Y_2S1_2S2_600_Controller.text),
                    Y_3S1_3S2_600: double.parse(_Y_3S1_3S2_600_Controller.text),
                    Y_4S1_4S2_600: double.parse(_Y_4S1_4S2_600_Controller.text),
                    Y_5S1_5S2_600: double.parse(_Y_5S1_5S2_600_Controller.text),
                    B_1S1_1S2_600: double.parse(_B_1S1_1S2_600_Controller.text),
                    B_2S1_2S2_600: double.parse(_B_2S1_2S2_600_Controller.text),
                    B_3S1_3S2_600: double.parse(_B_3S1_3S2_600_Controller.text),
                    B_4S1_4S2_600: double.parse(_B_4S1_4S2_600_Controller.text),
                    B_5S1_5S2_600: double.parse(_B_5S1_5S2_600_Controller.text),
                    R_1S1_1S2_800: double.parse(_R_1S1_1S2_800_Controller.text),
                    R_2S1_2S2_800: double.parse(_R_2S1_2S2_800_Controller.text),
                    R_3S1_3S2_800: double.parse(_R_3S1_3S2_800_Controller.text),
                    R_4S1_4S2_800: double.parse(_R_4S1_4S2_800_Controller.text),
                    R_5S1_5S2_800: double.parse(_R_5S1_5S2_800_Controller.text),
                    Y_1S1_1S2_800: double.parse(_Y_1S1_1S2_800_Controller.text),
                    Y_2S1_2S2_800: double.parse(_Y_2S1_2S2_800_Controller.text),
                    Y_3S1_3S2_800: double.parse(_Y_3S1_3S2_800_Controller.text),
                    Y_4S1_4S2_800: double.parse(_Y_4S1_4S2_800_Controller.text),
                    Y_5S1_5S2_800: double.parse(_Y_5S1_5S2_800_Controller.text),
                    B_1S1_1S2_800: double.parse(_B_1S1_1S2_800_Controller.text),
                    B_2S1_2S2_800: double.parse(_B_2S1_2S2_800_Controller.text),
                    B_3S1_3S2_800: double.parse(_B_3S1_3S2_800_Controller.text),
                    B_4S1_4S2_800: double.parse(_B_4S1_4S2_800_Controller.text),
                    B_5S1_5S2_800: double.parse(_B_5S1_5S2_800_Controller.text),
                    equipmentUsed: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,
                    updateDate: DateTime.now(),
                  );
                  print(CTcoreRtoLocal);
                  print(CTcoreRtoLocal.trNo);
                  getX((CTcoreRProvider x) => x.addCTcoreR(CTcoreRtoLocal));
                  watchOnly((CTcoreRProvider x) => {});
                  Navigator.popAndPushNamed(context, '/detail_CT', arguments: {
                    'id': args['CT_ID'],
                    'ctDatabaseID': CT_ID,
                    'trDatabaseID': TR_ID,
                  });
                }
              },
              icon: Icon(Icons.save)),
        ],
      ),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(5.0),
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
