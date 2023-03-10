// ignore_for_file: missing_return, missing_required_param

import 'dart:convert';
import 'dart:ffi';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/acb/acb_ir_test_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/Auser_input_validation_exnt.dart/validation_extension_methods.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/login_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/equipment_acb_provider/acb_ir_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/widgets/custom_text_form_field.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../env.sample.dart';
import '../../../data/models/equipment/acb/acb_model.dart';
import '../../providers/equipment_acb_provider/acb_provider.dart';
import '../../widgets/custom_text_form_field_For_number.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditAcbIrPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditAcbIrPage(this.args, {Key key}) : super(key: key);

  AcbIrTestModel _acbIrTestModel;
  final TextEditingController _IDcontroller = TextEditingController();

  final TextEditingController _nOcontroller = TextEditingController();
  final TextEditingController _ybcontroller = TextEditingController();
  final TextEditingController _brcontroller = TextEditingController();
  final TextEditingController _rncontroller = TextEditingController();
  final TextEditingController _yncontroller = TextEditingController();
  final TextEditingController _bncontroller = TextEditingController();
  final TextEditingController _recontroller = TextEditingController();
  final TextEditingController _yecontroller = TextEditingController();
  final TextEditingController _becontroller = TextEditingController();
  final TextEditingController _necontroller = TextEditingController();
  final TextEditingController _rrcontroller = TextEditingController();
  final TextEditingController _yycontroller = TextEditingController();
  final TextEditingController _bbcontroller = TextEditingController();
  final TextEditingController _nncontroller = TextEditingController();
  final TextEditingController _SerialNOcontroller = TextEditingController();
  final TextEditingController _rycontroller = TextEditingController();

  @override
  void dispose() {
    _ybcontroller.dispose();
    _brcontroller.dispose();
    _rncontroller.dispose();
    _yncontroller.dispose();
    _bncontroller.dispose();
    _recontroller.dispose();
    _yecontroller.dispose();
    _becontroller.dispose();
    _necontroller.dispose();
    _rrcontroller.dispose();
    _yycontroller.dispose();
    _bbcontroller.dispose();
    _nncontroller.dispose();
    _rycontroller.dispose();
  }

  Future<void> getReport() async {
    getX((AcbIrProvider x) => x.getAcbIrByID(args['id']));
    _acbIrTestModel = watchOnly((AcbIrProvider x) => x.acbIrModel);

    _IDcontroller.text = args['id'].toString();
    _nOcontroller.text = args['TrNo'].toString();
    _ybcontroller.text = _acbIrTestModel.yb.toString();
    _brcontroller.text = _acbIrTestModel.br.toString();
    _rncontroller.text = _acbIrTestModel.rn.toString();
    _yncontroller.text = _acbIrTestModel.yn.toString();
    _bncontroller.text = _acbIrTestModel.bn.toString();
    _recontroller.text = _acbIrTestModel.re.toString();
    _yecontroller.text = _acbIrTestModel.ye.toString();
    _becontroller.text = _acbIrTestModel.be.toString();
    _necontroller.text = _acbIrTestModel.ne.toString();
    _rrcontroller.text = _acbIrTestModel.rR.toString();
    _yycontroller.text = _acbIrTestModel.yY.toString();
    _bbcontroller.text = _acbIrTestModel.bB.toString();
    _nncontroller.text = _acbIrTestModel.nN.toString();
    _SerialNOcontroller.text = args['Serial_No'];
    _rycontroller.text = _acbIrTestModel.ry.toString();
  }

  @override
  Widget build(BuildContext context) {
    final AcbModel ntr = watchOnly((AcbProvider x) => x.acbModel);
    getReport();
    var mob = const Text('Edit ACB-IR Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Edit ACB-IR Details', style: TextStyle(fontSize: 20));
    var mobV =
        const Text('Edit VCB-IR Details', style: TextStyle(fontSize: 15));
    var deskV =
        const Text('Edit VCB-IR Details', style: TextStyle(fontSize: 20));
    var mobO =
        const Text('Edit OCB-IR Details', style: TextStyle(fontSize: 15));
    var deskO =
        const Text('Edit OCB-IR Details', style: TextStyle(fontSize: 20));
    var mobS =
        const Text('Edit SFE-IR Details', style: TextStyle(fontSize: 15));
    var deskS =
        const Text('Edit SFE-IR Details', style: TextStyle(fontSize: 20));

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

                  final AcbIrTestModel acbIrReportToLocal = AcbIrTestModel(
                    trNo: int.parse(_nOcontroller.text),
                    serialNo: _SerialNOcontroller.text,
                    ry: double.parse(_rycontroller.text),
                    yb: double.parse(_ybcontroller.text),
                    br: double.parse(_brcontroller.text),
                    rn: double.parse(_rncontroller.text),
                    yn: double.parse(_ybcontroller.text),
                    bn: double.parse(_bncontroller.text),
                    re: double.parse(_recontroller.text),
                    ye: double.parse(_yecontroller.text),
                    be: double.parse(_becontroller.text),
                    ne: double.parse(_necontroller.text),
                    rR: double.parse(_rrcontroller.text),
                    yY: double.parse(_yycontroller.text),
                    bB: double.parse(_bbcontroller.text),
                    nN: double.parse(_nncontroller.text),
                  );

                  //add to remote database
                  var success_code = 201;
                  var success_code1 = 200;
                  var failed_code = 'Server Connection Lost';
                  //add to remote database
                  var url = Uri.parse('${Env.URL_PREFIX}/irTest/' +
                      ntr.databaseID.toString() +
                      '/');

                  Map<String, String> headers = {
                    "Content-type": "application/json",
                    "Authorization": "Bearer $acc_token",
                  };
                  print("***********");
                  print(args['trDatabaseID'].toString());
                  print(args['ACB_ID'].toString());

                  final Map payload = {
                    "trNo": args['trDatabaseID'].toString(),
                    "ry": _rycontroller.text,
                    "yb": _ybcontroller.text,
                    "br": _brcontroller.text,
                    "serialNo": args['ACB_ID'].toString(),
                    "rn": _rncontroller.text,
                    "yn": _ybcontroller.text,
                    "bn": _bncontroller.text,
                    "re": _recontroller.text,
                    "ye": _yecontroller.text,
                    "be": _becontroller.text,
                    "ne": _necontroller.text,
                    "rR": _rrcontroller.text,
                    "yY": _yycontroller.text,
                    "bB": _bbcontroller.text,
                    "nN": _nncontroller.text,
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

                    final AcbIrTestModel acbIrReportToLocal = AcbIrTestModel(
                      trNo: int.parse(_nOcontroller.text),
                      ry: double.parse(_rycontroller.text),
                      yb: double.parse(_ybcontroller.text),
                      br: double.parse(_brcontroller.text),
                      serialNo: _SerialNOcontroller.text,
                      rn: double.parse(_rncontroller.text),
                      yn: double.parse(_ybcontroller.text),
                      bn: double.parse(_bncontroller.text),
                      re: double.parse(_recontroller.text),
                      ye: double.parse(_yecontroller.text),
                      be: double.parse(_becontroller.text),
                      ne: double.parse(_necontroller.text),
                      rR: double.parse(_rrcontroller.text),
                      yY: double.parse(_yycontroller.text),
                      bB: double.parse(_bbcontroller.text),
                      nN: double.parse(_nncontroller.text),
                      databaseID: ntr.databaseID,
                      EquipmentType: selectedValueForEquipmentUse.toString(),
                      lastUpdated: DateTime.now(),
                    );

                    getX((AcbIrProvider x) =>
                        x.updateACBIr(acbIrReportToLocal, args['id']));

                    watchOnly((AcbIrProvider x) => {});
                    Navigator.pop(context);
                    Navigator.popAndPushNamed(context, '/detail_ACB_IR',
                        arguments: {
                          'id': args['id'],
                          'ACB_ID': args['ACB_ID'],
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
    var ntrRSV = ntr.ratedSystemVoltage;
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
                  padding: EdgeInsets.fromLTRB(150, 10, 150, 10),
                  child: EquipmentTypeList(),
                ),
                Divider(height: 10, color: Colors.grey[200]),
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 20, 150, 10),
                  child: CustomTextFormFieldForNumber(
                    controller: _rycontroller,
                    hintText: 'ry',
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
                    controller: _ybcontroller,
                    hintText: 'yb',
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
                  child: CustomTextFormFieldForNumber(
                    controller: _rncontroller,
                    hintText: 'rn',
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
                    controller: _yncontroller,
                    hintText: 'yn',
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
                    controller: _bncontroller,
                    hintText: 'bn',
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
                    controller: _recontroller,
                    hintText: 're',
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
                    controller: _yecontroller,
                    hintText: 'ye',
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
                    controller: _becontroller,
                    hintText: 'be',
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
                    controller: _necontroller,
                    hintText: 'ne',
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
                    controller: _rrcontroller,
                    hintText: 'rR',
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
                    controller: _yycontroller,
                    hintText: 'yY',
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
                    controller: _bbcontroller,
                    hintText: 'bB',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 0, 150, 20),
                  child: CustomTextFormFieldForNumber(
                    controller: _nncontroller,
                    hintText: 'nN',
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
                  padding: const EdgeInsets.all(10.0),
                  child: CustomTextFormFieldForNumber(
                    controller: _rycontroller,
                    hintText: 'ry',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomTextFormFieldForNumber(
                    controller: _ybcontroller,
                    hintText: 'yb',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomTextFormFieldForNumber(
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
                  child: CustomTextFormFieldForNumber(
                    controller: _rncontroller,
                    hintText: 'rn',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomTextFormFieldForNumber(
                    controller: _yncontroller,
                    hintText: 'yn',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomTextFormFieldForNumber(
                    controller: _bncontroller,
                    hintText: 'bn',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomTextFormFieldForNumber(
                    controller: _recontroller,
                    hintText: 're',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomTextFormFieldForNumber(
                    controller: _yecontroller,
                    hintText: 'ye',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomTextFormFieldForNumber(
                    controller: _becontroller,
                    hintText: 'be',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomTextFormFieldForNumber(
                    controller: _necontroller,
                    hintText: 'ne',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomTextFormFieldForNumber(
                    controller: _rrcontroller,
                    hintText: 'rR',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomTextFormFieldForNumber(
                    controller: _yycontroller,
                    hintText: 'yY',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomTextFormFieldForNumber(
                    controller: _bbcontroller,
                    hintText: 'bB',
                    validator: (val) {
                      if (!val.IsValueEmpty) {
                        return 'Field should not be empty';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomTextFormFieldForNumber(
                    controller: _nncontroller,
                    hintText: 'nN',
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
