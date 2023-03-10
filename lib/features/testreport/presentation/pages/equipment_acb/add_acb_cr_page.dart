// ignore_for_file: missing_return, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/Auser_input_validation_exnt.dart/validation_extension_methods.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/equipment_acb_provider/acb_cr_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/acb/acb_cr_test_model.dart';
import '../../../data/models/equipment/acb/acb_model.dart';
import '../../providers/equipment_acb_provider/acb_provider.dart';
import '../../widgets/custom_text_form_field_For_number.dart';
import '../dropdown_All/equipmentUsed.dart';
import '../dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class AddAcbCRPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int TR_ID;
  int ACB_ID;

  AddAcbCRPage(this.args, {Key key}) : super(key: key);

  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _motor_voltage = TextEditingController();
  final TextEditingController _coil_voltage = TextEditingController();
  final TextEditingController _trip_voltage = TextEditingController();
  final TextEditingController _SerialNOcontroller = TextEditingController();

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
    var mob = const Text('Add ACB-CR Details', style: TextStyle(fontSize: 15));
    var desk = const Text('Add ACB-CR Details', style: TextStyle(fontSize: 20));
    var mobV = const Text('Add VCB-CR Details', style: TextStyle(fontSize: 15));
    var deskV =
        const Text('Add VCB-CR Details', style: TextStyle(fontSize: 20));
    var mobO = const Text('Add OCB-CR Details', style: TextStyle(fontSize: 15));
    var deskO =
        const Text('Add OCB-CR Details', style: TextStyle(fontSize: 20));
    var mobS = const Text('Add SF6-CR Details', style: TextStyle(fontSize: 15));
    var deskS =
        const Text('Add SF6-CR Details', style: TextStyle(fontSize: 20));

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
                  final AcbCRTestModel acbCRReportToLocal = AcbCRTestModel(
                    trNo: int.parse(_nOcontroller.text),
                    serialNo: _SerialNOcontroller.text,
                    motorCoil: double.parse(_motor_voltage.text),
                    closeCoil: double.parse(_coil_voltage.text),
                    tripCoil: double.parse(_trip_voltage.text),
                    EquipmentType: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,
                  );

                  getX((AcbCRProvider x) => x.addACBCR(acbCRReportToLocal));
                  watchOnly((AcbCRProvider x) => {});
                  print("ACB CR added");

                  Navigator.popAndPushNamed(context, '/detail_ACB', arguments: {
                    'id': args['ACB_ID'],
                    'trDatabaseID': args['trDatabaseID']
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
                        'CR Measured Resistance Values ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _motor_voltage,
                        hintText: 'motor voltag',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (double.parse(_motor_voltage.text) > 100) {
                            _formKey.currentState.save();
                            return 'Acceptable Limits Below [ 100 Micro Ohm ]';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _coil_voltage,
                        hintText: 'coil voltage',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (double.parse(_coil_voltage.text) > 100) {
                            _formKey.currentState.save();
                            return 'Acceptable Limits Below [ 100 Micro Ohm ]';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _trip_voltage,
                        hintText: 'trip voltage',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (double.parse(_trip_voltage.text) > 100) {
                            _formKey.currentState.save();
                            return 'Acceptable Limits Below [ 100 Micro Ohm ]';
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
                        controller: _motor_voltage,
                        hintText: 'motor voltage',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (double.parse(_motor_voltage.text) > 100) {
                            _formKey.currentState.save();
                            return 'Acceptable Limits Below [ 100 Micro Ohm ]';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _coil_voltage,
                        hintText: 'coil voltage',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (double.parse(_coil_voltage.text) > 100) {
                            _formKey.currentState.save();
                            return 'Acceptable Limits Below [ 100 Micro Ohm ]';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: CustomTextFormFieldForNumber(
                        controller: _trip_voltage,
                        hintText: 'trip voltage',
                        validator: (val) {
                          if (!val.IsValueEmpty) {
                            return 'Field should not be empty';
                          }
                          if (double.parse(_trip_voltage.text) > 100) {
                            _formKey.currentState.save();
                            return 'Acceptable Limits Below [ 100 Micro Ohm ]';
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
