// ignore_for_file: missing_return, missing_required_param

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/Auser_input_validation_exnt.dart/validation_extension_methods.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/equipment_acb_provider/acb_crm_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../data/models/equipment/acb/acb_crm_test_model.dart';
import '../../../data/models/equipment/acb/acb_model.dart';
import '../../providers/equipment_acb_provider/acb_provider.dart';
import '../../widgets/custom_text_form_field_For_number.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditAcbCrmPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditAcbCrmPage(this.args, {Key key}) : super(key: key);

  AcbCrmTestModel _acbCrmTestModel;
  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _SerialNOcontroller = TextEditingController();
  final TextEditingController _rrcontroller = TextEditingController();
  final TextEditingController _yycontroller = TextEditingController();
  final TextEditingController _bbcontroller = TextEditingController();
  final TextEditingController _nncontroller = TextEditingController();

  Future<void> getReport() async {
    getX((AcbCrmProvider x) => x.getAcbCrmByID(args['id']));
    _acbCrmTestModel = watchOnly((AcbCrmProvider x) => x.acbCrmModel);

    _IDcontroller.text = args['id'].toString();
    _nOcontroller.text = args['TrNo'].toString();
    _SerialNOcontroller.text = args['Serial_No'];
    _rrcontroller.text = _acbCrmTestModel.rR.toString();
    _yycontroller.text = _acbCrmTestModel.yY.toString();
    _bbcontroller.text = _acbCrmTestModel.bB.toString();
    _nncontroller.text = _acbCrmTestModel.nN.toString();
  }

  @override
  Widget build(BuildContext context) {
    final AcbModel ntr = watchOnly((AcbProvider x) => x.acbModel);
    getReport();
    print("*** Edit ACB IR CRm NO ****" + args['trDatabaseID'].toString());
    var mob =
        const Text('Edit ACB-CRM Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Edit ACB-CRM Details', style: TextStyle(fontSize: 20));
    var mobV =
        const Text('Edit VCB-CRM Details', style: TextStyle(fontSize: 15));
    var deskV =
        const Text('Edit VCB-CRM Details', style: TextStyle(fontSize: 20));
    var mobO =
        const Text('Edit OCB-CRM Details', style: TextStyle(fontSize: 15));
    var deskO =
        const Text('Edit OCB-CRM Details', style: TextStyle(fontSize: 20));
    var mobS =
        const Text('Edit SFE-CRM Details', style: TextStyle(fontSize: 15));
    var deskS =
        const Text('Edit SFE-CRM Details', style: TextStyle(fontSize: 20));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // ignore: missing_return
        title: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 400) {
            if (ntr.etype == 'acb') {
              return ntr.etype == 'acb' ? desk : mob;
            } else if (ntr.etype == 'vcb') {
              return ntr.etype == 'vcb' ? deskV : mobV;
            } else if (ntr.etype == 'ocb') {
              return ntr.etype == 'ocb' ? deskO : mobO;
            } else if (ntr.etype == 'sfe') {
              return ntr.etype == 'sfe' ? deskS : mobS;
            }
          } else {
            if (ntr.etype == 'acb') {
              return ntr.etype == 'acb' ? mob : desk;
            } else if (ntr.etype == 'vcb') {
              return ntr.etype == 'vcb' ? mobV : deskV;
            } else if (ntr.etype == 'ocb') {
              return ntr.etype == 'ocb' ? mobO : deskO;
            } else if (ntr.etype == 'sfe') {
              return ntr.etype == 'sfe' ? mobS : deskS;
            }
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
                  final AcbCrmTestModel acbCrmReportToLocal = AcbCrmTestModel(
                    trNo: int.parse(_nOcontroller.text),
                    serialNo: _SerialNOcontroller.text,
                    rR: double.parse(_rrcontroller.text),
                    yY: double.parse(_yycontroller.text),
                    bB: double.parse(_bbcontroller.text),
                    nN: double.parse(_nncontroller.text),
                  );
                  getX((AcbCrmProvider x) =>
                      x.updateACBCrm(acbCrmReportToLocal, args['id']));
                  Navigator.pop(context);
                  Navigator.popAndPushNamed(context, '/detail_ACB',
                      arguments: args['ACB_ID']);
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
                        // ignore: prefer_const_constructors
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
    final AcbModel ntr = watchOnly((AcbProvider x) => x.acbModel);
    return Form(
      key: _formKey,
      child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 400) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        'Test Report No',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      ),
                    ),
                    TextFormField(
                      controller: _nOcontroller,
                      textAlign: TextAlign.center,
                      // label : const Text('Test Report No.'),
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
                      ),
                    ),
                    TextFormField(
                      controller: _SerialNOcontroller,
                      textAlign: TextAlign.center,
                      // hintText: 'Serial No',
                      enabled: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 20, 150, 10),
                      child: EquipmentTypeList(),
                    ),
                  ]),
                ),
                //--------------------------------------------------------------
                Divider(
                  height: 10,
                  color: Colors.grey[200],
                ),
                Card(
                  elevation: 5,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 10, 150, 10),
                      child: Text(
                        ' Measured Resistance Values ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _rrcontroller,
                        hintText: 'rR',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (double.parse(_rrcontroller.text) > 100) {
                            _formKey.currentState.save();
                            return 'reTest [ Acceptable Limits Below [ 100 Micro Ohm ]';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _yycontroller,
                        hintText: 'yY',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (double.parse(_yycontroller.text) > 100) {
                            _formKey.currentState.save();
                            return 'reTest [ Acceptable Limits Below [ 100 Micro Ohm ]';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _bbcontroller,
                        hintText: 'bB',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (double.parse(_bbcontroller.text) > 100) {
                            _formKey.currentState.save();
                            return 'reTest [ Acceptable Limits Below [ 100 Micro Ohm ]';
                          }
                        },
                      ),
                    ),
                    ntr.noOfPoles == 3
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.fromLTRB(150, 0, 150, 20),
                            child: CustomTextFormFieldForNumber(
                              controller: _nncontroller,
                              hintText: 'nN',
                              validator: (val) {
                                if (!val.IsValueEmpty) {
                                  return 'Field should not be empty';
                                }
                                if (double.parse(_nncontroller.text) > 100) {
                                  _formKey.currentState.save();
                                  return 'reTest [ Acceptable Limits Below [ 100 Micro Ohm ]';
                                }
                              },
                            ),
                          ),
                  ]),
                )
              ],
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        'Test Report No',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      ),
                    ),
                    TextFormField(
                      controller: _nOcontroller,
                      textAlign: TextAlign.center,
                      // label : const Text('Test Report No.'),
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
                      ),
                    ),
                    TextFormField(
                      controller: _SerialNOcontroller,
                      textAlign: TextAlign.center,
                      // hintText: 'Serial No',
                      enabled: false,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                      child: EquipmentTypeList(),
                    ),
                  ]),
                ),
                //---------------------------------------------------------------------
                Divider(
                  height: 10,
                  color: Colors.grey[100],
                ),
                Card(
                  elevation: 5,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Text(
                        ' Measured Resistance Values ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _rrcontroller,
                        hintText: 'rR',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (double.parse(_rrcontroller.text) > 100) {
                            _formKey.currentState.save();
                            return 'reTest [ Acceptable Limits Below [ 100 Micro Ohm ]';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _yycontroller,
                        hintText: 'yY',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (double.parse(_yycontroller.text) > 100) {
                            _formKey.currentState.save();
                            return 'reTest [ Acceptable Limits Below [ 100 Micro Ohm ]';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _bbcontroller,
                        hintText: 'bB',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (double.parse(_bbcontroller.text) > 100) {
                            _formKey.currentState.save();
                            return 'reTest [ Acceptable Limits Below [ 100 Micro Ohm ]';
                          }
                        },
                      ),
                    ),
                    ntr.noOfPoles == 3
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                            child: CustomTextFormFieldForNumber(
                              controller: _nncontroller,
                              hintText: 'nN',
                              validator: (val) {
                                if (!val.IsValueEmpty) {
                                  return 'Field should not be empty';
                                }
                                if (double.parse(_nncontroller.text) > 100) {
                                  _formKey.currentState.save();
                                  return 'reTest [ Acceptable Limits Below [ 100 Micro Ohm ]';
                                }
                              },
                            ),
                          ),
                  ]),
                )
              ],
            ),
          );
        }
      }),
    );
  }
}
