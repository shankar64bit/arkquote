// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/Auser_input_validation_exnt.dart/validation_extension_methods.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/equipmentUsed.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../../injection_container.dart';
import '../../../../data/models/equipment/Relays/FPrelay/FPR_overcurrent_model.dart';
import '../../../../data/models/equipment/Relays/FPrelay/FPrelay_model.dart';
import '../../../providers/Relays_providers/FPrelay_providers/FPR_overcurrent_provider.dart';
import '../../../providers/Relays_providers/FPrelay_providers/FPrelay_providers.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../dropdown_All/a_as_simplified_function.dart';
import '../../dropdown_All/a_fpr_curve_drop_list.dart';

final _formKey = GlobalKey<FormState>();
// int min = 0;
// int max;

class Add_FPRovercurrent_Details extends StatelessWidget with GetItMixin {
  Map args = {};
  int FPR_ID;
  int TR_ID;

  Add_FPRovercurrent_Details(this.args, {Key key}) : super(key: key);

  final TextEditingController _trNo_controller = TextEditingController();
  final TextEditingController _serialNo_controller = TextEditingController();
  final TextEditingController _CurrentSet_controller = TextEditingController();
  final TextEditingController _TMS_controller = TextEditingController();
  final TextEditingController _delay_controller = TextEditingController();
  final TextEditingController _rn_pickupCurrent_controller =
      TextEditingController();
  final TextEditingController _rn_relayOprTime_2x_controller =
      TextEditingController();
  final TextEditingController _rn_relayOprTime_5x_controller =
      TextEditingController();
  final TextEditingController _yn_pickupCurrent_controller =
      TextEditingController();
  final TextEditingController _yn_relayOprTime_2x_controller =
      TextEditingController();
  final TextEditingController _yn_relayOprTime_5x_controller =
      TextEditingController();
  final TextEditingController _bn_pickupCurrent_controller =
      TextEditingController();
  final TextEditingController _bn_relayOprTime_2x_controller =
      TextEditingController();
  final TextEditingController _bn_relayOprTime_5x_controller =
      TextEditingController();
  final TextEditingController _stageNo_controller = TextEditingController();
  final TextEditingController _curve_controller = TextEditingController();
  final TextEditingController _function_controller = TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();
  String get selectedValueForCurveType => fprCurveType_drop_lits().get_etype();

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
    var mob = Text('Add overcurrent Details', style: TextStyle(fontSize: 17));
    var desk = Text('Add overcurrent Details', style: TextStyle(fontSize: 20));
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
                  final FPRovercurrentModel FPRovercurrenttoLocal =
                      FPRovercurrentModel(
                    trNo: int.parse(_trNo_controller.text),
                    serialNo: _serialNo_controller.text,
                    CurrentSet: double.parse(_CurrentSet_controller.text),
                    TMS: double.parse(_TMS_controller.text),
                    delay: double.parse(_delay_controller.text),
                    rn_pickupCurrent:
                        double.parse(_rn_pickupCurrent_controller.text),
                    rn_relayOprTime_2x:
                        double.parse(_rn_relayOprTime_2x_controller.text),
                    rn_relayOprTime_5x:
                        double.parse(_rn_relayOprTime_5x_controller.text),
                    yn_pickupCurrent:
                        double.parse(_yn_pickupCurrent_controller.text),
                    yn_relayOprTime_2x:
                        double.parse(_yn_relayOprTime_2x_controller.text),
                    yn_relayOprTime_5x:
                        double.parse(_yn_relayOprTime_5x_controller.text),
                    bn_pickupCurrent:
                        double.parse(_bn_pickupCurrent_controller.text),
                    bn_relayOprTime_2x:
                        double.parse(_bn_relayOprTime_2x_controller.text),
                    bn_relayOprTime_5x:
                        double.parse(_bn_relayOprTime_5x_controller.text),
                    stageNo: int.parse(_stageNo_controller.text),
                    curve: selectedValueForCurveType.toString(),
                    function: _function_controller.text.toString(),
                    equipmentUsed: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,
                  );
                  print(FPRovercurrenttoLocal);
                  print(FPRovercurrenttoLocal.trNo);
                  getX((FPRovercurrentProvider x) =>
                      x.addFPRovercurrent(FPRovercurrenttoLocal));
                  watchOnly((FPRovercurrentProvider x) => {});

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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: Text(
                        'Relay Adopted Setting',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomTextFormField(
                        controller: _function_controller,
                        hintText: 'function',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                        },
                      ),
                    ),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Current Set', _CurrentSet_controller),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: fprCurveType_drop_lits(),
                    ),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'TMS', _TMS_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'delay', _delay_controller),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: Text(
                        'Relay Operation Check',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      ),
                    ),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'R-N Pickup Current', _rn_pickupCurrent_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'R-N Relay Operated Time 2X',
                        _rn_relayOprTime_2x_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'R-N Relay Operated Time 5X',
                        _rn_relayOprTime_5x_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Y-N Pickup Current', _yn_pickupCurrent_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Y-N Relay Operated Time 2X',
                        _yn_relayOprTime_2x_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Y-N Relay Operated Time 5X',
                        _yn_relayOprTime_5x_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'B-N Pickup Current', _bn_pickupCurrent_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'B-N Relay Operated Time 2X',
                        _bn_relayOprTime_2x_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'B-N Relay Operated Time 5X',
                        _bn_relayOprTime_5x_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Stage No', _stageNo_controller),
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
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: EquipmentTypeList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Text(
                        'Relay Adopted Setting',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: CustomTextFormField(
                        controller: _function_controller,
                        hintText: 'Function',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                        },
                      ),
                    ),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Current Set', _CurrentSet_controller),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: fprCurveType_drop_lits(),
                    ),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'TMS', _TMS_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'delay', _delay_controller),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Text(
                        'Relay Operation Check',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      ),
                    ),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'R-N Pickup Current', _rn_pickupCurrent_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'R-N Relay Operated Time 2X',
                        _rn_relayOprTime_2x_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'R-N Relay Operated Time 5X',
                        _rn_relayOprTime_5x_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Y-N Pickup Current', _yn_pickupCurrent_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Y-N Relay Operated Time 2X',
                        _yn_relayOprTime_2x_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Y-N Relay Operated Time 5X',
                        _yn_relayOprTime_5x_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'B-N Pickup Current', _bn_pickupCurrent_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'B-N Relay Operated Time 2X',
                        _bn_relayOprTime_2x_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'B-N Relay Operated Time 5X',
                        _bn_relayOprTime_5x_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Stage No', _stageNo_controller),
                  ]),
            ),
          );
        }
      }),
    );
  }
}
