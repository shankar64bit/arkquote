// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/equipmentUsed.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../../injection_container.dart';
import '../../../../data/models/equipment/Relays/FPrelay/FPR_voltageMgmt_model.dart';
import '../../../../data/models/equipment/Relays/FPrelay/FPrelay_model.dart';
import '../../../providers/Relays_providers/FPrelay_providers/FPR_voltageMgmt_provider.dart';
import '../../../providers/Relays_providers/FPrelay_providers/FPrelay_providers.dart';
import '../../dropdown_All/a_as_simplified_function.dart';

final _formKey = GlobalKey<FormState>();
// int min = 0;
// int max;

class Add_FPRvoltageMgmt_Details extends StatelessWidget with GetItMixin {
  Map args = {};
  int FPR_ID;
  int TR_ID;

  Add_FPRvoltageMgmt_Details(this.args, {Key key}) : super(key: key);

  final TextEditingController _trNo_controller = TextEditingController();
  final TextEditingController _serialNo_controller = TextEditingController();
  final TextEditingController _rn_applSecVoltage_controller =
      TextEditingController();
  final TextEditingController _rn_measurePrimVoltage_controller =
      TextEditingController();
  final TextEditingController _yn_applSecVoltage_controller =
      TextEditingController();
  final TextEditingController _yn_measurePrimVoltage_controller =
      TextEditingController();
  final TextEditingController _bn_applSecVoltage_controller =
      TextEditingController();
  final TextEditingController _bn_measurePrimVoltage_controller =
      TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  setTrNo() {
    _trNo_controller.text = args['TrNo'].toString();
    _serialNo_controller.text = args['serialno'].toString();
    FPR_ID = args['fprDatabaseID'];
    TR_ID = args['trDatabaseID'];
  }

  @override
  Widget build(BuildContext context) {
    final FPrelayModel ntr = watchOnly((FPrelayProvider x) => x.fprelayModel);

    setTrNo();
    var mob =
        Text('Add FPRvoltageMgmt Details', style: TextStyle(fontSize: 17));
    var desk =
        Text('Add FPRvoltageMgmt Details', style: TextStyle(fontSize: 20));
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

                  // loading to add details to remote server & local server

                  // add to local database
                  final FPRvoltageMgmtModel FPRvoltageMgmttoLocal =
                      FPRvoltageMgmtModel(
                    trNo: int.parse(_trNo_controller.text),
                    serialNo: _serialNo_controller.text,
                    rn_applSecVoltage:
                        double.parse(_rn_applSecVoltage_controller.text),
                    rn_measurePrimVoltage:
                        double.parse(_rn_measurePrimVoltage_controller.text),
                    yn_applSecVoltage:
                        double.parse(_yn_applSecVoltage_controller.text),
                    yn_measurePrimVoltage:
                        double.parse(_yn_measurePrimVoltage_controller.text),
                    bn_applSecVoltage:
                        double.parse(_bn_applSecVoltage_controller.text),
                    bn_measurePrimVoltage:
                        double.parse(_bn_measurePrimVoltage_controller.text),
                    equipmentUsed: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,
                  );
                  print(FPRvoltageMgmttoLocal);
                  print(FPRvoltageMgmttoLocal.trNo);
                  getX((FPRvoltageMgmtProvider x) =>
                      x.addFPRvoltageMgmt(FPRvoltageMgmttoLocal));
                  watchOnly((FPRvoltageMgmtProvider x) => {});

                  Navigator.popAndPushNamed(context, '/detail_FPrelay',
                      arguments: {
                        'id': args['FPR_ID'],
                        'fprDatabaseID': FPR_ID,
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
    final FPrelayModel ntr = watchOnly((FPrelayProvider x) => x.fprelayModel);
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
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: EquipmentTypeList(),
                    ),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'R-N Applied Secondary Voltage',
                        _rn_applSecVoltage_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'R-N Measured Primary Voltage',
                        _rn_measurePrimVoltage_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Y-N Applied Secondary Voltage',
                        _yn_applSecVoltage_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Y-N Measured Primary Voltage ',
                        _yn_measurePrimVoltage_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'B-N Applied Secondary Voltage',
                        _bn_applSecVoltage_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'B-N Measured Primary Voltage ',
                        _bn_measurePrimVoltage_controller),
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
                          'Serial No',
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
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'R-N Applied Secondary Voltage',
                        _rn_applSecVoltage_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'R-N Measured Primary Voltage ',
                        _rn_measurePrimVoltage_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Y-N Applied Secondary Voltage',
                        _yn_applSecVoltage_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Y-N Measured Primary Voltage ',
                        _yn_measurePrimVoltage_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'B-N Applied Secondary Voltage',
                        _bn_applSecVoltage_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'B-N Measured Primary Voltage ',
                        _bn_measurePrimVoltage_controller),
                  ]),
            ),
          );
        }
      }),
    );
  }
}
