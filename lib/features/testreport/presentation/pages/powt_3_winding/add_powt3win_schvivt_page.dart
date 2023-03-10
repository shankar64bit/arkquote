// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/Auser_input_validation_exnt.dart/validation_extension_methods.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/equipmentUsed.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/powt_3_winding/powt3win_schvivt_model.dart';
import '../../../data/models/equipment/powt_3_winding/powt3winding_model.dart';
import '../../providers/powt_3_winding/powt3win_schvivt_provider.dart';
import '../../providers/powt_3_winding/powt_3_winding_provider.dart';
import '../../widgets/custom_text_form_field_For_number.dart';

final _formKey = GlobalKey<FormState>();
// int min = 0;
// int max;

class Add_Powt3winschvivtDetails extends StatelessWidget with GetItMixin {
  Map args = {};
  int POWT3WIN_ID;
  int TR_ID;

  Add_Powt3winschvivtDetails(this.args, {Key key}) : super(key: key);

  final TextEditingController _trNo_controller = TextEditingController();
  final TextEditingController _serialNo_controller = TextEditingController();
  final TextEditingController _hv_u_controller = TextEditingController();
  final TextEditingController _hv_v_controller = TextEditingController();
  final TextEditingController _hv_w_controller = TextEditingController();
  final TextEditingController _hv_n_controller = TextEditingController();
  final TextEditingController _ivt_u_controller = TextEditingController();
  final TextEditingController _ivt_v_controller = TextEditingController();
  final TextEditingController _ivt_w_controller = TextEditingController();
  final TextEditingController _ivt_n_controller = TextEditingController();
  final TextEditingController _equipmentUsed_controller =
      TextEditingController();
  final TextEditingController _tap_controller = TextEditingController();

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
    var mob = Text('Add Powt3win SC Test HV-IV/Tertiary Side Details',
        style: TextStyle(fontSize: 17));
    var desk = Text('Add Powt3win SC Test HV-IV/Tertiary Side Details',
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
                  if (ntr.vectorGroup.toLowerCase() == "yna0d11") {
                    _hv_n_controller.text = '0.0';
                  } else if (ntr.vectorGroup.toLowerCase() == "ynyn0d11") {
                    _ivt_n_controller.text = ' 0.0';
                  }

                  // add to local database
                  final Powt3winschvivtModel Powt3winschvivttoLocal =
                      Powt3winschvivtModel(
                    trNo: int.parse(_trNo_controller.text),
                    serialNo: _serialNo_controller.text,
                    hv_u: double.parse(_hv_u_controller.text),
                    hv_v: double.parse(_hv_v_controller.text),
                    hv_w: double.parse(_hv_w_controller.text),
                    hv_n: double.parse(_hv_n_controller.text),
                    ivt_u: double.parse(_ivt_u_controller.text),
                    ivt_v: double.parse(_ivt_v_controller.text),
                    ivt_w: double.parse(_ivt_w_controller.text),
                    ivt_n: double.parse(_ivt_n_controller.text),
                    tapPosition: int.parse(_tap_controller.text),
                    equipmentUsed: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,
                  );
                  print(Powt3winschvivttoLocal);
                  print(Powt3winschvivttoLocal.trNo);
                  getX((Powt3winschvivtProvider x) =>
                      x.addPowt3winschvivt(Powt3winschvivttoLocal));
                  watchOnly((Powt3winschvivtProvider x) => {});

                  Navigator.popAndPushNamed(context, '/detail_POWT3WIN',
                      arguments: {
                        'id': args['POWT3WIN_ID'],
                        'powt3winDatabaseID': POWT3WIN_ID,
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
    final Powt3WindingModel ntr =
        watchOnly((Powt3WindingProvider x) => x.powt3WindingModel);
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
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: EquipmentTypeList(),
                    ),
                    Db0_Db6(150.0, 0.0, 150.0, 10.0, ntr),
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
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: EquipmentTypeList(),
                    ),
                    Db0_Db6(10.0, 0.0, 10.0, 10.0, ntr),
                  ]),
            ),
          );
        }
      }),
    );
  }

  ////////////////////////////////////////////////////vector-1///////////////////////
  Column Db0_Db6(double l, t, r, b, Powt3WindingModel ntr) {
    String displayText = 'IV Side';
    if (ntr.vectorGroup.toLowerCase() == 'ynyn0d11')
      displayText = "Tertiary Side";

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _hv_u_controller,
            hintText: 'HV Side -U',
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _hv_v_controller,
            hintText: 'HV Side -V',
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _hv_w_controller,
            hintText: 'HV Side -W',
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        ntr.vectorGroup.toLowerCase() == 'ynyn0d11'
            ? Padding(
                padding: EdgeInsets.fromLTRB(l, t, r, b),
                child: CustomTextFormFieldForNumber(
                  controller: _hv_n_controller,
                  hintText: 'HV Side -N',
                  validator: (val) {
                    if (!val.IsValueEmpty) {
                      return 'Field should not be empty';
                    }
                  },
                ),
              )
            : Container(),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _ivt_u_controller,
            hintText: displayText + '-U',
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _ivt_v_controller,
            hintText: displayText + '-V',
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _ivt_w_controller,
            hintText: displayText + '-W',
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
        ntr.vectorGroup.toLowerCase() == 'yna0d11'
            ? Padding(
                padding: EdgeInsets.fromLTRB(l, t, r, b),
                child: CustomTextFormFieldForNumber(
                  controller: _ivt_n_controller,
                  hintText: displayText + '-N',
                  validator: (val) {
                    if (!val.IsValueEmpty) {
                      return 'Field should not be empty';
                    }
                  },
                ),
              )
            : Container(),
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _tap_controller,
            hintText: 'tapPosition',
            validator: (val) {
              if (!val.IsValueEmpty) {
                return 'Field should not be empty';
              }
            },
          ),
        ),
      ],
    );
  }
}
