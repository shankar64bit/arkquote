import 'dart:convert';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/Auser_input_validation_exnt.dart/validation_extension_methods.dart';
import 'package:flutter_testreports/features/testreport/presentation/widgets/custom_text_form_field.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

import '../../../../../env.sample.dart';
import '../../../data/models/equipment/energy_meter/energy_meter_ci_test.dart';
import '../../providers/energy_meter_provider/energy_meter_ci_provider.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditEnergyMeterCiPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditEnergyMeterCiPage(this.args, {Key key}) : super(key: key);

  EnergyMeterCiTestModel _energymeterCiTestModel;
  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _SerialNOcontroller = TextEditingController();
  final TextEditingController _rrcontroller = TextEditingController();
  final TextEditingController _yrcontroller = TextEditingController();
  final TextEditingController _brcontroller = TextEditingController();
  final TextEditingController _racontroller = TextEditingController();
  final TextEditingController _yacontroller = TextEditingController();
  final TextEditingController _bacontroller = TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Future<void> getReport() async {
    getX((EnergyMeterCiProvider x) => x.getEnergyMeterCiByID(args['id']));
    _energymeterCiTestModel =
        watchOnly((EnergyMeterCiProvider x) => x.energymeterCiModel);

    _IDcontroller.text = args['id'].toString();
    _nOcontroller.text = args['TrNo'].toString();

    _brcontroller.text = _energymeterCiTestModel.br.toString();
    _rrcontroller.text = _energymeterCiTestModel.rr.toString();
    _yrcontroller.text = _energymeterCiTestModel.yr.toString();
    _yacontroller.text = _energymeterCiTestModel.ya.toString();
    _bacontroller.text = _energymeterCiTestModel.ba.toString();
    _SerialNOcontroller.text = args['Serial_No'];
    _racontroller.text = _energymeterCiTestModel.ra.toString();
  }

  @override
  Widget build(BuildContext context) {
    final EnergyMeterCiTestModel ntr =
        watchOnly((EnergyMeterCiProvider x) => x.energymeterCiModel);
    getReport();
    var mob = const Text('Edit Energy Meter-CI Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('Edit Energy Meter-Ci Details',
        style: TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // ignore: missing_return
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
                  //add to remote database
                  var success_code = 201;
                  var success_code1 = 200;
                  var failed_code = 'Server Connection Lost';
                  //add to remote database
                  var url = Uri.parse('${Env.URL_PREFIX}/ciTest/' +
                      ntr.databaseID.toString() +
                      '/');

                  Map<String, String> headers = {
                    "Content-type": "application/json",
                    "Authorization": "Bearer $acc_token",
                  };
                  print("***********");
                  print(args['trDatabaseID'].toString());
                  print(args['EM_ID'].toString());

                  final Map payload = {
                    "trNo": args['trDatabaseID'].toString(),
                    "rr": _rrcontroller.text,
                    "ra": _racontroller.text,
                    "yr": _yrcontroller.text,
                    "ya": _yacontroller.text,
                    "br": _brcontroller.text,
                    "ba": _bacontroller.text,
                    "serialNo": args['EM_ID'].toString(),
                    "equipmentUsed": selectedValueForEquipmentUse.toString(),
                    "updateDate": DateTime.now().toString(),
                  };
                  var response = await http.put(url,
                      body: jsonEncode(payload), headers: headers);

                  if (response.statusCode == success_code ||
                      response.statusCode == success_code1) {
                    print('Response status: ${response.statusCode}');
                    print('Response body: ${response.body}');
                    print('Stored successfully');

                    //add to local database
                    final EnergyMeterCiTestModel energyMeterCiReportToLocal =
                        EnergyMeterCiTestModel(
                      trNo: int.parse(_nOcontroller.text),
                      ra: double.parse(_racontroller.text),
                      br: double.parse(_brcontroller.text),
                      serialNo: _SerialNOcontroller.text,
                      ba: double.parse(_bacontroller.text),
                      yr: double.parse(_yrcontroller.text),
                      ya: double.parse(_yacontroller.text),
                      rr: double.parse(_rrcontroller.text),
                      databaseID: ntr.databaseID,
                      EquipmentType: selectedValueForEquipmentUse.toString(),
                      updateDate: DateTime.now(),
                    );

                    getX((EnergyMeterCiProvider x) => x.updateEnergyMeterCi(
                        energyMeterCiReportToLocal, args['id']));
                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_EM_CI',
                        arguments: {
                          'id': args['id'],
                          'EM_ID': args['EM_ID'],
                          'trDatabaseID': args['trDatabaseID'],
                        });
                  } else {
                    failed_code;
                    print('Failed Response status: ${response.statusCode}');
                    print('Failed Response body: ${response.body}');
                    print('Unsuccessfully');
                  }
                }
              },
              icon: const Icon(Icons.save)),
        ],
      ),
      // body: SingleChildScrollView(child: build_body()),
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
              elevation: 2,
              child: Column(children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'ID',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
                TextFormField(
                  controller: _IDcontroller,
                  enabled: false,
                  textAlign: TextAlign.center,
                ),
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
                  // label : const Text('Test Report No.'),
                  enabled: false,
                  textAlign: TextAlign.center,
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 20, 150, 10),
                  child: CustomTextFormField(
                    controller: _rrcontroller,
                    hintText: 'rr',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                  child: CustomTextFormField(
                    controller: _racontroller,
                    hintText: 'ra',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                  child: CustomTextFormField(
                    controller: _brcontroller,
                    hintText: 'br',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                  child: CustomTextFormField(
                    controller: _bacontroller,
                    hintText: 'ba',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                  child: CustomTextFormField(
                    controller: _yrcontroller,
                    hintText: 'yr',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                  child: CustomTextFormField(
                    controller: _yacontroller,
                    hintText: 'ya',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
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
              elevation: 2,
              child: Column(children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    'ID',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
                TextFormField(
                  controller: _IDcontroller,
                  enabled: false,
                  textAlign: TextAlign.center,
                ),
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
                  // label : const Text('Test Report No.'),
                  enabled: false,
                  textAlign: TextAlign.center,
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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomTextFormField(
                    controller: _rrcontroller,
                    hintText: 'rr',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomTextFormField(
                    controller: _racontroller,
                    hintText: 'ra',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomTextFormField(
                    controller: _brcontroller,
                    hintText: 'br',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomTextFormField(
                    controller: _bacontroller,
                    hintText: 'ba',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomTextFormField(
                    controller: _yrcontroller,
                    hintText: 'yr',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomTextFormField(
                    controller: _yacontroller,
                    hintText: 'ya',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
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
