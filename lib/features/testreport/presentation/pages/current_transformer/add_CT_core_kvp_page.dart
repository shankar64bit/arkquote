// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field, prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/CT/ct_core_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/ct_provider/ct_core_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/ct_provider/ct_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/CT/ct_core_kvp_model.dart';
import '../../../data/models/equipment/CT/ct_model.dart';
import '../../../data/models/equipment/CT/ct_tap_model.dart';
import '../../providers/ct_provider/ct_core_kvp_provider.dart';
import '../../providers/ct_provider/ct_tap_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';

final _formKey = GlobalKey<FormState>();

class Add_CTcoreKVP extends StatelessWidget with GetItMixin {
  Map args = {};
  int CT_ID;
  int TR_ID;

  Add_CTcoreKVP(this.args, {Key key}) : super(key: key);

  final TextEditingController _Trno_Controller = TextEditingController();
  final TextEditingController _serialNo_Controller = TextEditingController();
  final TextEditingController _R_35_Controller = TextEditingController();
  final TextEditingController _R_70_Controller = TextEditingController();
  final TextEditingController _R_105_Controller = TextEditingController();
  final TextEditingController _R_140_Controller = TextEditingController();
  final TextEditingController _R_175_Controller = TextEditingController();
  final TextEditingController _R_210_Controller = TextEditingController();
  final TextEditingController _R_245_Controller = TextEditingController();
  final TextEditingController _R_280_Controller = TextEditingController();
  final TextEditingController _R_315_Controller = TextEditingController();
  final TextEditingController _R_350_Controller = TextEditingController();
  final TextEditingController _R_385_Controller = TextEditingController();
  final TextEditingController _Y_35_Controller = TextEditingController();
  final TextEditingController _Y_70_Controller = TextEditingController();
  final TextEditingController _Y_105_Controller = TextEditingController();
  final TextEditingController _Y_140_Controller = TextEditingController();
  final TextEditingController _Y_175_Controller = TextEditingController();
  final TextEditingController _Y_210_Controller = TextEditingController();
  final TextEditingController _Y_245_Controller = TextEditingController();
  final TextEditingController _Y_280_Controller = TextEditingController();
  final TextEditingController _Y_315_Controller = TextEditingController();
  final TextEditingController _Y_350_Controller = TextEditingController();
  final TextEditingController _Y_385_Controller = TextEditingController();
  final TextEditingController _B_35_Controller = TextEditingController();
  final TextEditingController _B_70_Controller = TextEditingController();
  final TextEditingController _B_105_Controller = TextEditingController();
  final TextEditingController _B_140_Controller = TextEditingController();
  final TextEditingController _B_175_Controller = TextEditingController();
  final TextEditingController _B_210_Controller = TextEditingController();
  final TextEditingController _B_245_Controller = TextEditingController();
  final TextEditingController _B_280_Controller = TextEditingController();
  final TextEditingController _B_315_Controller = TextEditingController();
  final TextEditingController _B_350_Controller = TextEditingController();
  final TextEditingController _B_385_Controller = TextEditingController();
  final TextEditingController _equipmentUsed_Controller =
      TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  setTrNo() {
    _Trno_Controller.text = args['TrNo'].toString();
    _serialNo_Controller.text = args['serial_no_bph'].toString();
    CT_ID = args['ctDatabaseID'];
    TR_ID = args['trDatabaseID'];
  }

  @override
  Widget build(BuildContext context) {
    // getX((CTProvider x) => x.getCTByID(args['id']));
    final CTModel ntr = watchOnly((CTProvider x) => x.ctModel);

    setTrNo();
    var mob = Text('Add CTcore KVP ', style: TextStyle(fontSize: 17));
    var desk = Text('Add CTcore KVP ', style: TextStyle(fontSize: 20));
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
                  final CTcoreKVPModel CTcoreKVPtoLocal = CTcoreKVPModel(
                    trNo: int.parse(_Trno_Controller.text),
                    serialNo: _serialNo_Controller.text,
                    R_35: double.parse(_R_35_Controller.text),
                    R_70: double.parse(_R_70_Controller.text),
                    R_105: double.parse(_R_105_Controller.text),
                    R_140: double.parse(_R_140_Controller.text),
                    R_175: double.parse(_R_175_Controller.text),
                    R_210: double.parse(_R_210_Controller.text),
                    R_245: double.parse(_R_245_Controller.text),
                    R_280: double.parse(_R_280_Controller.text),
                    R_315: double.parse(_R_315_Controller.text),
                    R_350: double.parse(_R_350_Controller.text),
                    R_385: double.parse(_R_385_Controller.text),
                    Y_35: double.parse(_Y_35_Controller.text),
                    Y_70: double.parse(_Y_70_Controller.text),
                    Y_105: double.parse(_Y_105_Controller.text),
                    Y_140: double.parse(_Y_140_Controller.text),
                    Y_175: double.parse(_Y_175_Controller.text),
                    Y_210: double.parse(_Y_210_Controller.text),
                    Y_245: double.parse(_Y_245_Controller.text),
                    Y_280: double.parse(_Y_280_Controller.text),
                    Y_315: double.parse(_Y_315_Controller.text),
                    Y_350: double.parse(_Y_350_Controller.text),
                    Y_385: double.parse(_Y_385_Controller.text),
                    B_35: double.parse(_B_35_Controller.text),
                    B_70: double.parse(_B_70_Controller.text),
                    B_105: double.parse(_B_105_Controller.text),
                    B_140: double.parse(_B_140_Controller.text),
                    B_175: double.parse(_B_175_Controller.text),
                    B_210: double.parse(_B_210_Controller.text),
                    B_245: double.parse(_B_245_Controller.text),
                    B_280: double.parse(_B_280_Controller.text),
                    B_315: double.parse(_B_315_Controller.text),
                    B_350: double.parse(_B_350_Controller.text),
                    B_385: double.parse(_B_385_Controller.text),
                    equipmentUsed: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,
                    updateDate: DateTime.now(),
                  );
                  print(CTcoreKVPtoLocal);
                  print(CTcoreKVPtoLocal.trNo);
                  getX((CTcoreKVPProvider x) =>
                      x.addCTcoreKVP(CTcoreKVPtoLocal));
                  watchOnly((CTcoreKVPProvider x) => {});

                  Navigator.popAndPushNamed(context, '/detail_CT', arguments: {
                    'id': args['CT_ID'],
                    'ctDatabaseID': CT_ID,
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
                        child: build_body(context, ntr)),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  build_body(BuildContext context, CTModel ntr_model) {
    ntr_model = watchOnly((CTProvider x) => x.ctModel);

    var splitConn = ntr_model.connectedTap.split('-');
    var kvp = 0;

    getX((CT_core_Provider x) => x.getCTcoreByctNoID(ntr_model.id));
    final List<CT_core_Model> reports =
        watchOnly((CT_core_Provider x) => x.ct_core_ctNoIDList);

    for (var eachCore in reports) {
      var CoreIds = eachCore.id;
      print('coreId' + CoreIds.toString());
      if (eachCore.coreClass.toLowerCase() == 'ps') {
        getX((CT_tap_Provider x) => x.getCTtapByctNoID(eachCore.id));
        final List<CT_tap_Model> reports1 =
            watchOnly((CT_tap_Provider x) => x.ct_tap_ctNoIDList);

        for (var eachTap in reports1) {
          print('eachTap' + eachTap.toString());

          var present = true;
          var TapName = eachTap.tapName;
          var kvp1 = eachTap.kneePointVoltage;
          print('TapName  : ' + TapName.toString());
          print('splitConn : ' + splitConn.toString());

          for (var eachSymbol in splitConn) {
            if (!TapName.contains(eachSymbol)) {
              present = false;
            }
          }
          if (present == true) {
            kvp = eachTap.kneePointVoltage;
          } else {
            kvp = 0;
          }
        }
      }
    }

    var vk_convertion_value = ntr_model.vk;
    var vkConn = vk_convertion_value * kvp;
    print('vkconn' + vkConn.toString());

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
                          'serialNo_bph',
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
                    Column(
                      children: [
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            ' R_' + (vkConn * 0.1).toStringAsFixed(0),
                            _R_35_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            ' R_' + (vkConn * 0.2).toStringAsFixed(0),
                            _R_70_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            ' R_' + (vkConn * 0.3).toStringAsFixed(0),
                            _R_105_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            ' R_' + (vkConn * 0.4).toStringAsFixed(0),
                            _R_140_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            ' R_' + (vkConn * 0.5).toStringAsFixed(0),
                            _R_175_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            ' R_' + (vkConn * 0.6).toStringAsFixed(0),
                            _R_210_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            ' R_' + (vkConn * 0.7).toStringAsFixed(0),
                            _R_245_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            ' R_' + (vkConn * 0.8).toStringAsFixed(0),
                            _R_280_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            ' R_' + (vkConn * 0.9).toStringAsFixed(0),
                            _R_315_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            ' R_' + (vkConn * 1.0).toStringAsFixed(0),
                            _R_350_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            ' R_' + (vkConn * 1.1).toStringAsFixed(0),
                            _R_385_Controller),

                        // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            ' Y_' + (vkConn * 0.1).toStringAsFixed(0),
                            _Y_35_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            ' Y_' + (vkConn * 0.2).toStringAsFixed(0),
                            _Y_70_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            ' Y_' + (vkConn * 0.3).toStringAsFixed(0),
                            _Y_105_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            ' Y_' + (vkConn * 0.4).toStringAsFixed(0),
                            _Y_140_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            ' Y_' + (vkConn * 0.5).toStringAsFixed(0),
                            _Y_175_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            ' Y_' + (vkConn * 0.6).toStringAsFixed(0),
                            _Y_210_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            ' Y_' + (vkConn * 0.7).toStringAsFixed(0),
                            _Y_245_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            ' Y_' + (vkConn * 0.8).toStringAsFixed(0),
                            _Y_280_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            ' Y_' + (vkConn * 0.9).toStringAsFixed(0),
                            _Y_315_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            ' Y_' + (vkConn * 1.0).toStringAsFixed(0),
                            _Y_350_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            ' Y_' + (vkConn * 1.1).toStringAsFixed(0),
                            _Y_385_Controller),

                        //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            ' B_' + (vkConn * 0.1).toStringAsFixed(0),
                            _B_35_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            ' B_' + (vkConn * 0.2).toStringAsFixed(0),
                            _B_70_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            ' B_' + (vkConn * 0.3).toStringAsFixed(0),
                            _B_105_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            ' B_' + (vkConn * 0.4).toStringAsFixed(0),
                            _B_140_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            ' B_' + (vkConn * 0.5).toStringAsFixed(0),
                            _B_175_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            ' B_' + (vkConn * 0.6).toStringAsFixed(0),
                            _B_210_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            ' B_' + (vkConn * 0.7).toStringAsFixed(0),
                            _B_245_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            ' B_' + (vkConn * 0.8).toStringAsFixed(0),
                            _B_280_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            ' B_' + (vkConn * 0.9).toStringAsFixed(0),
                            _B_315_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            ' B_' + (vkConn * 1.0).toStringAsFixed(0),
                            _B_350_Controller),
                        simplifiedFor_Diplay_for_all_PC_numpad(
                            ' B_' + (vkConn * 1.1).toStringAsFixed(0),
                            _B_385_Controller),
                      ],
                    )
                  ],
                ),
              ),
            );

            // >>>>>>>>>>>>>>>>>>>>>>>>>>>>Mobile-view>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
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
                          'serialNo_bph',
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
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: EquipmentTypeList(),
                    ),
                    Divider(color: Colors.black, thickness: 1),
                    Column(
                      children: [
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            ' R_' + (vkConn * 0.1).toStringAsFixed(0),
                            _R_35_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            ' R_' + (vkConn * 0.2).toStringAsFixed(0),
                            _R_70_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            ' R_' + (vkConn * 0.3).toStringAsFixed(0),
                            _R_105_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            ' R_' + (vkConn * 0.4).toStringAsFixed(0),
                            _R_140_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            ' R_' + (vkConn * 0.5).toStringAsFixed(0),
                            _R_175_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            ' R_' + (vkConn * 0.6).toStringAsFixed(0),
                            _R_210_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            ' R_' + (vkConn * 0.7).toStringAsFixed(0),
                            _R_245_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            ' R_' + (vkConn * 0.8).toStringAsFixed(0),
                            _R_280_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            ' R_' + (vkConn * 0.9).toStringAsFixed(0),
                            _R_315_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            ' R_' + (vkConn * 1.0).toStringAsFixed(0),
                            _R_350_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            ' R_' + (vkConn * 1.1).toStringAsFixed(0),
                            _R_385_Controller),

                        // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            ' Y_' + (vkConn * 0.1).toStringAsFixed(0),
                            _Y_35_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            ' Y_' + (vkConn * 0.2).toStringAsFixed(0),
                            _Y_70_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            ' Y_' + (vkConn * 0.3).toStringAsFixed(0),
                            _Y_105_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            ' Y_' + (vkConn * 0.4).toStringAsFixed(0),
                            _Y_140_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            ' Y_' + (vkConn * 0.5).toStringAsFixed(0),
                            _Y_175_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            ' Y_' + (vkConn * 0.6).toStringAsFixed(0),
                            _Y_210_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            ' Y_' + (vkConn * 0.7).toStringAsFixed(0),
                            _Y_245_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            ' Y_' + (vkConn * 0.8).toStringAsFixed(0),
                            _Y_280_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            ' Y_' + (vkConn * 0.9).toStringAsFixed(0),
                            _Y_315_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            ' Y_' + (vkConn * 1.0).toStringAsFixed(0),
                            _Y_350_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            ' Y_' + (vkConn * 1.1).toStringAsFixed(0),
                            _Y_385_Controller),

                        //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            ' B_' + (vkConn * 0.1).toStringAsFixed(0),
                            _B_35_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            ' B_' + (vkConn * 0.2).toStringAsFixed(0),
                            _B_70_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            ' B_' + (vkConn * 0.3).toStringAsFixed(0),
                            _B_105_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            ' B_' + (vkConn * 0.4).toStringAsFixed(0),
                            _B_140_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            ' B_' + (vkConn * 0.5).toStringAsFixed(0),
                            _B_175_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            ' B_' + (vkConn * 0.6).toStringAsFixed(0),
                            _B_210_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            ' B_' + (vkConn * 0.7).toStringAsFixed(0),
                            _B_245_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            ' B_' + (vkConn * 0.8).toStringAsFixed(0),
                            _B_280_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            ' B_' + (vkConn * 0.9).toStringAsFixed(0),
                            _B_315_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            ' B_' + (vkConn * 1.0).toStringAsFixed(0),
                            _B_350_Controller),
                        simplifiedFor_Display_for_all_Mobile_numpad(
                            ' B_' + (vkConn * 1.1).toStringAsFixed(0),
                            _B_385_Controller),
                      ],
                    )
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
