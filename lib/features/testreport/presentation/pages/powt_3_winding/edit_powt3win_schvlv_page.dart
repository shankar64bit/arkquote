import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/powt_3_winding/powt3win_schvlv_model.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/powt_3_winding/powt3winding_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/Auser_input_validation_exnt.dart/validation_extension_methods.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/powt_3_winding/powt3win_schvlv_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/powt_3_winding/powt_3_winding_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../widgets/custom_text_form_field_For_number.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditPowt3winscHvLvPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditPowt3winscHvLvPage(this.args, {Key key}) : super(key: key);

  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _trNo_controller = TextEditingController();
  final TextEditingController _serialNo_controller = TextEditingController();
  final TextEditingController _hv_u_controller = TextEditingController();
  final TextEditingController _hv_v_controller = TextEditingController();
  final TextEditingController _hv_w_controller = TextEditingController();
  final TextEditingController _hv_n_controller = TextEditingController();
  final TextEditingController _lv_u_controller = TextEditingController();
  final TextEditingController _lv_v_controller = TextEditingController();
  final TextEditingController _lv_w_controller = TextEditingController();
  final TextEditingController _lv_n_controller = TextEditingController();
  final TextEditingController _tap_controller = TextEditingController();

  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Future<void> getReport() async {
    getX((Powt3winschvlvProvider x) => x.getPowt3winschvlvById(args['id']));
    Powt3winschvlvModel _powt3WindingscHvLvModel =
        watchOnly((Powt3winschvlvProvider x) => x.powt3winschvlvModel);

    _IDcontroller.text = args['id'].toString();
    _trNo_controller.text = _powt3WindingscHvLvModel.trNo.toString();
    _serialNo_controller.text = _powt3WindingscHvLvModel.serialNo.toString();
    _hv_u_controller.text = _powt3WindingscHvLvModel.hv_u.toString();
    _hv_v_controller.text = _powt3WindingscHvLvModel.hv_v.toString();
    _hv_w_controller.text = _powt3WindingscHvLvModel.hv_w.toString();
    _hv_n_controller.text = _powt3WindingscHvLvModel.hv_w.toString();
    _lv_n_controller.text = _powt3WindingscHvLvModel.lv_n.toString();
    _lv_u_controller.text = _powt3WindingscHvLvModel.lv_u.toString();
    _lv_v_controller.text = _powt3WindingscHvLvModel.lv_v.toString();
    _lv_w_controller.text = _powt3WindingscHvLvModel.lv_w.toString();
    _tap_controller.text = _powt3WindingscHvLvModel.tapPosition.toString();
  }

  setDefaultValue(Powt3WindingModel ntr) {
    if (ntr.vectorGroup.toLowerCase() == 'yna0d11') {
      _hv_n_controller.text = '0.0';
      _lv_n_controller.text = '0.0';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Powt3WindingModel ntr1 =
        watchOnly((Powt3WindingProvider x) => x.powt3WindingModel);

    final Powt3winschvlvModel ntr =
        watchOnly((Powt3winschvlvProvider x) => x.powt3winschvlvModel);
    getReport();
    var mob = const Text(
        'Edit powt3winding Short Circuit Test HV/LV Side Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text(
        'Edit powt3winding Short Circuit Test HV/LV Side Details',
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
                  var url = Uri.parse('${Env.URL_PREFIX}/powt3wScHvLvTest/' +
                      ntr.databaseID.toString() +
                      '/');
                  setDefaultValue(ntr1);

                  Map<String, String> headers = {
                    "Content-type": "application/json",
                    "Authorization": "Bearer $acc_token",
                  };
                  print("***********");
                  print(url);
                  print(args['trDatabaseID'].toString());

                  final Map payload = {
                    "trNo": args['trDatabaseID'].toString(),
                    'hv_u': _hv_u_controller.text.toString(),
                    'hv_v': _hv_v_controller.text.toString(),
                    'hv_w': _hv_w_controller.text.toString(),
                    'hv_n': _hv_n_controller.text.toString(),
                    'lv_u': _lv_u_controller.text.toString(),
                    'lv_v': _lv_v_controller.text.toString(),
                    'lv_w': _lv_w_controller.text.toString(),
                    'lv_n': _lv_n_controller.text.toString(),
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
                    final Powt3winschvlvModel powt3winhvlvReportToLocal =
                        Powt3winschvlvModel(
                      trNo: int.parse(_trNo_controller.text),
                      serialNo: _serialNo_controller.text,
                      hv_u: double.parse(_hv_u_controller.text),
                      hv_v: double.parse(_hv_v_controller.text),
                      hv_w: double.parse(_hv_w_controller.text),
                      hv_n: double.parse(_hv_n_controller.text),
                      lv_u: double.parse(_lv_u_controller.text),
                      lv_v: double.parse(_lv_v_controller.text),
                      lv_w: double.parse(_lv_w_controller.text),
                      lv_n: double.parse(_lv_n_controller.text),
                      tapPosition: int.parse(_tap_controller.text),
                      databaseID: ntr.databaseID,
                      // updateDate: DateTime.now(),
                    );

                    getX((Powt3winschvlvProvider x) => x.updatePowt3winschvlv(
                        powt3winhvlvReportToLocal, args['id']));
                    Navigator.pop(context);

                    Navigator.popAndPushNamed(
                        context, '/detail_POWT3WIN_schvlv',
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
                    Db0_Db6(150.0, 10.0, 150.0, 0.0, ntr),
                    Divider(color: Colors.white),
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
                    Db0_Db6(10.0, 10.0, 10.0, 0.0, ntr),
                    Divider(color: Colors.white),
                  ]),
            ),
          );
        }
      }),
    );
  }

  ////////////////////////////////////////////////////vector-1///////////////////////
  Column Db0_Db6(double l, t, r, b, Powt3WindingModel ntr) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _hv_u_controller,
            hintText: 'HV Side - U',
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
            hintText: 'HV Side - V',
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
            hintText: 'HV Side - W',
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
                  hintText: 'HV Side - N',
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
            controller: _lv_u_controller,
            hintText: 'LV Side - U',
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
            controller: _lv_v_controller,
            hintText: 'LV Side - V',
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
            controller: _lv_w_controller,
            hintText: 'LV Side - W',
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
                  controller: _lv_n_controller,
                  hintText: 'LV Side - N',
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
