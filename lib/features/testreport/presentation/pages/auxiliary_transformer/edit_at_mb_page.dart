// ignore_for_file: missing_return, missing_required_param, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../data/models/equipment/AT/AT_mb_model.dart';
import '../../../data/models/equipment/AT/AT_model.dart';
import '../../providers/at_provider/at_mb_provider.dart';
import '../../providers/at_provider/at_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditATmbPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditATmbPage(this.args, {Key key}) : super(key: key);

  AT_mb_Model _atmbTestModel;
  final TextEditingController _IDcontroller = TextEditingController();
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
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Future<void> getReport() async {
    getX((AT_mb_Provider x) => x.getAT_mbById(args['id']));
    _atmbTestModel = watchOnly((AT_mb_Provider x) => x.at_mb_Model);
    _IDcontroller.text = _atmbTestModel.id.toString();
    _trNo_controller.text = _atmbTestModel.trNo.toString();
    _serialNo_controller.text = _atmbTestModel.serialNo.toString();
    _ry_hv_1u_1v_controller.text = _atmbTestModel.ry_hv_1u_1v.toString();
    _ry_hv_1v_1w_controller.text = _atmbTestModel.ry_hv_1v_1w.toString();
    _ry_hv_1w_1u_controller.text = _atmbTestModel.ry_hv_1w_1u.toString();
    _ry_hv_1u_1n_controller.text = _atmbTestModel.ry_hv_1u_1n.toString();
    _ry_hv_1v_1n_controller.text = _atmbTestModel.ry_hv_1v_1n.toString();
    _ry_hv_1w_1n_controller.text = _atmbTestModel.ry_hv_1w_1n.toString();
    _ry_lv_2u_2v_controller.text = _atmbTestModel.ry_lv_2u_2v.toString();
    _ry_lv_2v_2w_controller.text = _atmbTestModel.ry_lv_2v_2w.toString();
    _ry_lv_2w_2u_controller.text = _atmbTestModel.ry_lv_2w_2u.toString();
    _ry_lv_2u_2n_controller.text = _atmbTestModel.ry_lv_2u_2n.toString();
    _ry_lv_2v_2n_controller.text = _atmbTestModel.ry_lv_2v_2n.toString();
    _ry_lv_2w_2n_controller.text = _atmbTestModel.ry_lv_2w_2n.toString();
    _yb_hv_1u_1v_controller.text = _atmbTestModel.yb_hv_1u_1v.toString();
    _yb_hv_1v_1w_controller.text = _atmbTestModel.yb_hv_1v_1w.toString();
    _yb_hv_1w_1u_controller.text = _atmbTestModel.yb_hv_1w_1u.toString();
    _yb_hv_1u_1n_controller.text = _atmbTestModel.yb_hv_1u_1n.toString();
    _yb_hv_1v_1n_controller.text = _atmbTestModel.yb_hv_1v_1n.toString();
    _yb_hv_1w_1n_controller.text = _atmbTestModel.yb_hv_1w_1n.toString();
    _yb_lv_2u_2v_controller.text = _atmbTestModel.yb_lv_2u_2v.toString();
    _yb_lv_2v_2w_controller.text = _atmbTestModel.yb_lv_2v_2w.toString();
    _yb_lv_2w_2u_controller.text = _atmbTestModel.yb_lv_2w_2u.toString();
    _yb_lv_2u_2n_controller.text = _atmbTestModel.yb_lv_2u_2n.toString();
    _yb_lv_2v_2n_controller.text = _atmbTestModel.yb_lv_2v_2n.toString();
    _yb_lv_2w_2n_controller.text = _atmbTestModel.yb_lv_2w_2n.toString();
    _br_hv_1u_1v_controller.text = _atmbTestModel.br_hv_1u_1v.toString();
    _br_hv_1v_1w_controller.text = _atmbTestModel.br_hv_1v_1w.toString();
    _br_hv_1w_1u_controller.text = _atmbTestModel.br_hv_1w_1u.toString();
    _br_hv_1u_1n_controller.text = _atmbTestModel.br_hv_1u_1n.toString();
    _br_hv_1v_1n_controller.text = _atmbTestModel.br_hv_1v_1n.toString();
    _br_hv_1w_1n_controller.text = _atmbTestModel.br_hv_1w_1n.toString();
    _br_lv_2u_2v_controller.text = _atmbTestModel.br_lv_2u_2v.toString();
    _br_lv_2v_2w_controller.text = _atmbTestModel.br_lv_2v_2w.toString();
    _br_lv_2w_2u_controller.text = _atmbTestModel.br_lv_2w_2u.toString();
    _br_lv_2u_2n_controller.text = _atmbTestModel.br_lv_2u_2n.toString();
    _br_lv_2v_2n_controller.text = _atmbTestModel.br_lv_2v_2n.toString();
    _br_lv_2w_2n_controller.text = _atmbTestModel.br_lv_2w_2n.toString();
  }

  @override
  Widget build(BuildContext context) {
    final AT_mb_Model ntr = watchOnly((AT_mb_Provider x) => x.at_mb_Model);
    // getX((ATProvider x) => x.getATByID(args['id']));
    final ATModel ntr1 = watchOnly((ATProvider x) => x.atModel);
    getReport();
    var mob = const Text('Edit AT-mb Details', style: TextStyle(fontSize: 15));
    var desk = const Text('Edit AT-mb Details', style: TextStyle(fontSize: 20));

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

                  if (ntr1.vectorGroup == "Dd0" || ntr1.vectorGroup == "Dd6") {
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
                  if (ntr1.vectorGroup == "Dyn1" ||
                      ntr1.vectorGroup == "Dyn11") {
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
                  if (ntr1.vectorGroup == "YNd1" ||
                      ntr1.vectorGroup == "YNd11") {
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

                  //add to remote database
                  var success_code = 201;
                  var success_code1 = 200;
                  var failed_code = 'Server Connection Lost';
                  //add to remote database
                  var url = Uri.parse('${Env.URL_PREFIX}/atMbTest/' +
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
                    'serialNo': args['AT_ID'].toString(),
                    'equipmentUsed': selectedValueForEquipmentUse.toString(),
                    'ry_hv_1u_1v': _ry_hv_1u_1v_controller.text.toString(),
                    'ry_hv_1v_1w': _ry_hv_1v_1w_controller.text.toString(),
                    'ry_hv_1w_1u': _ry_hv_1w_1u_controller.text.toString(),
                    'ry_hv_1u_1n': _ry_hv_1u_1n_controller.text.toString(),
                    'ry_hv_1v_1n': _ry_hv_1v_1n_controller.text.toString(),
                    'ry_hv_1w_1n': _ry_hv_1w_1n_controller.text.toString(),
                    'ry_lv_2u_2v': _ry_lv_2u_2v_controller.text.toString(),
                    'ry_lv_2v_2w': _ry_lv_2v_2w_controller.text.toString(),
                    'ry_lv_2w_2u': _ry_lv_2w_2u_controller.text.toString(),
                    'ry_lv_2u_2n': _ry_lv_2u_2n_controller.text.toString(),
                    'ry_lv_2v_2n': _ry_lv_2v_2n_controller.text.toString(),
                    'ry_lv_2w_2n': _ry_lv_2w_2n_controller.text.toString(),
                    'yb_hv_1u_1v': _yb_hv_1u_1v_controller.text.toString(),
                    'yb_hv_1v_1w': _yb_hv_1v_1w_controller.text.toString(),
                    'yb_hv_1w_1u': _yb_hv_1w_1u_controller.text.toString(),
                    'yb_hv_1u_1n': _yb_hv_1u_1n_controller.text.toString(),
                    'yb_hv_1v_1n': _yb_hv_1v_1n_controller.text.toString(),
                    'yb_hv_1w_1n': _yb_hv_1w_1n_controller.text.toString(),
                    'yb_lv_2u_2v': _yb_lv_2u_2v_controller.text.toString(),
                    'yb_lv_2v_2w': _yb_lv_2v_2w_controller.text.toString(),
                    'yb_lv_2w_2u': _yb_lv_2w_2u_controller.text.toString(),
                    'yb_lv_2u_2n': _yb_lv_2u_2n_controller.text.toString(),
                    'yb_lv_2v_2n': _yb_lv_2v_2n_controller.text.toString(),
                    'yb_lv_2w_2n': _yb_lv_2w_2n_controller.text.toString(),
                    'br_hv_1u_1v': _br_hv_1u_1v_controller.text.toString(),
                    'br_hv_1v_1w': _br_hv_1v_1w_controller.text.toString(),
                    'br_hv_1w_1u': _br_hv_1w_1u_controller.text.toString(),
                    'br_hv_1u_1n': _br_hv_1u_1n_controller.text.toString(),
                    'br_hv_1v_1n': _br_hv_1v_1n_controller.text.toString(),
                    'br_hv_1w_1n': _br_hv_1w_1n_controller.text.toString(),
                    'br_lv_2u_2v': _br_lv_2u_2v_controller.text.toString(),
                    'br_lv_2v_2w': _br_lv_2v_2w_controller.text.toString(),
                    'br_lv_2w_2u': _br_lv_2w_2u_controller.text.toString(),
                    'br_lv_2u_2n': _br_lv_2u_2n_controller.text.toString(),
                    'br_lv_2v_2n': _br_lv_2v_2n_controller.text.toString(),
                    'br_lv_2w_2n': _br_lv_2w_2n_controller.text.toString(),
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
                    final AT_mb_Model atmbReportToLocal = AT_mb_Model(
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
                      databaseID: ntr.databaseID,
                      updateDate: DateTime.now(),
                    );

                    getX((AT_mb_Provider x) =>
                        x.updateATmb(atmbReportToLocal, args['id']));
                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_AT_mb',
                        arguments: {
                          'id': args['id'],
                          'AT_ID': args['AT_ID'],
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
