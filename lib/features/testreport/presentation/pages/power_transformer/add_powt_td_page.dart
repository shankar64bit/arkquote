// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/powt/powt_model.dart';
import '../../../data/models/equipment/powt/powt_td_model.dart';
import '../../providers/powt_provider/powt_provider.dart';
import '../../providers/powt_provider/powt_td_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

final _formKey = GlobalKey<FormState>();

class Add_Powttd extends StatelessWidget with GetItMixin {
  Map args = {};
  int POWT_ID;
  int TR_ID;

  Add_Powttd(this.args, {Key key}) : super(key: key);

  final TextEditingController _Trno_Controller = TextEditingController();
  final TextEditingController _serialNo_Controller = TextEditingController();
  final TextEditingController _equipmentUsed_Controller =
      TextEditingController();
  final TextEditingController _ru1_Controller = TextEditingController();
  final TextEditingController _ru2_Controller = TextEditingController();
  final TextEditingController _ru3_Controller = TextEditingController();
  final TextEditingController _ri1_Controller = TextEditingController();
  final TextEditingController _ri2_Controller = TextEditingController();
  final TextEditingController _ri3_Controller = TextEditingController();
  final TextEditingController _rc1_Controller = TextEditingController();
  final TextEditingController _rc2_Controller = TextEditingController();
  final TextEditingController _rc3_Controller = TextEditingController();
  final TextEditingController _rtanD1_Controller = TextEditingController();
  final TextEditingController _rtanD2_Controller = TextEditingController();
  final TextEditingController _rtanD3_Controller = TextEditingController();
  final TextEditingController _rp1_Controller = TextEditingController();
  final TextEditingController _rp2_Controller = TextEditingController();
  final TextEditingController _rp3_Controller = TextEditingController();
  final TextEditingController _rVdf1_Controller = TextEditingController();
  final TextEditingController _rVdf2_Controller = TextEditingController();
  final TextEditingController _rVdf3_Controller = TextEditingController();
  final TextEditingController _yu1_Controller = TextEditingController();
  final TextEditingController _yu2_Controller = TextEditingController();
  final TextEditingController _yu3_Controller = TextEditingController();
  final TextEditingController _yi1_Controller = TextEditingController();
  final TextEditingController _yi2_Controller = TextEditingController();
  final TextEditingController _yi3_Controller = TextEditingController();
  final TextEditingController _yc1_Controller = TextEditingController();
  final TextEditingController _yc2_Controller = TextEditingController();
  final TextEditingController _yc3_Controller = TextEditingController();
  final TextEditingController _ytanD1_Controller = TextEditingController();
  final TextEditingController _ytanD2_Controller = TextEditingController();
  final TextEditingController _ytanD3_Controller = TextEditingController();
  final TextEditingController _yp1_Controller = TextEditingController();
  final TextEditingController _yp2_Controller = TextEditingController();
  final TextEditingController _yp3_Controller = TextEditingController();
  final TextEditingController _yVdf1_Controller = TextEditingController();
  final TextEditingController _yVdf2_Controller = TextEditingController();
  final TextEditingController _yVdf3_Controller = TextEditingController();
  final TextEditingController _bu1_Controller = TextEditingController();
  final TextEditingController _bu2_Controller = TextEditingController();
  final TextEditingController _bu3_Controller = TextEditingController();
  final TextEditingController _bi1_Controller = TextEditingController();
  final TextEditingController _bi2_Controller = TextEditingController();
  final TextEditingController _bi3_Controller = TextEditingController();
  final TextEditingController _bc1_Controller = TextEditingController();
  final TextEditingController _bc2_Controller = TextEditingController();
  final TextEditingController _bc3_Controller = TextEditingController();
  final TextEditingController _btanD1_Controller = TextEditingController();
  final TextEditingController _btanD2_Controller = TextEditingController();
  final TextEditingController _btanD3_Controller = TextEditingController();
  final TextEditingController _bp1_Controller = TextEditingController();
  final TextEditingController _bp2_Controller = TextEditingController();
  final TextEditingController _bp3_Controller = TextEditingController();
  final TextEditingController _bVdf1_Controller = TextEditingController();
  final TextEditingController _bVdf2_Controller = TextEditingController();
  final TextEditingController _bVdf3_Controller = TextEditingController();
  final TextEditingController _hv_lv_u1_Controller = TextEditingController();
  final TextEditingController _hv_lv_u2_Controller = TextEditingController();
  final TextEditingController _hv_lv_u3_Controller = TextEditingController();
  final TextEditingController _hv_lv_i1_Controller = TextEditingController();
  final TextEditingController _hv_lv_i2_Controller = TextEditingController();
  final TextEditingController _hv_lv_i3_Controller = TextEditingController();
  final TextEditingController _hv_lv_c1_Controller = TextEditingController();
  final TextEditingController _hv_lv_c2_Controller = TextEditingController();
  final TextEditingController _hv_lv_c3_Controller = TextEditingController();
  final TextEditingController _hv_lv_tanD1_Controller = TextEditingController();
  final TextEditingController _hv_lv_tanD2_Controller = TextEditingController();
  final TextEditingController _hv_lv_tanD3_Controller = TextEditingController();
  final TextEditingController _hv_lv_p1_Controller = TextEditingController();
  final TextEditingController _hv_lv_p2_Controller = TextEditingController();
  final TextEditingController _hv_lv_p3_Controller = TextEditingController();
  final TextEditingController _hv_lv_Vdf1_Controller = TextEditingController();
  final TextEditingController _hv_lv_Vdf2_Controller = TextEditingController();
  final TextEditingController _hv_lv_Vdf3_Controller = TextEditingController();
  final TextEditingController _hvE_G_u1_Controller = TextEditingController();
  final TextEditingController _hvE_G_u2_Controller = TextEditingController();
  final TextEditingController _hvE_G_u3_Controller = TextEditingController();
  final TextEditingController _hvE_G_i1_Controller = TextEditingController();
  final TextEditingController _hvE_G_i2_Controller = TextEditingController();
  final TextEditingController _hvE_G_i3_Controller = TextEditingController();
  final TextEditingController _hvE_G_c1_Controller = TextEditingController();
  final TextEditingController _hvE_G_c2_Controller = TextEditingController();
  final TextEditingController _hvE_G_c3_Controller = TextEditingController();
  final TextEditingController _hvE_G_tanD1_Controller = TextEditingController();
  final TextEditingController _hvE_G_tanD2_Controller = TextEditingController();
  final TextEditingController _hvE_G_tanD3_Controller = TextEditingController();
  final TextEditingController _hvE_G_p1_Controller = TextEditingController();
  final TextEditingController _hvE_G_p2_Controller = TextEditingController();
  final TextEditingController _hvE_G_p3_Controller = TextEditingController();
  final TextEditingController _hvE_G_Vdf1_Controller = TextEditingController();
  final TextEditingController _hvE_G_Vdf2_Controller = TextEditingController();
  final TextEditingController _hvE_G_Vdf3_Controller = TextEditingController();
  final TextEditingController _hvE_Grnd_u1_Controller = TextEditingController();
  final TextEditingController _hvE_Grnd_u2_Controller = TextEditingController();
  final TextEditingController _hvE_Grnd_u3_Controller = TextEditingController();
  final TextEditingController _hvE_Grnd_i1_Controller = TextEditingController();
  final TextEditingController _hvE_Grnd_i2_Controller = TextEditingController();
  final TextEditingController _hvE_Grnd_i3_Controller = TextEditingController();
  final TextEditingController _hvE_Grnd_c1_Controller = TextEditingController();
  final TextEditingController _hvE_Grnd_c2_Controller = TextEditingController();
  final TextEditingController _hvE_Grnd_c3_Controller = TextEditingController();
  final TextEditingController _hvE_Grnd_tanD1_Controller =
      TextEditingController();
  final TextEditingController _hvE_Grnd_tanD2_Controller =
      TextEditingController();
  final TextEditingController _hvE_Grnd_tanD3_Controller =
      TextEditingController();
  final TextEditingController _hvE_Grnd_p1_Controller = TextEditingController();
  final TextEditingController _hvE_Grnd_p2_Controller = TextEditingController();
  final TextEditingController _hvE_Grnd_p3_Controller = TextEditingController();
  final TextEditingController _hvE_Grnd_Vdf1_Controller =
      TextEditingController();
  final TextEditingController _hvE_Grnd_Vdf2_Controller =
      TextEditingController();
  final TextEditingController _hvE_Grnd_Vdf3_Controller =
      TextEditingController();
  final TextEditingController _lvEu1_Controller = TextEditingController();
  final TextEditingController _lvEu2_Controller = TextEditingController();
  final TextEditingController _lvEu3_Controller = TextEditingController();
  final TextEditingController _lvEi1_Controller = TextEditingController();
  final TextEditingController _lvEi2_Controller = TextEditingController();
  final TextEditingController _lvEi3_Controller = TextEditingController();
  final TextEditingController _lvEc1_Controller = TextEditingController();
  final TextEditingController _lvEc2_Controller = TextEditingController();
  final TextEditingController _lvEc3_Controller = TextEditingController();
  final TextEditingController _lvEtanD1_Controller = TextEditingController();
  final TextEditingController _lvEtanD2_Controller = TextEditingController();
  final TextEditingController _lvEtanD3_Controller = TextEditingController();
  final TextEditingController _lvEp1_Controller = TextEditingController();
  final TextEditingController _lvEp2_Controller = TextEditingController();
  final TextEditingController _lvEp3_Controller = TextEditingController();
  final TextEditingController _lvEVdf1_Controller = TextEditingController();
  final TextEditingController _lvEVdf2_Controller = TextEditingController();
  final TextEditingController _lvEVdf3_Controller = TextEditingController();
  final TextEditingController _lvE_G_u1_Controller = TextEditingController();
  final TextEditingController _lvE_G_u2_Controller = TextEditingController();
  final TextEditingController _lvE_G_u3_Controller = TextEditingController();
  final TextEditingController _lvE_G_i1_Controller = TextEditingController();
  final TextEditingController _lvE_G_i2_Controller = TextEditingController();
  final TextEditingController _lvE_G_i3_Controller = TextEditingController();
  final TextEditingController _lvE_G_c1_Controller = TextEditingController();
  final TextEditingController _lvE_G_c2_Controller = TextEditingController();
  final TextEditingController _lvE_G_c3_Controller = TextEditingController();
  final TextEditingController _lvE_G_tanD1_Controller = TextEditingController();
  final TextEditingController _lvE_G_tanD2_Controller = TextEditingController();
  final TextEditingController _lvE_G_tanD3_Controller = TextEditingController();
  final TextEditingController _lvE_G_p1_Controller = TextEditingController();
  final TextEditingController _lvE_G_p2_Controller = TextEditingController();
  final TextEditingController _lvE_G_p3_Controller = TextEditingController();
  final TextEditingController _lvE_G_Vdf1_Controller = TextEditingController();
  final TextEditingController _lvE_G_Vdf2_Controller = TextEditingController();
  final TextEditingController _lvE_G_Vdf3_Controller = TextEditingController();
  final TextEditingController _lvE_Grnd_u1_Controller = TextEditingController();
  final TextEditingController _lvE_Grnd_u2_Controller = TextEditingController();
  final TextEditingController _lvE_Grnd_u3_Controller = TextEditingController();
  final TextEditingController _lvE_Grnd_i1_Controller = TextEditingController();
  final TextEditingController _lvE_Grnd_i2_Controller = TextEditingController();
  final TextEditingController _lvE_Grnd_i3_Controller = TextEditingController();
  final TextEditingController _lvE_Grnd_c1_Controller = TextEditingController();
  final TextEditingController _lvE_Grnd_c2_Controller = TextEditingController();
  final TextEditingController _lvE_Grnd_c3_Controller = TextEditingController();
  final TextEditingController _lvE_Grnd_tanD1_Controller =
      TextEditingController();
  final TextEditingController _lvE_Grnd_tanD2_Controller =
      TextEditingController();
  final TextEditingController _lvE_Grnd_tanD3_Controller =
      TextEditingController();
  final TextEditingController _lvE_Grnd_p1_Controller = TextEditingController();
  final TextEditingController _lvE_Grnd_p2_Controller = TextEditingController();
  final TextEditingController _lvE_Grnd_p3_Controller = TextEditingController();
  final TextEditingController _lvE_Grnd_Vdf1_Controller =
      TextEditingController();
  final TextEditingController _lvE_Grnd_Vdf2_Controller =
      TextEditingController();
  final TextEditingController _lvE_Grnd_Vdf3_Controller =
      TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  setTrNo() {
    _Trno_Controller.text = args['TrNo'].toString();
    _serialNo_Controller.text = args['serial_no_bph'].toString();
    POWT_ID = args['powtDatabaseID'];
    TR_ID = args['trDatabaseID'];
  }

  @override
  Widget build(BuildContext context) {
    final PowtModel ntr = watchOnly((PowtProvider x) => x.powtModel);

    setTrNo();
    var mob = Text('Add PowtTD ', style: TextStyle(fontSize: 17));
    var desk = Text('Add PowtTD ', style: TextStyle(fontSize: 20));
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

                  // add to local database
                  final PowttdModel PowttdtoLocal = PowttdModel(
                    trNo: int.parse(_Trno_Controller.text),
                    serialNo: _serialNo_Controller.text,
                    ru1: double.parse(_ru1_Controller.text),
                    ru2: double.parse(_ru2_Controller.text),
                    ru3: double.parse(_ru3_Controller.text),
                    ri1: double.parse(_ri1_Controller.text),
                    ri2: double.parse(_ri2_Controller.text),
                    ri3: double.parse(_ri3_Controller.text),
                    rc1: double.parse(_rc1_Controller.text),
                    rc2: double.parse(_rc2_Controller.text),
                    rc3: double.parse(_rc3_Controller.text),
                    rtanD1: double.parse(_rtanD1_Controller.text),
                    rtanD2: double.parse(_rtanD2_Controller.text),
                    rtanD3: double.parse(_rtanD3_Controller.text),
                    rp1: double.parse(_rp1_Controller.text),
                    rp2: double.parse(_rp2_Controller.text),
                    rp3: double.parse(_rp3_Controller.text),
                    rVdf1: double.parse(_rVdf1_Controller.text),
                    rVdf2: double.parse(_rVdf2_Controller.text),
                    rVdf3: double.parse(_rVdf3_Controller.text),
                    yu1: double.parse(_yu1_Controller.text),
                    yu2: double.parse(_yu2_Controller.text),
                    yu3: double.parse(_yu3_Controller.text),
                    yi1: double.parse(_yi1_Controller.text),
                    yi2: double.parse(_yi2_Controller.text),
                    yi3: double.parse(_yi3_Controller.text),
                    yc1: double.parse(_yc1_Controller.text),
                    yc2: double.parse(_yc2_Controller.text),
                    yc3: double.parse(_yc3_Controller.text),
                    ytanD1: double.parse(_ytanD1_Controller.text),
                    ytanD2: double.parse(_ytanD2_Controller.text),
                    ytanD3: double.parse(_ytanD3_Controller.text),
                    yp1: double.parse(_yp1_Controller.text),
                    yp2: double.parse(_yp2_Controller.text),
                    yp3: double.parse(_yp3_Controller.text),
                    yVdf1: double.parse(_yVdf1_Controller.text),
                    yVdf2: double.parse(_yVdf2_Controller.text),
                    yVdf3: double.parse(_yVdf3_Controller.text),
                    bu1: double.parse(_bu1_Controller.text),
                    bu2: double.parse(_bu2_Controller.text),
                    bu3: double.parse(_bu3_Controller.text),
                    bi1: double.parse(_bi1_Controller.text),
                    bi2: double.parse(_bi2_Controller.text),
                    bi3: double.parse(_bi3_Controller.text),
                    bc1: double.parse(_bc1_Controller.text),
                    bc2: double.parse(_bc2_Controller.text),
                    bc3: double.parse(_bc3_Controller.text),
                    btanD1: double.parse(_btanD1_Controller.text),
                    btanD2: double.parse(_btanD2_Controller.text),
                    btanD3: double.parse(_btanD3_Controller.text),
                    bp1: double.parse(_bp1_Controller.text),
                    bp2: double.parse(_bp2_Controller.text),
                    bp3: double.parse(_bp3_Controller.text),
                    bVdf1: double.parse(_bVdf1_Controller.text),
                    bVdf2: double.parse(_bVdf2_Controller.text),
                    bVdf3: double.parse(_bVdf3_Controller.text),
                    hv_lv_u1: double.parse(_hv_lv_u1_Controller.text),
                    hv_lv_u2: double.parse(_hv_lv_u2_Controller.text),
                    hv_lv_u3: double.parse(_hv_lv_u3_Controller.text),
                    hv_lv_i1: double.parse(_hv_lv_i1_Controller.text),
                    hv_lv_i2: double.parse(_hv_lv_i2_Controller.text),
                    hv_lv_i3: double.parse(_hv_lv_i3_Controller.text),
                    hv_lv_c1: double.parse(_hv_lv_c1_Controller.text),
                    hv_lv_c2: double.parse(_hv_lv_c2_Controller.text),
                    hv_lv_c3: double.parse(_hv_lv_c3_Controller.text),
                    hv_lv_tanD1: double.parse(_hv_lv_tanD1_Controller.text),
                    hv_lv_tanD2: double.parse(_hv_lv_tanD2_Controller.text),
                    hv_lv_tanD3: double.parse(_hv_lv_tanD3_Controller.text),
                    hv_lv_p1: double.parse(_hv_lv_p1_Controller.text),
                    hv_lv_p2: double.parse(_hv_lv_p2_Controller.text),
                    hv_lv_p3: double.parse(_hv_lv_p3_Controller.text),
                    hv_lv_Vdf1: double.parse(_hv_lv_Vdf1_Controller.text),
                    hv_lv_Vdf2: double.parse(_hv_lv_Vdf2_Controller.text),
                    hv_lv_Vdf3: double.parse(_hv_lv_Vdf3_Controller.text),
                    hvE_G_u1: double.parse(_hvE_G_u1_Controller.text),
                    hvE_G_u2: double.parse(_hvE_G_u2_Controller.text),
                    hvE_G_u3: double.parse(_hvE_G_u3_Controller.text),
                    hvE_G_i1: double.parse(_hvE_G_i1_Controller.text),
                    hvE_G_i2: double.parse(_hvE_G_i2_Controller.text),
                    hvE_G_i3: double.parse(_hvE_G_i3_Controller.text),
                    hvE_G_c1: double.parse(_hvE_G_c1_Controller.text),
                    hvE_G_c2: double.parse(_hvE_G_c2_Controller.text),
                    hvE_G_c3: double.parse(_hvE_G_c3_Controller.text),
                    hvE_G_tanD1: double.parse(_hvE_G_tanD1_Controller.text),
                    hvE_G_tanD2: double.parse(_hvE_G_tanD2_Controller.text),
                    hvE_G_tanD3: double.parse(_hvE_G_tanD3_Controller.text),
                    hvE_G_p1: double.parse(_hvE_G_p1_Controller.text),
                    hvE_G_p2: double.parse(_hvE_G_p2_Controller.text),
                    hvE_G_p3: double.parse(_hvE_G_p3_Controller.text),
                    hvE_G_Vdf1: double.parse(_hvE_G_Vdf1_Controller.text),
                    hvE_G_Vdf2: double.parse(_hvE_G_Vdf2_Controller.text),
                    hvE_G_Vdf3: double.parse(_hvE_G_Vdf3_Controller.text),
                    hvE_Grnd_u1: double.parse(_hvE_Grnd_u1_Controller.text),
                    hvE_Grnd_u2: double.parse(_hvE_Grnd_u2_Controller.text),
                    hvE_Grnd_u3: double.parse(_hvE_Grnd_u3_Controller.text),
                    hvE_Grnd_i1: double.parse(_hvE_Grnd_i1_Controller.text),
                    hvE_Grnd_i2: double.parse(_hvE_Grnd_i2_Controller.text),
                    hvE_Grnd_i3: double.parse(_hvE_Grnd_i3_Controller.text),
                    hvE_Grnd_c1: double.parse(_hvE_Grnd_c1_Controller.text),
                    hvE_Grnd_c2: double.parse(_hvE_Grnd_c2_Controller.text),
                    hvE_Grnd_c3: double.parse(_hvE_Grnd_c3_Controller.text),
                    hvE_Grnd_tanD1:
                        double.parse(_hvE_Grnd_tanD1_Controller.text),
                    hvE_Grnd_tanD2:
                        double.parse(_hvE_Grnd_tanD2_Controller.text),
                    hvE_Grnd_tanD3:
                        double.parse(_hvE_Grnd_tanD3_Controller.text),
                    hvE_Grnd_p1: double.parse(_hvE_Grnd_p1_Controller.text),
                    hvE_Grnd_p2: double.parse(_hvE_Grnd_p2_Controller.text),
                    hvE_Grnd_p3: double.parse(_hvE_Grnd_p3_Controller.text),
                    hvE_Grnd_Vdf1: double.parse(_hvE_Grnd_Vdf1_Controller.text),
                    hvE_Grnd_Vdf2: double.parse(_hvE_Grnd_Vdf2_Controller.text),
                    hvE_Grnd_Vdf3: double.parse(_hvE_Grnd_Vdf3_Controller.text),
                    lvEu1: double.parse(_lvEu1_Controller.text),
                    lvEu2: double.parse(_lvEu2_Controller.text),
                    lvEu3: double.parse(_lvEu3_Controller.text),
                    lvEi1: double.parse(_lvEi1_Controller.text),
                    lvEi2: double.parse(_lvEi2_Controller.text),
                    lvEi3: double.parse(_lvEi3_Controller.text),
                    lvEc1: double.parse(_lvEc1_Controller.text),
                    lvEc2: double.parse(_lvEc2_Controller.text),
                    lvEc3: double.parse(_lvEc3_Controller.text),
                    lvEtanD1: double.parse(_lvEtanD1_Controller.text),
                    lvEtanD2: double.parse(_lvEtanD2_Controller.text),
                    lvEtanD3: double.parse(_lvEtanD3_Controller.text),
                    lvEp1: double.parse(_lvEp1_Controller.text),
                    lvEp2: double.parse(_lvEp2_Controller.text),
                    lvEp3: double.parse(_lvEp3_Controller.text),
                    lvEVdf1: double.parse(_lvEVdf1_Controller.text),
                    lvEVdf2: double.parse(_lvEVdf2_Controller.text),
                    lvEVdf3: double.parse(_lvEVdf3_Controller.text),
                    lvE_G_u1: double.parse(_lvE_G_u1_Controller.text),
                    lvE_G_u2: double.parse(_lvE_G_u2_Controller.text),
                    lvE_G_u3: double.parse(_lvE_G_u3_Controller.text),
                    lvE_G_i1: double.parse(_lvE_G_i1_Controller.text),
                    lvE_G_i2: double.parse(_lvE_G_i2_Controller.text),
                    lvE_G_i3: double.parse(_lvE_G_i3_Controller.text),
                    lvE_G_c1: double.parse(_lvE_G_c1_Controller.text),
                    lvE_G_c2: double.parse(_lvE_G_c2_Controller.text),
                    lvE_G_c3: double.parse(_lvE_G_c3_Controller.text),
                    lvE_G_tanD1: double.parse(_lvE_G_tanD1_Controller.text),
                    lvE_G_tanD2: double.parse(_lvE_G_tanD2_Controller.text),
                    lvE_G_tanD3: double.parse(_lvE_G_tanD3_Controller.text),
                    lvE_G_p1: double.parse(_lvE_G_p1_Controller.text),
                    lvE_G_p2: double.parse(_lvE_G_p2_Controller.text),
                    lvE_G_p3: double.parse(_lvE_G_p3_Controller.text),
                    lvE_G_Vdf1: double.parse(_lvE_G_Vdf1_Controller.text),
                    lvE_G_Vdf2: double.parse(_lvE_G_Vdf2_Controller.text),
                    lvE_G_Vdf3: double.parse(_lvE_G_Vdf3_Controller.text),
                    lvE_Grnd_u1: double.parse(_lvE_Grnd_u1_Controller.text),
                    lvE_Grnd_u2: double.parse(_lvE_Grnd_u2_Controller.text),
                    lvE_Grnd_u3: double.parse(_lvE_Grnd_u3_Controller.text),
                    lvE_Grnd_i1: double.parse(_lvE_Grnd_i1_Controller.text),
                    lvE_Grnd_i2: double.parse(_lvE_Grnd_i2_Controller.text),
                    lvE_Grnd_i3: double.parse(_lvE_Grnd_i3_Controller.text),
                    lvE_Grnd_c1: double.parse(_lvE_Grnd_c1_Controller.text),
                    lvE_Grnd_c2: double.parse(_lvE_Grnd_c2_Controller.text),
                    lvE_Grnd_c3: double.parse(_lvE_Grnd_c3_Controller.text),
                    lvE_Grnd_tanD1:
                        double.parse(_lvE_Grnd_tanD1_Controller.text),
                    lvE_Grnd_tanD2:
                        double.parse(_lvE_Grnd_tanD2_Controller.text),
                    lvE_Grnd_tanD3:
                        double.parse(_lvE_Grnd_tanD3_Controller.text),
                    lvE_Grnd_p1: double.parse(_lvE_Grnd_p1_Controller.text),
                    lvE_Grnd_p2: double.parse(_lvE_Grnd_p2_Controller.text),
                    lvE_Grnd_p3: double.parse(_lvE_Grnd_p3_Controller.text),
                    lvE_Grnd_Vdf1: double.parse(_lvE_Grnd_Vdf1_Controller.text),
                    lvE_Grnd_Vdf2: double.parse(_lvE_Grnd_Vdf2_Controller.text),
                    lvE_Grnd_Vdf3: double.parse(_lvE_Grnd_Vdf3_Controller.text),
                    equipmentUsed: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,

                    // updateDate: DateTime.now(),
                  );
                  print(PowttdtoLocal);
                  print(PowttdtoLocal.trNo);
                  getX((PowttdProvider x) => x.addPowttd(PowttdtoLocal));
                  watchOnly((PowttdProvider x) => {});

                  Navigator.popAndPushNamed(context, '/detail_POWT',
                      arguments: {
                        'id': args['POWT_ID'],
                        'powtDatabaseID': POWT_ID,
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

                    Divider(color: Colors.black, thickness: 1),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: EquipmentTypeList(),
                    ),
                    powt_td_page_PC_numpad(
                        _ru1_Controller, 'R Ph Bushings U -1'),
                    powt_td_page_PC_numpad(
                        _ru2_Controller, 'R Ph Bushings U -2'),
                    powt_td_page_PC_numpad(
                        _ru3_Controller, 'R Ph Bushings U -3'),
                    powt_td_page_PC_numpad(
                        _ri1_Controller, 'R Ph Bushings I-1'),
                    powt_td_page_PC_numpad(
                        _ri2_Controller, 'R Ph Bushings I-2'),
                    powt_td_page_PC_numpad(
                        _ri3_Controller, 'R Ph Bushings I-3'),
                    powt_td_page_PC_numpad(
                        _rc1_Controller, 'R Ph Bushings c-1'),
                    powt_td_page_PC_numpad(
                        _rc2_Controller, 'R Ph Bushings c-2'),
                    powt_td_page_PC_numpad(
                        _rc3_Controller, 'R Ph Bushings c-3'),
                    powt_td_page_PC_numpad(
                        _rtanD1_Controller, 'R Ph Bushings tanD-1'),
                    powt_td_page_PC_numpad(
                        _rtanD2_Controller, 'R Ph Bushings tanD-2'),
                    powt_td_page_PC_numpad(
                        _rtanD3_Controller, 'R Ph Bushings tanD-3'),
                    powt_td_page_PC_numpad(
                        _rp1_Controller, 'R Ph Bushings p-1'),
                    powt_td_page_PC_numpad(
                        _rp2_Controller, 'R Ph Bushings p-2'),
                    powt_td_page_PC_numpad(
                        _rp3_Controller, 'R Ph Bushings p-3'),
                    powt_td_page_PC_numpad(
                        _rVdf1_Controller, 'R Ph Bushings Vdf-1'),
                    powt_td_page_PC_numpad(
                        _rVdf2_Controller, 'R Ph Bushings Vdf-2'),
                    powt_td_page_PC_numpad(
                        _rVdf3_Controller, 'R Ph Bushings Vdf-3'),
                    powt_td_page_PC_numpad(
                        _yu1_Controller, 'Y Ph Bushings u-1'),
                    powt_td_page_PC_numpad(
                        _yu2_Controller, 'Y Ph Bushings u-2'),
                    powt_td_page_PC_numpad(
                        _yu3_Controller, 'Y Ph Bushings u-3'),
                    powt_td_page_PC_numpad(
                        _yi1_Controller, 'Y Ph Bushings i-1'),
                    powt_td_page_PC_numpad(
                        _yi2_Controller, 'Y Ph Bushings i-2'),
                    powt_td_page_PC_numpad(
                        _yi3_Controller, 'Y Ph Bushings i-3'),
                    powt_td_page_PC_numpad(
                        _yc1_Controller, 'Y Ph Bushings c-1'),
                    powt_td_page_PC_numpad(
                        _yc2_Controller, 'Y Ph Bushings c-2'),
                    powt_td_page_PC_numpad(
                        _yc3_Controller, 'Y Ph Bushings c-3'),
                    powt_td_page_PC_numpad(
                        _ytanD1_Controller, 'Y Ph Bushings tanD-1'),
                    powt_td_page_PC_numpad(
                        _ytanD2_Controller, 'Y Ph Bushings tanD-2'),
                    powt_td_page_PC_numpad(
                        _ytanD3_Controller, 'Y Ph Bushings tanD-3'),
                    powt_td_page_PC_numpad(
                        _yp1_Controller, 'Y Ph Bushings p-1'),
                    powt_td_page_PC_numpad(
                        _yp2_Controller, 'Y Ph Bushings p-2'),
                    powt_td_page_PC_numpad(
                        _yp3_Controller, 'Y Ph Bushings p-3'),
                    powt_td_page_PC_numpad(
                        _yVdf1_Controller, 'Y Ph Bushings Vdf-1'),
                    powt_td_page_PC_numpad(
                        _yVdf2_Controller, 'Y Ph Bushings Vdf-2'),
                    powt_td_page_PC_numpad(
                        _yVdf3_Controller, 'Y Ph Bushings Vdf-3'),
                    powt_td_page_PC_numpad(
                        _bu1_Controller, 'B Ph Bushings U-1'),
                    powt_td_page_PC_numpad(
                        _bu2_Controller, 'B Ph Bushings U-2'),
                    powt_td_page_PC_numpad(
                        _bu3_Controller, 'B Ph Bushings U-3'),
                    powt_td_page_PC_numpad(
                        _bi1_Controller, 'B Ph Bushings I-1'),
                    powt_td_page_PC_numpad(
                        _bi2_Controller, 'B Ph Bushings I-2'),
                    powt_td_page_PC_numpad(
                        _bi3_Controller, 'B Ph Bushings I-3'),
                    powt_td_page_PC_numpad(
                        _bc1_Controller, 'B Ph Bushings C-1'),
                    powt_td_page_PC_numpad(
                        _bc2_Controller, 'B Ph Bushings C-2'),
                    powt_td_page_PC_numpad(
                        _bc3_Controller, 'B Ph Bushings C-3'),
                    powt_td_page_PC_numpad(
                        _btanD1_Controller, 'B Ph Bushings tanD-1'),
                    powt_td_page_PC_numpad(
                        _btanD2_Controller, 'B Ph Bushings tanD-2'),
                    powt_td_page_PC_numpad(
                        _btanD3_Controller, 'B Ph Bushings tanD-3'),
                    powt_td_page_PC_numpad(
                        _bp1_Controller, 'B Ph Bushings P-1'),
                    powt_td_page_PC_numpad(
                        _bp2_Controller, 'B Ph Bushings P-2'),
                    powt_td_page_PC_numpad(
                        _bp3_Controller, 'B Ph Bushings P-3'),
                    powt_td_page_PC_numpad(
                        _bVdf1_Controller, 'B Ph Bushings VDF-1'),
                    powt_td_page_PC_numpad(
                        _bVdf2_Controller, 'B Ph Bushings VDF-2'),
                    powt_td_page_PC_numpad(
                        _bVdf3_Controller, 'B Ph Bushings VDF-3'),
                    powt_td_page_PC_numpad(
                        _hv_lv_u1_Controller, 'HV-LV Winding U-1'),
                    powt_td_page_PC_numpad(
                        _hv_lv_u2_Controller, 'HV-LV Winding U-2'),
                    powt_td_page_PC_numpad(
                        _hv_lv_u3_Controller, 'HV-LV Winding U-3'),
                    powt_td_page_PC_numpad(
                        _hv_lv_i1_Controller, 'HV-LV Winding I-1'),
                    powt_td_page_PC_numpad(
                        _hv_lv_i2_Controller, 'HV-LV Winding I-2'),
                    powt_td_page_PC_numpad(
                        _hv_lv_i3_Controller, 'HV-LV Winding I-3'),
                    powt_td_page_PC_numpad(
                        _hv_lv_c1_Controller, 'HV-LV Winding C-1'),
                    powt_td_page_PC_numpad(
                        _hv_lv_c2_Controller, 'HV-LV Winding C-2'),
                    powt_td_page_PC_numpad(
                        _hv_lv_c3_Controller, 'HV-LV Winding C-3'),
                    powt_td_page_PC_numpad(
                        _hv_lv_tanD1_Controller, 'HV-LV Winding tanD-1'),
                    powt_td_page_PC_numpad(
                        _hv_lv_tanD2_Controller, 'HV-LV Winding tanD-2'),
                    powt_td_page_PC_numpad(
                        _hv_lv_tanD3_Controller, 'HV-LV Winding tanD-3'),
                    powt_td_page_PC_numpad(
                        _hv_lv_p1_Controller, 'HV-LV Winding P-1'),
                    powt_td_page_PC_numpad(
                        _hv_lv_p2_Controller, 'HV-LV Winding P-2'),
                    powt_td_page_PC_numpad(
                        _hv_lv_p3_Controller, 'HV-LV Winding P-3'),
                    powt_td_page_PC_numpad(
                        _hv_lv_Vdf1_Controller, 'HV-LV Winding VDF-1'),
                    powt_td_page_PC_numpad(
                        _hv_lv_Vdf2_Controller, 'HV-LV Winding VDF-2'),
                    powt_td_page_PC_numpad(
                        _hv_lv_Vdf3_Controller, 'HV-LV Winding VDF-3'),
                    powt_td_page_PC_numpad(
                        _hvE_G_u1_Controller, 'HV-E Guard U-1'),
                    powt_td_page_PC_numpad(
                        _hvE_G_u2_Controller, 'HV-E Guard U-2'),
                    powt_td_page_PC_numpad(
                        _hvE_G_u3_Controller, 'HV-E Guard U-3'),
                    powt_td_page_PC_numpad(
                        _hvE_G_i1_Controller, 'HV-E Guard I-1'),
                    powt_td_page_PC_numpad(
                        _hvE_G_i2_Controller, 'HV-E Guard I-2'),
                    powt_td_page_PC_numpad(
                        _hvE_G_i3_Controller, 'HV-E Guard I-3'),
                    powt_td_page_PC_numpad(
                        _hvE_G_c1_Controller, 'HV-E Guard C-1'),
                    powt_td_page_PC_numpad(
                        _hvE_G_c2_Controller, 'HV-E Guard C-2'),
                    powt_td_page_PC_numpad(
                        _hvE_G_c3_Controller, 'HV-E Guard C-3'),
                    powt_td_page_PC_numpad(
                        _hvE_G_tanD1_Controller, 'HV-E Guard tanD-1'),
                    powt_td_page_PC_numpad(
                        _hvE_G_tanD2_Controller, 'HV-E Guard tanD-2'),
                    powt_td_page_PC_numpad(
                        _hvE_G_tanD3_Controller, 'HV-E Guard tanD-3'),
                    powt_td_page_PC_numpad(
                        _hvE_G_p1_Controller, 'HV-E Guard P-1'),
                    powt_td_page_PC_numpad(
                        _hvE_G_p2_Controller, 'HV-E Guard P-2'),
                    powt_td_page_PC_numpad(
                        _hvE_G_p3_Controller, 'HV-E Guard P-3'),
                    powt_td_page_PC_numpad(
                        _hvE_G_Vdf1_Controller, 'HV-E Guard VDF-1'),
                    powt_td_page_PC_numpad(
                        _hvE_G_Vdf2_Controller, 'HV-E Guard VDF-2'),
                    powt_td_page_PC_numpad(
                        _hvE_G_Vdf3_Controller, 'HV-E Guard VDF-3'),
                    powt_td_page_PC_numpad(
                        _hvE_Grnd_u1_Controller, 'HV-E Ground U-1'),
                    powt_td_page_PC_numpad(
                        _hvE_Grnd_u2_Controller, 'HV-E Ground U-2'),
                    powt_td_page_PC_numpad(
                        _hvE_Grnd_u3_Controller, 'HV-E Ground U-3'),
                    powt_td_page_PC_numpad(
                        _hvE_Grnd_i1_Controller, 'HV-E Ground I-1'),
                    powt_td_page_PC_numpad(
                        _hvE_Grnd_i2_Controller, 'HV-E Ground I-2'),
                    powt_td_page_PC_numpad(
                        _hvE_Grnd_i3_Controller, 'HV-E Ground I-3'),
                    powt_td_page_PC_numpad(
                        _hvE_Grnd_c1_Controller, 'HV-E Ground c-1'),
                    powt_td_page_PC_numpad(
                        _hvE_Grnd_c2_Controller, 'HV-E Ground C-2'),
                    powt_td_page_PC_numpad(
                        _hvE_Grnd_c3_Controller, 'HV-E Ground C-3'),
                    powt_td_page_PC_numpad(
                        _hvE_Grnd_tanD1_Controller, 'HV-E Ground tanD-1'),
                    powt_td_page_PC_numpad(
                        _hvE_Grnd_tanD2_Controller, 'HV-E Ground tanD-2'),
                    powt_td_page_PC_numpad(
                        _hvE_Grnd_tanD3_Controller, 'HV-E Ground tanD-3'),
                    powt_td_page_PC_numpad(
                        _hvE_Grnd_p1_Controller, 'HV-E Ground P-1'),
                    powt_td_page_PC_numpad(
                        _hvE_Grnd_p2_Controller, 'HV-E Ground P-2'),
                    powt_td_page_PC_numpad(
                        _hvE_Grnd_p3_Controller, 'HV-E Ground P-3'),
                    powt_td_page_PC_numpad(
                        _hvE_Grnd_Vdf1_Controller, 'HV-E Ground VDF-1'),
                    powt_td_page_PC_numpad(
                        _hvE_Grnd_Vdf2_Controller, 'HV-E Ground VDF-2'),
                    powt_td_page_PC_numpad(
                        _hvE_Grnd_Vdf3_Controller, 'HV-E Ground VDF-3'),
                    powt_td_page_PC_numpad(
                        _lvEu1_Controller, 'LV-E Winding U-1'),
                    powt_td_page_PC_numpad(
                        _lvEu2_Controller, 'LV-E Winding U-2'),
                    powt_td_page_PC_numpad(
                        _lvEu3_Controller, 'LV-E Winding U-3'),
                    powt_td_page_PC_numpad(
                        _lvEi1_Controller, 'LV-E Winding I-1'),
                    powt_td_page_PC_numpad(
                        _lvEi2_Controller, 'LV-E Winding I-2'),
                    powt_td_page_PC_numpad(
                        _lvEi3_Controller, 'LV-E Winding I-3'),
                    powt_td_page_PC_numpad(
                        _lvEc1_Controller, 'LV-E Winding C-1'),
                    powt_td_page_PC_numpad(
                        _lvEc2_Controller, 'LV-E Winding C-2'),
                    powt_td_page_PC_numpad(
                        _lvEc3_Controller, 'LV-E Winding C-3'),
                    powt_td_page_PC_numpad(
                        _lvEtanD1_Controller, 'LV-E Winding tanD-1'),
                    powt_td_page_PC_numpad(
                        _lvEtanD2_Controller, 'LV-E Winding tanD-2'),
                    powt_td_page_PC_numpad(
                        _lvEtanD3_Controller, 'LV-E Winding tanD-3'),
                    powt_td_page_PC_numpad(
                        _lvEp1_Controller, 'LV-E Winding P-1'),
                    powt_td_page_PC_numpad(
                        _lvEp2_Controller, 'LV-E Winding P-2'),
                    powt_td_page_PC_numpad(
                        _lvEp3_Controller, 'LV-E Winding P-3'),
                    powt_td_page_PC_numpad(
                        _lvEVdf1_Controller, 'LV-E Winding VDF-1'),
                    powt_td_page_PC_numpad(
                        _lvEVdf2_Controller, 'LV-E Winding VDF-2'),
                    powt_td_page_PC_numpad(
                        _lvEVdf3_Controller, 'LV-E Winding VDF-3'),
                    powt_td_page_PC_numpad(
                        _lvE_G_u1_Controller, 'LV-E Guard U-1'),
                    powt_td_page_PC_numpad(
                        _lvE_G_u2_Controller, 'LV-E Guard U-2'),
                    powt_td_page_PC_numpad(
                        _lvE_G_u3_Controller, 'LV-E Guard U-3'),
                    powt_td_page_PC_numpad(
                        _lvE_G_i1_Controller, 'LV-E Guard I-1'),
                    powt_td_page_PC_numpad(
                        _lvE_G_i2_Controller, 'LV-E Guard I-2'),
                    powt_td_page_PC_numpad(
                        _lvE_G_i3_Controller, 'LV-E Guard I-3'),
                    powt_td_page_PC_numpad(
                        _lvE_G_c1_Controller, 'LV-E Guard C-1'),
                    powt_td_page_PC_numpad(
                        _lvE_G_c2_Controller, 'LV-E Guard C-2'),
                    powt_td_page_PC_numpad(
                        _lvE_G_c3_Controller, 'LV-E Guard C-3'),
                    powt_td_page_PC_numpad(
                        _lvE_G_tanD1_Controller, 'LV-E Guard tanD-1'),
                    powt_td_page_PC_numpad(
                        _lvE_G_tanD2_Controller, 'LV-E Guard tanD-2'),
                    powt_td_page_PC_numpad(
                        _lvE_G_tanD3_Controller, 'LV-E Guard tanD-3'),
                    powt_td_page_PC_numpad(
                        _lvE_G_p1_Controller, 'LV-E Guard P-1'),
                    powt_td_page_PC_numpad(
                        _lvE_G_p2_Controller, 'LV-E Guard P-2'),
                    powt_td_page_PC_numpad(
                        _lvE_G_p3_Controller, 'LV-E Guard P-3'),
                    powt_td_page_PC_numpad(
                        _lvE_G_Vdf1_Controller, 'LV-E Guard VDF-1'),
                    powt_td_page_PC_numpad(
                        _lvE_G_Vdf2_Controller, 'LV-E Guard VDF2'),
                    powt_td_page_PC_numpad(
                        _lvE_G_Vdf3_Controller, 'LV-E Guard VDF-3'),
                    powt_td_page_PC_numpad(
                        _lvE_Grnd_u1_Controller, 'LV-E Ground U-1'),
                    powt_td_page_PC_numpad(
                        _lvE_Grnd_u2_Controller, 'LV-E Ground U-2'),
                    powt_td_page_PC_numpad(
                        _lvE_Grnd_u3_Controller, 'LV-E Ground U-3'),
                    powt_td_page_PC_numpad(
                        _lvE_Grnd_i1_Controller, 'LV-E Ground I-1'),
                    powt_td_page_PC_numpad(
                        _lvE_Grnd_i2_Controller, 'LV-E Ground I-2'),
                    powt_td_page_PC_numpad(
                        _lvE_Grnd_i3_Controller, 'LV-E Ground I-3'),
                    powt_td_page_PC_numpad(
                        _lvE_Grnd_c1_Controller, 'LV-E Ground C-1'),
                    powt_td_page_PC_numpad(
                        _lvE_Grnd_c2_Controller, 'LV-E Ground C-2'),
                    powt_td_page_PC_numpad(
                        _lvE_Grnd_c3_Controller, 'LV-E Ground C-3'),
                    powt_td_page_PC_numpad(
                        _lvE_Grnd_tanD1_Controller, 'LV-E Ground tanD-1'),
                    powt_td_page_PC_numpad(
                        _lvE_Grnd_tanD2_Controller, 'LV-E Ground tanD-2'),
                    powt_td_page_PC_numpad(
                        _lvE_Grnd_tanD3_Controller, 'LV-E Ground tanD-3'),
                    powt_td_page_PC_numpad(
                        _lvE_Grnd_p1_Controller, 'LV-E Ground P-1'),
                    powt_td_page_PC_numpad(
                        _lvE_Grnd_p2_Controller, 'LV-E Ground P-2'),
                    powt_td_page_PC_numpad(
                        _lvE_Grnd_p3_Controller, 'LV-E Ground P-3'),
                    powt_td_page_PC_numpad(
                        _lvE_Grnd_Vdf1_Controller, 'LV-E Ground VDF1'),
                    powt_td_page_PC_numpad(
                        _lvE_Grnd_Vdf2_Controller, 'LV-E Ground VDF2'),
                    powt_td_page_PC_numpad(
                        _lvE_Grnd_Vdf3_Controller, 'LV-E Ground VDF3'),
                    Divider(color: Colors.white)
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
                    powt_td_page_mobile_numpad(
                        _ru1_Controller, 'R Ph Bushings u-1'),
                    powt_td_page_mobile_numpad(
                        _ru2_Controller, 'R Ph Bushings u-2'),
                    powt_td_page_mobile_numpad(
                        _ru3_Controller, 'R Ph Bushings u-3'),
                    powt_td_page_mobile_numpad(
                        _ri1_Controller, 'R Ph Bushings i-1'),
                    powt_td_page_mobile_numpad(
                        _ri2_Controller, 'R Ph Bushings i-2'),
                    powt_td_page_mobile_numpad(
                        _ri3_Controller, 'R Ph Bushings i-3'),
                    powt_td_page_mobile_numpad(
                        _rc1_Controller, 'R Ph Bushings c-1'),
                    powt_td_page_mobile_numpad(
                        _rc2_Controller, 'R Ph Bushings c-2'),
                    powt_td_page_mobile_numpad(
                        _rc3_Controller, 'R Ph Bushings c-3'),
                    powt_td_page_mobile_numpad(
                        _rtanD1_Controller, 'R Ph Bushings tanD-1'),
                    powt_td_page_mobile_numpad(
                        _rtanD2_Controller, 'R Ph Bushings tanD-2'),
                    powt_td_page_mobile_numpad(
                        _rtanD3_Controller, 'R Ph Bushings tanD-3'),
                    powt_td_page_mobile_numpad(
                        _rp1_Controller, 'R Ph Bushings p-1'),
                    powt_td_page_mobile_numpad(
                        _rp2_Controller, 'R Ph Bushings p-2'),
                    powt_td_page_mobile_numpad(
                        _rp3_Controller, 'R Ph Bushings p-3'),
                    powt_td_page_mobile_numpad(
                        _rVdf1_Controller, 'R Ph Bushings Vdf-1'),
                    powt_td_page_mobile_numpad(
                        _rVdf2_Controller, 'R Ph Bushings Vdf-2'),
                    powt_td_page_mobile_numpad(
                        _rVdf3_Controller, 'R Ph Bushings Vdf-3'),
                    powt_td_page_mobile_numpad(
                        _yu1_Controller, 'Y Ph Bushings u-1'),
                    powt_td_page_mobile_numpad(
                        _yu2_Controller, 'Y Ph Bushings u-2'),
                    powt_td_page_mobile_numpad(
                        _yu3_Controller, 'Y Ph Bushings u-3'),
                    powt_td_page_mobile_numpad(
                        _yi1_Controller, 'Y Ph Bushings i-1'),
                    powt_td_page_mobile_numpad(
                        _yi2_Controller, 'Y Ph Bushings i-2'),
                    powt_td_page_mobile_numpad(
                        _yi3_Controller, 'Y Ph Bushings i-3'),
                    powt_td_page_mobile_numpad(
                        _yc1_Controller, 'Y Ph Bushings c-1'),
                    powt_td_page_mobile_numpad(
                        _yc2_Controller, 'Y Ph Bushings c-2'),
                    powt_td_page_mobile_numpad(
                        _yc3_Controller, 'Y Ph Bushings c-3'),
                    powt_td_page_mobile_numpad(
                        _ytanD1_Controller, 'Y Ph Bushings tanD-1'),
                    powt_td_page_mobile_numpad(
                        _ytanD2_Controller, 'Y Ph Bushings tanD-2'),
                    powt_td_page_mobile_numpad(
                        _ytanD3_Controller, 'Y Ph Bushings tanD-3'),
                    powt_td_page_mobile_numpad(
                        _yp1_Controller, 'Y Ph Bushings p-1'),
                    powt_td_page_mobile_numpad(
                        _yp2_Controller, 'Y Ph Bushings p-2'),
                    powt_td_page_mobile_numpad(
                        _yp3_Controller, 'Y Ph Bushings p-3'),
                    powt_td_page_mobile_numpad(
                        _yVdf1_Controller, 'Y Ph Bushings Vdf-1'),
                    powt_td_page_mobile_numpad(
                        _yVdf2_Controller, 'Y Ph Bushings Vdf-2'),
                    powt_td_page_mobile_numpad(
                        _yVdf3_Controller, 'Y Ph Bushings Vdf-3'),
                    powt_td_page_mobile_numpad(
                        _bu1_Controller, 'B Ph Bushings U-1'),
                    powt_td_page_mobile_numpad(
                        _bu2_Controller, 'B Ph Bushings U-2'),
                    powt_td_page_mobile_numpad(
                        _bu3_Controller, 'B Ph Bushings U-3'),
                    powt_td_page_mobile_numpad(
                        _bi1_Controller, 'B Ph Bushings I-1'),
                    powt_td_page_mobile_numpad(
                        _bi2_Controller, 'B Ph Bushings I-2'),
                    powt_td_page_mobile_numpad(
                        _bi3_Controller, 'B Ph Bushings I-3'),
                    powt_td_page_mobile_numpad(
                        _bc1_Controller, 'B Ph Bushings C-1'),
                    powt_td_page_mobile_numpad(
                        _bc2_Controller, 'B Ph Bushings C-2'),
                    powt_td_page_mobile_numpad(
                        _bc3_Controller, 'B Ph Bushings C-3'),
                    powt_td_page_mobile_numpad(
                        _btanD1_Controller, 'B Ph Bushings tanD-1'),
                    powt_td_page_mobile_numpad(
                        _btanD2_Controller, 'B Ph Bushings tanD-2'),
                    powt_td_page_mobile_numpad(
                        _btanD3_Controller, 'B Ph Bushings tanD-3'),
                    powt_td_page_mobile_numpad(
                        _bp1_Controller, 'B Ph Bushings P-1'),
                    powt_td_page_mobile_numpad(
                        _bp2_Controller, 'B Ph Bushings P-2'),
                    powt_td_page_mobile_numpad(
                        _bp3_Controller, 'B Ph Bushings P-3'),
                    powt_td_page_mobile_numpad(
                        _bVdf1_Controller, 'B Ph Bushings VDF1'),
                    powt_td_page_mobile_numpad(
                        _bVdf2_Controller, 'B Ph Bushings VDF2'),
                    powt_td_page_mobile_numpad(
                        _bVdf3_Controller, 'B Ph Bushings VDF3'),
                    powt_td_page_mobile_numpad(
                        _hv_lv_u1_Controller, 'HV-LV Winding U-1'),
                    powt_td_page_mobile_numpad(
                        _hv_lv_u2_Controller, 'HV-LV Winding U-2'),
                    powt_td_page_mobile_numpad(
                        _hv_lv_u3_Controller, 'HV-LV Winding U-3'),
                    powt_td_page_mobile_numpad(
                        _hv_lv_i1_Controller, 'HV-LV Winding I-1'),
                    powt_td_page_mobile_numpad(
                        _hv_lv_i2_Controller, 'HV-LV Winding I-2'),
                    powt_td_page_mobile_numpad(
                        _hv_lv_i3_Controller, 'HV-LV Winding I-3'),
                    powt_td_page_mobile_numpad(
                        _hv_lv_c1_Controller, 'HV-LV Winding C-1'),
                    powt_td_page_mobile_numpad(
                        _hv_lv_c2_Controller, 'HV-LV Winding C-2'),
                    powt_td_page_mobile_numpad(
                        _hv_lv_c3_Controller, 'HV-LV Winding C-3'),
                    powt_td_page_mobile_numpad(
                        _hv_lv_tanD1_Controller, 'HV-LV Winding tanD-1'),
                    powt_td_page_mobile_numpad(
                        _hv_lv_tanD2_Controller, 'HV-LV Winding tanD-2'),
                    powt_td_page_mobile_numpad(
                        _hv_lv_tanD3_Controller, 'HV-LV Winding tanD-3'),
                    powt_td_page_mobile_numpad(
                        _hv_lv_p1_Controller, 'HV-LV Winding P-1'),
                    powt_td_page_mobile_numpad(
                        _hv_lv_p2_Controller, 'HV-LV Winding P-2'),
                    powt_td_page_mobile_numpad(
                        _hv_lv_p3_Controller, 'HV-LV Winding P-3'),
                    powt_td_page_mobile_numpad(
                        _hv_lv_Vdf1_Controller, 'HV-LV Winding VDF1'),
                    powt_td_page_mobile_numpad(
                        _hv_lv_Vdf2_Controller, 'HV-LV Winding VDF2'),
                    powt_td_page_mobile_numpad(
                        _hv_lv_Vdf3_Controller, 'HV-LV Winding VDF3'),
                    powt_td_page_mobile_numpad(
                        _hvE_G_u1_Controller, 'HV-E Guard U-1'),
                    powt_td_page_mobile_numpad(
                        _hvE_G_u2_Controller, 'HV-E Guard U-2'),
                    powt_td_page_mobile_numpad(
                        _hvE_G_u3_Controller, 'HV-E Guard U-3'),
                    powt_td_page_mobile_numpad(
                        _hvE_G_i1_Controller, 'HV-E Guard I-1'),
                    powt_td_page_mobile_numpad(
                        _hvE_G_i2_Controller, 'HV-E Guard I-2'),
                    powt_td_page_mobile_numpad(
                        _hvE_G_i3_Controller, 'HV-E Guard I-3'),
                    powt_td_page_mobile_numpad(
                        _hvE_G_c1_Controller, 'HV-E Guard C-1'),
                    powt_td_page_mobile_numpad(
                        _hvE_G_c2_Controller, 'HV-E Guard C-2'),
                    powt_td_page_mobile_numpad(
                        _hvE_G_c3_Controller, 'HV-E Guard C-3'),
                    powt_td_page_mobile_numpad(
                        _hvE_G_tanD1_Controller, 'HV-E Guard tanD-1'),
                    powt_td_page_mobile_numpad(
                        _hvE_G_tanD2_Controller, 'HV-E Guard tanD-2'),
                    powt_td_page_mobile_numpad(
                        _hvE_G_tanD3_Controller, 'HV-E Guard tanD-3'),
                    powt_td_page_mobile_numpad(
                        _hvE_G_p1_Controller, 'HV-E Guard P-1'),
                    powt_td_page_mobile_numpad(
                        _hvE_G_p2_Controller, 'HV-E Guard P-2'),
                    powt_td_page_mobile_numpad(
                        _hvE_G_p3_Controller, 'HV-E Guard P-3'),
                    powt_td_page_mobile_numpad(
                        _hvE_G_Vdf1_Controller, 'HV-E Guard VDF1'),
                    powt_td_page_mobile_numpad(
                        _hvE_G_Vdf2_Controller, 'HV-E Guard VDF2'),
                    powt_td_page_mobile_numpad(
                        _hvE_G_Vdf3_Controller, 'HV-E Guard VDF3'),
                    powt_td_page_mobile_numpad(
                        _hvE_Grnd_u1_Controller, 'HV-E Ground U-1'),
                    powt_td_page_mobile_numpad(
                        _hvE_Grnd_u2_Controller, 'HV-E Ground U-2'),
                    powt_td_page_mobile_numpad(
                        _hvE_Grnd_u3_Controller, 'HV-E Ground U-3'),
                    powt_td_page_mobile_numpad(
                        _hvE_Grnd_i1_Controller, 'HV-E Ground I-1'),
                    powt_td_page_mobile_numpad(
                        _hvE_Grnd_i2_Controller, 'HV-E Ground I-2'),
                    powt_td_page_mobile_numpad(
                        _hvE_Grnd_i3_Controller, 'HV-E Ground I-3'),
                    powt_td_page_mobile_numpad(
                        _hvE_Grnd_c1_Controller, 'HV-E Ground C-1'),
                    powt_td_page_mobile_numpad(
                        _hvE_Grnd_c2_Controller, 'HV-E Ground C-2'),
                    powt_td_page_mobile_numpad(
                        _hvE_Grnd_c3_Controller, 'HV-E Ground C-3'),
                    powt_td_page_mobile_numpad(
                        _hvE_Grnd_tanD1_Controller, 'HV-E Ground tanD-1'),
                    powt_td_page_mobile_numpad(
                        _hvE_Grnd_tanD2_Controller, 'HV-E Ground tanD-2'),
                    powt_td_page_mobile_numpad(
                        _hvE_Grnd_tanD3_Controller, 'HV-E Ground tanD-3'),
                    powt_td_page_mobile_numpad(
                        _hvE_Grnd_p1_Controller, 'HV-E Ground P-1'),
                    powt_td_page_mobile_numpad(
                        _hvE_Grnd_p2_Controller, 'HV-E Ground P-2'),
                    powt_td_page_mobile_numpad(
                        _hvE_Grnd_p3_Controller, 'HV-E Ground P-3'),
                    powt_td_page_mobile_numpad(
                        _hvE_Grnd_Vdf1_Controller, 'HV-E Ground VDF1'),
                    powt_td_page_mobile_numpad(
                        _hvE_Grnd_Vdf2_Controller, 'HV-E Ground VDF2'),
                    powt_td_page_mobile_numpad(
                        _hvE_Grnd_Vdf3_Controller, 'HV-E Ground VDF3'),
                    powt_td_page_mobile_numpad(
                        _lvEu1_Controller, 'LV-E Winding U-1'),
                    powt_td_page_mobile_numpad(
                        _lvEu2_Controller, 'LV-E Winding U-2'),
                    powt_td_page_mobile_numpad(
                        _lvEu3_Controller, 'LV-E Winding U-3'),
                    powt_td_page_mobile_numpad(
                        _lvEi1_Controller, 'LV-E Winding I-1'),
                    powt_td_page_mobile_numpad(
                        _lvEi2_Controller, 'LV-E Winding I-2'),
                    powt_td_page_mobile_numpad(
                        _lvEi3_Controller, 'LV-E Winding I-3'),
                    powt_td_page_mobile_numpad(
                        _lvEc1_Controller, 'LV-E Winding C-1'),
                    powt_td_page_mobile_numpad(
                        _lvEc2_Controller, 'LV-E Winding C-2'),
                    powt_td_page_mobile_numpad(
                        _lvEc3_Controller, 'LV-E Winding C-3'),
                    powt_td_page_mobile_numpad(
                        _lvEtanD1_Controller, 'LV-E Winding tanD-1'),
                    powt_td_page_mobile_numpad(
                        _lvEtanD2_Controller, 'LV-E Winding tanD-2'),
                    powt_td_page_mobile_numpad(
                        _lvEtanD3_Controller, 'LV-E Winding tanD-3'),
                    powt_td_page_mobile_numpad(
                        _lvEp1_Controller, 'LV-E Winding P-1'),
                    powt_td_page_mobile_numpad(
                        _lvEp2_Controller, 'LV-E Winding P-2'),
                    powt_td_page_mobile_numpad(
                        _lvEp3_Controller, 'LV-E Winding P-3'),
                    powt_td_page_mobile_numpad(
                        _lvEVdf1_Controller, 'LV-E Winding VDF1'),
                    powt_td_page_mobile_numpad(
                        _lvEVdf2_Controller, 'LV-E Winding VDF2'),
                    powt_td_page_mobile_numpad(
                        _lvEVdf3_Controller, 'LV-E Winding VDF3'),
                    powt_td_page_mobile_numpad(
                        _lvE_G_u1_Controller, 'LV-E Guard U-1'),
                    powt_td_page_mobile_numpad(
                        _lvE_G_u2_Controller, 'LV-E Guard U-2'),
                    powt_td_page_mobile_numpad(
                        _lvE_G_u3_Controller, 'LV-E Guard U-3'),
                    powt_td_page_mobile_numpad(
                        _lvE_G_i1_Controller, 'LV-E Guard I-1'),
                    powt_td_page_mobile_numpad(
                        _lvE_G_i2_Controller, 'LV-E Guard I-2'),
                    powt_td_page_mobile_numpad(
                        _lvE_G_i3_Controller, 'LV-E Guard I-3'),
                    powt_td_page_mobile_numpad(
                        _lvE_G_c1_Controller, 'LV-E Guard C-1'),
                    powt_td_page_mobile_numpad(
                        _lvE_G_c2_Controller, 'LV-E Guard C-2'),
                    powt_td_page_mobile_numpad(
                        _lvE_G_c3_Controller, 'LV-E Guard C-3'),
                    powt_td_page_mobile_numpad(
                        _lvE_G_tanD1_Controller, 'LV-E Guard tanD-1'),
                    powt_td_page_mobile_numpad(
                        _lvE_G_tanD2_Controller, 'LV-E Guard tanD-2'),
                    powt_td_page_mobile_numpad(
                        _lvE_G_tanD3_Controller, 'LV-E Guard tanD-3'),
                    powt_td_page_mobile_numpad(
                        _lvE_G_p1_Controller, 'LV-E Guard P-1'),
                    powt_td_page_mobile_numpad(
                        _lvE_G_p2_Controller, 'LV-E Guard P-2'),
                    powt_td_page_mobile_numpad(
                        _lvE_G_p3_Controller, 'LV-E Guard P-3'),
                    powt_td_page_mobile_numpad(
                        _lvE_G_Vdf1_Controller, 'LV-E Guard VDF1'),
                    powt_td_page_mobile_numpad(
                        _lvE_G_Vdf2_Controller, 'LV-E Guard VDF2'),
                    powt_td_page_mobile_numpad(
                        _lvE_G_Vdf3_Controller, 'LV-E Guard VDF3'),
                    powt_td_page_mobile_numpad(
                        _lvE_Grnd_u1_Controller, 'LV-E Ground U-1'),
                    powt_td_page_mobile_numpad(
                        _lvE_Grnd_u2_Controller, 'LV-E Ground U-2'),
                    powt_td_page_mobile_numpad(
                        _lvE_Grnd_u3_Controller, 'LV-E Ground U-3'),
                    powt_td_page_mobile_numpad(
                        _lvE_Grnd_i1_Controller, 'LV-E Ground I-1'),
                    powt_td_page_mobile_numpad(
                        _lvE_Grnd_i2_Controller, 'LV-E Ground I-2'),
                    powt_td_page_mobile_numpad(
                        _lvE_Grnd_i3_Controller, 'LV-E Ground I-3'),
                    powt_td_page_mobile_numpad(
                        _lvE_Grnd_c1_Controller, 'LV-E Ground C-1'),
                    powt_td_page_mobile_numpad(
                        _lvE_Grnd_c2_Controller, 'LV-E Ground C-2'),
                    powt_td_page_mobile_numpad(
                        _lvE_Grnd_c3_Controller, 'LV-E Ground C-3'),
                    powt_td_page_mobile_numpad(
                        _lvE_Grnd_tanD1_Controller, 'LV-E Ground tanD-1'),
                    powt_td_page_mobile_numpad(
                        _lvE_Grnd_tanD2_Controller, 'LV-E Ground tanD-2'),
                    powt_td_page_mobile_numpad(
                        _lvE_Grnd_tanD3_Controller, 'LV-E Ground tanD-3'),
                    powt_td_page_mobile_numpad(
                        _lvE_Grnd_p1_Controller, 'LV-E Ground P-1'),
                    powt_td_page_mobile_numpad(
                        _lvE_Grnd_p2_Controller, 'LV-E Ground P-2'),
                    powt_td_page_mobile_numpad(
                        _lvE_Grnd_p3_Controller, 'LV-E Ground P-3'),
                    powt_td_page_mobile_numpad(
                        _lvE_Grnd_Vdf1_Controller, 'LV-E Ground  VDF1'),
                    powt_td_page_mobile_numpad(
                        _lvE_Grnd_Vdf2_Controller, 'LV-E Ground  VDF2'),
                    powt_td_page_mobile_numpad(
                        _lvE_Grnd_Vdf3_Controller, 'LV-E Ground  VDF3'),
                    Divider(color: Colors.white)
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
