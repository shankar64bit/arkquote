// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/Auser_input_validation_exnt.dart/validation_extension_methods.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/equipmentUsed.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/AT/AT_mb_model.dart';
import '../../../data/models/equipment/AT/AT_model.dart';
import '../../providers/at_provider/at_mb_provider.dart';
import '../../providers/at_provider/at_provider.dart';
import '../../widgets/custom_text_form_field_For_number.dart';
import '../dropdown_All/a_as_simplified_function.dart';

final _formKey = GlobalKey<FormState>();
// int min = 0;
// int max;

class Add_At_mb_Details extends StatelessWidget with GetItMixin {
  Map args = {};
  int AT_ID;
  int TR_ID;

  Add_At_mb_Details(this.args, {Key key}) : super(key: key);

  final TextEditingController _trNo_controller = TextEditingController();
  final TextEditingController _serialNo_controller = TextEditingController();
  final TextEditingController _ry_hv_1u_1v_controller = TextEditingController();
  final TextEditingController _ry_hv_1v_1w_controller = TextEditingController();
  final TextEditingController _ry_hv_1w_1u_controller = TextEditingController();
  final TextEditingController _ry_hv_1u_1n_controller = TextEditingController();
  final TextEditingController _ry_hv_1v_1n_controller = TextEditingController();
  final TextEditingController _ry_hv_1w_1n_controller = TextEditingController();
  final TextEditingController _ry_lv_2u_2v_controller = TextEditingController();
  final TextEditingController _ry_lv_2v_2w_controller = TextEditingController();
  final TextEditingController _ry_lv_2w_2u_controller = TextEditingController();
  final TextEditingController _ry_lv_2u_2n_controller = TextEditingController();
  final TextEditingController _ry_lv_2v_2n_controller = TextEditingController();
  final TextEditingController _ry_lv_2w_2n_controller = TextEditingController();
  final TextEditingController _yb_hv_1u_1v_controller = TextEditingController();
  final TextEditingController _yb_hv_1v_1w_controller = TextEditingController();
  final TextEditingController _yb_hv_1w_1u_controller = TextEditingController();
  final TextEditingController _yb_hv_1u_1n_controller = TextEditingController();
  final TextEditingController _yb_hv_1v_1n_controller = TextEditingController();
  final TextEditingController _yb_hv_1w_1n_controller = TextEditingController();
  final TextEditingController _yb_lv_2u_2v_controller = TextEditingController();
  final TextEditingController _yb_lv_2v_2w_controller = TextEditingController();
  final TextEditingController _yb_lv_2w_2u_controller = TextEditingController();
  final TextEditingController _yb_lv_2u_2n_controller = TextEditingController();
  final TextEditingController _yb_lv_2v_2n_controller = TextEditingController();
  final TextEditingController _yb_lv_2w_2n_controller = TextEditingController();
  final TextEditingController _br_hv_1u_1v_controller = TextEditingController();
  final TextEditingController _br_hv_1v_1w_controller = TextEditingController();
  final TextEditingController _br_hv_1w_1u_controller = TextEditingController();
  final TextEditingController _br_hv_1u_1n_controller = TextEditingController();
  final TextEditingController _br_hv_1v_1n_controller = TextEditingController();
  final TextEditingController _br_hv_1w_1n_controller = TextEditingController();
  final TextEditingController _br_lv_2u_2v_controller = TextEditingController();
  final TextEditingController _br_lv_2v_2w_controller = TextEditingController();
  final TextEditingController _br_lv_2w_2u_controller = TextEditingController();
  final TextEditingController _br_lv_2u_2n_controller = TextEditingController();
  final TextEditingController _br_lv_2v_2n_controller = TextEditingController();
  final TextEditingController _br_lv_2w_2n_controller = TextEditingController();

  setTrNo() {
    _trNo_controller.text = args['TrNo'].toString();
    _serialNo_controller.text = args['serial_no_bph'].toString();
    AT_ID = args['atDatabaseID'];
    TR_ID = args['trDatabaseID'];
  }

  @override
  Widget build(BuildContext context) {
    final ATModel ntr = watchOnly((ATProvider x) => x.atModel);
    setTrNo();
    var mob = Text('Add AT_mb Details', style: TextStyle(fontSize: 17));
    var desk = Text('Add AT_mb Details', style: TextStyle(fontSize: 20));
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

                  double ry_hv_1u_1v;
                  double ry_hv_1v_1w;
                  double ry_hv_1w_1u;
                  double ry_hv_1u_1n;
                  double ry_hv_1v_1n;
                  double ry_hv_1w_1n;
                  double ry_lv_2u_2v;
                  double ry_lv_2v_2w;
                  double ry_lv_2w_2u;
                  double ry_lv_2u_2n;
                  double ry_lv_2v_2n;
                  double ry_lv_2w_2n;
                  double yb_hv_1u_1v;
                  double yb_hv_1v_1w;
                  double yb_hv_1w_1u;
                  double yb_hv_1u_1n;
                  double yb_hv_1v_1n;
                  double yb_hv_1w_1n;
                  double yb_lv_2u_2v;
                  double yb_lv_2v_2w;
                  double yb_lv_2w_2u;
                  double yb_lv_2u_2n;
                  double yb_lv_2v_2n;
                  double yb_lv_2w_2n;
                  double br_hv_1u_1v;
                  double br_hv_1v_1w;
                  double br_hv_1w_1u;
                  double br_hv_1u_1n;
                  double br_hv_1v_1n;
                  double br_hv_1w_1n;
                  double br_lv_2u_2v;
                  double br_lv_2v_2w;
                  double br_lv_2w_2u;
                  double br_lv_2u_2n;
                  double br_lv_2v_2n;
                  double br_lv_2w_2n;

                  if (ntr.vectorGroup == "Dd0" || ntr.vectorGroup == "Dd6") {
                    ry_hv_1u_1v = double.parse(_ry_hv_1u_1v_controller.text);
                    ry_hv_1v_1w = double.parse(_ry_hv_1v_1w_controller.text);
                    ry_hv_1w_1u = double.parse(_ry_hv_1w_1u_controller.text);

                    ry_hv_1u_1n = 0.00;
                    ry_hv_1v_1n = 0.00;
                    ry_hv_1w_1n = 0.00;

                    ry_lv_2u_2v = double.parse(_ry_lv_2u_2v_controller.text);
                    ry_lv_2v_2w = double.parse(_ry_lv_2v_2w_controller.text);
                    ry_lv_2w_2u = double.parse(_ry_lv_2w_2u_controller.text);

                    ry_lv_2u_2n = 0.00;
                    ry_lv_2v_2n = 0.00;
                    ry_lv_2w_2n = 0.00;

                    yb_hv_1u_1v = double.parse(_yb_hv_1u_1v_controller.text);
                    yb_hv_1v_1w = double.parse(_yb_hv_1v_1w_controller.text);
                    yb_hv_1w_1u = double.parse(_yb_hv_1w_1u_controller.text);

                    yb_hv_1u_1n = 0.00;
                    yb_hv_1v_1n = 0.00;
                    yb_hv_1w_1n = 0.00;

                    yb_lv_2u_2v = double.parse(_yb_lv_2u_2v_controller.text);
                    yb_lv_2v_2w = double.parse(_yb_lv_2v_2w_controller.text);
                    yb_lv_2w_2u = double.parse(_yb_lv_2w_2u_controller.text);

                    yb_lv_2u_2n = 0.00;
                    yb_lv_2v_2n = 0.00;
                    yb_lv_2w_2n = 0.00;

                    br_hv_1u_1v = double.parse(_br_hv_1u_1v_controller.text);
                    br_hv_1v_1w = double.parse(_br_hv_1v_1w_controller.text);
                    br_hv_1w_1u = double.parse(_br_hv_1w_1u_controller.text);

                    br_hv_1u_1n = 0.00;
                    br_hv_1v_1n = 0.00;
                    br_hv_1w_1n = 0.00;

                    br_lv_2u_2v = double.parse(_br_lv_2u_2v_controller.text);
                    br_lv_2v_2w = double.parse(_br_lv_2v_2w_controller.text);
                    br_lv_2w_2u = double.parse(_br_lv_2w_2u_controller.text);

                    br_lv_2u_2n = 0.00;
                    br_lv_2v_2n = 0.00;
                    br_lv_2w_2n = 0.00;
                  }
                  if (ntr.vectorGroup == "Dyn1" || ntr.vectorGroup == "Dyn11") {
                    ry_hv_1u_1v = double.parse(_ry_hv_1u_1v_controller.text);
                    ry_hv_1v_1w = double.parse(_ry_hv_1v_1w_controller.text);
                    ry_hv_1w_1u = double.parse(_ry_hv_1w_1u_controller.text);

                    ry_hv_1u_1n = 0.00;
                    ry_hv_1v_1n = 0.00;
                    ry_hv_1w_1n = 0.00;

                    ry_lv_2u_2v = double.parse(_ry_lv_2u_2v_controller.text);
                    ry_lv_2v_2w = double.parse(_ry_lv_2v_2w_controller.text);
                    ry_lv_2w_2u = double.parse(_ry_lv_2w_2u_controller.text);

                    ry_lv_2u_2n = double.parse(_ry_lv_2u_2n_controller.text);
                    ry_lv_2v_2n = double.parse(_ry_lv_2v_2n_controller.text);
                    ry_lv_2w_2n = double.parse(_ry_lv_2w_2n_controller.text);

                    yb_hv_1u_1v = double.parse(_yb_hv_1u_1v_controller.text);
                    yb_hv_1v_1w = double.parse(_yb_hv_1v_1w_controller.text);
                    yb_hv_1w_1u = double.parse(_yb_hv_1w_1u_controller.text);

                    yb_hv_1u_1n = 0.00;
                    yb_hv_1v_1n = 0.00;
                    yb_hv_1w_1n = 0.00;

                    yb_lv_2u_2v = double.parse(_yb_lv_2u_2v_controller.text);
                    yb_lv_2v_2w = double.parse(_yb_lv_2v_2w_controller.text);
                    yb_lv_2w_2u = double.parse(_yb_lv_2w_2u_controller.text);

                    yb_lv_2u_2n = double.parse(_yb_lv_2u_2n_controller.text);
                    yb_lv_2v_2n = double.parse(_yb_lv_2v_2n_controller.text);
                    yb_lv_2w_2n = double.parse(_yb_lv_2w_2n_controller.text);

                    br_hv_1u_1v = double.parse(_br_hv_1u_1v_controller.text);
                    br_hv_1v_1w = double.parse(_br_hv_1v_1w_controller.text);
                    br_hv_1w_1u = double.parse(_br_hv_1w_1u_controller.text);

                    br_hv_1u_1n = 0.00;
                    br_hv_1v_1n = 0.00;
                    br_hv_1w_1n = 0.00;

                    br_lv_2u_2v = double.parse(_br_lv_2u_2v_controller.text);
                    br_lv_2v_2w = double.parse(_br_lv_2v_2w_controller.text);
                    br_lv_2w_2u = double.parse(_br_lv_2w_2u_controller.text);

                    br_lv_2u_2n = double.parse(_br_lv_2u_2n_controller.text);
                    br_lv_2v_2n = double.parse(_br_lv_2v_2n_controller.text);
                    br_lv_2w_2n = double.parse(_br_lv_2w_2n_controller.text);
                  }
                  if (ntr.vectorGroup == "YNd1" || ntr.vectorGroup == "YNd11") {
                    ry_hv_1u_1v = double.parse(_ry_hv_1u_1v_controller.text);
                    ry_hv_1v_1w = double.parse(_ry_hv_1v_1w_controller.text);
                    ry_hv_1w_1u = double.parse(_ry_hv_1w_1u_controller.text);

                    ry_hv_1u_1n = double.parse(_ry_hv_1u_1n_controller.text);
                    ry_hv_1v_1n = double.parse(_ry_hv_1v_1n_controller.text);
                    ry_hv_1w_1n = double.parse(_ry_hv_1w_1n_controller.text);

                    ry_lv_2u_2v = double.parse(_ry_lv_2u_2v_controller.text);
                    ry_lv_2v_2w = double.parse(_ry_lv_2v_2w_controller.text);
                    ry_lv_2w_2u = double.parse(_ry_lv_2w_2u_controller.text);

                    ry_lv_2u_2n = 0.00;
                    ry_lv_2v_2n = 0.00;
                    ry_lv_2w_2n = 0.00;

                    yb_hv_1u_1v = double.parse(_yb_hv_1u_1v_controller.text);
                    yb_hv_1v_1w = double.parse(_yb_hv_1v_1w_controller.text);
                    yb_hv_1w_1u = double.parse(_yb_hv_1w_1u_controller.text);

                    yb_hv_1u_1n = double.parse(_yb_hv_1u_1n_controller.text);
                    yb_hv_1v_1n = double.parse(_yb_hv_1v_1n_controller.text);
                    yb_hv_1w_1n = double.parse(_yb_hv_1w_1n_controller.text);

                    yb_lv_2u_2v = double.parse(_yb_lv_2u_2v_controller.text);
                    yb_lv_2v_2w = double.parse(_yb_lv_2v_2w_controller.text);
                    yb_lv_2w_2u = double.parse(_yb_lv_2w_2u_controller.text);

                    yb_lv_2u_2n = 0.00;
                    yb_lv_2v_2n = 0.00;
                    yb_lv_2w_2n = 0.00;

                    br_hv_1u_1v = double.parse(_br_hv_1u_1v_controller.text);
                    br_hv_1v_1w = double.parse(_br_hv_1v_1w_controller.text);
                    br_hv_1w_1u = double.parse(_br_hv_1w_1u_controller.text);

                    br_hv_1u_1n = double.parse(_br_hv_1u_1n_controller.text);
                    br_hv_1v_1n = double.parse(_br_hv_1v_1n_controller.text);
                    br_hv_1w_1n = double.parse(_br_hv_1w_1n_controller.text);

                    br_lv_2u_2v = double.parse(_br_lv_2u_2v_controller.text);
                    br_lv_2v_2w = double.parse(_br_lv_2v_2w_controller.text);
                    br_lv_2w_2u = double.parse(_br_lv_2w_2u_controller.text);

                    br_lv_2u_2n = 0.00;
                    br_lv_2v_2n = 0.00;
                    br_lv_2w_2n = 0.00;
                  }

                  _ry_hv_1u_1v_controller.text = ry_hv_1u_1v.toString();
                  _ry_hv_1v_1w_controller.text = ry_hv_1v_1w.toString();
                  _ry_hv_1w_1u_controller.text = ry_hv_1w_1u.toString();
                  _ry_hv_1u_1n_controller.text = ry_hv_1u_1n.toString();
                  _ry_hv_1v_1n_controller.text = ry_hv_1v_1n.toString();
                  _ry_hv_1w_1n_controller.text = ry_hv_1w_1n.toString();
                  _ry_lv_2u_2v_controller.text = ry_lv_2u_2v.toString();
                  _ry_lv_2v_2w_controller.text = ry_lv_2v_2w.toString();
                  _ry_lv_2w_2u_controller.text = ry_lv_2w_2u.toString();
                  _ry_lv_2u_2n_controller.text = ry_lv_2u_2n.toString();
                  _ry_lv_2v_2n_controller.text = ry_lv_2v_2n.toString();
                  _ry_lv_2w_2n_controller.text = ry_lv_2w_2n.toString();
                  _yb_hv_1u_1v_controller.text = yb_hv_1u_1v.toString();
                  _yb_hv_1v_1w_controller.text = yb_hv_1v_1w.toString();
                  _yb_hv_1w_1u_controller.text = yb_hv_1w_1u.toString();
                  _yb_hv_1u_1n_controller.text = yb_hv_1u_1n.toString();
                  _yb_hv_1v_1n_controller.text = yb_hv_1v_1n.toString();
                  _yb_hv_1w_1n_controller.text = yb_hv_1w_1n.toString();
                  _yb_lv_2u_2v_controller.text = yb_lv_2u_2v.toString();
                  _yb_lv_2v_2w_controller.text = yb_lv_2v_2w.toString();
                  _yb_lv_2w_2u_controller.text = yb_lv_2w_2u.toString();
                  _yb_lv_2u_2n_controller.text = yb_lv_2u_2n.toString();
                  _yb_lv_2v_2n_controller.text = yb_lv_2v_2n.toString();
                  _yb_lv_2w_2n_controller.text = yb_lv_2w_2n.toString();
                  _br_hv_1u_1v_controller.text = br_hv_1u_1v.toString();
                  _br_hv_1v_1w_controller.text = br_hv_1v_1w.toString();
                  _br_hv_1w_1u_controller.text = br_hv_1w_1u.toString();
                  _br_hv_1u_1n_controller.text = br_hv_1u_1n.toString();
                  _br_hv_1v_1n_controller.text = br_hv_1v_1n.toString();
                  _br_hv_1w_1n_controller.text = br_hv_1w_1n.toString();
                  _br_lv_2u_2v_controller.text = br_lv_2u_2v.toString();
                  _br_lv_2v_2w_controller.text = br_lv_2v_2w.toString();
                  _br_lv_2w_2u_controller.text = br_lv_2w_2u.toString();
                  _br_lv_2u_2n_controller.text = br_lv_2u_2n.toString();
                  _br_lv_2v_2n_controller.text = br_lv_2v_2n.toString();
                  _br_lv_2w_2n_controller.text = br_lv_2w_2n.toString();

                  // add to local database
                  final AT_mb_Model AT_mbtoLocal = AT_mb_Model(
                    trNo: int.parse(_trNo_controller.text),
                    serialNo: _serialNo_controller.text,
                    ry_hv_1u_1v: double.parse(_ry_hv_1u_1v_controller.text),
                    ry_hv_1v_1w: double.parse(_ry_hv_1v_1w_controller.text),
                    ry_hv_1w_1u: double.parse(_ry_hv_1w_1u_controller.text),
                    ry_hv_1u_1n: double.parse(_ry_hv_1u_1n_controller.text),
                    ry_hv_1v_1n: double.parse(_ry_hv_1v_1n_controller.text),
                    ry_hv_1w_1n: double.parse(_ry_hv_1w_1n_controller.text),
                    ry_lv_2u_2v: double.parse(_ry_lv_2u_2v_controller.text),
                    ry_lv_2v_2w: double.parse(_ry_lv_2v_2w_controller.text),
                    ry_lv_2w_2u: double.parse(_ry_lv_2w_2u_controller.text),
                    ry_lv_2u_2n: double.parse(_ry_lv_2u_2n_controller.text),
                    ry_lv_2v_2n: double.parse(_ry_lv_2v_2n_controller.text),
                    ry_lv_2w_2n: double.parse(_ry_lv_2w_2n_controller.text),
                    yb_hv_1u_1v: double.parse(_yb_hv_1u_1v_controller.text),
                    yb_hv_1v_1w: double.parse(_yb_hv_1v_1w_controller.text),
                    yb_hv_1w_1u: double.parse(_yb_hv_1w_1u_controller.text),
                    yb_hv_1u_1n: double.parse(_yb_hv_1u_1n_controller.text),
                    yb_hv_1v_1n: double.parse(_yb_hv_1v_1n_controller.text),
                    yb_hv_1w_1n: double.parse(_yb_hv_1w_1n_controller.text),
                    yb_lv_2u_2v: double.parse(_yb_lv_2u_2v_controller.text),
                    yb_lv_2v_2w: double.parse(_yb_lv_2v_2w_controller.text),
                    yb_lv_2w_2u: double.parse(_yb_lv_2w_2u_controller.text),
                    yb_lv_2u_2n: double.parse(_yb_lv_2u_2n_controller.text),
                    yb_lv_2v_2n: double.parse(_yb_lv_2v_2n_controller.text),
                    yb_lv_2w_2n: double.parse(_yb_lv_2w_2n_controller.text),
                    br_hv_1u_1v: double.parse(_br_hv_1u_1v_controller.text),
                    br_hv_1v_1w: double.parse(_br_hv_1v_1w_controller.text),
                    br_hv_1w_1u: double.parse(_br_hv_1w_1u_controller.text),
                    br_hv_1u_1n: double.parse(_br_hv_1u_1n_controller.text),
                    br_hv_1v_1n: double.parse(_br_hv_1v_1n_controller.text),
                    br_hv_1w_1n: double.parse(_br_hv_1w_1n_controller.text),
                    br_lv_2u_2v: double.parse(_br_lv_2u_2v_controller.text),
                    br_lv_2v_2w: double.parse(_br_lv_2v_2w_controller.text),
                    br_lv_2w_2u: double.parse(_br_lv_2w_2u_controller.text),
                    br_lv_2u_2n: double.parse(_br_lv_2u_2n_controller.text),
                    br_lv_2v_2n: double.parse(_br_lv_2v_2n_controller.text),
                    br_lv_2w_2n: double.parse(_br_lv_2w_2n_controller.text),
                    equipmentUsed: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,
                  );
                  print(AT_mbtoLocal);
                  print(AT_mbtoLocal.trNo);
                  getX((AT_mb_Provider x) => x.addATmb(AT_mbtoLocal));
                  watchOnly((AT_mb_Provider x) => {});
                  Navigator.popAndPushNamed(context, '/detail_AT', arguments: {
                    'id': args['AT_ID'],
                    'atDatabaseID': AT_ID,
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
    final ATModel ntr = watchOnly((ATProvider x) => x.atModel);
    return Form(
      key: _formKey,
      child: LayoutBuilder(builder: (context, constraints) {
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
                          'trNo',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5),
                        )),
                    TextFormField(
                      controller: _trNo_controller,
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
                      ),
                    ),
                    TextFormField(
                      controller: _serialNo_controller,
                      textAlign: TextAlign.center,
                      enabled: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: EquipmentTypeList(),
                    ),
                    ntr.vectorGroup == "Dd0" || ntr.vectorGroup == "Dd6"
                        ? ApartFrom_nCol()
                        : Container(),
                    ntr.vectorGroup == "Dyn1" || ntr.vectorGroup == "Dyn11"
                        ? Column(
                            children: [
                              ApartFrom_nCol(),
                              Dyn1_Dyn11(),
                            ],
                          )
                        : Container(),
                    ntr.vectorGroup == "YNd1" || ntr.vectorGroup == "YNd11"
                        ? Column(
                            children: [
                              ApartFrom_nCol(),
                              YNd1_YNd11(),
                            ],
                          )
                        : Container(),
                    ntr.vectorGroup == "YNyn0" || ntr.vectorGroup == "YNyn6"
                        ? YNyn0_YNyn6()
                        : Container(),
                  ]),
            ),
          );
          //------------------------------------------------------------------------------
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
                        'trNo',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      )),
                  TextFormField(
                    controller: _trNo_controller,
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
                    controller: _serialNo_controller,
                    textAlign: TextAlign.center,
                    enabled: false,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: EquipmentTypeList(),
                  ),
                  ntr.vectorGroup == "Dd0" || ntr.vectorGroup == "Dd6"
                      ? ApartFrom_nCol()
                      : Container(),
                  ntr.vectorGroup == "Dyn1" || ntr.vectorGroup == "Dyn11"
                      ? Column(
                          children: [
                            ApartFrom_nCol(),
                            Dyn1_Dyn11(),
                          ],
                        )
                      : Container(),
                  ntr.vectorGroup == "YNd1" || ntr.vectorGroup == "YNd11"
                      ? Column(
                          children: [
                            ApartFrom_nCol(),
                            YNd1_YNd11(),
                          ],
                        )
                      : Container(),
                  ntr.vectorGroup == "YNyn0" || ntr.vectorGroup == "YNyn6"
                      ? YNyn0_YNyn6()
                      : Container(),
                ],
              ),
            ),
          );
        }
      }),
    );
  }

  Column Db0_Db6() {
    return Column(
      children: [
        simplifiedFor_Display_for_all_Mobile_numpad(
            'ry_hv_1u_1n', _ry_hv_1u_1n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'ry_hv_1v_1n', _ry_hv_1v_1n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'ry_hv_1w_1n', _ry_hv_1w_1n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'ry_lv_2u_2n', _ry_lv_2u_2n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'ry_lv_2v_2n', _ry_lv_2v_2n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'ry_lv_2w_2n', _ry_lv_2w_2n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'yb_hv_1u_1n', _yb_hv_1u_1n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'yb_hv_1v_1n', _yb_hv_1v_1n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'yb_hv_1w_1n', _yb_hv_1w_1n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'yb_lv_2u_2n', _yb_lv_2u_2n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'yb_lv_2v_2n', _yb_lv_2v_2n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'yb_lv_2w_2n', _yb_lv_2w_2n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'br_hv_1u_1n', _br_hv_1u_1n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'br_hv_1v_1n', _br_hv_1v_1n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'br_hv_1w_1n', _br_hv_1w_1n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'br_lv_2u_2n', _br_lv_2u_2n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'br_lv_2v_2n', _br_lv_2v_2n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'br_lv_2w_2n', _br_lv_2w_2n_controller),
      ],
    );
  }

  Column Dyn1_Dyn11() {
    return Column(
      children: [
        simplifiedFor_Display_for_all_Mobile_numpad(
            'ry_hv_1u_1n', _ry_hv_1u_1n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'ry_hv_1v_1n', _ry_hv_1v_1n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'ry_hv_1w_1n', _ry_hv_1w_1n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'yb_hv_1u_1n', _yb_hv_1u_1n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'yb_hv_1v_1n', _yb_hv_1v_1n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'yb_hv_1w_1n', _yb_hv_1w_1n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'br_hv_1u_1n', _br_hv_1u_1n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'br_hv_1v_1n', _br_hv_1v_1n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'br_hv_1w_1n', _br_hv_1w_1n_controller),
      ],
    );
  }

  Column YNd1_YNd11() {
    return Column(
      children: [
        simplifiedFor_Display_for_all_Mobile_numpad(
            'ry_lv_2u_2n', _ry_lv_2u_2n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'ry_lv_2v_2n', _ry_lv_2v_2n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'ry_lv_2w_2n', _ry_lv_2w_2n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'yb_lv_2u_2n', _yb_lv_2u_2n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'yb_lv_2v_2n', _yb_lv_2v_2n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'yb_lv_2w_2n', _yb_lv_2w_2n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'br_lv_2u_2n', _br_lv_2u_2n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'br_lv_2v_2n', _br_lv_2v_2n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'br_lv_2w_2n', _br_lv_2w_2n_controller),
      ],
    );
  }

  Column YNyn0_YNyn6() {
    return Column(
      children: [
        simplifiedFor_Display_for_all_Mobile_numpad(
            'ry_hv_1u_1v', _ry_hv_1u_1v_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'ry_hv_1v_1w', _ry_hv_1v_1w_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'ry_hv_1w_1u', _ry_hv_1w_1u_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'ry_hv_1u_1n', _ry_hv_1u_1n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'ry_hv_1v_1n', _ry_hv_1v_1n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'ry_hv_1w_1n', _ry_hv_1w_1n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'ry_lv_2u_2v', _ry_lv_2u_2v_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'ry_lv_2v_2w', _ry_lv_2v_2w_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'ry_lv_2w_2u', _ry_lv_2w_2u_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'ry_lv_2u_2n', _ry_lv_2u_2n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'ry_lv_2v_2n', _ry_lv_2v_2n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'ry_lv_2w_2n', _ry_lv_2w_2n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'yb_hv_1u_1v', _yb_hv_1u_1v_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'yb_hv_1v_1w', _yb_hv_1v_1w_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'yb_hv_1w_1u', _yb_hv_1w_1u_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'yb_hv_1u_1n', _yb_hv_1u_1n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'yb_hv_1v_1n', _yb_hv_1v_1n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'yb_hv_1w_1n', _yb_hv_1w_1n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'yb_lv_2u_2v', _yb_lv_2u_2v_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'yb_lv_2v_2w', _yb_lv_2v_2w_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'yb_lv_2w_2u', _yb_lv_2w_2u_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'yb_lv_2u_2n', _yb_lv_2u_2n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'yb_lv_2v_2n', _yb_lv_2v_2n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'yb_lv_2w_2n', _yb_lv_2w_2n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'br_hv_1u_1v', _br_hv_1u_1v_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'br_hv_1v_1w', _br_hv_1v_1w_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'br_hv_1w_1u', _br_hv_1w_1u_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'br_hv_1u_1n', _br_hv_1u_1n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'br_hv_1v_1n', _br_hv_1v_1n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'br_hv_1w_1n', _br_hv_1w_1n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'br_lv_2u_2v', _br_lv_2u_2v_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'br_lv_2v_2w', _br_lv_2v_2w_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'br_lv_2w_2u', _br_lv_2w_2u_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'br_lv_2u_2n', _br_lv_2u_2n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'br_lv_2v_2n', _br_lv_2v_2n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'br_lv_2w_2n', _br_lv_2w_2n_controller),
      ],
    );
  }

  Column ApartFrom_nCol() {
    return Column(
      children: [
        simplifiedFor_Display_for_all_Mobile_numpad(
            'ry_hv_1u_1v', _ry_hv_1u_1v_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'ry_hv_1v_1w', _ry_hv_1v_1w_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'ry_hv_1w_1u', _ry_hv_1w_1u_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'ry_lv_2u_2v', _ry_lv_2u_2v_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'ry_lv_2v_2w', _ry_lv_2v_2w_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'ry_lv_2w_2u', _ry_lv_2w_2u_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'yb_hv_1u_1v', _yb_hv_1u_1v_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'yb_hv_1v_1w', _yb_hv_1v_1w_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'yb_hv_1w_1u', _yb_hv_1w_1u_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'yb_lv_2u_2v', _yb_lv_2u_2v_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'yb_lv_2v_2w', _yb_lv_2v_2w_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'yb_lv_2w_2u', _yb_lv_2w_2u_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'br_hv_1u_1v', _br_hv_1u_1v_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'br_hv_1v_1w', _br_hv_1v_1w_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'br_hv_1w_1u', _br_hv_1w_1u_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'br_lv_2u_2v', _br_lv_2u_2v_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'br_lv_2v_2w', _br_lv_2v_2w_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'br_lv_2w_2u', _br_lv_2w_2u_controller),
      ],
    );
  }
}
