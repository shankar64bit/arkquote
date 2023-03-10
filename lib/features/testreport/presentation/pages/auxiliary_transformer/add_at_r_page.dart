// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/equipmentUsed.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/at_provider/at_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/AT/AT_model.dart';
import '../../../data/models/equipment/AT/AT_r_model.dart';
import '../../providers/at_provider/at_r_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';

final _formKey = GlobalKey<FormState>();

class Add_R_Details extends StatelessWidget with GetItMixin {
  Map args = {};
  int AT_ID;
  int TR_ID;

  Add_R_Details(this.args, {Key key}) : super(key: key);

  final TextEditingController _trNo_controller = TextEditingController();
  final TextEditingController _serialNo_controller = TextEditingController();
  final TextEditingController _hv_1u_1v_controller = TextEditingController();
  final TextEditingController _hv_1v_1w_controller = TextEditingController();
  final TextEditingController _hv_1w_1u_controller = TextEditingController();
  final TextEditingController _hv_1u_1n_controller = TextEditingController();
  final TextEditingController _hv_1v_1n_controller = TextEditingController();
  final TextEditingController _hv_1w_1n_controller = TextEditingController();
  final TextEditingController _lv_2u_2v_controller = TextEditingController();
  final TextEditingController _lv_2v_2w_controller = TextEditingController();
  final TextEditingController _lv_2w_2u_controller = TextEditingController();
  final TextEditingController _lv_2u_2n_controller = TextEditingController();
  final TextEditingController _lv_2v_2n_controller = TextEditingController();
  final TextEditingController _lv_2w_2n_controller = TextEditingController();
  final TextEditingController _tap_controller = TextEditingController();

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
    var mob = Text('Add AT_R Details', style: TextStyle(fontSize: 17));
    var desk = Text('Add AT_R Details', style: TextStyle(fontSize: 20));
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

                  double hv_1u_1v;
                  double hv_1v_1w;
                  double hv_1w_1u;
                  double hv_1u_1n;
                  double hv_1v_1n;
                  double hv_1w_1n;
                  double lv_2u_2v;
                  double lv_2v_2w;
                  double lv_2w_2u;
                  double lv_2u_2n;
                  double lv_2v_2n;
                  double lv_2w_2n;

                  if (ntr.vectorGroup == "Dd0" || ntr.vectorGroup == "Dd6") {
                    hv_1u_1v = double.parse(_hv_1u_1v_controller.text);
                    hv_1v_1w = double.parse(_hv_1v_1w_controller.text);
                    hv_1w_1u = double.parse(_hv_1w_1u_controller.text);
                    hv_1u_1n = 0.00;
                    hv_1v_1n = 0.00;
                    hv_1w_1n = 0.00;
                    lv_2u_2v = double.parse(_lv_2u_2v_controller.text);
                    lv_2v_2w = double.parse(_lv_2v_2w_controller.text);
                    lv_2w_2u = double.parse(_lv_2w_2u_controller.text);
                    lv_2u_2n = 0.00;
                    lv_2v_2n = 0.00;
                    lv_2w_2n = 0.00;
                  }
                  if (ntr.vectorGroup == "Dyn1" || ntr.vectorGroup == "Dyn11") {
                    hv_1u_1v = double.parse(_hv_1u_1v_controller.text);
                    hv_1v_1w = double.parse(_hv_1v_1w_controller.text);
                    hv_1w_1u = double.parse(_hv_1w_1u_controller.text);
                    hv_1u_1n = 0.00;
                    hv_1v_1n = 0.00;
                    hv_1w_1n = 0.00;
                    lv_2u_2v = double.parse(_lv_2u_2v_controller.text);
                    lv_2v_2w = double.parse(_lv_2v_2w_controller.text);
                    lv_2w_2u = double.parse(_lv_2w_2u_controller.text);
                    lv_2u_2n = double.parse(_lv_2u_2n_controller.text);
                    lv_2v_2n = double.parse(_lv_2v_2n_controller.text);
                    lv_2w_2n = double.parse(_lv_2w_2n_controller.text);
                  }
                  if (ntr.vectorGroup == "YNd1" || ntr.vectorGroup == "YNd11") {
                    hv_1u_1v = double.parse(_hv_1u_1v_controller.text);
                    hv_1v_1w = double.parse(_hv_1v_1w_controller.text);
                    hv_1w_1u = double.parse(_hv_1w_1u_controller.text);
                    hv_1u_1n = double.parse(_hv_1u_1n_controller.text);
                    hv_1v_1n = double.parse(_hv_1v_1n_controller.text);
                    hv_1w_1n = double.parse(_hv_1w_1n_controller.text);
                    lv_2u_2v = double.parse(_lv_2u_2v_controller.text);
                    lv_2v_2w = double.parse(_lv_2v_2w_controller.text);
                    lv_2w_2u = double.parse(_lv_2w_2u_controller.text);
                    lv_2u_2n = 0.00;
                    lv_2v_2n = 0.00;
                    lv_2w_2n = 0.00;
                  }

                  _hv_1u_1v_controller.text = hv_1u_1v.toString();
                  _hv_1v_1w_controller.text = hv_1v_1w.toString();
                  _hv_1w_1u_controller.text = hv_1w_1u.toString();
                  _hv_1u_1n_controller.text = hv_1u_1n.toString();
                  _hv_1v_1n_controller.text = hv_1v_1n.toString();
                  _hv_1w_1n_controller.text = hv_1w_1n.toString();
                  _lv_2u_2v_controller.text = lv_2u_2v.toString();
                  _lv_2v_2w_controller.text = lv_2v_2w.toString();
                  _lv_2w_2u_controller.text = lv_2w_2u.toString();
                  _lv_2u_2n_controller.text = lv_2u_2n.toString();
                  _lv_2v_2n_controller.text = lv_2v_2n.toString();
                  _lv_2w_2n_controller.text = lv_2w_2n.toString();

                  // add to local database
                  final AT_R_Model ATrtoLocal = AT_R_Model(
                    trNo: int.parse(_trNo_controller.text),
                    serialNo: _serialNo_controller.text,
                    hv_1u_1v: double.parse(_hv_1u_1v_controller.text),
                    hv_1v_1w: double.parse(_hv_1v_1w_controller.text),
                    hv_1w_1u: double.parse(_hv_1w_1u_controller.text),
                    hv_1u_1n: double.parse(_hv_1u_1n_controller.text),
                    hv_1v_1n: double.parse(_hv_1v_1n_controller.text),
                    hv_1w_1n: double.parse(_hv_1w_1n_controller.text),
                    lv_2u_2v: double.parse(_lv_2u_2v_controller.text),
                    lv_2v_2w: double.parse(_lv_2v_2w_controller.text),
                    lv_2w_2u: double.parse(_lv_2w_2u_controller.text),
                    lv_2u_2n: double.parse(_lv_2u_2n_controller.text),
                    lv_2v_2n: double.parse(_lv_2v_2n_controller.text),
                    lv_2w_2n: double.parse(_lv_2w_2n_controller.text),
                    equipmentUsed: selectedValueForEquipmentUse.toString(),
                    tapPosition: int.parse(_tap_controller.text),
                    databaseID: 0,
                  );
                  print(ATrtoLocal);
                  print(ATrtoLocal.trNo);
                  getX((AT_R_Provider x) => x.addATr(ATrtoLocal));
                  watchOnly((AT_R_Provider x) => {});
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
                        ? Db0_Db6()
                        : Container(),
                    ntr.vectorGroup == "Dyn1" || ntr.vectorGroup == "Dyn11"
                        ? Dyn1_Dyn11()
                        : Container(),
                    ntr.vectorGroup == "YNd1" || ntr.vectorGroup == "YNd11"
                        ? YNd1_YNd11()
                        : Container(),
                    ntr.vectorGroup == "YNyn0" || ntr.vectorGroup == "YNyn6"
                        ? YNyn0_YNyn6()
                        : Container()
                  ]),
            ),
          );
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
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: EquipmentTypeList(),
                    ),
                    ntr.vectorGroup == "Dd0" || ntr.vectorGroup == "Dd 6"
                        ? Db0_Db6()
                        : Container(),
                    ntr.vectorGroup == "Dyn1" || ntr.vectorGroup == "Dyn11"
                        ? Dyn1_Dyn11()
                        : Container(),
                    ntr.vectorGroup == "YNd1" || ntr.vectorGroup == "YNd11"
                        ? YNd1_YNd11()
                        : Container(),
                    ntr.vectorGroup == "YNyn0" || ntr.vectorGroup == "YNyn6"
                        ? YNyn0_YNyn6()
                        : Container()
                  ]),
            ),
          );
        }
      }),
    );
  }

  ////////////////////////////////////////////////////vector-1///////////////////////
  Column Db0_Db6() {
    return Column(
      children: [
        simplifiedFor_Display_for_all_Mobile_numpad(
            'hv_1u_1v', _hv_1u_1v_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'hv_1v_1w', _hv_1v_1w_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'hv_1w_1u', _hv_1w_1u_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'lv_2u_2v', _lv_2u_2v_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'lv_2v_2w', _lv_2v_2w_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'lv_2w_2u', _lv_2w_2u_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'tapPosition', _tap_controller),
      ],
    );
  }

  ////////////////////////////////////////////////////vector-2///////////////////////
  Column Dyn1_Dyn11() {
    return Column(
      children: [
        simplifiedFor_Display_for_all_Mobile_numpad(
            'hv_1u_1v', _hv_1u_1v_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'hv_1v_1w', _hv_1v_1w_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'hv_1w_1u', _hv_1w_1u_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'lv_2u_2v', _lv_2u_2v_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'lv_2v_2w', _lv_2v_2w_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'lv_2w_2u', _lv_2w_2u_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'lv_2u_2n', _lv_2u_2n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'lv_2v_2n', _lv_2v_2n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'lv_2w_2n', _lv_2w_2n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'tapPosition', _tap_controller),
      ],
    );
  }

  ////////////////////////////////////////////////////vector-3///////////////////////
  Column YNd1_YNd11() {
    return Column(
      children: [
        simplifiedFor_Display_for_all_Mobile_numpad(
            'hv_1u_1v', _hv_1u_1v_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'hv_1v_1w', _hv_1v_1w_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'hv_1w_1u', _hv_1w_1u_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'hv_1u_1n', _hv_1u_1n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'hv_1v_1n', _hv_1v_1n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'hv_1w_1n', _hv_1w_1n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'lv_2u_2v', _lv_2u_2v_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'lv_2v_2w', _lv_2v_2w_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'lv_2w_2u', _lv_2w_2u_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'tapPosition', _tap_controller),
      ],
    );
  }

////////////////////////////////////////////////////vector-4///////////////////////
  Column YNyn0_YNyn6() {
    return Column(
      children: [
        simplifiedFor_Display_for_all_Mobile_numpad(
            'hv_1u_1v', _hv_1u_1v_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'hv_1v_1w', _hv_1v_1w_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'hv_1w_1u', _hv_1w_1u_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'hv_1u_1n', _hv_1u_1n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'hv_1v_1n', _hv_1v_1n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'hv_1w_1n', _hv_1w_1n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'lv_2u_2v', _lv_2u_2v_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'lv_2v_2w', _lv_2v_2w_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'lv_2w_2u', _lv_2w_2u_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'lv_2u_2n', _lv_2u_2n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'lv_2v_2n', _lv_2v_2n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'lv_2w_2n', _lv_2w_2n_controller),
        simplifiedFor_Display_for_all_Mobile_numpad(
            'tapPosition', _tap_controller),
      ],
    );
  }
}
