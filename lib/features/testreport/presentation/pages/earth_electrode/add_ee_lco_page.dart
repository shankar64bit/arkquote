// ignore_for_file: missing_return, missing_required_param, non_constant_identifier_names, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/Auser_input_validation_exnt.dart/validation_extension_methods.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/EE/eeLoc.dart';
import '../../providers/ee_provider/ee_loc_provider.dart';
import '../../providers/ee_provider/ee_provider.dart';
import '../../widgets/custom_text_form_field.dart';
import '../dropdown_All/a_as_simplified_function.dart';
import '../dropdown_All/a_location_enum_drop_list.dart';

final _formKey = GlobalKey<FormState>();

class AddEELocPage extends StatelessWidget with GetItMixin {
  Map args = {};
  int local_eeRefId;
  AddEELocPage(this.args, {Key key}) : super(key: key);

  final TextEditingController _eeRefcontroller = TextEditingController();
  final TextEditingController _eeNocontroller = TextEditingController();
  final TextEditingController _locatioNcontroller = TextEditingController();
  String get selectedValueLocation =>
      Location_dropDown().get_selectedValueLocation();
  setEENo() {
    _eeNocontroller.text = args['id'].toString();
    local_eeRefId = args['id'];
  }

  @override
  Widget build(BuildContext context) {
    setEENo();
    var mob = Text('Add Earth Electrode Location Details',
        style: TextStyle(fontSize: 17));
    var desk = Text('Add Earth Electrode Location Details',
        style: TextStyle(fontSize: 20));
    var accToken = sl<GoogleSignInController>().ACCESS_TOKEN;
    var refToken = sl<GoogleSignInController>().REFRESH_TOKEN;
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

                  // add to local database

                  final EELocModel eeLoctoLocal = EELocModel(
                    location: _locatioNcontroller.text,
                    databaseID: 0,
                    eeRef: local_eeRefId,
                    lastUpdated: DateTime.now(),
                  );
                  getX((EE_loc_Provider x) => x.addEELoc(eeLoctoLocal));
                  watchOnly((EEProvider x) => {});
                  print('Stored successfully');
                  Navigator.popAndPushNamed(context, '/detail_EE', arguments: {
                    'id': args['id'],
                    'trDatabaseID': args['trDatabaseID'],
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
            child: Card(
              elevation: 5,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        'Earth Electrode No',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        controller: _eeNocontroller,
                        textAlign: TextAlign.center,
                        enabled: false,
                      ),
                    ),
                    simplifiedFor_Diplay_for_all_PC_alphanum(
                        'Location', _locatioNcontroller),
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
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        'Earth Electrode No',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: TextFormField(
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        controller: _eeNocontroller,
                        textAlign: TextAlign.center,
                        enabled: false,
                      ),
                    ),
                    simplifiedFor_Display_for_all_Mobile_alphanum(
                        'Location', _locatioNcontroller),
                  ]),
            ),
          );
        }
      }),
    );
  }
}
