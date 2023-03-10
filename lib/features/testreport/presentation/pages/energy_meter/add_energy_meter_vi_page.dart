// ignore_for_file: missing_return, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/energy_meter/energy_meter_model.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/energy_meter/energy_meter_vi_test_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/Auser_input_validation_exnt.dart/validation_extension_methods.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../providers/energy_meter_provider/energy_meter_provider.dart';
import '../../providers/energy_meter_provider/energy_meter_vi_provider.dart';
import '../../widgets/custom_text_form_field_For_number.dart';
import '../dropdown_All/equipmentUsed.dart';
import '../dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class AddEnergyMeterViPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int TR_ID;
  int EM_ID;

  AddEnergyMeterViPage(this.args, {Key key}) : super(key: key);

  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _rrcontroller = TextEditingController();
  final TextEditingController _yrcontroller = TextEditingController();
  final TextEditingController _brcontroller = TextEditingController();
  final TextEditingController _racontroller = TextEditingController();
  final TextEditingController _yacontroller = TextEditingController();
  final TextEditingController _bacontroller = TextEditingController();
  final TextEditingController _SerialNOcontroller = TextEditingController();

  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  setTrNo() {
    _nOcontroller.text = args['TrNo'].toString();
    _SerialNOcontroller.text = args['Serial_No'].toString();
    EM_ID = args['emDatabaseID'];
    TR_ID = args['trDatabaseID'];
  }

  @override
  Widget build(BuildContext context) {
    final EnergyMeterModel ntr =
        watchOnly((EnergyMeterProvider x) => x.energymeterModel);
    setTrNo();
    int id;
    var acc_token = sl<GoogleSignInController>().ACCESS_TOKEN;
    var ref_token = sl<GoogleSignInController>().REFRESH_TOKEN;
    var mob = const Text('Add Energy Meter-VI Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('Add Energy Meter-VI Details',
        style: TextStyle(fontSize: 20));

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

                  //add to local database
                  final EnergyMeterViTestModel energyMeterViReportToLocal =
                      EnergyMeterViTestModel(
                    trNo: int.parse(_nOcontroller.text),
                    serialNo: _SerialNOcontroller.text,
                    rr: double.parse(_rrcontroller.text),
                    ra: double.parse(_racontroller.text),
                    br: double.parse(_brcontroller.text),
                    ba: double.parse(_bacontroller.text),
                    yr: double.parse(_yrcontroller.text),
                    ya: double.parse(_yacontroller.text),
                    EquipmentType: selectedValueForEquipmentUse.toString(),
                    databaseID: 0,
                    updateDate: DateTime.now(),
                  );

                  print(energyMeterViReportToLocal.serialNo);
                  getX((EnergyMeterViProvider x) =>
                      x.addEnergyMeterVi(energyMeterViReportToLocal));
                  watchOnly((EnergyMeterViProvider x) => {});
                  print("Energy Meter Vi added");
                  Navigator.popAndPushNamed(context, '/detail_EM',
                      arguments: {'id': args['EM_ID'], 'trDatabaseID': TR_ID});
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
                  enabled: false,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 20, 150, 10),
                  child: EquipmentTypeList(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                  child: CustomTextFormFieldForNumber(
                    controller: _rrcontroller,
                    hintText: 'rr',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                      if (val == '0') {
                        return 'Field can not be "0"';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                  child: CustomTextFormFieldForNumber(
                    controller: _racontroller,
                    hintText: 'ra',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                      if (val == '0') {
                        return 'Field can not be "0"';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                  child: CustomTextFormFieldForNumber(
                    controller: _brcontroller,
                    hintText: 'br',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                      if (val == '0') {
                        return 'Field can not be "0"';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                  child: CustomTextFormFieldForNumber(
                    controller: _bacontroller,
                    hintText: 'ba',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                      if (val == '0') {
                        return 'Field can not be "0"';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                  child: CustomTextFormFieldForNumber(
                    controller: _yrcontroller,
                    hintText: 'yr',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                      if (val == '0') {
                        return 'Field can not be "0"';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 0, 150, 20),
                  child: CustomTextFormFieldForNumber(
                    controller: _yacontroller,
                    hintText: 'ya',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                      if (val == '0') {
                        return 'Field can not be "0"';
                      }
                    },
                  ),
                ),
              ]),
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
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
                  enabled: false,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child: EquipmentTypeList(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: CustomTextFormFieldForNumber(
                    controller: _rrcontroller,
                    hintText: 'rr',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                      if (val == '0') {
                        return 'Field can not be "0"';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: CustomTextFormFieldForNumber(
                    controller: _racontroller,
                    hintText: 'ra',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                      if (val == '0') {
                        return 'Field can not be "0"';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: CustomTextFormFieldForNumber(
                    controller: _yrcontroller,
                    hintText: 'yr',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                      if (val == '0') {
                        return 'Field can not be "0"';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                  child: CustomTextFormFieldForNumber(
                    controller: _yacontroller,
                    hintText: 'ya',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                      if (val == '0') {
                        return 'Field can not be "0"';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                  child: CustomTextFormFieldForNumber(
                    controller: _brcontroller,
                    hintText: 'br',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                      if (val == '0') {
                        return 'Field can not be "0"';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                  child: CustomTextFormFieldForNumber(
                    controller: _bacontroller,
                    hintText: 'ba',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                      if (val == '0') {
                        return 'Field can not be "0"';
                      }
                    },
                  ),
                ),
              ]),
            ),
          );
        }
      }),
    );
  }
}
