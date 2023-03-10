// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/IT/it_mc_model.dart';
import '../../../data/models/equipment/IT/it_model.dart';
import '../../providers/it_provider/it_mc_provider.dart';
import '../../providers/it_provider/it_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

final _formKey = GlobalKey<FormState>();

class AddItMcPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int itDatabaseID;
  int trDatabaseID;

  AddItMcPage(this.args, {Key key}) : super(key: key);

  final TextEditingController _Trno_Controller = TextEditingController();
  final TextEditingController _serialNo_Controller = TextEditingController();
  final TextEditingController _tapPosition_Controller = TextEditingController();

  final TextEditingController _uv_Controller = TextEditingController();
  final TextEditingController _vw_Controller = TextEditingController();
  final TextEditingController _wu_Controller = TextEditingController();
  final TextEditingController _u_Controller = TextEditingController();
  final TextEditingController _v_Controller = TextEditingController();
  final TextEditingController _w_Controller = TextEditingController();

  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  setTrNo() {
    _Trno_Controller.text = args['TrNo'].toString();
    _serialNo_Controller.text = args['serialNo'].toString();
    itDatabaseID = args['itDatabaseID'];
    trDatabaseID = args['trDatabaseID'];
  }

  @override
  Widget build(BuildContext context) {
    final ItModel ntr = watchOnly((ItProvider x) => x.itModel);

    setTrNo();
    var mob =
        Text('Add Inverter Transformer MC ', style: TextStyle(fontSize: 17));
    var desk =
        Text('Add Inverter Transformer Mc ', style: TextStyle(fontSize: 20));
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
                  final ItMcTestModel ItMcToLocal = ItMcTestModel(
                    trNo: int.parse(_Trno_Controller.text),
                    serialNo: _serialNo_Controller.text,
                    tapPosition: _tapPosition_Controller.text,
                    uv: double.parse(_uv_Controller.text),
                    vw: double.parse(_vw_Controller.text),
                    wu: double.parse(_wu_Controller.text),
                    u: double.parse(_u_Controller.text),
                    v: double.parse(_v_Controller.text),
                    w: double.parse(_w_Controller.text),
                    equipmentUsed: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,
                    // updateDate: DateTime.now(),
                  );
                  print(ItMcToLocal);
                  print(ItMcToLocal.trNo);
                  getX((ItMcProvider x) => x.addItMc(ItMcToLocal));
                  watchOnly((ItMcProvider x) => {});
                  Navigator.popAndPushNamed(context, '/detail_IT', arguments: {
                    'id': args['IT_ID'],
                    'itDatabaseID': itDatabaseID,
                    'trDatabaseID': trDatabaseID,
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
    final ItModel ntr = watchOnly((ItProvider x) => x.itModel);
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: EquipmentTypeList(),
                    ),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Tap Position', _tapPosition_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Applied Voltage HV Side (V)-U-V', _uv_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Applied Voltage HV Side (V)-V-W', _vw_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Applied Voltage HV Side (V)-W-U', _wu_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Measured Magnetizing Current HV Side (mA)-U',
                        _u_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Measured Magnetizing Current HV Side (mA)-V',
                        _v_Controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Measured Magnetizing Current HV Side (mA)-W',
                        _w_Controller),
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
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Tap Position', _tapPosition_Controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Applied Voltage HV Side (V)-U-V', _uv_Controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Applied Voltage HV Side (V)-V-W', _vw_Controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Applied Voltage HV Side (V)-W-U', _wu_Controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Measured Magnetizing Current HV Side (mA)-U',
                        _u_Controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Measured Magnetizing Current HV Side (mA)-V',
                        _v_Controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Measured Magnetizing Current HV Side (mA)-W',
                        _w_Controller),
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
