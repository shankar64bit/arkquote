// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/equipmentUsed.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../../injection_container.dart';
import '../../../../data/models/equipment/Relays/AuxiliaryRelay/AR_model.dart';
import '../../../../data/models/equipment/Relays/AuxiliaryRelay/AR_pudo_model.dart';
import '../../../../data/models/equipment/Relays/FPrelay/FPrelay_model.dart';
import '../../../providers/Relays_providers/AuxiliaryRelay_providers/AR_provider.dart';
import '../../../providers/Relays_providers/AuxiliaryRelay_providers/AR_pudo_provider.dart';
import '../../../providers/Relays_providers/FPrelay_providers/FPrelay_providers.dart';
import '../../dropdown_All/a_as_simplified_function.dart';

final _formKey = GlobalKey<FormState>();
// int min = 0;
// int max;

class Add_ARpudo_Details extends StatelessWidget with GetItMixin {
  Map args = {};
  int AR_ID;
  int TR_ID;

  Add_ARpudo_Details(this.args, {Key key}) : super(key: key);

  final TextEditingController _trNo_controller = TextEditingController();
  final TextEditingController _arRef_controller = TextEditingController();
  final TextEditingController _coilRef_controller = TextEditingController();

  final TextEditingController _coilResistenace_controller =
      TextEditingController();
  final TextEditingController _pickUp_controller = TextEditingController();
  final TextEditingController _dropOff_controller = TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  setTrNo() {
    _trNo_controller.text = args['TrNo'].toString();
    _arRef_controller.text = args['AR_ID'].toString();
    AR_ID = args['arDatabaseID'];
    TR_ID = args['trDatabaseID'];
  }

  @override
  Widget build(BuildContext context) {
    final ARModel ntr = watchOnly((ARProvider x) => x.arModel);

    setTrNo();
    var mob = Text('Add ARpudo Details', style: TextStyle(fontSize: 17));
    var desk = Text('Add ARpudo Details', style: TextStyle(fontSize: 20));
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
                  final ARpudoModel arpudotoLocal = ARpudoModel(
                    trNo: int.parse(_trNo_controller.text),
                    arRef: int.parse(_arRef_controller.text),
                    coilRef: _coilRef_controller.text,
                    coilResistenace:
                        double.parse(_coilResistenace_controller.text),
                    pickUp: int.parse(_pickUp_controller.text),
                    dropOff: _dropOff_controller.text,
                    equipmentUsed: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,
                  );
                  print(arpudotoLocal);
                  print(arpudotoLocal.trNo);
                  getX((ARpudoProvider x) => x.addARpudo(arpudotoLocal));
                  watchOnly((ARpudoProvider x) => {});

                  Navigator.popAndPushNamed(context, '/detail_AR', arguments: {
                    'id': args['AR_ID'],
                    'arDatabaseID': AR_ID,
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
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: EquipmentTypeList(),
                    ),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Coil Ref', _coilRef_controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Coil Resistenace', _coilResistenace_controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Pick Up', _pickUp_controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Drop Off', _dropOff_controller),
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
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: EquipmentTypeList(),
                    ),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Coil Ref', _coilRef_controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Coil Resistenace', _coilResistenace_controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Pick Up', _pickUp_controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Drop Off', _dropOff_controller),
                  ]),
            ),
          );
        }
      }),
    );
  }
}
