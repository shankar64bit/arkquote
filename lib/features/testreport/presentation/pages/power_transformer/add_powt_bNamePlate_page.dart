// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/powt/powt_bNamePlate_model.dart';
import '../../../data/models/equipment/powt/powt_model.dart';
import '../../providers/powt_provider/powt_bNamePlate_provider.dart';
import '../../providers/powt_provider/powt_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';

final _formKey = GlobalKey<FormState>();

class Add_PowtbNamePlate_Details extends StatelessWidget with GetItMixin {
  Map args = {};
  int POWT_ID;
  int TR_ID;

  Add_PowtbNamePlate_Details(this.args, {Key key}) : super(key: key);

  final TextEditingController _trNo_controller = TextEditingController();
  final TextEditingController _serialNo_controller = TextEditingController();
  final TextEditingController _R_serialNo_controller = TextEditingController();
  final TextEditingController _R_ratedVoltage_controller =
      TextEditingController();
  final TextEditingController _R_ratedCurrent_controller =
      TextEditingController();
  final TextEditingController _R_Make_controller = TextEditingController();
  final TextEditingController _Y_serialNo_controller = TextEditingController();
  final TextEditingController _Y_ratedVoltage_controller =
      TextEditingController();
  final TextEditingController _Y_ratedCurrent_controller =
      TextEditingController();
  final TextEditingController _Y_Make_controller = TextEditingController();
  final TextEditingController _B_serialNo_controller = TextEditingController();
  final TextEditingController _B_ratedVoltage_controller =
      TextEditingController();
  final TextEditingController _B_ratedCurrent_controller =
      TextEditingController();
  final TextEditingController _B_Make_controller = TextEditingController();

  setTrNo() {
    _trNo_controller.text = args['TrNo'].toString();
    _serialNo_controller.text = args['serial_no_bph'].toString();
    POWT_ID = args['powtDatabaseID'];
    TR_ID = args['trDatabaseID'];
  }

  @override
  Widget build(BuildContext context) {
    final PowtModel ntr = watchOnly((PowtProvider x) => x.powtModel);

    setTrNo();
    var mob =
        Text('Add PowtbNamePlate Details', style: TextStyle(fontSize: 17));
    var desk =
        Text('Add PowtbNamePlate Details', style: TextStyle(fontSize: 20));
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
                  final PowtbNamePlateModel PowtbNamePlatetoLocal =
                      PowtbNamePlateModel(
                    trNo: int.parse(_trNo_controller.text),
                    serialNo: _serialNo_controller.text,
                    R_serialNo: _R_serialNo_controller.text,
                    R_ratedVoltage: int.parse(_R_ratedVoltage_controller.text),
                    R_ratedCurrent: int.parse(_R_ratedCurrent_controller.text),
                    R_Make: _R_Make_controller.text,
                    Y_serialNo: _Y_serialNo_controller.text,
                    Y_ratedVoltage: int.parse(_Y_ratedVoltage_controller.text),
                    Y_ratedCurrent: int.parse(_Y_ratedCurrent_controller.text),
                    Y_Make: _Y_Make_controller.text,
                    B_serialNo: _B_serialNo_controller.text,
                    B_ratedVoltage: int.parse(_B_ratedVoltage_controller.text),
                    B_ratedCurrent: int.parse(_B_ratedCurrent_controller.text),
                    B_Make: _B_Make_controller.text,
                    databaseID: 0,
                  );
                  print(PowtbNamePlatetoLocal);
                  print(PowtbNamePlatetoLocal.trNo);
                  getX((PowtbNamePlateProvider x) =>
                      x.addPowtwrHv(PowtbNamePlatetoLocal));
                  watchOnly((PowtbNamePlateProvider x) => {});

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
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'R Phase serial No', _R_serialNo_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'R Phase rated Voltage', _R_ratedVoltage_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'R Phase rated Current', _R_ratedCurrent_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'R Phase Make', _R_Make_controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Y Phase serial No', _Y_serialNo_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Y Phase rated Voltage', _Y_ratedVoltage_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Y Phase rated Current', _Y_ratedCurrent_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Y Phase Make', _Y_Make_controller),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'B Phase serial No', _B_serialNo_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'B Phase rated Voltage', _B_ratedVoltage_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'B Phase rated Current', _B_ratedCurrent_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'b Phase Make', _B_Make_controller),
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
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'R Phase serial No', _R_serialNo_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'R Phase rated Voltage', _R_ratedVoltage_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'R Phase rated Current', _R_ratedCurrent_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'R Phase Make', _R_Make_controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Y Phase serial No', _Y_serialNo_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Y Phase rated Voltage', _Y_ratedVoltage_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Y Phase rated Current', _Y_ratedCurrent_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Y Phase Make', _Y_Make_controller),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'B Phase serial No', _B_serialNo_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'B Phase rated Voltage', _B_ratedVoltage_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'B Phase rated Current', _B_ratedCurrent_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'b Phase Make', _B_Make_controller),
                  ]),
            ),
          );
        }
      }),
    );
  }
}
