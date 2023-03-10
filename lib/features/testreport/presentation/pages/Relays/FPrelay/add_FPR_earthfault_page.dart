// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/Auser_input_validation_exnt.dart/validation_extension_methods.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/equipmentUsed.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../../injection_container.dart';
import '../../../../data/models/equipment/Relays/FPrelay/FPR_earthfault_model.dart';
import '../../../../data/models/equipment/Relays/FPrelay/FPrelay_model.dart';
import '../../../providers/Relays_providers/FPrelay_providers/FPR_earthfault_provider.dart';
import '../../../providers/Relays_providers/FPrelay_providers/FPrelay_providers.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../dropdown_All/a_as_simplified_function.dart';
import '../../dropdown_All/a_fpr_curve_drop_list.dart';

final _formKey = GlobalKey<FormState>();
// int min = 0;
// int max;

class Add_FPRearthfault_Details extends StatelessWidget with GetItMixin {
  Map args = {};
  int FPR_ID;
  int TR_ID;

  Add_FPRearthfault_Details(this.args, {Key key}) : super(key: key);

  final TextEditingController _trNo_controller = TextEditingController();
  final TextEditingController _serialNo_controller = TextEditingController();
  final TextEditingController _CurrentSet_controller = TextEditingController();
  final TextEditingController _TMS_controller = TextEditingController();
  final TextEditingController _delay_controller = TextEditingController();
  final TextEditingController _pickupCurrent_controller =
      TextEditingController();
  final TextEditingController _relayOprTime_2x_controller =
      TextEditingController();
  final TextEditingController _relayOprTime_5x_controller =
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
    var mob = Text('Add Earthfault Details', style: TextStyle(fontSize: 17));
    var desk = Text('Add Earthfault Details', style: TextStyle(fontSize: 20));
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
                  final FPRearthfaultModel FPRearthfaulttoLocal =
                      FPRearthfaultModel(
                    trNo: int.parse(_trNo_controller.text),
                    serialNo: _serialNo_controller.text,
                    currentSet: double.parse(_CurrentSet_controller.text),
                    TMS: double.parse(_TMS_controller.text),
                    delay: double.parse(_delay_controller.text),
                    pickupCurrent: double.parse(_pickupCurrent_controller.text),
                    relayOprTime_2x:
                        double.parse(_relayOprTime_2x_controller.text),
                    relayOprTime_5x:
                        double.parse(_relayOprTime_5x_controller.text),
                    stageNo: int.parse(_stageNo_controller.text),
                    curve: selectedValueForCurveType.toString(),
                    function: _function_controller.text.toString(),
                    equipmentUsed: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,
                  );
                  print(FPRearthfaulttoLocal);
                  print(FPRearthfaulttoLocal.trNo);
                  getX((FPRearthfaultProvider x) =>
                      x.addFPRearthfault(FPRearthfaulttoLocal));
                  watchOnly((FPRearthfaultProvider x) => {});
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
                        hintText: 'Function',
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
                        'Delay', _delay_controller),
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
                        'Pickup Current', _pickupCurrent_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Relay Operated Time 2X', _relayOprTime_2x_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Relay Operated Time 5X', _relayOprTime_5x_controller),
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
                        'Delay', _delay_controller),
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
                        'Pickup Current', _pickupCurrent_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Relay Operated Time 2X', _relayOprTime_2x_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Relay Operated Time 5X', _relayOprTime_5x_controller),
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
