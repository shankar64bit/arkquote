// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/PT/pt_core_model.dart';
import '../../providers/pt_provider/pt_core_provider.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/pt_coreName_dropdown.dart';

final _formKey = GlobalKey<FormState>();

class Add_PT_core_Details extends StatelessWidget with GetItMixin {
  Map args = {};
  int PT_ID;
  int TR_ID;

  Add_PT_core_Details(this.args, {Key key}) : super(key: key);

  final TextEditingController _coreNo_controller = TextEditingController();
  final TextEditingController _ratio_controller = TextEditingController();
  final TextEditingController _coreClass_controller = TextEditingController();
  final TextEditingController _burden_controller = TextEditingController();
  final TextEditingController _ptNo_controller = TextEditingController();

  String get selectedcoreName => core_Name_drop().get_CoreName();

  setTrNo() {
    _ptNo_controller.text = args['PT_ID'].toString();
    PT_ID = args['ptDatabaseID'];
    TR_ID = args['trDatabaseID'];
  }

  @override
  Widget build(BuildContext context) {
    setTrNo();
    var mob = Text('Add PTcore Details', style: TextStyle(fontSize: 17));
    var desk = Text('Add PTcore Details', style: TextStyle(fontSize: 20));
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
                  final PT_core_Model PTcoretoLocal = PT_core_Model(
                    ptNo: int.parse(_ptNo_controller.text),
                    burden: int.parse(_burden_controller.text),
                    coreClass: _coreClass_controller.text,
                    coreName: selectedcoreName,
                    ratio: int.parse(_ratio_controller.text),
                    coreNo: int.parse(_coreNo_controller.text),
                    databaseID: 0,
                  );
                  print(PTcoretoLocal);
                  print(PTcoretoLocal.ptNo);
                  getX((PT_core_Provider x) => x.addPT_core(PTcoretoLocal));
                  watchOnly((PT_core_Provider x) => {});

                  Navigator.popAndPushNamed(context, '/detail_PT', arguments: {
                    'id': args['PT_ID'],
                    'ptDatabaseID': PT_ID,
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
                          'PT No',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5),
                        )),
                    TextFormField(
                      controller: _ptNo_controller,
                      textAlign: TextAlign.center,
                      enabled: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: core_Name_drop(),
                    ),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Core No', _coreNo_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Core Class', _coreClass_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Ratio', _ratio_controller),
                    simplifiedFor_Diplay_for_all_PC_numpad(
                        'Burden', _burden_controller),
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
                          'ptNo',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5),
                        )),
                    TextFormField(
                      controller: _ptNo_controller,
                      textAlign: TextAlign.center,
                      enabled: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: core_Name_drop(),
                    ),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Core No', _coreNo_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Core Class', _coreClass_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Ratio', _ratio_controller),
                    simplifiedFor_Display_for_all_Mobile_numpad(
                        'Burden', _burden_controller),
                  ]),
            ),
          );
        }
      }),
    );
  }
}
