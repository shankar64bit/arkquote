// ignore_for_file: missing_return, missing_requWred_param, non_constant_identifier_names, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/it_wr_hvlv_option.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/IT/it_model.dart';
import '../../../data/models/equipment/IT/it_wr_model.dart';
import '../../providers/it_provider/it_provider.dart';
import '../../providers/it_provider/it_wr_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

final _formKey = GlobalKey<FormState>();

class AddItWrPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int itDatabaseID;
  int trDatabaseID;
  String optChoose;
  //ItModel ntrCheck;
  AddItWrPage(this.args, {Key key}) : super(key: key);

  final TextEditingController _Trno_Controller = TextEditingController();
  final TextEditingController _serialNo_Controller = TextEditingController();
  final TextEditingController _uVController = TextEditingController();
  final TextEditingController _vWController = TextEditingController();
  final TextEditingController _wUController = TextEditingController();
  final TextEditingController _tapPositionController = TextEditingController();

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
    //ntrCheck = ntr;
    setTrNo();
    var mob = Text('Add Inverter Transformer WR Test ',
        style: TextStyle(fontSize: 17));
    var desk = Text('Add Inverter Transformer WR Test ',
        style: TextStyle(fontSize: 20));
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

                  optChoose = HVLV().get_HVLV().toString().split('.')[1];

                  if (checkVectoreGroup(ntr) &&
                      (optChoose == 'lv3' || optChoose == 'lv4')) {
                    _showAlertDialog(context);
                  } else {
                    // add to local database
                    final ItWrTestModel ItWrToLocal = ItWrTestModel(
                      trNo: int.parse(_Trno_Controller.text),
                      serialNo: _serialNo_Controller.text,
                      uV: double.parse(_uVController.text),
                      vW: double.parse(_vWController.text),
                      wU: double.parse(_wUController.text),
                      tapPosition: _tapPositionController.text,
                      hvLVOpt: optChoose,
                      equipmentUsed: selectedValueForEquipmentUse.toString(),
                      databaseID: 0,

                      // updateDate: DateTime.now(),
                    );
                    print(ItWrToLocal);
                    print(ItWrToLocal.trNo);
                    getX((ItWrProvider x) => x.addItWr(ItWrToLocal));
                    watchOnly((ItWrProvider x) => {});
                    Navigator.popAndPushNamed(context, '/detail_IT',
                        arguments: {
                          'id': args['IT_ID'],
                          'itDatabaseID': itDatabaseID,
                          'trDatabaseID': trDatabaseID,
                        });
                  }
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
                    //EquipmentTypeList

                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: EquipmentTypeList(),
                    ),

                    simplifiedFor_Diplay_for_all_PC_numpad('uV', _uVController),
                    simplifiedFor_Diplay_for_all_PC_numpad('vW', _vWController),
                    simplifiedFor_Diplay_for_all_PC_numpad('wU', _wUController),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'tap Position', _tapPositionController),
                    HVLV(),
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
                        'uV', _uVController),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'vW', _vWController),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'wU', _wUController),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'tap Position', _tapPositionController),
                    HVLV(),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  bool checkVectoreGroup(ItModel ntr) {
    return ntr.vectorGroup.toLowerCase() == 'dd0/dd0' ||
        ntr.vectorGroup.toLowerCase() == 'dd6/dd6' ||
        ntr.vectorGroup.toLowerCase() == 'yd1d1' ||
        ntr.vectorGroup.toLowerCase() == 'yd11d11';
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: [
            Expanded(
              child: AlertDialog(
                title: const Text('Alert'),
                content: const Text(
                    'you can not add Lv3 or Lv4 details to this vector group?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Ok',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
