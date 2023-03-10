import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/powt_3_winding/powt3winding_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/Auser_input_validation_exnt.dart/validation_extension_methods.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/powt_3_winding/powt3win_mcIvT_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/powt_3_winding/powt_3_winding_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../data/models/equipment/powt_3_winding/powt3win_mcIvT_model.dart';
import '../../widgets/custom_text_form_field_For_number.dart';
import '../dropdown_All/equipmentUsed.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditPowt3winmcIvtPage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditPowt3winmcIvtPage(this.args, {Key key}) : super(key: key);

  final TextEditingController _IDcontroller = TextEditingController();
  final TextEditingController _trNo_controller = TextEditingController();
  final TextEditingController _serialNo_controller = TextEditingController();
  final TextEditingController _ivt_u_vn_controller = TextEditingController();
  final TextEditingController _ivt_v_wn_controller = TextEditingController();
  final TextEditingController _ivt_w_un_controller = TextEditingController();
  final TextEditingController _ivt_u_controller = TextEditingController();
  final TextEditingController _ivt_v_controller = TextEditingController();
  final TextEditingController _ivt_w_controller = TextEditingController();
  final TextEditingController _tap_controller = TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();

  Future<void> getReport() async {
    getX((Powt3winmcIvTProvider x) => x.getPowt3winmcIvTById(args['id']));
    Powt3winmcIvTModel _powt3WindingmcIvtModel =
        watchOnly((Powt3winmcIvTProvider x) => x.powt3winmcIvTModel);

    _IDcontroller.text = args['id'].toString();
    _trNo_controller.text = _powt3WindingmcIvtModel.trNo.toString();
    _serialNo_controller.text = _powt3WindingmcIvtModel.serialNo.toString();
    _ivt_u_vn_controller.text = _powt3WindingmcIvtModel.ivt_u_vn.toString();
    _ivt_v_wn_controller.text = _powt3WindingmcIvtModel.ivt_v_wn.toString();
    _ivt_w_un_controller.text = _powt3WindingmcIvtModel.ivt_w_un.toString();
    _ivt_u_controller.text = _powt3WindingmcIvtModel.ivt_u.toString();
    _ivt_v_controller.text = _powt3WindingmcIvtModel.ivt_v.toString();
    _ivt_w_controller.text = _powt3WindingmcIvtModel.ivt_w.toString();
    _tap_controller.text = _powt3WindingmcIvtModel.tapPosition.toString();
  }

  @override
  Widget build(BuildContext context) {
    final Powt3WindingModel ntr1 =
        watchOnly((Powt3WindingProvider x) => x.powt3WindingModel);

    final Powt3winmcIvTModel ntr =
        watchOnly((Powt3winmcIvTProvider x) => x.powt3winmcIvTModel);
    getReport();
    var mob = const Text('Edit powt3windingMc Iv/Tertiary side Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('Edit powt3windingMc Iv/Tertiary side Details',
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
                  var url = Uri.parse('${Env.URL_PREFIX}/powt3wMcIvtTest/' +
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
                    'ivt_u_vn': _ivt_u_vn_controller.text.toString(),
                    'ivt_v_wn': _ivt_v_wn_controller.text.toString(),
                    'ivt_w_un': _ivt_w_un_controller.text.toString(),
                    'ivt_u': _ivt_u_controller.text.toString(),
                    'ivt_v': _ivt_v_controller.text.toString(),
                    'ivt_w': _ivt_w_controller.text.toString(),
                    'ivt_n': '0.0',
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
                    final Powt3winmcIvTModel powt3winMcIvtReportToLocal =
                        Powt3winmcIvTModel(
                            trNo: int.parse(_trNo_controller.text),
                            serialNo: _serialNo_controller.text,
                            ivt_u_vn: double.parse(_ivt_u_vn_controller.text),
                            ivt_v_wn: double.parse(_ivt_v_wn_controller.text),
                            ivt_w_un: double.parse(_ivt_w_un_controller.text),
                            ivt_u: double.parse(_ivt_u_controller.text),
                            ivt_v: double.parse(_ivt_v_controller.text),
                            ivt_w: double.parse(_ivt_w_controller.text),
                            ivt_n: 0.0,
                            tapPosition: int.parse(_tap_controller.text),
                            databaseID: ntr.databaseID,
                            equipmentUsed:
                                selectedValueForEquipmentUse.toString()
                            // updateDate: DateTime.now(),
                            );

                    getX((Powt3winmcIvTProvider x) => x.updatePowt3winmcIvT(
                        powt3winMcIvtReportToLocal, args['id']));
                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_POWT3WIN_mcIvT',
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
                    ntr.vectorGroup.toLowerCase() == 'ynyn0d11'
                        ? Db0_Db6(150.0, 0.0, 150.0, 10.0, 'Tertiary Side')
                        : Db0_Db6(150.0, 0.0, 150.0, 10.0, 'IV Side'),
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
                    ntr.vectorGroup.toLowerCase() == 'ynyn0d11'
                        ? Db0_Db6(10.0, 0.0, 10.0, 10.0, 'Tertiary Side')
                        : Db0_Db6(10.0, 0.0, 10.0, 10.0, 'IV Side')
                  ]),
            ),
          );
        }
      }),
    );
  }

  ////////////////////////////////////////////////////vector-1///////////////////////
  Column Db0_Db6(double l, t, r, b, String displayText) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(l, t, r, b),
          child: CustomTextFormFieldForNumber(
            controller: _ivt_u_vn_controller,
            hintText: displayText + ' UV /UN',
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
            controller: _ivt_v_wn_controller,
            hintText: displayText + ' VW /VN',
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
            controller: _ivt_w_un_controller,
            hintText: displayText + ' WU /WN',
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
            controller: _ivt_u_controller,
            hintText: displayText + ' U',
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
            hintText: displayText + ' V',
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
            hintText: displayText + ' W',
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
            hintText: 'tapPositions',
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
