import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/Auser_input_validation_exnt.dart/validation_extension_methods.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../data/models/equipment/busbar/bb_cr_test_model.dart';
import '../../../data/models/equipment/busbar/bb_model.dart';
import '../../providers/busbar_provider/bb_cr_provider.dart';
import '../../providers/busbar_provider/bb_provider.dart';
import '../../widgets/custom_text_form_field_For_number.dart';
import '../dropdown_All/equipmentUsed.dart';
import '../dropdown_All/responsive_tool/google_sign_in_out/login_page.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditBbCrPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditBbCrPage(this.args, {Key key}) : super(key: key);
  int _bbRefID;
  BbCrTestModel _bbCrTestModel;
  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _Rcontroller = TextEditingController();
  final TextEditingController _Ycontroller = TextEditingController();
  final TextEditingController _Bcontroller = TextEditingController();
  final TextEditingController _Ncontroller = TextEditingController();

  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Future<void> getReport() async {
    getX((BbCrProvider x) => x.getBbCrByID(args['id']));
    _bbCrTestModel = watchOnly((BbCrProvider x) => x.bbCrModel);

    _IDcontroller.text = args['id'].toString();
    _nOcontroller.text = args['TrNo'].toString();
    _Rcontroller.text = _bbCrTestModel.r.toString();
    _Ycontroller.text = _bbCrTestModel.y.toString();
    _Bcontroller.text = _bbCrTestModel.b.toString();
    _Ncontroller.text = _bbCrTestModel.n.toString();

    _bbRefID = _bbCrTestModel.bbRefId;
  }

  @override
  Widget build(BuildContext context) {
    final BbCrTestModel ntr1 = watchOnly((BbCrProvider x) => x.bbCrModel);
    getX((BbProvider x) => x.getBbByID(args['BB_ID']));
    final BbModel ntr = watchOnly((BbProvider x) => x.bbModel);
    print("_______");
    print(ntr);
    getReport();
    var mob = const Text('Edit BB-CR Details', style: TextStyle(fontSize: 15));
    var desk = const Text('Edit BB-CR Details', style: TextStyle(fontSize: 20));

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
                  var url = Uri.parse('${Env.URL_PREFIX}/bbCrTest/' +
                      ntr1.databaseID.toString() +
                      '/');

                  Map<String, String> headers = {
                    "Content-type": "application/json",
                    "Authorization": "Bearer $acc_token",
                  };
                  print("***********");
                  print(url);

                  final Map payload = {
                    "trNo": args['trDatabaseID'].toString(),
                    'r': _Rcontroller.text.toString(),
                    'y': _Ycontroller.text.toString(),
                    'b': _Bcontroller.text.toString(),
                    'n': _Ncontroller.text.toString(),
                    "bbRef": args['bbDatabaseID'].toString(),
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
                    final BbCrTestModel bbCrReportToLocal = BbCrTestModel(
                      trNo: int.parse(_nOcontroller.text),
                      bbRefId: _bbRefID,
                      r: double.parse(_Rcontroller.text),
                      y: double.parse(_Ycontroller.text),
                      b: double.parse(_Bcontroller.text),
                      n: double.parse(_Ncontroller.text),
                      databaseID: ntr.databaseID,
                      EquipmentType: selectedValueForEquipmentUse.toString(),
                      lastUpdated: DateTime.now(),
                    );

                    getX((BbCrProvider x) =>
                        x.updateBbCr(bbCrReportToLocal, args['id']));
                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_BB_CR',
                        arguments: {
                          'id': args['id'],
                          'BB_ID': args['bbDatabaseID'],
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
                        child: build_body(context, ntr)),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  build_body(BuildContext context, BbModel ntr) {
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 20, 150, 10),
                  child: EquipmentTypeList(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                  child: CustomTextFormFieldForNumber(
                    controller: _Rcontroller,
                    hintText: 'R-R\'Measured Resistance Value (µΩ)',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                  child: CustomTextFormFieldForNumber(
                    controller: _Ycontroller,
                    hintText: 'Y-Y\'Measured Resistance Value (µΩ)',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                  child: CustomTextFormFieldForNumber(
                    controller: _Bcontroller,
                    hintText: 'B-B\'Measured Resistance Value (µΩ)',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                    },
                  ),
                ),
                ntr.noOfBar == 4
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                        child: CustomTextFormFieldForNumber(
                          controller: _Ncontroller,
                          hintText: 'N-N\'Measured Resistance Value (µΩ)',
                          validator: (val) {
                            if (!val.IsValueEmpty) {
                              return 'Field should not be empty';
                            }
                          },
                        ),
                      )
                    : Container(),
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 20, 150, 10),
                  child: EquipmentTypeList(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: CustomTextFormFieldForNumber(
                    controller: _Rcontroller,
                    hintText: 'R-R\'Measured Resistance Value (µΩ)',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: CustomTextFormFieldForNumber(
                    controller: _Ycontroller,
                    hintText: 'Y-Y\'Measured Resistance Value (µΩ)',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: CustomTextFormFieldForNumber(
                    controller: _Bcontroller,
                    hintText: 'B-B\'Measured Resistance Value (µΩ)',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                    },
                  ),
                ),
                ntr.noOfBar == 4
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                        child: CustomTextFormFieldForNumber(
                          controller: _Ncontroller,
                          hintText: 'N-N\'Measured Resistance Value (µΩ)',
                          validator: (val) {
                            if (!val.IsValueEmpty) {
                              return 'Field should not be empty';
                            }
                          },
                        ),
                      )
                    : Container(),
              ]),
            ),
          );
        }
      }),
    );
  }
}
