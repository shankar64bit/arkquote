import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/PT/pt_core_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/equipment_acb/test_report_page.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/pt_provider/pt_core_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/pt_provider/pt_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../data/models/equipment/PT/pt_model.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/equipmentUsed.dart';
import '../dropdown_All/pt_coreName_dropdown.dart';

// the formkey used to validate the forms with key
final _formKey = GlobalKey<FormState>();

class EditPtCorePage extends StatelessWidget with GetItMixin {
  Map args = {};

  EditPtCorePage(this.args, {Key key}) : super(key: key);

  final TextEditingController _IDcontroller = TextEditingController();

  final TextEditingController _coreNo_controller = TextEditingController();
  final TextEditingController _ptID_controller = TextEditingController();
  final TextEditingController _ratio_controller = TextEditingController();
  final TextEditingController _coreClass_controller = TextEditingController();
  final TextEditingController _burden_controller = TextEditingController();
  final TextEditingController _ptNo_controller = TextEditingController();
  String get selectedValueForEquipmentUse =>
      EquipmentTypeList().getEquipmentuse();
  String get selectedcoreName => core_Name_drop().get_CoreName();

  Future<void> getReport() async {
    getX((PT_core_Provider x) => x.getPT_core_ById(args['id']));
    PT_core_Model _ptCoreModel =
        watchOnly((PT_core_Provider x) => x.pt_core_Model);

    _IDcontroller.text = args['id'].toString();
    _ptID_controller.text = args['PT_ID'].toString();
    // args['TrNo'].toString();
    //args['Serial_No'];
    _coreNo_controller.text = _ptCoreModel.coreNo.toString();
    _coreClass_controller.text = _ptCoreModel.coreClass.toString();
    _ratio_controller.text = _ptCoreModel.ratio.toString();
    _burden_controller.text = _ptCoreModel.burden.toString();
    _ptNo_controller.text = _ptCoreModel.ptNo.toString();
  }

  @override
  Widget build(BuildContext context) {
    final PTModel ntr1 = watchOnly((PTProvider x) => x.ptModel);

    final PT_core_Model ntr =
        watchOnly((PT_core_Provider x) => x.pt_core_Model);
    getReport();
    var mob =
        const Text('Edit pt-core Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Edit pt-core Details', style: TextStyle(fontSize: 20));

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
                  var url = Uri.parse('${Env.URL_PREFIX}/ptCoreDetails/' +
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
                    'ptNo': ntr1.databaseID,
                    'coreNo': _coreNo_controller.text.toString(),
                    'coreName': selectedcoreName.toString(),
                    'ratio': _ratio_controller.text.toString(),
                    'coreClass': _coreClass_controller.text.toString(),
                    'burden': _burden_controller.text.toString(),
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
                    final PT_core_Model ptCoreReportToLocal = PT_core_Model(
                      ptNo: int.parse(_ptNo_controller.text),
                      burden: int.parse(_burden_controller.text),
                      coreClass: _coreClass_controller.text,
                      coreName: selectedcoreName,
                      ratio: int.parse(_ratio_controller.text),
                      coreNo: int.parse(_coreNo_controller.text),
                      databaseID: ntr.databaseID,
                      updateDate: DateTime.now(),
                    );

                    getX((PT_core_Provider x) =>
                        x.updatePT_core(ptCoreReportToLocal, args['id']));
                    Navigator.pop(context);

                    Navigator.popAndPushNamed(context, '/detail_PT_core',
                        arguments: {
                          'id': args['id'],
                          'POWT_ID': args['POWT_ID'],
                          'ptDatabaseID': args['ptDatabaseID'],
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

  build_body(BuildContext context, PT_core_Model ntr1) {
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
                    'PT No',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
                TextFormField(
                  controller: _ptID_controller,
                  enabled: false,
                  textAlign: TextAlign.center,
                  // hintText: 'Serial No',
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(150, 0, 150, 10),
                  child: core_Name_drop(),
                ),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Core No', _coreNo_controller),
                simplifiedFor_Diplay_for_all_PC_alphanum(
                    'Core Class', _coreClass_controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Ratio', _ratio_controller),
                simplifiedFor_Diplay_for_all_PC_numpad(
                    'Burden', _burden_controller),
                Divider(color: Colors.white)
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
                    'PT No',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5),
                  ),
                ),
                TextFormField(
                  controller: _ptID_controller,
                  enabled: false,
                  textAlign: TextAlign.center,
                  // hintText: 'Serial No',
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: core_Name_drop(),
                ),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Core No', _coreNo_controller),
                simplifiedFor_Display_for_all_Mobile_alphanum(
                    'Core Class', _coreClass_controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Ratio', _ratio_controller),
                simplifiedFor_Display_for_all_Mobile_numpad(
                    'Burden', _burden_controller),
                Divider(color: Colors.white)
              ]),
            ),
          );
        }
      }),
    );
  }
}
