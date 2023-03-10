// ignore_for_file: missing_return, non_constant_identifier_names, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/Auser_input_validation_exnt.dart/validation_extension_methods.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/acb/acb_model.dart';
import '../../../data/models/equipment/acb/vcb_timing_test_model.dart';
import '../../providers/equipment_acb_provider/acb_provider.dart';
import '../../providers/vcb_timing_provider.dart';
import '../../widgets/custom_text_form_field_For_number.dart';
import '../dropdown_All/equipmentUsed.dart';
import '../dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class AddVcbTimingPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int ACB_ID;
  int TR_ID;

  AddVcbTimingPage(this.args, {Key key}) : super(key: key);
  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _SerialNOcontroller = TextEditingController();
  final TextEditingController _closeYcontroller = TextEditingController();
  final TextEditingController _closeBcontroller = TextEditingController();
  final TextEditingController _closeRcontroller = TextEditingController();
  final TextEditingController _tc1OpenRcontroller = TextEditingController();
  final TextEditingController _tc1OpenYcontroller = TextEditingController();
  final TextEditingController _tc1OpenBcontroller = TextEditingController();
  final TextEditingController _tc1CloseRcontroller = TextEditingController();
  final TextEditingController _tc1CloseYcontroller = TextEditingController();
  final TextEditingController _tc1CloseBcontroller = TextEditingController();
  final TextEditingController _tc2OpenRcontroller = TextEditingController();
  final TextEditingController _tc2OpenYcontroller = TextEditingController();
  final TextEditingController _tc2OpenBcontroller = TextEditingController();
  final TextEditingController _tc2CloseRcontroller = TextEditingController();
  final TextEditingController _tc2CloseYcontroller = TextEditingController();
  final TextEditingController _tc2CloseBcontroller = TextEditingController();

  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  setTrNo() {
    _nOcontroller.text = args['TrNo'].toString();
    _SerialNOcontroller.text = args['Serial_No'].toString();
    ACB_ID = args['acbDatabaseID'];
    TR_ID = args['trDatabaseID'];
  }

  @override
  Widget build(BuildContext context) {
    final AcbModel ntr = watchOnly((AcbProvider x) => x.acbModel);
    setTrNo();
    int id;
    var acc_token = sl<GoogleSignInController>().ACCESS_TOKEN;
    var ref_token = sl<GoogleSignInController>().REFRESH_TOKEN;
    var mob =
        const Text('Add ACB-TIME Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Add ACB-TIME Details', style: TextStyle(fontSize: 20));
    var mobV =
        const Text('Add VCB-TIME Details', style: TextStyle(fontSize: 15));
    var deskV =
        const Text('Add VCB-TIME Details', style: TextStyle(fontSize: 20));
    var mobO =
        const Text('Add OCB-TIME Details', style: TextStyle(fontSize: 15));
    var deskO =
        const Text('Add OCB-TIME Details', style: TextStyle(fontSize: 20));
    var mobS =
        const Text('Add SF6-TIME Details', style: TextStyle(fontSize: 15));
    var deskS =
        const Text('Add SF6-TIME Details', style: TextStyle(fontSize: 20));

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
            } else if (ntr.etype == 'sf6') {
              return ntr.etype == 'sf6' ? deskS : mobS;
            }
          } else {
            if (ntr.etype == 'acb') {
              return ntr.etype == 'acb' ? mob : desk;
            } else if (ntr.etype == 'vcb') {
              return ntr.etype == 'vcb' ? mobV : deskV;
            } else if (ntr.etype == 'ocb') {
              return ntr.etype == 'ocb' ? mobO : deskO;
            } else if (ntr.etype == 'sf6') {
              return ntr.etype == 'sf6' ? mobS : deskS;
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

                  //add to local database
                  final VcbTimingTestModel vcbTimingReportToLocal =
                      VcbTimingTestModel(
                    trNo: int.parse(_nOcontroller.text),
                    serialNo: _SerialNOcontroller.text,
                    closeY: double.parse(_closeYcontroller.text),
                    closeB: double.parse(_closeBcontroller.text),
                    closeR: double.parse(_closeRcontroller.text),
                    tc1OpenR: double.parse(_tc1CloseRcontroller.text),
                    tc1OpenY: double.parse(_tc1OpenYcontroller.text),
                    tc1OpenB: double.parse(_tc1CloseRcontroller.text),
                    tc1CloseR: double.parse(_tc1CloseRcontroller.text),
                    tc1CloseY: double.parse(_tc1CloseYcontroller.text),
                    tc1CloseB: double.parse(_tc1CloseBcontroller.text),
                    tc2OpenR: double.parse(_tc2OpenRcontroller.text),
                    tc2OpenY: double.parse(_tc2OpenYcontroller.text),
                    tc2OpenB: double.parse(_tc2OpenBcontroller.text),
                    tc2CloseR: double.parse(_tc2CloseRcontroller.text),
                    tc2CloseY: double.parse(_tc2CloseYcontroller.text),
                    tc2CloseB: double.parse(_tc2CloseBcontroller.text),
                    EquipmentType: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,
                  );

                  print(vcbTimingReportToLocal.stringify);
                  getX((VcbTimingProvider x) =>
                      x.AddVcbTiming(vcbTimingReportToLocal));
                  watchOnly((VcbTimingProvider x) => {});
                  print(vcbTimingReportToLocal);

                  Navigator.popAndPushNamed(context, '/detail_ACB', arguments: {
                    'id': args['ACB_ID'],
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
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  child: Column(children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                      enabled: false,
                      textAlign: TextAlign.center,
                      // hintText: 'Serial No',
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 20, 150, 10),
                      child: EquipmentTypeList(),
                    ),
                  ]),
                ),
                //--------------------------------------------------------
                Divider(height: 10, color: Colors.grey[100]),
                Card(
                  elevation: 5,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Text(
                        'close',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _closeRcontroller,
                        hintText: 'closeR',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (int.parse(_closeRcontroller.text) > 110) {
                            return 'should be below 100 or [100+10%] ms';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _closeYcontroller,
                        hintText: 'closeY',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (int.parse(_closeYcontroller.text) > 110) {
                            return 'should be below 100 or [100+10%] ms';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _closeBcontroller,
                        hintText: 'closeB',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (int.parse(_closeBcontroller.text) > 110) {
                            return 'should be below 100 or [100+10%] ms';
                          }
                        },
                      ),
                    ),
                  ]),
                ),
                //----------------------------------------
                Divider(
                  height: 5,
                  color: Colors.grey[100],
                ),
                Card(
                  elevation: 5,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Text(
                        'TC-1 [open]',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _tc1OpenRcontroller,
                        hintText: 'tc1OpenR',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (int.parse(_tc1OpenRcontroller.text) > 44) {
                            return 'should be below 40 or [40+10%] ms';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _tc1OpenYcontroller,
                        hintText: 'tc1OpenY',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (int.parse(_tc1OpenYcontroller.text) > 44) {
                            return 'should be below 40 or [40+10%] ms';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _tc1OpenBcontroller,
                        hintText: 'tc1OpenB',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (int.parse(_tc1OpenBcontroller.text) > 44) {
                            return 'should be below 40 or [40+10%] ms';
                          }
                        },
                      ),
                    ),
                  ]),
                ),
                //-----------------------------------------------
                Divider(
                  height: 10,
                  color: Colors.grey[100],
                ),
                Card(
                  elevation: 5,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Text(
                        'TC-1 [close-open]',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _tc1CloseRcontroller,
                        hintText: 'tc1closeR',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (int.parse(_tc1CloseRcontroller.text) > 44) {
                            return 'should be below 40 or [40+10%] ms';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _tc1CloseYcontroller,
                        hintText: 'tc1closeY',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (int.parse(_tc1CloseYcontroller.text) > 44) {
                            return 'should be below 40 or [40+10%] ms';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _tc1CloseBcontroller,
                        hintText: 'tc1closeB',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (int.parse(_tc1CloseBcontroller.text) > 44) {
                            return 'should be below 40 or [40+10%] ms';
                          }
                        },
                      ),
                    ),
                  ]),
                ),
                //-----------------------------------------------------------
                Divider(
                  height: 10,
                  color: Colors.grey[100],
                ),
                Card(
                  elevation: 5,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Text(
                        'TC-2 [open]',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _tc2OpenRcontroller,
                        hintText: 'tc2OpenR',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (int.parse(_tc2OpenRcontroller.text) > 44) {
                            return 'should be below 40 or [40+10%] ms';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _tc2OpenYcontroller,
                        hintText: 'tc2OpenY',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (int.parse(_tc2OpenYcontroller.text) > 44) {
                            return 'should be below 40 or [40+10%] ms';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _tc2OpenBcontroller,
                        hintText: 'tc2OpenB',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (int.parse(_tc2OpenBcontroller.text) > 44) {
                            return 'should be below 40 or [40+10%] ms';
                          }
                        },
                      ),
                    ),
                  ]),
                ),
                //-------------------------------------------------------------
                Divider(
                  height: 10,
                  color: Colors.grey[100],
                ),
                Card(
                  elevation: 5,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Text(
                        'TC-2 [close-open]',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _tc2CloseRcontroller,
                        hintText: 'tc2closeR',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (int.parse(_tc2CloseRcontroller.text) > 44) {
                            return 'should be below 40 or [40+10%] ms';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _tc2CloseYcontroller,
                        hintText: 'tc2closeY',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (int.parse(_tc2CloseYcontroller.text) > 44) {
                            return 'should be below 40 or [40+10%] ms';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _tc2CloseBcontroller,
                        hintText: 'tc2closeB',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (int.parse(_tc2CloseBcontroller.text) > 44) {
                            return 'should be below 40 or [40+10%] ms';
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
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                      enabled: false,
                      textAlign: TextAlign.center,
                      // hintText: 'Serial No',
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                      child: EquipmentTypeList(),
                    ),
                  ]),
                ),
                //----------------------------------------
                Divider(height: 10, color: Colors.grey[100]),
                Card(
                  elevation: 5,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Text(
                        'close',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _closeRcontroller,
                        hintText: 'closeR',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (int.parse(_closeRcontroller.text) > 110) {
                            return 'should be below 100 or [100+10%] ms';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _closeYcontroller,
                        hintText: 'closeY',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (int.parse(_closeYcontroller.text) > 110) {
                            return 'should be below 100 or [100+10%] ms';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _closeBcontroller,
                        hintText: 'closeB',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (int.parse(_closeBcontroller.text) > 110) {
                            return 'should be below 100 or [100+10%] ms';
                          }
                        },
                      ),
                    ),
                  ]),
                ),
                //----------------------------------------
                Divider(
                  height: 5,
                  color: Colors.grey[100],
                ),
                Card(
                  elevation: 5,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Text(
                        'TC-1 [open]',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _tc1OpenRcontroller,
                        hintText: 'tc1OpenR',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (int.parse(_tc1OpenRcontroller.text) > 44) {
                            return 'should be below 40 or [40+10%] ms';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _tc1OpenYcontroller,
                        hintText: 'tc1OpenY',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (int.parse(_tc1OpenYcontroller.text) > 44) {
                            return 'should be below 40 or [40+10%] ms';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _tc1OpenBcontroller,
                        hintText: 'tc1OpenB',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (int.parse(_tc1OpenBcontroller.text) > 44) {
                            return 'should be below 40 or [40+10%] ms';
                          }
                        },
                      ),
                    ),
                  ]),
                ),
                //-----------------------------------------------
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
                        'TC-1 [close-open]',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _tc1CloseRcontroller,
                        hintText: 'tc1closeR',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (int.parse(_tc1CloseRcontroller.text) > 44) {
                            return 'should be below 40 or [40+10%] ms';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _tc1CloseYcontroller,
                        hintText: 'tc1closeY',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (int.parse(_tc1CloseYcontroller.text) > 44) {
                            return 'should be below 40 or [40+10%] ms';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _tc1CloseBcontroller,
                        hintText: 'tc1closeB',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (int.parse(_tc1CloseBcontroller.text) > 44) {
                            return 'should be below 40 or [40+10%] ms';
                          }
                        },
                      ),
                    ),
                  ]),
                ),
                //-----------------------------------------------------------
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
                        'TC-2 [open]',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _tc2OpenRcontroller,
                        hintText: 'tc2OpenR',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (int.parse(_tc2OpenRcontroller.text) > 44) {
                            return 'should be below 40 or [40+10%] ms';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _tc2OpenYcontroller,
                        hintText: 'tc2OpenY',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (int.parse(_tc2OpenYcontroller.text) > 44) {
                            return 'should be below 40 or [40+10%] ms';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _tc2OpenBcontroller,
                        hintText: 'tc2OpenB',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (int.parse(_tc2OpenBcontroller.text) > 44) {
                            return 'should be below 40 or [40+10%] ms';
                          }
                        },
                      ),
                    ),
                  ]),
                ),
                //-------------------------------------------------------------
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
                        'TC-2 [close-open]',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _tc2CloseRcontroller,
                        hintText: 'tc2closeR',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (int.parse(_tc2CloseRcontroller.text) > 44) {
                            return 'should be below 40 or [40+10%] ms';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _tc2CloseYcontroller,
                        hintText: 'tc2closeY',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (int.parse(_tc2CloseYcontroller.text) > 44) {
                            return 'should be below 40 or [40+10%] ms';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                      child: CustomTextFormFieldForNumber(
                        controller: _tc2CloseBcontroller,
                        hintText: 'tc2closeB',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (int.parse(_tc2CloseBcontroller.text) > 44) {
                            return 'should be below 40 or [40+10%] ms';
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
