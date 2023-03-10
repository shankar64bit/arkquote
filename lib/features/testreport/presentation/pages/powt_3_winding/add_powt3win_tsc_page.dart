// ignore_for_file: missing_return, missing_required_param, non_ant_identifier_names, unused_field, prefer__ructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/equipmentUsed.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/powt_3_winding/powt3win_tsc_model.dart';
import '../../../data/models/equipment/powt_3_winding/powt3winding_model.dart';
import '../../providers/powt_3_winding/powt3win_tsc_provider.dart';
import '../../providers/powt_3_winding/powt_3_winding_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';

final _formKey = GlobalKey<FormState>();

class Add_Powt3wintsc_Details extends StatelessWidget with GetItMixin {
  Map args = {};
  int POWT3WIN_ID;
  int TR_ID;

  Add_Powt3wintsc_Details(this.args, {Key key}) : super(key: key);

  final TextEditingController _trNo_controller = TextEditingController();
  final TextEditingController _serialNo_controller = TextEditingController();
  final TextEditingController _hv_voltage_controller = TextEditingController();
  final TextEditingController _hv_current_Onan_controller =
      TextEditingController();
  final TextEditingController _hv_current_Onaf_controller =
      TextEditingController();
  final TextEditingController _hv_current_Ofaf_controller =
      TextEditingController();
  final TextEditingController _equipmentUsed_controller =
      TextEditingController();
  final TextEditingController _tapPosition_controller = TextEditingController();

  setTrNo() {
    _trNo_controller.text = args['TrNo'].toString();
    _serialNo_controller.text = args['serialno'].toString();
    POWT3WIN_ID = args['powt3winDatabaseID'];
    TR_ID = args['trDatabaseID'];
  }

  @override
  Widget build(BuildContext context) {
    final Powt3WindingModel ntr =
        watchOnly((Powt3WindingProvider x) => x.powt3WindingModel);

    setTrNo();
    var mob =
        Text('Add Powt_3_win_tsc Details', style: TextStyle(fontSize: 17));
    var desk =
        Text('Add Powt_3_win_tsc Details', style: TextStyle(fontSize: 20));
    var accToken = sl<GoogleSignInController>().ACCESS_TOKEN;
    var refToken = sl<GoogleSignInController>().REFRESH_TOKEN;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: LayoutBuilder(builder: (context, raints) {
          if (raints.maxWidth > 400) {
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
                  final Powt3wintscModel Powt3wintsctoLocal = Powt3wintscModel(
                    trNo: int.parse(_trNo_controller.text),
                    serialNo: _serialNo_controller.text,
                    hv_voltage: int.parse(_hv_voltage_controller.text),
                    hv_current_Onan:
                        double.parse(_hv_current_Onan_controller.text),
                    hv_current_Onaf:
                        double.parse(_hv_current_Onaf_controller.text),
                    hv_current_Ofaf:
                        double.parse(_hv_current_Ofaf_controller.text),
                    equipmentUsed: selectedValueForEquipmentUse.toString(),
                    tapPosition: int.parse(_tapPosition_controller.text),
                    databaseID: 0,
                  );
                  print(Powt3wintsctoLocal);
                  print(Powt3wintsctoLocal.trNo);

                  getX((Powt3wintscProvider x) =>
                      x.addPowt3wintsc(Powt3wintsctoLocal));
                  watchOnly((Powt3wintscProvider x) => {});

                  Navigator.popAndPushNamed(context, '/detail_POWT3WIN',
                      arguments: {
                        'id': args['POWT3WIN_ID'],
                        'powt3winDatabaseID': POWT3WIN_ID,
                        'trDatabaseID': TR_ID,
                      });
                }
              },
              icon: Icon(Icons.save)),
        ],
      ),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(5.0),
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
      child: LayoutBuilder(builder: (context, raints) {
        if (raints.maxWidth > 400) {
          return Padding(
            padding: EdgeInsets.all(5.0),
            child: Card(
              elevation: 5,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(150, 10, 150, 10),
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
                      padding: EdgeInsets.fromLTRB(150, 10, 150, 10),
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
                      padding: EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: EquipmentTypeList(),
                    ),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'HV Side current_Onan', _hv_current_Onan_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'HV Side current_Onaf', _hv_current_Onaf_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'HV Side current_Ofaf', _hv_current_Ofaf_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'HV Side voltage', _hv_voltage_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'tapPosition', _tapPosition_controller),
                  ]),
            ),
          );
        } else {
          return Padding(
            padding: EdgeInsets.all(5.0),
            child: Card(
              elevation: 5,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: EquipmentTypeList(),
                    ),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'HV Side current_Onan', _hv_current_Onan_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'HV Side current_Onaf', _hv_current_Onaf_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'HV Side current_Ofaf', _hv_current_Ofaf_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'HV Side voltage', _hv_voltage_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'tapPosition', _tapPosition_controller),
                  ]),
            ),
          );
        }
      }),
    );
  }
}
