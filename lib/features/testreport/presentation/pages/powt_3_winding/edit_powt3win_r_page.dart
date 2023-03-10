import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/powt_3_winding/powt3win_r_model.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/powt_3_winding/powt3winding_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/Auser_input_validation_exnt.dart/validation_extension_methods.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/powt_3_winding/powt3win_r_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/powt_3_winding/powt_3_winding_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../widgets/custom_text_form_field_For_number.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditPowt3winRPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditPowt3winRPage(this.args, {Key key}) : super(key: key);

  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _trNo_controller = TextEditingController();
  final TextEditingController _serialNo_controller = TextEditingController();
  final TextEditingController _hv_1u_1vn_controller = TextEditingController();
  final TextEditingController _hv_1v_1wn_controller = TextEditingController();
  final TextEditingController _hv_1w_1un_controller = TextEditingController();
  final TextEditingController _lv_uvn_controller = TextEditingController();
  final TextEditingController _lv_vwn_controller = TextEditingController();
  final TextEditingController _lv_wun_controller = TextEditingController();
  final TextEditingController _ivt_uvn_controller = TextEditingController();
  final TextEditingController _ivt_vwn_controller = TextEditingController();
  final TextEditingController _ivt_wun_controller = TextEditingController();
  final TextEditingController _tap_controller = TextEditingController();

  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Future<void> getReport() async {
    getX((Powt3win_R_Provider x) => x.getPowt3winrById(args['id']));
    Powt3win_R_Model _powt3WindingRModel =
        watchOnly((Powt3win_R_Provider x) => x.powt3win_R_Model);

    _IDcontroller.text = args['id'].toString();
    _trNo_controller.text = _powt3WindingRModel.trNo.toString();
    _serialNo_controller.text = _powt3WindingRModel.serialNo.toString();
    _hv_1u_1vn_controller.text = _powt3WindingRModel.hv_1u_1vn.toString();
    _hv_1v_1wn_controller.text = _powt3WindingRModel.hv_1v_1wn.toString();
    _hv_1w_1un_controller.text = _powt3WindingRModel.hv_1w_1un.toString();
    _lv_uvn_controller.text = _powt3WindingRModel.lv_uvn.toString();
    _lv_vwn_controller.text = _powt3WindingRModel.lv_vwn.toString();
    _lv_wun_controller.text = _powt3WindingRModel.lv_wun.toString();

    _ivt_uvn_controller.text = _powt3WindingRModel.ivt_uvn.toString();
    _ivt_vwn_controller.text = _powt3WindingRModel.ivt_vwn.toString();
    _ivt_wun_controller.text = _powt3WindingRModel.ivt_wun.toString();
    _tap_controller.text = _powt3WindingRModel.tapPosition.toString();
  }

  @override
  Widget build(BuildContext context) {
    final Powt3WindingModel ntr1 =
        watchOnly((Powt3WindingProvider x) => x.powt3WindingModel);

    final Powt3win_R_Model ntr =
        watchOnly((Powt3win_R_Provider x) => x.powt3win_R_Model);
    getReport();
    var mob = const Text('Edit powt3winding Ratio Test Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('Edit powt3winding Ratio Test Details',
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
                  var url = Uri.parse('${Env.URL_PREFIX}/powt3wRTest/' +
                      ntr.databaseID.toString() +
                      '/');

                  Map<String, String> headers = {
                    "Content-type": "application/json",
                    "Authorization": "Bearer $acc_token",
                  };
                  print("***********");
                  print(url);
                  print(args['trDatabaseID'].toString());

                  final Map payload = {
                    "trNo": args['trDatabaseID'].toString(),
                    'hv_1u_1vn': _hv_1u_1vn_controller.text.toString(),
                    'hv_1v_1wn': _hv_1v_1wn_controller.text.toString(),
                    'hv_1w_1un': _hv_1w_1un_controller.text.toString(),
                    'lv_uvn': _lv_uvn_controller.text.toString(),
                    'lv_vwn': _lv_vwn_controller.text.toString(),
                    'lv_wun': _lv_wun_controller.text.toString(),
                    'ivt_uvn': _ivt_uvn_controller.text.toString(),
                    'ivt_vwn': _ivt_vwn_controller.text.toString(),
                    'ivt_wun': _ivt_wun_controller.text.toString(),
                    'tapPosition': _tap_controller.text.toString(),
                    "serialNo": args['POWT3WIN_ID'].toString(),
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
                    final Powt3win_R_Model powt3winRReportToLocal =
                        Powt3win_R_Model(
                            trNo: int.parse(_trNo_controller.text),
                            serialNo: _serialNo_controller.text,
                            hv_1u_1vn: double.parse(_hv_1u_1vn_controller.text),
                            hv_1v_1wn: double.parse(_hv_1v_1wn_controller.text),
                            hv_1w_1un: double.parse(_hv_1w_1un_controller.text),
                            lv_uvn: double.parse(_lv_uvn_controller.text),
                            lv_vwn: double.parse(_lv_vwn_controller.text),
                            lv_wun: double.parse(_lv_wun_controller.text),
                            ivt_uvn: double.parse(_ivt_uvn_controller.text),
                            ivt_vwn: double.parse(_ivt_vwn_controller.text),
                            ivt_wun: double.parse(_ivt_wun_controller.text),
                            tapPosition: int.parse(_tap_controller.text),
                            databaseID: ntr.databaseID,
                            equipmentUsed:
                                selectedValueForEquipmentUse.toString()
                            // updateDate: DateTime.now(),
                            );

                    getX((Powt3win_R_Provider x) =>
                        x.updatePowt3winr(powt3winRReportToLocal, args['id']));
                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_POWT3WIN_r',
                        arguments: {
                          'id': args['id'],
                          'POWT3WIN_ID': args['POWT3WIN_ID'],
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
                          'ID',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5),
                        )),
                    TextFormField(
                      controller: _IDcontroller,
                      textAlign: TextAlign.center,
                      enabled: false,
                    ),
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
                    Db0_Db6(150.0, 10.0, 150.0, 10.0, ntr),
                    Divider(color: Colors.white)
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
                          'ID',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5),
                        )),
                    TextFormField(
                      controller: _IDcontroller,
                      textAlign: TextAlign.center,
                      enabled: false,
                    ),
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
                    Db0_Db6(10.0, 10.0, 10.0, 0.0, ntr),
                    Divider(color: Colors.white)
                  ]),
            ),
          );
        }
      }),
    );
  }

  ////////////////////////////////////////////////////vector-1///////////////////////
  Column Db0_Db6(double l, t, r, b, Powt3WindingModel ntr) {
    String displayText;
    if (ntr.vectorGroup.toLowerCase() == 'ynyn0d11') {
      displayText = 'Tertiary Side';
    } else {
      displayText = 'IV Side';
    }

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _hv_1u_1vn_controller,
            hintText: 'HV Side UV/UN',
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
            controller: _hv_1v_1wn_controller,
            hintText: 'HV Side VW/VN',
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
            controller: _hv_1w_1un_controller,
            hintText: 'HV Side WU/WN',
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
            controller: _lv_uvn_controller,
            hintText: 'LV Side UV/UN',
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
            controller: _lv_vwn_controller,
            hintText: 'LV Side VW/VN',
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
            controller: _lv_wun_controller,
            hintText: 'LV Side WU/WN',
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
            controller: _ivt_uvn_controller,
            hintText: displayText + ' UV/UN',
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
            controller: _ivt_vwn_controller,
            hintText: displayText + ' VW/VN',
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
            controller: _ivt_wun_controller,
            hintText: displayText + ' WU/WN',
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
