// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, use_build_context_synchronously, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/CT/ct_model.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/acb/acb_model.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/busbar/bb_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/ct_provider/ct_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/equipment_acb_provider/acb_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/it_provider/it_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../data/models/equipment/AT/AT_model.dart';
import '../../../data/models/equipment/DG/dg_model.dart';
import '../../../data/models/equipment/EE/ee_model.dart';
import '../../../data/models/equipment/IT/it_model.dart';
import '../../../data/models/equipment/LA/la_model.dart';
import '../../../data/models/equipment/PT/pt_model.dart';
import '../../../data/models/equipment/Relays/AuxiliaryRelay/AR_model.dart';
import '../../../data/models/equipment/Relays/EFELRelay/efelr_model.dart';
import '../../../data/models/equipment/Relays/FPrelay/FPrelay_model.dart';
import '../../../data/models/equipment/Relays/OCEFRelay/ocefr_model.dart';
import '../../../data/models/equipment/Relays/TRelay/tr_model.dart';
import '../../../data/models/equipment/Relays/VoltageRelay/vr_model.dart';
import '../../../data/models/equipment/SC/sc_model.dart';
import '../../../data/models/equipment/energy_meter/energy_meter_model.dart';
import '../../../data/models/equipment/powt/powt_model.dart';
import '../../../data/models/equipment/powt_3_winding/powt3winding_model.dart';
import '../../providers/Relays_providers/AuxiliaryRelay_providers/AR_provider.dart';
import '../../providers/Relays_providers/EFELRelay_provider/efelr_provider.dart';
import '../../providers/Relays_providers/FPrelay_providers/FPrelay_providers.dart';
import '../../providers/Relays_providers/OCEFRelay_provider/ocefr_provider.dart';
import '../../providers/Relays_providers/TimerRelay_provider/tr_provider.dart';
import '../../providers/Relays_providers/voltageRelay_provider/vr_provider.dart';
import '../../providers/at_provider/at_provider.dart';
import '../../../data/models/equipment/isolator/iso_model.dart';
import '../../../data/models/equipment/power_cable/pc_model.dart';
import '../../providers/busbar_provider/bb_provider.dart';
import '../../providers/dg_provider/dg_provider.dart';
import '../../providers/ee_provider/ee_provider.dart';
import '../../providers/energy_meter_provider/energy_meter_provider.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/test_report_model.dart';
import '../../providers/equipment_acb_provider/test_report_provider.dart';
import '../../providers/powt_3_winding/powt_3_winding_provider.dart';
import '../../providers/powt_provider/powt_provider.dart';
import '../../providers/iso_provider/iso_provider.dart';
import '../../providers/la_provider/la_provider.dart';
import '../../providers/pc_provider/pc_provider.dart';
import '../../providers/pt_provider/pt_provider.dart';
import '../../providers/sc_provider/sc_provider.dart';
import '../dropdown_All/MegaGigaTeraRadioButton/connectedtaps.dart';
import '../dropdown_All/a_EfEletype_drop_list.dart';
import '../dropdown_All/a_bbetype_drop_list.dart';
import '../dropdown_All/a_location_enum_drop_list.dart';
import '../dropdown_All/a_make_drop_list.dart';
import '../dropdown_All/at_vector_group_2_type_dropdown.dart';
import '../dropdown_All/at_vector_group_6_type_dropdown.dart';
import '../dropdown_All/at_vector_group_8_type_dropdown.dart';
import '../dropdown_All/equipmentUsed.dart';
import '../dropdown_All/it_vector_group_8_type_dropdown.dart';
import '../dropdown_All/it_wr_hvlv_option.dart';
import '../dropdown_All/no_of_poles_drop_list.dart';
import '../dropdown_All/pt_coreName_dropdown.dart';
import '../dropdown_All/responsive_tool/google_sign_in_out/InternetConnChecker.dart';
import '../dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import '../dropdown_All/testedbyuser.dart';
import '../dropdown_All/vcb_ocb_sfe_rsv_kv_drop.dart';
import '../dropdown_All/verifiedbyuser.dart';
import '../dropdown_All/vk_values_3_ctTapTable.dart';
import '../dropdown_All/yom_drop_list.dart';

var acc_token = sl<GoogleSignInController>().ACCESS_TOKEN;
String findEtype;

class DetailTestReportPage extends StatelessWidget with GetItMixin {
  final int id;
  TestReportModel ntr;
  AcbModel acb;
  var tempvar;

  findEtypeForEquip() {
    return findEtype;
  }

  DetailTestReportPage({this.id, Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    getX((TestReportsProvider x) => x.getReportByID(id));
    final TestReportModel ntr = watchOnly((TestReportsProvider x) => x.trModel);

    var mob = Text('Test Report Detail', style: TextStyle(fontSize: 16));
    var desk = Text('Test Report Details', style: TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        title: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 400) {
            return desk;
          } else {
            return mob;
          }
        }),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/edit_report',
                    arguments: id);
              },
              icon: const Icon(Icons.edit)),
          IconButton(
              onPressed: () {
                _showAlertDialog(context);
              },
              icon: const Icon(Icons.delete_forever)),
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/');
              },
              icon: const Icon(Icons.home)),
        ],
      ),
      /////////////////////////RESPONSIVE-ENDS////////////////////////////

      /////////////////////////////DESKTOP-VIEW-STARTS////////////////////
      // ignore: missing_return
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 400) {
          return Column(
            children: [
              ConstrainedBox(
                  constraints: BoxConstraints(minHeight: 0, maxWidth: 900),
                  child: build_body(ntr)),
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: ((context, index) {
                    return Column(
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              minHeight: 0, maxHeight: 165, maxWidth: 900),
                          child: generate_list_of_ACB(ntr),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              minHeight: 0, maxHeight: 165, maxWidth: 900),
                          child: generate_CT(ntr),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              minHeight: 0, maxHeight: 165, maxWidth: 900),
                          child: generate_PT(ntr),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              minHeight: 0, maxHeight: 165, maxWidth: 900),
                          child: generate_AT(ntr),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              minHeight: 0, maxHeight: 165, maxWidth: 900),
                          child: generate_POWT(ntr),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              minHeight: 0, maxHeight: 165, maxWidth: 700),
                          child: generate_powt3win(ntr),
                        ),
                        //upcoming test reports
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              minHeight: 0, maxHeight: 165, maxWidth: 700),
                          child: generate_list_of_EM(ntr),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              minHeight: 0, maxHeight: 165, maxWidth: 700),
                          child: generate_list_of_La(ntr),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              minHeight: 0, maxHeight: 165, maxWidth: 700),
                          child: generate_list_of_Iso(ntr),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              minHeight: 0, maxHeight: 165, maxWidth: 700),
                          child: generate_list_of_SC(ntr),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              minHeight: 0, maxHeight: 165, maxWidth: 700),
                          child: generate_list_of_EE(ntr),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              minHeight: 0, maxHeight: 165, maxWidth: 700),
                          child: generate_list_of_PC(ntr),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              minHeight: 0, maxHeight: 165, maxWidth: 700),
                          child: generate_list_of_BB(ntr),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              minHeight: 0, maxHeight: 165, maxWidth: 700),
                          child: generate_FPrelay(ntr),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              minHeight: 0, maxHeight: 165, maxWidth: 700),
                          child: generate_AR(ntr),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              minHeight: 0, maxHeight: 165, maxWidth: 700),
                          child: generate_list_of_DG(ntr),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              minHeight: 0, maxHeight: 165, maxWidth: 700),
                          child: generate_list_of_TR(ntr),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              minHeight: 0, maxHeight: 165, maxWidth: 700),
                          child: generate_list_of_VR(ntr),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              minHeight: 0, maxHeight: 165, maxWidth: 700),
                          child: generate_list_of_EFELR(ntr),
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              minHeight: 0, maxHeight: 165, maxWidth: 700),
                          child: generate_list_of_OCEFR(ntr),
                        ),
                        // ConstrainedBox(
                        //   constraints: BoxConstraints(
                        //       minHeight: 0, maxHeight: 165, maxWidth: 700),
                        //   child: generate_list_of_IT(ntr),
                        // ),
                      ],
                    );
                  }),
                ),
              ),
            ],
          );
          //////////////////////////MOBILE-VIEW-STARTS////////////////////
        } else if (constraints.maxWidth < 400) {
          return Column(
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(3, 0, 15, 5),
                  child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: 0),
                      child: build_body(ntr))),
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: ((context, index) {
                    return Column(
                      children: [
                        ConstrainedBox(
                            constraints:
                                BoxConstraints(minHeight: 0, maxHeight: 160),
                            child: generate_list_of_ACB(ntr)),
                        ConstrainedBox(
                            constraints:
                                BoxConstraints(minHeight: 0, maxHeight: 170),
                            child: generate_CT(ntr)),
                        ConstrainedBox(
                            constraints:
                                BoxConstraints(minHeight: 0, maxHeight: 170),
                            child: generate_PT(ntr)),
                        ConstrainedBox(
                            constraints:
                                BoxConstraints(minHeight: 0, maxHeight: 170),
                            child: generate_AT(ntr)),
                        ConstrainedBox(
                            constraints:
                                BoxConstraints(minHeight: 0, maxHeight: 170),
                            child: generate_POWT(ntr)),
                        ConstrainedBox(
                            constraints:
                                BoxConstraints(minHeight: 0, maxHeight: 165),
                            child: generate_powt3win(ntr)),
                        ConstrainedBox(
                            constraints:
                                BoxConstraints(minHeight: 0, maxHeight: 165),
                            child: generate_list_of_EM(ntr)),
                        ConstrainedBox(
                            constraints:
                                BoxConstraints(minHeight: 0, maxHeight: 165),
                            child: generate_list_of_La(ntr)),
                        ConstrainedBox(
                            constraints:
                                BoxConstraints(minHeight: 0, maxHeight: 165),
                            child: generate_list_of_Iso(ntr)),
                        ConstrainedBox(
                            constraints:
                                BoxConstraints(minHeight: 0, maxHeight: 165),
                            child: generate_list_of_SC(ntr)),
                        ConstrainedBox(
                            constraints:
                                BoxConstraints(minHeight: 0, maxHeight: 165),
                            child: generate_list_of_EE(ntr)),
                        ConstrainedBox(
                            constraints:
                                BoxConstraints(minHeight: 0, maxHeight: 165),
                            child: generate_list_of_PC(ntr)),
                        ConstrainedBox(
                            constraints:
                                BoxConstraints(minHeight: 0, maxHeight: 165),
                            child: generate_list_of_BB(ntr)),
                        ConstrainedBox(
                            constraints:
                                BoxConstraints(minHeight: 0, maxHeight: 165),
                            child: generate_FPrelay(ntr)),
                        ConstrainedBox(
                            constraints:
                                BoxConstraints(minHeight: 0, maxHeight: 165),
                            child: generate_AR(ntr)),
                        ConstrainedBox(
                            constraints:
                                BoxConstraints(minHeight: 0, maxHeight: 165),
                            child: generate_list_of_DG(ntr)),
                        ConstrainedBox(
                            constraints:
                                BoxConstraints(minHeight: 0, maxHeight: 165),
                            child: generate_list_of_TR(ntr)),
                        ConstrainedBox(
                            constraints:
                                BoxConstraints(minHeight: 0, maxHeight: 165),
                            child: generate_list_of_VR(ntr)),
                        ConstrainedBox(
                            constraints:
                                BoxConstraints(minHeight: 0, maxHeight: 165),
                            child: generate_list_of_EFELR(ntr)),
                        ConstrainedBox(
                            constraints:
                                BoxConstraints(minHeight: 0, maxHeight: 165),
                            child: generate_list_of_OCEFR(ntr)),
                        ConstrainedBox(
                            constraints:
                                BoxConstraints(minHeight: 0, maxHeight: 165),
                            child: generate_list_of_IT(ntr)),
                      ],
                    );
                  }),
                ),
              ),
            ],
          );
        }
      }),
      /////////////////////////RESPONSIVE-ENDS////////////////////////

      floatingActionButton: PopupMenuButton(
        child: FloatingActionButton.extended(
            label: Text('Equipments',
                style: TextStyle(color: Colors.white, fontSize: 12)),
            icon: const Icon(Icons.electric_bolt_sharp, color: Colors.white)),
        itemBuilder: (context) {
          return List.generate(
            1,
            (index) {
              return PopupMenuItem(
                child: Column(
                  children: [
                    PopupMenuButton(
                      child: FloatingActionButton.extended(
                        label: Text(
                          'circuit breaker',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                      itemBuilder: (context) {
                        return List.generate(
                          1,
                          (index) {
                            return PopupMenuItem(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    ///////////////////////Add ACB button/////////////////////
                                    padding: const EdgeInsets.all(5.0),
                                    child: FloatingActionButton.extended(
                                      heroTag: 'addACB',
                                      onPressed: () async {
                                        //-----------------------------------------------------

                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          },
                                        );

                                        await load_Inventry_User();

                                        Navigator.of(context).pop();

                                        //-----------------------------------------------------

                                        Navigator.pushNamed(
                                          context,
                                          '/add_ACB',
                                          arguments: {
                                            'trNo': ntr.trNo,
                                            'trId': ntr.id,
                                            'trDatabaseID': ntr.databaseID,
                                          },
                                        );
                                        findEtype = 'acb';
                                      },
                                      label: const Text('Add ACB',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      icon: const Icon(Icons.add,
                                          color: Colors.white),
                                    ),
                                  ),
                                  ///////////////////////Add VCB button/////////////////////
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FloatingActionButton.extended(
                                      heroTag: 'addVCB',
                                      onPressed: () async {
                                        // loading to fetch details from remote server
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          },
                                        );
                                        await load_Inventry_User();

                                        // pop loading function
                                        Navigator.of(context).pop();

                                        Navigator.pushNamed(
                                          context,
                                          '/add_ACB',
                                          arguments: {
                                            'trNo': ntr.trNo,
                                            'trId': ntr.id,
                                            'trDatabaseID': ntr.databaseID,
                                          },
                                        );
                                        findEtype = 'vcb';
                                      },
                                      label: const Text('Add VCB',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      icon: const Icon(Icons.add,
                                          color: Colors.white),
                                    ),
                                  ),
                                  ///////////////////////Add OCB button/////////////////////
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FloatingActionButton.extended(
                                      heroTag: 'addOCB',
                                      onPressed: () async {
                                        // loading to fetch details from remote server
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          },
                                        );
                                        await load_Inventry_User();

                                        // pop loading function
                                        Navigator.of(context).pop();
                                        Navigator.pushNamed(context, '/add_ACB',
                                            arguments: {
                                              'trNo': ntr.trNo,
                                              'trId': ntr.id,
                                              'trDatabaseID': ntr.databaseID,
                                            });
                                        findEtype = 'ocb';
                                      },
                                      label: const Text('Add OCB',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      icon: const Icon(Icons.add,
                                          color: Colors.white),
                                    ),
                                  ),
                                  ///////////////////////Add SFE button/////////////////////
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FloatingActionButton.extended(
                                      heroTag: 'addSF6',
                                      onPressed: () async {
                                        // loading to fetch details from remote server
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          },
                                        );
                                        await load_Inventry_User();

                                        // pop loading function
                                        Navigator.of(context).pop();
                                        Navigator.pushNamed(context, '/add_ACB',
                                            arguments: {
                                              'trNo': ntr.trNo,
                                              'trId': ntr.id,
                                              'trDatabaseID': ntr.databaseID,
                                            });
                                        findEtype = 'sf6';
                                      },
                                      label: const Text('Add SF6',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      icon: const Icon(Icons.add,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(height: 5),

                    //>>>>>>>>>>>>>>>>>>END-OF-CIRCUIT-BREAKERS-GROUP>>>>>>>>>>>>>>>>>>>
                    PopupMenuButton(
                      child: FloatingActionButton.extended(
                        label: Text(
                          'Transformers',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                      itemBuilder: (context) {
                        return List.generate(
                          1,
                          (index) {
                            return PopupMenuItem(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    ///////////////////////Add Transformer CT button/////////////////////
                                    padding: const EdgeInsets.all(5.0),
                                    child: FloatingActionButton.extended(
                                      heroTag: 'addCT',
                                      onPressed: () async {
                                        //-----------------------------------------------------
                                        // loading to fetch details from remote server
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          },
                                        );
                                        await load_Inventry_User();

                                        // pop loading function
                                        Navigator.of(context).pop();
                                        //-----------------------------------------------------

                                        Navigator.pushNamed(context, '/add_CT',
                                            arguments: {
                                              'trNo': ntr.trNo,
                                              'trId': ntr.id,
                                              'trDatabaseID': ntr.databaseID,
                                            });
                                      },
                                      label: const Text(
                                          'Add Current Transformer',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      icon: const Icon(Icons.add,
                                          color: Colors.white),
                                    ),
                                  ),
                                  ///////////////////////Add Transformer PT button/////////////////////
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FloatingActionButton.extended(
                                      heroTag: 'addPT',
                                      onPressed: () async {
                                        //-----------------------------------------------------
                                        // loading to fetch details from remote server
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          },
                                        );
                                        await load_Inventry_User();

                                        // pop loading function
                                        Navigator.of(context).pop();
                                        //-----------------------------------------------------

                                        Navigator.pushNamed(context, '/add_PT',
                                            arguments: {
                                              'trNo': ntr.trNo,
                                              'trId': ntr.id,
                                              'trDatabaseID': ntr.databaseID,
                                            });
                                      },
                                      label: const Text(
                                          'Add Potential Transformer',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      icon: const Icon(Icons.add,
                                          color: Colors.white),
                                    ),
                                  ),
                                  // ////////////////////////////////////////////////////////////////
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FloatingActionButton.extended(
                                      heroTag: 'addAT',
                                      onPressed: () async {
                                        //-----------------------------------------------------
                                        // loading to fetch details from remote server
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          },
                                        );
                                        await load_Inventry_User();

                                        // pop loading function
                                        Navigator.of(context).pop();
                                        //-----------------------------------------------------

                                        Navigator.pushNamed(context, '/add_AT',
                                            arguments: {
                                              'trNo': ntr.trNo,
                                              'trId': ntr.id,
                                              'trDatabaseID': ntr.databaseID,
                                            });
                                      },
                                      label: const Text(
                                          'Add Auxiliary Transformer',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      icon: const Icon(Icons.add,
                                          color: Colors.white),
                                    ),
                                  ),
                                  // ////////////////////////////////////////////////////////////////
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FloatingActionButton.extended(
                                      heroTag: 'addPOWT',
                                      onPressed: () async {
                                        //-----------------------------------------------------

                                        // loading to fetch details from remote server
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          },
                                        );
                                        await load_Inventry_User();

                                        // pop loading function
                                        Navigator.of(context).pop();
                                        //-----------------------------------------------------

                                        Navigator.pushNamed(
                                            context, '/add_POWT',
                                            arguments: {
                                              'trNo': ntr.trNo,
                                              'trId': ntr.id,
                                              'trDatabaseID': ntr.databaseID,
                                            });
                                      },
                                      label: const Text('Add Power Transformer',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      icon: const Icon(Icons.add,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FloatingActionButton.extended(
                                      heroTag: 'addPOWT3WIN',
                                      onPressed: () async {
                                        //-----------------------------------------------------

                                        // loading to fetch details from remote server
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          },
                                        );
                                        await load_Inventry_User();

                                        // pop loading function
                                        Navigator.of(context).pop();
                                        //-----------------------------------------------------

                                        Navigator.pushNamed(
                                            context, '/add_POWT3WIN',
                                            arguments: {
                                              'trNo': ntr.trNo,
                                              'trId': ntr.id,
                                              'trDatabaseID': ntr.databaseID,
                                            });
                                      },
                                      label: const Text(
                                          'Add Power Transformer3win',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      icon: const Icon(Icons.add,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FloatingActionButton.extended(
                                      heroTag: 'addIt',
                                      onPressed: () async {
                                        // loading to fetch details from remote server
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          },
                                        );
                                        await load_Inventry_User();

                                        // pop loading function
                                        Navigator.of(context).pop();
                                        Navigator.pushNamed(context, '/add_IT',
                                            arguments: {
                                              'trNo': ntr.trNo,
                                              'trId': ntr.id,
                                              'trDatabaseID': ntr.databaseID,
                                            });
                                      },
                                      label: const Text(
                                          'Add Inverter Transformer',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      icon: const Icon(Icons.add,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(height: 5),
                    PopupMenuButton(
                      child: FloatingActionButton.extended(
                        label: Text(
                          'Relays Equip',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                      itemBuilder: (context) {
                        return List.generate(
                          1,
                          (index) {
                            return PopupMenuItem(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    ///////////////////////Add Feeder Protection button/////////////////////
                                    padding: const EdgeInsets.all(5.0),
                                    child: FloatingActionButton.extended(
                                      heroTag: 'addFPrelay',
                                      onPressed: () async {
                                        //-----------------------------------------------------
                                        // loading to fetch details from remote server
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          },
                                        );
                                        await load_Inventry_User();

                                        // pop loading function
                                        Navigator.of(context).pop();
                                        //-----------------------------------------------------

                                        Navigator.pushNamed(
                                            context, '/add_FPrelay',
                                            arguments: {
                                              'trNo': ntr.trNo,
                                              'trId': ntr.id,
                                              'trDatabaseID': ntr.databaseID,
                                            });
                                      },
                                      label: const Text('Add FPrelay',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      icon: const Icon(Icons.add,
                                          color: Colors.white),
                                    ),
                                  ),
                                  ///////////////////////Add Auxiliary Relay button/////////////////////
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FloatingActionButton.extended(
                                      heroTag: 'addAR',
                                      onPressed: () async {
                                        //-----------------------------------------------------
                                        // loading to fetch details from remote server
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          },
                                        );
                                        await load_Inventry_User();

                                        // pop loading function
                                        Navigator.of(context).pop();
                                        //-----------------------------------------------------

                                        Navigator.pushNamed(context, '/add_AR',
                                            arguments: {
                                              'trNo': ntr.trNo,
                                              'trId': ntr.id,
                                              'trDatabaseID': ntr.databaseID,
                                            });
                                      },
                                      label: const Text('Add Auxiliary Relay',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      icon: const Icon(Icons.add,
                                          color: Colors.white),
                                    ),
                                  ),

                                  ///////////////////////Add Timer Relay button/////////////////////
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FloatingActionButton.extended(
                                      heroTag: 'addTR',
                                      onPressed: () async {
                                        //-----------------------------------------------------
                                        // loading to fetch details from remote server
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          },
                                        );
                                        await load_Inventry_User();

                                        // pop loading function
                                        Navigator.of(context).pop();
                                        //-----------------------------------------------------

                                        Navigator.pushNamed(context, '/add_TR',
                                            arguments: {
                                              'trNo': ntr.trNo,
                                              'trId': ntr.id,
                                              'trDatabaseID': ntr.databaseID,
                                            });
                                      },
                                      label: const Text('Add Timer Relay',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      icon: const Icon(Icons.add,
                                          color: Colors.white),
                                    ),
                                  ),
                                  ///////////////////////Add Voltage Relay button/////////////////////
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FloatingActionButton.extended(
                                      heroTag: 'addVR',
                                      onPressed: () async {
                                        //-----------------------------------------------------
                                        // loading to fetch details from remote server
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          },
                                        );
                                        await load_Inventry_User();

                                        // pop loading function
                                        Navigator.of(context).pop();
                                        //-----------------------------------------------------

                                        Navigator.pushNamed(context, '/add_VR',
                                            arguments: {
                                              'trNo': ntr.trNo,
                                              'trId': ntr.id,
                                              'trDatabaseID': ntr.databaseID,
                                            });
                                      },
                                      label: const Text('Add Voltage Relay',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      icon: const Icon(Icons.add,
                                          color: Colors.white),
                                    ),
                                  ),

                                  ///////////////////////Add Earth Fault/Leakage Relay button/////////////////////
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FloatingActionButton.extended(
                                      heroTag: 'addEFELR',
                                      onPressed: () async {
                                        //-----------------------------------------------------
                                        // loading to fetch details from remote server
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          },
                                        );
                                        await load_Inventry_User();

                                        // pop loading function
                                        Navigator.of(context).pop();
                                        //-----------------------------------------------------

                                        Navigator.pushNamed(
                                            context, '/add_EFELR',
                                            arguments: {
                                              'trNo': ntr.trNo,
                                              'trId': ntr.id,
                                              'trDatabaseID': ntr.databaseID,
                                            });
                                      },
                                      label: const Text(
                                          'Add EarthFault/\n Leakage Relay',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      icon: const Icon(Icons.add,
                                          color: Colors.white),
                                    ),
                                  ),

                                  ///////////////////////Add OverCurrent /Earth Fault Relay button/////////////////////
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FloatingActionButton.extended(
                                      heroTag: 'addOCEFR',
                                      onPressed: () async {
                                        //-----------------------------------------------------
                                        // loading to fetch details from remote server
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          },
                                        );
                                        await load_Inventry_User();

                                        // pop loading function
                                        Navigator.of(context).pop();
                                        //-----------------------------------------------------

                                        Navigator.pushNamed(
                                            context, '/add_OCEFR',
                                            arguments: {
                                              'trNo': ntr.trNo,
                                              'trId': ntr.id,
                                              'trDatabaseID': ntr.databaseID,
                                            });
                                      },
                                      label: const Text(
                                          'Add OverCurrent/\n EarthFault Relay',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      icon: const Icon(Icons.add,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),

                    SizedBox(height: 5),

                    PopupMenuButton(
                      child: FloatingActionButton.extended(
                        label: Text(
                          'Other Equip',
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                      ),
                      itemBuilder: (context) {
                        return List.generate(
                          1,
                          (index) {
                            return PopupMenuItem(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ///////////////////////Add Energy Meter button/////////////////////
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FloatingActionButton.extended(
                                      heroTag: 'addEM',
                                      onPressed: () async {
                                        // loading to fetch details from remote server
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          },
                                        );
                                        await load_Inventry_User();

                                        // pop loading function
                                        Navigator.of(context).pop();

                                        Navigator.pushNamed(context, '/add_EM',
                                            arguments: {
                                              'trNo': ntr.trNo,
                                              'trId': ntr.id,
                                              'trDatabaseID': ntr.databaseID,
                                            });
                                      },
                                      label: const Text('Add Energy Meter',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      icon: const Icon(Icons.add,
                                          color: Colors.white),
                                    ),
                                  ),

                                  ///////////////////////Add Lightning Arrester button/////////////////////
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FloatingActionButton.extended(
                                      heroTag: 'addLA',
                                      onPressed: () async {
                                        // loading to fetch details from remote server
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          },
                                        );
                                        await load_Inventry_User();

                                        // pop loading function
                                        Navigator.of(context).pop();

                                        Navigator.pushNamed(context, '/add_LA',
                                            arguments: {
                                              'trNo': ntr.trNo,
                                              'trId': ntr.id,
                                              'trDatabaseID': ntr.databaseID,
                                            });
                                      },
                                      label: const Text(
                                          'Add Lightning Arrester',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      icon: const Icon(Icons.add,
                                          color: Colors.white),
                                    ),
                                  ),

                                  ///////////////////////Add Isolator button/////////////////////
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FloatingActionButton.extended(
                                      heroTag: 'addIso',
                                      onPressed: () async {
                                        // loading to fetch details from remote server
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          },
                                        );
                                        await load_Inventry_User();

                                        // pop loading function
                                        Navigator.of(context).pop();

                                        Navigator.pushNamed(context, '/add_ISO',
                                            arguments: {
                                              'trNo': ntr.trNo,
                                              'trId': ntr.id,
                                              'trDatabaseID': ntr.databaseID,
                                            });
                                      },
                                      label: const Text('Add Isolater',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      icon: const Icon(Icons.add,
                                          color: Colors.white),
                                    ),
                                  ),

                                  ///////////////////////Add Surge Counter button/////////////////////
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FloatingActionButton.extended(
                                      heroTag: 'addSC',
                                      onPressed: () async {
                                        // loading to fetch details from remote server
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          },
                                        );
                                        await load_Inventry_User();

                                        // pop loading function
                                        Navigator.of(context).pop();

                                        Navigator.pushNamed(context, '/add_SC',
                                            arguments: {
                                              'trNo': ntr.trNo,
                                              'trId': ntr.id,
                                              'trDatabaseID': ntr.databaseID,
                                            });
                                      },
                                      label: const Text('Add Surge Counter',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      icon: const Icon(Icons.add,
                                          color: Colors.white),
                                    ),
                                  ),

                                  ///////////////////////Add Earth Electrode button/////////////////////
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FloatingActionButton.extended(
                                      heroTag: 'addEE',
                                      onPressed: () async {
                                        // loading to fetch details from remote server
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          },
                                        );
                                        await load_Inventry_User();

                                        // pop loading function
                                        Navigator.of(context).pop();

                                        Navigator.pushNamed(context, '/add_EE',
                                            arguments: {
                                              'trNo': ntr.trNo,
                                              'trId': ntr.id,
                                              'trDatabaseID': ntr.databaseID,
                                            });
                                      },
                                      label: const Text('Add Earth Electrode',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      icon: const Icon(Icons.add,
                                          color: Colors.white),
                                    ),
                                  ),
                                  ///////////////////////Add power Cable button/////////////////////
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FloatingActionButton.extended(
                                      heroTag: 'addPc',
                                      onPressed: () async {
                                        // loading to fetch details from remote server
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          },
                                        );
                                        await load_Inventry_User();

                                        // pop loading function
                                        Navigator.of(context).pop();

                                        Navigator.pushNamed(context, '/add_PC',
                                            arguments: {
                                              'trNo': ntr.trNo,
                                              'trId': ntr.id,
                                              'trDatabaseID': ntr.databaseID,
                                            });
                                      },
                                      label: const Text('Add Power Cable',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      icon: const Icon(Icons.add,
                                          color: Colors.white),
                                    ),
                                  ),
                                  ///////////////////////Add Busbar button/////////////////////
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FloatingActionButton.extended(
                                      heroTag: 'addBB',
                                      onPressed: () async {
                                        // loading to fetch details from remote server
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          },
                                        );
                                        await load_Inventry_User();

                                        // pop loading function
                                        Navigator.of(context).pop();
                                        Navigator.pushNamed(context, '/add_BB',
                                            arguments: {
                                              'trNo': ntr.trNo,
                                              'trId': ntr.id,
                                              'trDatabaseID': ntr.databaseID,
                                            });
                                      },
                                      label: const Text('Add Busbar',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      icon: const Icon(Icons.add,
                                          color: Colors.white),
                                    ),
                                  ),
                                  ///////////////////////Add Diesel Generator button/////////////////////

                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FloatingActionButton.extended(
                                      heroTag: 'addDG',
                                      onPressed: () async {
                                        // loading to fetch details from remote server
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          },
                                        );
                                        await load_Inventry_User();

                                        // pop loading function
                                        Navigator.of(context).pop();
                                        Navigator.pushNamed(context, '/add_DG',
                                            arguments: {
                                              'trNo': ntr.trNo,
                                              'trId': ntr.id,
                                              'trDatabaseID': ntr.databaseID,
                                            });
                                      },
                                      label: const Text('Add Diesel Generator',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      icon: const Icon(Icons.add,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> load_Inventry_User() async {
    TestedByUser().getTestByUsertoDefaultValue();
    VerifiedByUser().getTestByUsertoDefaultValue();
    vcb_ocb_sfe_RSV().getRSVtoDefaultValue();
    no_of_poles_drop().get_No_Of_Poles_Default_value();
    yom_drop().get_YOM_Default_value();
    make_drop_lits().get_Make_Default_value();
    Location_dropDown().get_selectedValueLocation_Default_value();
    EquipmentTypeList().getEquipUsetoDefaultValue();
    connectedTapRadio().get_connectedTapRadio_default_value();
    bbetype_drop_lits().get_etype_Default_value();
    vectorGroup2typePOWT3W().get_vector_Default_value();
    vectorGroup6typePOWT().get_vector_Default_value();
    vectorGroupForAT().get_vector_Default_value();
    ItvectorGroup().get_vector_Default_value();
    HVLV().get_HVLV_default_value();
    core_Name_drop().get_CoreName_Default_value();
    vk_value_drop().get_vk_value_Default_value();
    efeletype_drop_lits().get_etype_Default_value();
  }

//////////////////////////////////////////MAIN-CONTENT-END-HERE/////////////////////////
  void _showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Column(children: [
            Expanded(
                child: AlertDialog(
              title: const Text('Alert'),
              content: const Text('Do you want to delete?'),
              actions: [
                TextButton(
                    onPressed: () {
                      getX((TestReportsProvider x) => x.deleteReport(id));
                      //watchOnly((TestReportsProvider x) => {});
                      Navigator.pop(context);
                      Navigator.popAndPushNamed(context, "/");
                    },
                    child: const Text('YES',
                        style: TextStyle(color: Colors.black))),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('NO',
                        style: const TextStyle(color: Colors.black))),
              ],
            )),
          ]);
        });
  }

  generate_list_of_ACB(TestReportModel ntr) {
    getX((AcbProvider x) => x.getAcbByTrNo(ntr.trNo));
    final List<AcbModel> reports = watchOnly((AcbProvider x) => x.acbTrnoList);

    getX((AcbProvider x) => x.getAcbLocalData());
    final List<AcbModel> reportsFormLocalData =
        watchOnly((AcbProvider x) => x.acblocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgs =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    return Card(
      color: Colors.grey[50],
      elevation: 0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return GestureDetector(
            onTap: () async {
              DataConnectionStatus status = await CheckInternet();

              if (status == DataConnectionStatus.connected) {
                for (var i in reportsFormLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      tempvar = i.trNo;
                      print(tempvar);

                      for (var q in reportsForArgs) {
                        if (q.trNo == tempvar) {
                          var argsDatabaseID = q.databaseID;
                          print(argsDatabaseID);

                          var url = Uri.parse('${Env.URL_PREFIX}/equipment/');
                          var response = await http.post(url, body: {
                            'trNo': argsDatabaseID.toString(),
                            'etype': i.etype.toString(),
                            'designation': i.designation.toString(),
                            'location': i.location.toString(),
                            'serialNo': i.serialNo.toString(),
                            'make': i.make.toString(),
                            'type': i.type.toString(),
                            'ratedSysCur': i.ratedSystemCurrent.toString(),
                            'ratedSysVol': i.ratedSystemVoltage.toString(),
                            'yom': i.yom.toString(),
                            'noOfPoles': i.noOfPoles.toString(),
                            'panel': i.panel.toString(),
                            'iecStandard': i.iecStandard.toString(),
                            'testedBy': i.TestedBy.toString(),
                            'verifiedBy': i.VerifiedBy.toString(),
                            'WitnessedBy': i.WitnessedBy.toString(),
                            'motarVoltage': i.motorVoltage.toString(),
                            'closeCoilTripVolt': i.closeCoilTripVolt.toString(),
                            'dateOfTesting': i.dateOfTesting.toString(),
                            'DueDateOfTesting': i.dueDateOfTesting.toString(),
                          }, headers: {
                            'Authorization': 'Bearer $acc_token',
                          }).then((value) {
                            sl<AcbProvider>().updateACB(
                                AcbModel(
                                  id: i.id,
                                  databaseID: json.decode(value.body)['id'],
                                  etype: i.etype,
                                  dateOfTesting: i.dateOfTesting,
                                  designation: i.designation,
                                  location: i.location,
                                  panel: i.panel,
                                  serialNo: i.serialNo,
                                  make: i.make,
                                  type: i.type,
                                  ratedSystemCurrent: i.ratedSystemCurrent,
                                  ratedSystemVoltage: i.ratedSystemVoltage,
                                  yom: i.yom,
                                  dueDateOfTesting: i.dueDateOfTesting,
                                  noOfPoles: i.noOfPoles,
                                  iecStandard: i.iecStandard,
                                  trNo: i.trNo,
                                  TestedBy: i.TestedBy,
                                  VerifiedBy: i.VerifiedBy,
                                  WitnessedBy: i.WitnessedBy,
                                  lastUpdated: DateTime.now(),
                                  motorVoltage: i.motorVoltage,
                                  closeCoilTripVolt: i.closeCoilTripVolt,
                                ),
                                i.id);

                            print('Response status: ${value.statusCode}');
                            print('Response body: ${value.body}');
                            print('Stored successfully');
                          });
                        }
                      }
                    }
                  }
                }
                Navigator.pushNamed(context, '/detail_ACB', arguments: {
                  'id': report.id,
                  'trDatabaseID': ntr.databaseID
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_ACB', arguments: {
                  'id': report.id,
                  'trDatabaseID': ntr.databaseID
                });
              }
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                children: [
                  Card(
                    elevation: 5,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 50, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          report.databaseID == 0
                              ? Row(
                                  children: [
                                    Icon(
                                      Icons.replay_circle_filled_rounded,
                                      color: Color.fromARGB(255, 188, 24, 13),
                                      size: 15.0,
                                    ),
                                    Text(
                                      '  ' + report.etype + ' details',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
                                    ),
                                  ],
                                )
                              : Row(
                                  children: [
                                    Icon(
                                      Icons.circle_rounded,
                                      color: Color.fromARGB(255, 9, 230, 9),
                                      size: 10.0,
                                    ),
                                    Text(
                                      '  ' + report.etype + ' details',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
                                    ),
                                  ],
                                ),
                          Text('DBID No : ' + report.databaseID.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  letterSpacing: 1)),
                          Text('Test Report No : ' + report.trNo.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  letterSpacing: 1)),
                          Text('Designation : ' + report.designation.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  letterSpacing: 1)),
                          Text('Location : ' + report.location.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  letterSpacing: 1)),
                          Text('Serial_No : ' + report.serialNo.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  letterSpacing: 1)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  generate_list_of_EM(TestReportModel ntr) {
    getX((EnergyMeterProvider x) => x.getEnergyMeterByTrNo(ntr.trNo));
    final List<EnergyMeterModel> reports =
        watchOnly((EnergyMeterProvider x) => x.energymeterTrnoList);

    getX((EnergyMeterProvider x) => x.getEMLocalData());
    final List<EnergyMeterModel> reportsFormLocalData =
        watchOnly((EnergyMeterProvider x) => x.emloacaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgs =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    return Card(
      color: Colors.grey[50],
      elevation: 0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: reports.length,
          itemBuilder: (context, index) {
            final report = reports[index];
            return GestureDetector(
              onTap: () async {
                DataConnectionStatus status = await CheckInternet();
                if (status == DataConnectionStatus.connected) {
                  for (var i in reportsFormLocalData) {
                    if (i.id == report.id) {
                      if (report.databaseID == 0 || i.databaseID == 0) {
                        tempvar = i.trNo;
                        print(tempvar);

                        for (var q in reportsForArgs) {
                          if (q.trNo == tempvar) {
                            var argsDatabaseID = q.databaseID;
                            print(argsDatabaseID);

                            // add to remote database
                            var url = Uri.parse(
                                '${Env.URL_PREFIX}/energyMeterEquipment/');
                            var response = await http.post(url, body: {
                              'trNo': argsDatabaseID.toString(),
                              'etype': i.etype.toString(),
                              'designation': i.designation.toString(),
                              'location': i.location.toString(),
                              'serialNo': i.serialNo.toString(),
                              'make': i.make.toString(),
                              'eqClass': i.eqClass.toString(),
                              'frequency': i.frequency.toString(),
                              'voltage': i.voltage.toString(),
                              'panel': i.panel.toString(),
                              'testedBy': i.TestedBy.toString(),
                              'verifiedBy': i.VerifiedBy.toString(),
                              'WitnessedBy': i.WitnessedBy.toString(),
                              'ctr': i.ctr.toString(),
                              'ptr': i.ptr.toString(),
                              'dateOfTesting': i.dateOfTesting.toString(),
                            }, headers: {
                              'Authorization': 'Bearer $acc_token',
                            }).then((value) {
                              sl<EnergyMeterProvider>().updateEnergyMeter(
                                  EnergyMeterModel(
                                    id: i.id,
                                    trNo: i.trNo,
                                    etype: i.etype,
                                    designation: i.designation,
                                    location: i.location,
                                    panel: i.panel,
                                    serialNo: i.serialNo,
                                    make: i.make,
                                    eqClass: i.eqClass,
                                    frequency: i.frequency,
                                    voltage: i.voltage,
                                    dateOfTesting: i.dateOfTesting,
                                    TestedBy: i.TestedBy,
                                    VerifiedBy: i.VerifiedBy,
                                    WitnessedBy: i.WitnessedBy,
                                    ctr: i.ctr,
                                    ptr: i.ptr,
                                    databaseID: json.decode(value.body)['id'],
                                    updateDate: DateTime.now(),
                                  ),
                                  report.id);
                              print('Response status: ${value.statusCode}');
                              print('Response body: ${value.body}');
                              print('Stored successfully');
                            });
                          }
                        }
                      }
                    }
                  }
                  Navigator.pushNamed(context, '/detail_EM', arguments: {
                    'id': report.id,
                    'trDatabaseID': ntr.databaseID
                  });
                } else if (status == DataConnectionStatus.disconnected) {
                  Navigator.pushNamed(context, '/detail_EM', arguments: {
                    'id': report.id,
                    'trDatabaseID': ntr.databaseID
                  });
                }
                // -------------------------------------------------
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    Card(
                      elevation: 5,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            report.databaseID == 0
                                ? Row(
                                    children: [
                                      Icon(
                                        Icons.replay_circle_filled_rounded,
                                        color: Color.fromARGB(255, 188, 24, 13),
                                        size: 15.0,
                                      ),
                                      Text(
                                        '  ' + report.etype + ' details',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Icon(
                                        Icons.circle_rounded,
                                        color: Color.fromARGB(255, 9, 230, 9),
                                        size: 10.0,
                                      ),
                                      Text(
                                        '  ' + report.etype + ' details',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ],
                                  ),
                            Text('DBID No : ' + report.databaseID.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Test Report No : ' + report.trNo.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text(
                                'Designation : ' +
                                    report.designation.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Location : ' + report.location.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Serial_No : ' + report.serialNo.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  generate_CT(TestReportModel ntr) {
    getX((CTProvider x) => x.getCTByTrNo(ntr.trNo));
    final List<CTModel> reports = watchOnly((CTProvider x) => x.ctTrnoList);

    getX((CTProvider x) => x.getCTLocalData());
    final List<CTModel> reportsFormLocalData =
        watchOnly((CTProvider x) => x.ctlocaldataist);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgs =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    return Card(
      color: Colors.grey[50],
      elevation: 0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: reports.length,
          itemBuilder: (context, index) {
            final report = reports[index];
            return GestureDetector(
              onTap: () async {
                DataConnectionStatus status = await CheckInternet();
                if (status == DataConnectionStatus.connected) {
                  for (var i in reportsFormLocalData) {
                    if (i.id == report.id) {
                      if (report.databaseID == 0 || i.databaseID == 0) {
                        tempvar = i.trNo;
                        print(tempvar);

                        for (var q in reportsForArgs) {
                          if (q.trNo == tempvar) {
                            var argsDatabaseID = q.databaseID;
                            print(argsDatabaseID);

                            // add to remote database
                            var url = Uri.parse('${Env.URL_PREFIX}/ctEquip/');
                            var response = await http.post(url, body: {
                              'trNo': argsDatabaseID.toString(),
                              'etype': i.etype.toString(),
                              'designation': i.designation.toString(),
                              'location': i.location.toString(),
                              'make': i.make.toString(),
                              'panel': i.panel.toString(),
                              'serialNo_Rph': i.serialNo_Rph.toString(),
                              'serialNo_Yph': i.serialNo_Yph.toString(),
                              'serialNo_Bph': i.serialNo_Bph.toString(),
                              'pRatio': i.pRatio.toString(),
                              'sRatio': i.sRatio.toString(),
                              'noOfCores': i.noOfCores.toString(),
                              'noOfTaps': i.noOfTaps.toString(),
                              'yom': i.yom.toString(),
                              'testedBy': i.testedBy.toString(),
                              'verifiedBy': i.verifiedBy.toString(),
                              'WitnessedBy': i.WitnessedBy.toString(),
                              'ratedVoltage': i.ratedVoltage.toString(),
                              'dateOfTesting': i.dateOfTesting.toString(),
                              'connectedTap': i.connectedTap.toString(),
                              'vk': i.vk.toString(),
                            }, headers: {
                              'Authorization': 'Bearer $acc_token',
                            }).then((value) {
                              sl<CTProvider>().updateCT(
                                  CTModel(
                                    id: i.id,
                                    trNo: i.trNo,
                                    etype: i.etype,
                                    designation: i.designation,
                                    location: i.location,
                                    panel: i.panel,
                                    make: i.make,
                                    serialNo_Rph: i.serialNo_Rph,
                                    serialNo_Yph: i.serialNo_Yph,
                                    serialNo_Bph: i.serialNo_Bph,
                                    pRatio: i.pRatio,
                                    sRatio: i.sRatio,
                                    noOfCores: i.noOfCores,
                                    noOfTaps: i.noOfTaps,
                                    yom: i.yom,
                                    dateOfTesting: i.dateOfTesting,
                                    testedBy: i.testedBy,
                                    verifiedBy: i.verifiedBy,
                                    WitnessedBy: i.WitnessedBy,
                                    databaseID: json.decode(value.body)['id'],
                                    ratedVoltage: i.ratedVoltage,
                                    vk: i.vk,
                                    connectedTap: i.connectedTap,
                                    updateDate: DateTime.now(),
                                  ),
                                  report.id);
                              print('Response status: ${value.statusCode}');
                              print('Response body: ${value.body}');
                              print('Stored successfully');
                            });
                          }
                        }
                      }
                    }
                  }

                  Navigator.pushNamed(context, '/detail_CT', arguments: {
                    'id': report.id,
                    'trDatabaseID': ntr.databaseID
                  });
                } else if (status == DataConnectionStatus.disconnected) {
                  Navigator.pushNamed(context, '/detail_CT', arguments: {
                    'id': report.id,
                    'trDatabaseID': ntr.databaseID
                  });
                }
                // ------------------------------------------
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    Card(
                      elevation: 5,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 40, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            report.databaseID == 0
                                ? Row(
                                    children: [
                                      Icon(
                                        Icons.replay_circle_filled_rounded,
                                        color: Color.fromARGB(255, 188, 24, 13),
                                        size: 15.0,
                                      ),
                                      Text(
                                        '  ' + report.etype + ' details',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Icon(
                                        Icons.circle_rounded,
                                        color: Color.fromARGB(255, 9, 230, 9),
                                        size: 10.0,
                                      ),
                                      Text(
                                        '  ' + report.etype + ' details',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ],
                                  ),
                            Text('DBID No : ' + report.databaseID.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Test Report No : ' + report.trNo.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text(
                                'Designation : ' +
                                    report.designation.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Location : ' + report.location.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text(
                                'SerialNo_Bph : ' +
                                    report.serialNo_Bph.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  generate_PT(TestReportModel ntr) {
    getX((PTProvider x) => x.getPTByTrNo(ntr.trNo));
    final List<PTModel> reports = watchOnly((PTProvider x) => x.ptTrnoList);

    getX((PTProvider x) => x.getPTLocalData());
    final List<PTModel> reportsFormLocalData =
        watchOnly((PTProvider x) => x.ptlocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgs =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    return Card(
      color: Colors.grey[50],
      elevation: 0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: reports.length,
          itemBuilder: (context, index) {
            final report = reports[index];
            return GestureDetector(
              onTap: () async {
                DataConnectionStatus status = await CheckInternet();
                if (status == DataConnectionStatus.connected) {
                  for (var i in reportsFormLocalData) {
                    if (i.id == report.id) {
                      if (report.databaseID == 0 || i.databaseID == 0) {
                        tempvar = i.trNo;
                        print(tempvar);

                        for (var q in reportsForArgs) {
                          if (q.trNo == tempvar) {
                            var argsDatabaseID = q.databaseID;
                            print(argsDatabaseID);

                            // add to remote database
                            var url = Uri.parse('${Env.URL_PREFIX}/ptEquip/');
                            var response = await http.post(url, body: {
                              'trNo': argsDatabaseID.toString(),
                              'etype': i.etype.toString(),
                              'designation': i.designation.toString(),
                              'location': i.location.toString(),
                              'make': i.make.toString(),
                              'panel': i.panel.toString(),
                              'serialNo_Rph': i.serialNo_Rph.toString(),
                              'serialNo_Yph': i.serialNo_Yph.toString(),
                              'serialNo_Bph': i.serialNo_Bph.toString(),
                              'pRatio': i.pRatio.toString(),
                              'sRatio': i.sRatio.toString(),
                              'noOfCores': i.noOfCores.toString(),
                              'yom': i.yom.toString(),
                              'testedBy': i.testedBy.toString(),
                              'verifiedBy': i.verifiedBy.toString(),
                              'WitnessedBy': i.WitnessedBy.toString(),
                              'ratedVoltage': i.ratedVoltage.toString(),
                              'dateOfTesting': i.dateOfTesting.toString(),
                            }, headers: {
                              'Authorization': 'Bearer $acc_token',
                            }).then((value) {
                              sl<PTProvider>().updatePT(
                                  PTModel(
                                    id: i.id,
                                    trNo: i.trNo,
                                    etype: i.etype,
                                    designation: i.designation,
                                    location: i.location,
                                    panel: i.panel,
                                    make: i.make,
                                    serialNo_Rph: i.serialNo_Rph,
                                    serialNo_Yph: i.serialNo_Yph,
                                    serialNo_Bph: i.serialNo_Bph,
                                    pRatio: i.pRatio,
                                    sRatio: i.sRatio,
                                    noOfCores: i.noOfCores,
                                    yom: i.yom,
                                    dateOfTesting: i.dateOfTesting,
                                    testedBy: i.testedBy,
                                    verifiedBy: i.verifiedBy,
                                    WitnessedBy: i.WitnessedBy,
                                    databaseID: json.decode(value.body)['id'],
                                    ratedVoltage: i.ratedVoltage,
                                    updateDate: DateTime.now(),
                                  ),
                                  report.id);
                              print('Response status: ${value.statusCode}');
                              print('Response body: ${value.body}');
                              print('Stored successfully');
                            });
                          }
                        }
                      }
                    }
                  }
                  Navigator.pushNamed(context, '/detail_PT', arguments: {
                    'id': report.id,
                    'trDatabaseID': ntr.databaseID
                  });
                } else if (status == DataConnectionStatus.disconnected) {
                  Navigator.pushNamed(context, '/detail_PT', arguments: {
                    'id': report.id,
                    'trDatabaseID': ntr.databaseID
                  });
                }
                // --------------------------------------------------
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    Card(
                      elevation: 5,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 40, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            report.databaseID == 0
                                ? Row(
                                    children: [
                                      Icon(
                                        Icons.replay_circle_filled_rounded,
                                        color: Color.fromARGB(255, 188, 24, 13),
                                        size: 15.0,
                                      ),
                                      Text(
                                        '  ' + report.etype + ' details',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Icon(
                                        Icons.circle_rounded,
                                        color: Color.fromARGB(255, 9, 230, 9),
                                        size: 10.0,
                                      ),
                                      Text(
                                        '  ' + report.etype + ' details',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ],
                                  ),
                            Text('DBID No : ' + report.databaseID.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Test Report No : ' + report.trNo.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text(
                                'Designation : ' +
                                    report.designation.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Location : ' + report.location.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text(
                                'SerialNo_Bph : ' +
                                    report.serialNo_Bph.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  generate_AT(TestReportModel ntr) {
    getX((ATProvider x) => x.getATByTrNo(ntr.trNo));
    final List<ATModel> reports = watchOnly((ATProvider x) => x.atTrnoList);

    getX((ATProvider x) => x.getATLocalData());
    final List<ATModel> reportsFormLocalData =
        watchOnly((ATProvider x) => x.atlocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgs =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    return Card(
      color: Colors.grey[50],
      elevation: 0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: reports.length,
          itemBuilder: (context, index) {
            final report = reports[index];
            return GestureDetector(
              onTap: () async {
                DataConnectionStatus status = await CheckInternet();

                if (status == DataConnectionStatus.connected) {
                  for (var i in reportsFormLocalData) {
                    if (i.id == report.id) {
                      if (report.databaseID == 0 || i.databaseID == 0) {
                        tempvar = i.trNo;
                        print(tempvar);
                        for (var q in reportsForArgs) {
                          if (q.trNo == tempvar) {
                            var argsDatabaseID = q.databaseID;
                            print(argsDatabaseID);

                            // add to remote database
                            var url = Uri.parse('${Env.URL_PREFIX}/atEquip/');
                            var response = await http.post(url, body: {
                              'trNo': argsDatabaseID.toString(),
                              'etype': i.etype.toString(),
                              'designation': i.designation.toString(),
                              'location': i.location.toString(),
                              'make': i.make.toString(),
                              'serialNo': i.serialNo.toString(),
                              'rating': i.rating.toString(),
                              'ratedVoltage_HV': i.ratedVoltage_HV.toString(),
                              'ratedVoltage_LV': i.ratedVoltage_LV.toString(),
                              'ratedCurrent_HV': i.ratedCurrent_HV.toString(),
                              'ratedCurrent_LV': i.ratedCurrent_LV.toString(),
                              'vectorGroup': i.vectorGroup.toString(),
                              'impedanceVoltage': i.impedanceVoltage.toString(),
                              'frequency': i.frequency.toString(),
                              'typeOfCooling': i.typeOfCooling.toString(),
                              'noOfPhases': i.noOfPhases.toString(),
                              'noOfTaps': i.noOfTaps.toString(),
                              'onOfNominalTaps': i.onOfNominalTaps.toString(),
                              'yom': i.yom.toString(),
                              'dateOfTesting': i.dateOfTesting.toString(),
                              'testedBy': i.testedBy.toString(),
                              'verifiedBy': i.verifiedBy.toString(),
                              'WitnessedBy': i.WitnessedBy.toString(),
                            }, headers: {
                              'Authorization': 'Bearer $acc_token',
                            }).then((value) {
                              sl<ATProvider>().updateAT(
                                  ATModel(
                                    id: i.id,
                                    trNo: i.trNo,
                                    etype: i.etype,
                                    designation: i.designation,
                                    location: i.location,
                                    make: i.make,
                                    serialNo: i.serialNo,
                                    rating: i.rating,
                                    ratedVoltage_HV: i.ratedVoltage_HV,
                                    ratedVoltage_LV: i.ratedVoltage_LV,
                                    ratedCurrent_HV: i.ratedCurrent_HV,
                                    ratedCurrent_LV: i.ratedCurrent_LV,
                                    vectorGroup: i.vectorGroup,
                                    impedanceVoltage: i.impedanceVoltage,
                                    frequency: i.frequency,
                                    typeOfCooling: i.typeOfCooling,
                                    noOfPhases: i.noOfPhases,
                                    noOfTaps: i.noOfTaps,
                                    onOfNominalTaps: i.onOfNominalTaps,
                                    yom: i.yom,
                                    dateOfTesting: i.dateOfTesting,
                                    testedBy: i.testedBy,
                                    verifiedBy: i.verifiedBy,
                                    WitnessedBy: i.WitnessedBy,
                                    databaseID: json.decode(value.body)['id'],
                                    updateDate: DateTime.now(),
                                  ),
                                  report.id);
                              print('Response status: ${value.statusCode}');
                              print('Response body: ${value.body}');
                              print('Stored successfully');
                            });
                          }
                        }
                      }
                    }
                  }
                  Navigator.pushNamed(context, '/detail_AT', arguments: {
                    'id': report.id,
                    'trDatabaseID': ntr.databaseID
                  });
                } else if (status == DataConnectionStatus.disconnected) {
                  Navigator.pushNamed(context, '/detail_AT', arguments: {
                    'id': report.id,
                    'trDatabaseID': ntr.databaseID
                  });
                }
                // -----------------------------------
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    Card(
                      elevation: 5,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 40, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            report.databaseID == 0
                                ? Row(
                                    children: [
                                      Icon(
                                        Icons.replay_circle_filled_rounded,
                                        color: Color.fromARGB(255, 188, 24, 13),
                                        size: 15.0,
                                      ),
                                      Text(
                                        '  ' + report.etype + ' details',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Icon(
                                        Icons.circle_rounded,
                                        color: Color.fromARGB(255, 9, 230, 9),
                                        size: 10.0,
                                      ),
                                      Text(
                                        '  ' + report.etype + ' details',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ],
                                  ),
                            Text('DBID No : ' + report.databaseID.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Test Report No : ' + report.trNo.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text(
                                'Designation : ' +
                                    report.designation.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Location : ' + report.location.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('SerialNo : ' + report.serialNo.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  generate_POWT(TestReportModel ntr) {
    getX((PowtProvider x) => x.getPowtByTrNo(ntr.trNo));
    final List<PowtModel> reports =
        watchOnly((PowtProvider x) => x.powtTrnoList);

    getX((PowtProvider x) => x.getPowtLocalData());
    final List<PowtModel> reportsFormLocalData =
        watchOnly((PowtProvider x) => x.powtlocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgs =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    return Card(
      color: Colors.grey[50],
      elevation: 0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return GestureDetector(
            onTap: () async {
              DataConnectionStatus status = await CheckInternet();
              if (status == DataConnectionStatus.connected) {
                for (var i in reportsFormLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      tempvar = i.trNo;
                      print(tempvar);
                      // json.decode(response.body)['id'],

                      for (var q in reportsForArgs) {
                        if (q.trNo == tempvar) {
                          var argsDatabaseID = q.databaseID;
                          print(argsDatabaseID);

                          // add to remote database
                          var url = Uri.parse('${Env.URL_PREFIX}/powtEquip/');
                          var response = await http.post(url, body: {
                            'trNo': argsDatabaseID.toString(),
                            'etype': i.etype.toString(),
                            'designation': i.designation.toString(),
                            'location': i.location.toString(),
                            'serialNo': i.serialNo.toString(),
                            'rating': i.rating.toString(),
                            'ratedVoltage_HV': i.ratedVoltage_HV.toString(),
                            'ratedVoltage_LV': i.ratedVoltage_LV.toString(),
                            'ratedCurrent_HV': i.ratedCurrent_HV.toString(),
                            'ratedCurrent_LV': i.ratedCurrent_LV.toString(),
                            'vectorGroup': i.vectorGroup.toString(),
                            'impedanceVoltageLTap':
                                i.impedanceVoltageLTap.toString(),
                            'impedanceVoltageRTap':
                                i.impedanceVoltageRTap.toString(),
                            'impedanceVoltageHTap':
                                i.impedanceVoltageHTap.toString(),
                            'frequency': i.frequency.toString(),
                            'typeOfCooling': i.typeOfCooling.toString(),
                            'noOfPhases': i.noOfPhases.toString(),
                            'make': i.make.toString(),
                            'yom': i.yom.toString(),
                            'noOfTaps': i.noOfTaps.toString(),
                            'onOfNominalTaps': i.onOfNominalTaps.toString(),
                            'oilTemp': i.oilTemp.toString(),
                            'windingTemp': i.windingTemp.toString(),
                            'ambientTemp': i.ambientTemp.toString(),
                            'dateOfTesting': i.dateOfTesting.toString(),
                            'testedBy': i.testedBy.toString(),
                            'verifiedBy': i.verifiedBy.toString(),
                            'WitnessedBy': i.WitnessedBy.toString(),
                          }, headers: {
                            'Authorization': 'Bearer $acc_token',
                          }).then((value) {
                            sl<PowtProvider>().updatePowt(
                                PowtModel(
                                  id: i.id,
                                  trNo: i.trNo,
                                  etype: i.etype,
                                  designation: i.designation,
                                  location: i.location,
                                  serialNo: i.serialNo,
                                  rating: i.rating,
                                  ratedVoltage_HV: i.ratedVoltage_HV,
                                  ratedVoltage_LV: i.ratedVoltage_LV,
                                  ratedCurrent_HV: i.ratedCurrent_HV,
                                  ratedCurrent_LV: i.ratedCurrent_LV,
                                  vectorGroup: i.vectorGroup,
                                  impedanceVoltageLTap: i.impedanceVoltageLTap,
                                  impedanceVoltageRTap: i.impedanceVoltageRTap,
                                  impedanceVoltageHTap: i.impedanceVoltageHTap,
                                  frequency: i.frequency,
                                  typeOfCooling: i.typeOfCooling,
                                  noOfPhases: i.noOfPhases,
                                  make: i.make,
                                  yom: i.yom,
                                  noOfTaps: i.noOfTaps,
                                  onOfNominalTaps: i.onOfNominalTaps,
                                  oilTemp: i.oilTemp,
                                  windingTemp: i.windingTemp,
                                  ambientTemp: i.ambientTemp,
                                  dateOfTesting: i.dateOfTesting,
                                  testedBy: i.testedBy,
                                  verifiedBy: i.verifiedBy,
                                  WitnessedBy: i.WitnessedBy,
                                  databaseID: json.decode(value.body)['id'],
                                  updateDate: DateTime.now(),
                                ),
                                report.id);
                            print('Response status: ${value.statusCode}');
                            print('Response body: ${value.body}');
                            print('Stored successfully');
                          });
                        }
                      }
                    }
                  }
                }

                Navigator.pushNamed(context, '/detail_POWT', arguments: {
                  'id': report.id,
                  'trDatabaseID': ntr.databaseID,
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_POWT', arguments: {
                  'id': report.id,
                  'trDatabaseID': ntr.databaseID,
                });
              }
              // ------------------------------------------------
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Card(
                    elevation: 5,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 40, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          report.databaseID == 0
                              ? Row(
                                  children: [
                                    Icon(
                                      Icons.replay_circle_filled_rounded,
                                      color: Color.fromARGB(255, 188, 24, 13),
                                      size: 15.0,
                                    ),
                                    Text(
                                      '  ' + report.etype + ' details',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
                                    ),
                                  ],
                                )
                              : Row(
                                  children: [
                                    Icon(
                                      Icons.circle_rounded,
                                      color: Color.fromARGB(255, 9, 230, 9),
                                      size: 10.0,
                                    ),
                                    Text(
                                      '  ' + report.etype + ' details',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
                                    ),
                                  ],
                                ),
                          Text('DBID No : ' + report.databaseID.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  letterSpacing: 1)),
                          Text('Test Report No : ' + report.trNo.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  letterSpacing: 1)),
                          Text('Designation : ' + report.designation.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  letterSpacing: 1)),
                          Text('Location : ' + report.location.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  letterSpacing: 1)),
                          Text('SerialNo : ' + report.serialNo.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  letterSpacing: 1)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  generate_list_of_Iso(TestReportModel ntr) {
    getX((IsoProvider x) => x.getIsoByTrNo(ntr.trNo));
    final List<IsoModel> reports = watchOnly((IsoProvider x) => x.isoTrnoList);

    getX((IsoProvider x) => x.getISOLocalData());
    final List<IsoModel> reportsFormLocalData =
        watchOnly((IsoProvider x) => x.isolocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgs =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    return Card(
      color: Colors.grey[50],
      elevation: 0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: reports.length,
          itemBuilder: (context, index) {
            final report = reports[index];
            return GestureDetector(
              onTap: () async {
                DataConnectionStatus status = await CheckInternet();
                if (status == DataConnectionStatus.connected) {
                  for (var i in reportsFormLocalData) {
                    if (i.id == report.id) {
                      if (report.databaseID == 0 || i.databaseID == 0) {
                        tempvar = i.trNo;
                        print(tempvar);

                        for (var q in reportsForArgs) {
                          if (q.trNo == tempvar) {
                            var argsDatabaseID = q.databaseID;
                            print(argsDatabaseID);

                            // add to remote database
                            var url = Uri.parse('${Env.URL_PREFIX}/isoEquip/');
                            var response = await http.post(url, body: {
                              'trNo': argsDatabaseID.toString(),
                              'etype': i.etype.toString(),
                              'designation': i.designation.toString(),
                              'location': i.location.toString(),
                              'serialNo': i.serialNo.toString(),
                              'make': i.make.toString(),
                              'equipType': i.equipType.toString(),
                              'yom': i.yom.toString(),
                              'rating': i.rating.toString(),
                              'testedBy': i.TestedBy.toString(),
                              'verifiedBy': i.VerifiedBy.toString(),
                              'WitnessedBy': i.WitnessedBy.toString(),
                              'dateOfTesting': i.dateOfTesting.toString(),
                            }, headers: {
                              'Authorization': 'Bearer $acc_token',
                            }).then((value) {
                              sl<IsoProvider>().updateIso(
                                  IsoModel(
                                    id: i.id,
                                    trNo: i.trNo,
                                    etype: i.etype,
                                    designation: i.designation,
                                    location: i.location,
                                    rating: i.rating,
                                    serialNo: i.serialNo,
                                    make: i.make,
                                    equipType: i.equipType,
                                    yom: i.yom,
                                    dateOfTesting: i.dateOfTesting,
                                    TestedBy: i.TestedBy,
                                    VerifiedBy: i.VerifiedBy,
                                    WitnessedBy: i.WitnessedBy,
                                    databaseID: json.decode(value.body)['id'],
                                    lastUpdated: DateTime.now(),
                                  ),
                                  report.id);
                              print('Response status: ${value.statusCode}');
                              print('Response body: ${value.body}');
                              print('Stored successfully');
                            });
                          }
                        }
                      }
                    }
                  }

                  Navigator.pushNamed(context, '/detail_ISO', arguments: {
                    'id': report.id,
                    'trDatabaseID': ntr.databaseID,
                  });
                } else if (status == DataConnectionStatus.disconnected) {
                  Navigator.pushNamed(context, '/detail_ISO', arguments: {
                    'id': report.id,
                    'trDatabaseID': ntr.databaseID,
                  });
                }
                // ---------------------------------------------------
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    Card(
                      elevation: 5,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            report.databaseID == 0
                                ? Row(
                                    children: [
                                      Icon(
                                        Icons.replay_circle_filled_rounded,
                                        color: Color.fromARGB(255, 188, 24, 13),
                                        size: 15.0,
                                      ),
                                      Text(
                                        '  ' + report.etype + ' details',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Icon(
                                        Icons.circle_rounded,
                                        color: Color.fromARGB(255, 9, 230, 9),
                                        size: 10.0,
                                      ),
                                      Text(
                                        '  ' + report.etype + ' details',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ],
                                  ),
                            Text('DBID No : ' + report.databaseID.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Test Report No : ' + report.trNo.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text(
                                'Designation : ' +
                                    report.designation.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Location : ' + report.location.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Serial_No : ' + report.serialNo.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  generate_list_of_La(TestReportModel ntr) {
    getX((LaProvider x) => x.getLaByTrNo(ntr.trNo));
    final List<LaModel> reports = watchOnly((LaProvider x) => x.laTrnoList);

    getX((LaProvider x) => x.getLALocalData());
    final List<LaModel> reportsFormLocalData =
        watchOnly((LaProvider x) => x.lalocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgs =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    return Card(
      color: Colors.grey[50],
      elevation: 0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: reports.length,
          itemBuilder: (context, index) {
            final report = reports[index];
            return GestureDetector(
              onTap: () async {
                DataConnectionStatus status = await CheckInternet();
                if (status == DataConnectionStatus.connected) {
                  for (var i in reportsFormLocalData) {
                    if (i.id == report.id) {
                      if (report.databaseID == 0 || i.databaseID == 0) {
                        tempvar = i.trNo;
                        print(tempvar);

                        for (var q in reportsForArgs) {
                          if (q.trNo == tempvar) {
                            var argsDatabaseID = q.databaseID;
                            print(argsDatabaseID);

                            // add to remote database
                            var url = Uri.parse('${Env.URL_PREFIX}/laEquip/');
                            var response = await http.post(url, body: {
                              'trNo': argsDatabaseID.toString(),
                              'etype': i.etype.toString(),
                              'designation': i.designation.toString(),
                              'location': i.location.toString(),
                              'serialNo': i.serialNo.toString(),
                              'make': i.make.toString(),
                              'equipType': i.equipType.toString(),
                              'yom': i.yom.toString(),
                              'rating': i.rating.toString(),
                              'testedBy': i.TestedBy.toString(),
                              'verifiedBy': i.VerifiedBy.toString(),
                              'WitnessedBy': i.WitnessedBy.toString(),
                              'dateOfTesting': i.dateOfTesting.toString(),
                            }, headers: {
                              'Authorization': 'Bearer $acc_token',
                            }).then((value) {
                              sl<LaProvider>().updateLa(
                                  LaModel(
                                    id: i.id,
                                    trNo: i.trNo,
                                    etype: i.etype,
                                    designation: i.designation,
                                    location: i.location,
                                    rating: i.rating,
                                    serialNo: i.serialNo,
                                    make: i.make,
                                    equipType: i.equipType,
                                    yom: i.yom,
                                    dateOfTesting: i.dateOfTesting,
                                    TestedBy: i.TestedBy,
                                    VerifiedBy: i.VerifiedBy,
                                    WitnessedBy: i.WitnessedBy,
                                    databaseID: json.decode(value.body)['id'],
                                    lastUpdated: DateTime.now(),
                                  ),
                                  report.id);
                              print('Response status: ${value.statusCode}');
                              print('Response body: ${value.body}');
                              print('Stored successfully');
                            });
                          }
                        }
                      }
                    }
                  }
                  Navigator.pushNamed(context, '/detail_LA', arguments: {
                    'id': report.id,
                    'trDatabaseID': ntr.databaseID
                  });
                } else if (status == DataConnectionStatus.disconnected) {
                  Navigator.pushNamed(context, '/detail_LA', arguments: {
                    'id': report.id,
                    'trDatabaseID': ntr.databaseID
                  });
                }
                // -----------------------------------
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    Card(
                      elevation: 5,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            report.databaseID == 0
                                ? Row(
                                    children: [
                                      Icon(
                                        Icons.replay_circle_filled_rounded,
                                        color: Color.fromARGB(255, 188, 24, 13),
                                        size: 15.0,
                                      ),
                                      Text(
                                        '  ' + report.etype + ' details',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Icon(
                                        Icons.circle_rounded,
                                        color: Color.fromARGB(255, 9, 230, 9),
                                        size: 10.0,
                                      ),
                                      Text(
                                        '  ' + report.etype + ' details',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ],
                                  ),
                            Text('DBID No : ' + report.databaseID.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Test Report No : ' + report.trNo.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text(
                                'Designation : ' +
                                    report.designation.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Location : ' + report.location.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Serial_No : ' + report.serialNo.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  generate_list_of_PC(TestReportModel ntr) {
    getX((PcProvider x) => x.getPcByTrNo(ntr.trNo));
    final List<PcModel> reports = watchOnly((PcProvider x) => x.pcTrnoList);

    getX((PcProvider x) => x.getPCLocalData());
    final List<PcModel> reportsFormLocalData =
        watchOnly((PcProvider x) => x.pclocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgs =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    return Card(
      color: Colors.grey[50],
      elevation: 0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: reports.length,
          itemBuilder: (context, index) {
            final report = reports[index];
            return GestureDetector(
              onTap: () async {
                DataConnectionStatus status = await CheckInternet();
                if (status == DataConnectionStatus.connected) {
                  for (var i in reportsFormLocalData) {
                    if (i.id == report.id) {
                      if (report.databaseID == 0 || i.databaseID == 0) {
                        tempvar = i.trNo;
                        print(tempvar);

                        for (var q in reportsForArgs) {
                          if (q.trNo == tempvar) {
                            var argsDatabaseID = q.databaseID;
                            print(argsDatabaseID);

                            // add to remote database
                            var url = Uri.parse('${Env.URL_PREFIX}/pcEquip/');
                            var response = await http.post(url, body: {
                              'trNo': argsDatabaseID.toString(),
                              'etype': i.etype.toString(),
                              'designation': i.designation.toString(),
                              'location': i.location.toString(),
                              'panel': i.panel.toString(),
                              'make': i.make.toString(),
                              'size': i.size.toString(),
                              'length': i.length.toString(),
                              'rating': i.rating.toString(),
                              'testedBy': i.TestedBy.toString(),
                              'verifiedBy': i.VerifiedBy.toString(),
                              'WitnessedBy': i.WitnessedBy.toString(),
                              'dateOfTesting': i.dateOfTesting.toString(),
                            }, headers: {
                              'Authorization': 'Bearer $acc_token',
                            }).then((value) {
                              sl<PcProvider>().updatePc(
                                  PcModel(
                                    id: i.id,
                                    trNo: i.trNo,
                                    etype: i.etype,
                                    designation: i.designation,
                                    location: i.location,
                                    rating: i.rating,
                                    panel: i.panel,
                                    make: i.make,
                                    size: i.size,
                                    length: i.length,
                                    dateOfTesting: i.dateOfTesting,
                                    TestedBy: i.TestedBy,
                                    VerifiedBy: i.VerifiedBy,
                                    WitnessedBy: i.WitnessedBy,
                                    databaseID: json.decode(value.body)['id'],
                                    lastUpdated: DateTime.now(),
                                  ),
                                  report.id);
                              print('Response status: ${value.statusCode}');
                              print('Response body: ${value.body}');
                              print('Stored successfully');
                            });
                          }
                        }
                      }
                    }
                  }
                  Navigator.pushNamed(context, '/detail_PC', arguments: {
                    'id': report.id,
                    'trDatabaseID': ntr.databaseID
                  });
                } else if (status == DataConnectionStatus.disconnected) {
                  Navigator.pushNamed(context, '/detail_PC', arguments: {
                    'id': report.id,
                    'trDatabaseID': ntr.databaseID
                  });
                }
                // ---------------------------------------------------
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    Card(
                      elevation: 5,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            report.databaseID == 0
                                ? Row(
                                    children: [
                                      Icon(
                                        Icons.replay_circle_filled_rounded,
                                        color: Color.fromARGB(255, 188, 24, 13),
                                        size: 15.0,
                                      ),
                                      Text(
                                        '  ' + report.etype + ' details',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Icon(
                                        Icons.circle_rounded,
                                        color: Color.fromARGB(255, 9, 230, 9),
                                        size: 10.0,
                                      ),
                                      Text(
                                        '  ' + report.etype + ' details',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ],
                                  ),
                            Text('DBID No : ' + report.databaseID.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Test Report No : ' + report.trNo.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text(
                                'Designation : ' +
                                    report.designation.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Location : ' + report.location.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Size : ' + report.size.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  generate_list_of_SC(TestReportModel ntr) {
    getX((ScProvider x) => x.getScByTrNo(ntr.trNo));
    final List<ScModel> reports = watchOnly((ScProvider x) => x.scTrnoList);

    getX((ScProvider x) => x.getScLocalData());
    final List<ScModel> reportsFormLocalData =
        watchOnly((ScProvider x) => x.sclocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgs =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    return Card(
      color: Colors.grey[50],
      elevation: 0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: reports.length,
          itemBuilder: (context, index) {
            final report = reports[index];
            return GestureDetector(
              onTap: () async {
                DataConnectionStatus status = await CheckInternet();
                if (status == DataConnectionStatus.connected) {
                  for (var i in reportsFormLocalData) {
                    if (i.id == report.id) {
                      if (report.databaseID == 0 || i.databaseID == 0) {
                        tempvar = i.trNo;
                        print(tempvar);
                        for (var q in reportsForArgs) {
                          if (q.trNo == tempvar) {
                            var argsDatabaseID = q.databaseID;
                            print(argsDatabaseID);

                            // add to remote database
                            var url = Uri.parse('${Env.URL_PREFIX}/scEquip/');
                            var response = await http.post(url, body: {
                              'trNo': argsDatabaseID.toString(),
                              'etype': i.etype.toString(),
                              'designation': i.designation.toString(),
                              'location': i.location.toString(),
                              'serialNo': i.serialNo.toString(),
                              'make': i.make.toString(),
                              'equipType': i.equipType.toString(),
                              'yom': i.yom.toString(),
                              'testedBy': i.TestedBy.toString(),
                              'verifiedBy': i.VerifiedBy.toString(),
                              'WitnessedBy': i.WitnessedBy.toString(),
                              'dateOfTesting': i.dateOfTesting.toString(),
                            }, headers: {
                              'Authorization': 'Bearer $acc_token',
                            }).then((value) {
                              sl<ScProvider>().updateSc(
                                  ScModel(
                                    id: i.id,
                                    trNo: i.trNo,
                                    etype: i.etype,
                                    designation: i.designation,
                                    location: i.location,
                                    serialNo: i.serialNo,
                                    make: i.make,
                                    equipType: i.equipType,
                                    yom: i.yom,
                                    dateOfTesting: i.dateOfTesting,
                                    TestedBy: i.TestedBy,
                                    VerifiedBy: i.VerifiedBy,
                                    WitnessedBy: i.WitnessedBy,
                                    databaseID: json.decode(value.body)['id'],
                                    lastUpdated: DateTime.now(),
                                  ),
                                  report.id);
                              print('Response status: ${value.statusCode}');
                              print('Response body: ${value.body}');
                              print('Stored successfully');
                            });
                          }
                        }
                      }
                    }
                  }
                  Navigator.pushNamed(context, '/detail_SC', arguments: {
                    'id': report.id,
                    'trDatabaseID': ntr.databaseID
                  });
                } else if (status == DataConnectionStatus.disconnected) {
                  Navigator.pushNamed(context, '/detail_SC', arguments: {
                    'id': report.id,
                    'trDatabaseID': ntr.databaseID
                  });
                }
                // ---------------------------------------------------
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    Card(
                      elevation: 5,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            report.databaseID == 0
                                ? Row(
                                    children: [
                                      Icon(
                                        Icons.replay_circle_filled_rounded,
                                        color: Color.fromARGB(255, 188, 24, 13),
                                        size: 15.0,
                                      ),
                                      Text(
                                        '  ' + report.etype + ' details',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Icon(
                                        Icons.circle_rounded,
                                        color: Color.fromARGB(255, 9, 230, 9),
                                        size: 10.0,
                                      ),
                                      Text(
                                        '  ' + report.etype + ' details',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ],
                                  ),
                            Text('DBID No : ' + report.databaseID.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Test Report No : ' + report.trNo.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text(
                                'Designation : ' +
                                    report.designation.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Location : ' + report.location.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Serial No : ' + report.serialNo.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  generate_list_of_EE(TestReportModel ntr) {
    getX((EEProvider x) => x.getEEByTrNo(ntr.trNo));
    final List<EEModel> reports = watchOnly((EEProvider x) => x.eeTrnoList);

    getX((EEProvider x) => x.getEELocalData());
    final List<EEModel> reportsFormLocalData =
        watchOnly((EEProvider x) => x.eelocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgs =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    return Card(
      color: Colors.grey[50],
      elevation: 0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: reports.length,
          itemBuilder: (context, index) {
            final report = reports[index];
            return GestureDetector(
              onTap: () async {
                DataConnectionStatus status = await CheckInternet();
                if (status == DataConnectionStatus.connected) {
                  for (var i in reportsFormLocalData) {
                    if (i.id == report.id) {
                      if (report.databaseID == 0 || i.databaseID == 0) {
                        tempvar = i.trNo;
                        print(tempvar);

                        for (var q in reportsForArgs) {
                          if (q.trNo == tempvar) {
                            var argsDatabaseID = q.databaseID;
                            print(argsDatabaseID);

                            // add to remote database
                            var url = Uri.parse('${Env.URL_PREFIX}/eeEquip/');
                            var response = await http.post(url, body: {
                              'trNo': argsDatabaseID.toString(),
                              'etype': i.etype.toString(),
                              'testedBy': i.TestedBy.toString(),
                              'verifiedBy': i.VerifiedBy.toString(),
                              'WitnessedBy': i.WitnessedBy.toString(),
                              'dateOfTesting': i.dateOfTesting.toString(),
                            }, headers: {
                              'Authorization': 'Bearer $acc_token'
                            }).then((value) {
                              sl<EEProvider>().updateEE(
                                  EEModel(
                                    id: i.id,
                                    trNo: i.trNo,
                                    etype: i.etype,
                                    dateOfTesting: i.dateOfTesting,
                                    TestedBy: i.TestedBy,
                                    VerifiedBy: i.VerifiedBy,
                                    WitnessedBy: i.WitnessedBy,
                                    databaseID: json.decode(value.body)['id'],
                                    lastUpdated: DateTime.now(),
                                  ),
                                  report.id);
                              print('Response status: ${value.statusCode}');
                              print('Response body: ${value.body}');
                              print('Stored successfully');
                            });
                          }
                        }
                      }
                    }
                  }

                  Navigator.pushNamed(context, '/detail_EE', arguments: {
                    'id': report.id,
                    'trNo': ntr.id,
                    'trDatabaseID': ntr.databaseID,
                  });
                } else if (status == DataConnectionStatus.disconnected) {
                  Navigator.pushNamed(context, '/detail_EE', arguments: {
                    'id': report.id,
                    'trNo': ntr.id,
                    'trDatabaseID': ntr.databaseID,
                  });
                }
                // --------------------------------------------------
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    Card(
                      elevation: 5,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            report.databaseID == 0
                                ? Row(
                                    children: [
                                      Icon(
                                        Icons.replay_circle_filled_rounded,
                                        color: Color.fromARGB(255, 188, 24, 13),
                                        size: 15.0,
                                      ),
                                      Text(
                                        '  ' + report.etype + ' details',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Icon(
                                        Icons.circle_rounded,
                                        color: Color.fromARGB(255, 9, 230, 9),
                                        size: 10.0,
                                      ),
                                      Text(
                                        '  ' + report.etype + ' details',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ],
                                  ),
                            Text('DBID No : ' + report.databaseID.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Test Report No : ' + report.trNo.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  generate_list_of_BB(TestReportModel ntr) {
    getX((BbProvider x) => x.getBbByTrNo(ntr.trNo));
    final List<BbModel> reports = watchOnly((BbProvider x) => x.bbTrnoList);

    getX((BbProvider x) => x.getBBLocalData());
    final List<BbModel> reportsFormLocalData =
        watchOnly((BbProvider x) => x.bblocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgs =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    return Card(
      color: Colors.grey[50],
      elevation: 0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: reports.length,
          itemBuilder: (context, index) {
            final report = reports[index];
            return GestureDetector(
              onTap: () async {
                DataConnectionStatus status = await CheckInternet();
                if (status == DataConnectionStatus.connected) {
                  for (var i in reportsFormLocalData) {
                    if (i.id == report.id) {
                      if (report.databaseID == 0 || i.databaseID == 0) {
                        tempvar = i.trNo;
                        print(tempvar);

                        for (var q in reportsForArgs) {
                          if (q.trNo == tempvar) {
                            var argsDatabaseID = q.databaseID;
                            print(argsDatabaseID);

                            // add to remote database
                            var url = Uri.parse('${Env.URL_PREFIX}/bbEquip/');
                            var response = await http.post(url, body: {
                              'trNo': argsDatabaseID.toString(),
                              'etype': i.etype.toString(),
                              'designation': i.designation.toString(),
                              'location': i.location.toString(),
                              'panel': i.panel.toString(),
                              'nob': i.noOfBar.toString(),
                              'rating': i.rating.toString(),
                              'testedBy': i.TestedBy.toString(),
                              'verifiedBy': i.VerifiedBy.toString(),
                              'WitnessedBy': i.WitnessedBy.toString(),
                              'dateOfTesting': i.dateOfTesting.toString(),
                            }, headers: {
                              'Authorization': 'Bearer $acc_token',
                            }).then((value) {
                              sl<BbProvider>().updateBb(
                                  BbModel(
                                    id: i.id,
                                    trNo: i.trNo,
                                    etype: i.etype,
                                    designation: i.designation,
                                    location: i.location,
                                    rating: i.rating,
                                    panel: i.panel,
                                    noOfBar: i.noOfBar,
                                    dateOfTesting: i.dateOfTesting,
                                    TestedBy: i.TestedBy,
                                    VerifiedBy: i.VerifiedBy,
                                    WitnessedBy: i.WitnessedBy,
                                    databaseID: json.decode(value.body)['id'],
                                    lastUpdated: DateTime.now(),
                                  ),
                                  report.id);
                              print('Response status: ${value.statusCode}');
                              print('Response body: ${value.body}');
                              print('Stored successfully');
                            });
                          }
                        }
                      }
                    }
                    Navigator.pushNamed(context, '/detail_BB', arguments: {
                      'id': report.id,
                      'trNo': ntr.id,
                      'trDatabaseID': ntr.databaseID,
                    });
                  }
                } else if (status == DataConnectionStatus.disconnected) {
                  Navigator.pushNamed(context, '/detail_BB', arguments: {
                    'id': report.id,
                    'trNo': ntr.id,
                    'trDatabaseID': ntr.databaseID,
                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    Card(
                      elevation: 5,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            report.databaseID == 0
                                ? Row(
                                    children: [
                                      Icon(
                                        Icons.replay_circle_filled_rounded,
                                        color: Color.fromARGB(255, 188, 24, 13),
                                        size: 15.0,
                                      ),
                                      Text(
                                        '   BusBar details',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Icon(
                                        Icons.circle_rounded,
                                        color: Color.fromARGB(255, 9, 230, 9),
                                        size: 10.0,
                                      ),
                                      Text(
                                        '   BusBar details',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ],
                                  ),
                            Text('DBID No : ' + report.databaseID.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Test Report No : ' + report.trNo.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text(
                                'Designation : ' +
                                    report.designation.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  generate_powt3win(TestReportModel ntr) {
    getX((Powt3WindingProvider x) => x.getPowt3WindingByTrNo(ntr.trNo));
    final List<Powt3WindingModel> reports =
        watchOnly((Powt3WindingProvider x) => x.powt3WindingTrnoList);

    getX((Powt3WindingProvider x) => x.getPowt3WindingLocalData());
    final List<Powt3WindingModel> reportsFormLocalData =
        watchOnly((Powt3WindingProvider x) => x.powt3WindinglocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgs =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    return Card(
      color: Colors.grey[50],
      elevation: 0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: reports.length,
          itemBuilder: (context, index) {
            final report = reports[index];
            return GestureDetector(
              onTap: () async {
                DataConnectionStatus status = await CheckInternet();
                if (status == DataConnectionStatus.connected) {
                  for (var i in reportsFormLocalData) {
                    if (i.id == report.id) {
                      if (report.databaseID == 0 || i.databaseID == 0) {
                        tempvar = i.trNo;
                        print(tempvar);
                        for (var q in reportsForArgs) {
                          if (q.trNo == tempvar) {
                            var argsDatabaseID = q.databaseID;
                            print(argsDatabaseID);

                            // add to remote database
                            var url =
                                Uri.parse('${Env.URL_PREFIX}/powt3wEquip/');
                            var response = await http.post(url, body: {
                              'trNo': argsDatabaseID.toString(),
                              'etype': i.etype.toString(),
                              'designation': i.designation.toString(),
                              'location': i.location.toString(),
                              'serialNo': i.serialNo.toString(),
                              'rating': i.rating.toString(),
                              'ratedVoltage_HV': i.ratedVoltage_HV.toString(),
                              'ratedVoltage_LV': i.ratedVoltage_LV.toString(),
                              'ratedCurrent_HV': i.ratedCurrent_HV.toString(),
                              'ratedCurrent_LV': i.ratedCurrent_LV.toString(),
                              'ratedVoltage_TS': i.ratedVoltage_TS.toString(),
                              'ratedCurrent_TS': i.ratedCurrent_TS.toString(),
                              'vectorGroup': i.vectorGroup.toString(),
                              'impedanceVoltageLTap':
                                  i.impedanceVoltageLTap.toString(),
                              'impedanceVoltageRTap':
                                  i.impedanceVoltageRTap.toString(),
                              'impedanceVoltageHTap':
                                  i.impedanceVoltageHTap.toString(),
                              'frequency': i.frequency.toString(),
                              'typeOfCooling': i.typeOfCooling.toString(),
                              'noOfPhases': i.noOfPhases.toString(),
                              'make': i.make.toString(),
                              'yom': i.yom.toString(),
                              'noOfTaps': i.noOfTaps.toString(),
                              'onOfNominalTaps': i.onOfNominalTaps.toString(),
                              'oilTemp': i.oilTemp.toString(),
                              'windingTemp': i.windingTemp.toString(),
                              'ambientTemp': i.ambientTemp.toString(),
                              'dateOfTesting': i.dateOfTesting.toString(),
                              'testedBy': i.testedBy.toString(),
                              'verifiedBy': i.verifiedBy.toString(),
                              'WitnessedBy': i.WitnessedBy.toString(),
                            }, headers: {
                              'Authorization': 'Bearer $acc_token',
                            }).then((value) {
                              sl<Powt3WindingProvider>().updatePowt3Winding(
                                  Powt3WindingModel(
                                    id: i.id,
                                    trNo: i.trNo,
                                    etype: i.etype,
                                    designation: i.designation,
                                    location: i.location,
                                    serialNo: i.serialNo,
                                    rating: i.rating,
                                    ratedVoltage_HV: i.ratedVoltage_HV,
                                    ratedVoltage_LV: i.ratedVoltage_LV,
                                    ratedVoltage_TS: i.ratedVoltage_TS,
                                    ratedCurrent_TS: i.ratedCurrent_TS,
                                    ratedCurrent_HV: i.ratedCurrent_HV,
                                    ratedCurrent_LV: i.ratedCurrent_LV,
                                    impedanceVoltageLTap:
                                        i.impedanceVoltageLTap,
                                    impedanceVoltageRTap:
                                        i.impedanceVoltageRTap,
                                    impedanceVoltageHTap:
                                        i.impedanceVoltageHTap,
                                    frequency: i.frequency,
                                    typeOfCooling: i.typeOfCooling,
                                    noOfPhases: i.noOfPhases,
                                    make: i.make,
                                    yom: i.yom,
                                    noOfTaps: i.noOfTaps,
                                    onOfNominalTaps: i.onOfNominalTaps,
                                    oilTemp: i.oilTemp,
                                    windingTemp: i.windingTemp,
                                    ambientTemp: i.ambientTemp,
                                    dateOfTesting: i.dateOfTesting,
                                    testedBy: i.testedBy,
                                    verifiedBy: i.verifiedBy,
                                    WitnessedBy: i.WitnessedBy,
                                    vectorGroup: i.vectorGroup,
                                    databaseID: json.decode(value.body)['id'],
                                    updateDate: DateTime.now(),
                                  ),
                                  report.id);
                              print('Response status: ${value.statusCode}');
                              print('Response body: ${value.body}');
                              print('Stored successfully');
                            });
                          }
                        }
                      }
                    }
                  }

                  // ---------------------------------------------------------

                  Navigator.pushNamed(context, '/detail_POWT3WIN', arguments: {
                    'id': report.id,
                    'trDatabaseID': ntr.databaseID
                  });
                } else if (status == DataConnectionStatus.disconnected) {
                  Navigator.pushNamed(context, '/detail_POWT3WIN', arguments: {
                    'id': report.id,
                    'trDatabaseID': ntr.databaseID
                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    Card(
                      elevation: 5,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 40, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            report.databaseID == 0
                                ? Row(
                                    children: [
                                      Icon(
                                        Icons.replay_circle_filled_rounded,
                                        color: Color.fromARGB(255, 188, 24, 13),
                                        size: 15.0,
                                      ),
                                      Text(
                                        '  ' + report.etype + ' details',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Icon(
                                        Icons.circle_rounded,
                                        color: Color.fromARGB(255, 9, 230, 9),
                                        size: 10.0,
                                      ),
                                      Text(
                                        '  ' + report.etype + ' details',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ],
                                  ),
                            Text('DBID No : ' + report.databaseID.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Test Report No : ' + report.trNo.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text(
                                'Designation : ' +
                                    report.designation.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Location : ' + report.location.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('SerialNo : ' + report.serialNo.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  generate_FPrelay(TestReportModel ntr) {
    getX((FPrelayProvider x) => x.getFPrelayByTrNo(ntr.trNo));
    final List<FPrelayModel> reports =
        watchOnly((FPrelayProvider x) => x.fprelayTrnoList);

    getX((FPrelayProvider x) => x.getFPrelayLocalData());
    final List<FPrelayModel> reportsFormLocalData =
        watchOnly((FPrelayProvider x) => x.fprelaylocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgs =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    return Card(
      color: Colors.grey[50],
      elevation: 0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: reports.length,
          itemBuilder: (context, index) {
            final report = reports[index];
            return GestureDetector(
              onTap: () async {
                DataConnectionStatus status = await CheckInternet();
                if (status == DataConnectionStatus.connected) {
                  for (var i in reportsFormLocalData) {
                    if (i.id == report.id) {
                      if (report.databaseID == 0 || i.databaseID == 0) {
                        tempvar = i.trNo;
                        print(tempvar);
                        for (var q in reportsForArgs) {
                          if (q.trNo == tempvar) {
                            var argsDatabaseID = q.databaseID;
                            print(argsDatabaseID);

                            // add to remote database
                            var url = Uri.parse('${Env.URL_PREFIX}/FpRelay/');
                            var response = await http.post(url, body: {
                              'trNo': argsDatabaseID.toString(),
                              'etype': i.etype.toString(),
                              'designation': i.designation.toString(),
                              'panel': i.panel.toString(),
                              'location': i.location.toString(),
                              'serialNo': i.serialNo.toString(),
                              'make': i.make.toString(),
                              'rtype': i.rtype.toString(),
                              'auxVoltage': i.auxVoltage.toString(),
                              'ctRatioPri': i.ctRatioPri.toString(),
                              'ctRatioSec': i.ctRatioSec.toString(),
                              'ptRatio': i.ptRatio.toString(),
                              'dateOfTesting': i.dateOfTesting.toString(),
                              'testedBy': i.testedBy.toString(),
                              'verifiedBy': i.verifiedBy.toString(),
                              'WitnessedBy': i.WitnessedBy.toString(),
                            }, headers: {
                              'Authorization': 'Bearer $acc_token',
                            }).then((value) {
                              sl<FPrelayProvider>().updateFPrelay(
                                  FPrelayModel(
                                    id: i.id,
                                    trNo: i.trNo,
                                    etype: i.etype,
                                    designation: i.designation,
                                    location: i.location,
                                    serialNo: i.serialNo,
                                    panel: i.panel,
                                    make: i.make,
                                    rtype: i.rtype,
                                    auxVoltage: i.auxVoltage,
                                    ctRatioPri: i.ctRatioPri,
                                    ctRatioSec: i.ctRatioSec,
                                    ptRatio: i.ptRatio,
                                    dateOfTesting: i.dateOfTesting,
                                    testedBy: i.testedBy,
                                    verifiedBy: i.verifiedBy,
                                    WitnessedBy: i.WitnessedBy,
                                    databaseID: json.decode(value.body)['id'],
                                    updateDate: DateTime.now(),
                                  ),
                                  report.id);
                              print('Response status: ${value.statusCode}');
                              print('Response body: ${value.body}');
                              print('Stored successfully');
                            });
                          }
                        }
                      }
                    }
                    Navigator.pushNamed(context, '/detail_FPrelay', arguments: {
                      'id': report.id,
                      'trDatabaseID': ntr.databaseID
                    });
                  }
                } else if (status == DataConnectionStatus.disconnected) {
                  Navigator.pushNamed(context, '/detail_FPrelay', arguments: {
                    'id': report.id,
                    'trDatabaseID': ntr.databaseID
                  });
                }

                // ----------------------------------------
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    Card(
                      elevation: 5,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 40, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            report.databaseID == 0
                                ? Row(
                                    children: [
                                      Icon(
                                        Icons.replay_circle_filled_rounded,
                                        color: Color.fromARGB(255, 188, 24, 13),
                                        size: 15.0,
                                      ),
                                      Text(
                                        '  ' + report.etype + ' details',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Icon(
                                        Icons.circle_rounded,
                                        color: Color.fromARGB(255, 9, 230, 9),
                                        size: 10.0,
                                      ),
                                      Text(
                                        '  ' + report.etype + ' details',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ],
                                  ),
                            Text('DBID No : ' + report.databaseID.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Test Report No : ' + report.trNo.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text(
                                'Designation : ' +
                                    report.designation.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Location : ' + report.location.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('SerialNo : ' + report.serialNo.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  generate_AR(TestReportModel ntr) {
    getX((ARProvider x) => x.getARByTrNo(ntr.trNo));
    final List<ARModel> reports = watchOnly((ARProvider x) => x.arTrnoList);

    getX((ARProvider x) => x.getARLocalData());
    final List<ARModel> reportsFormLocalData =
        watchOnly((ARProvider x) => x.arLocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgs =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    return Card(
      color: Colors.grey[50],
      elevation: 0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: reports.length,
          itemBuilder: (context, index) {
            final report = reports[index];
            return GestureDetector(
              onTap: () async {
                DataConnectionStatus status = await CheckInternet();
                if (status == DataConnectionStatus.connected) {
                  for (var i in reportsFormLocalData) {
                    if (i.id == report.id) {
                      if (report.databaseID == 0 || i.databaseID == 0) {
                        tempvar = i.trNo;
                        print(tempvar);
                        for (var q in reportsForArgs) {
                          if (q.trNo == tempvar) {
                            var argsDatabaseID = q.databaseID;
                            print(argsDatabaseID);

                            // add to remote database
                            var url = Uri.parse('${Env.URL_PREFIX}/aRelay/');
                            var response = await http.post(url, body: {
                              'trNo': argsDatabaseID.toString(),
                              'etype': i.etype.toString(),
                              'designation': i.designation.toString(),
                              'panel': i.panel.toString(),
                              'location': i.location.toString(),
                              'noOfCoil': i.noOfCoil.toString(),
                              'make': i.make.toString(),
                              'rtype': i.rtype.toString(),
                              'auxVoltage': i.auxVoltage.toString(),
                              'dateOfTesting': i.dateOfTesting.toString(),
                              'testedBy': i.testedBy.toString(),
                              'verifiedBy': i.verifiedBy.toString(),
                              'WitnessedBy': i.WitnessedBy.toString(),
                            }, headers: {
                              'Authorization': 'Bearer $acc_token',
                            }).then((value) {
                              sl<ARProvider>().updateAR(
                                  ARModel(
                                    id: i.id,
                                    trNo: i.trNo,
                                    etype: i.etype,
                                    designation: i.designation,
                                    location: i.location,
                                    noOfCoil: i.noOfCoil,
                                    panel: i.panel,
                                    make: i.make,
                                    rtype: i.rtype,
                                    auxVoltage: i.auxVoltage,
                                    dateOfTesting: i.dateOfTesting,
                                    testedBy: i.testedBy,
                                    verifiedBy: i.verifiedBy,
                                    WitnessedBy: i.WitnessedBy,
                                    databaseID: json.decode(value.body)['id'],
                                    updateDate: DateTime.now(),
                                  ),
                                  report.id);
                              print('Response status: ${value.statusCode}');
                              print('Response body: ${value.body}');
                              print('Stored successfully');
                            });
                          }
                        }
                      }
                    }
                  }
                  Navigator.pushNamed(context, '/detail_AR', arguments: {
                    'id': report.id,
                    'trDatabaseID': ntr.databaseID
                  });
                } else if (status == DataConnectionStatus.disconnected) {
                  Navigator.pushNamed(context, '/detail_AR', arguments: {
                    'id': report.id,
                    'trDatabaseID': ntr.databaseID
                  });
                }
                // -----------------------------------------------
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    Card(
                      elevation: 5,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 40, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            report.databaseID == 0
                                ? Row(
                                    children: [
                                      Icon(
                                        Icons.replay_circle_filled_rounded,
                                        color: Color.fromARGB(255, 188, 24, 13),
                                        size: 15.0,
                                      ),
                                      Text(
                                        '  ' + report.etype + ' details',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Icon(
                                        Icons.circle_rounded,
                                        color: Color.fromARGB(255, 9, 230, 9),
                                        size: 10.0,
                                      ),
                                      Text(
                                        '  ' + report.etype + ' details',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ],
                                  ),
                            Text('DBID No : ' + report.databaseID.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Test Report No : ' + report.trNo.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text(
                                'Designation : ' +
                                    report.designation.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Location : ' + report.location.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('make : ' + report.make.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  generate_list_of_TR(TestReportModel ntr) {
    getX((TrProvider x) => x.getTrByTrNo(ntr.trNo));
    final List<TrModel> reports = watchOnly((TrProvider x) => x.trTrnoList);

    getX((TrProvider x) => x.getTrLocalData());
    final List<TrModel> reportsFormTrLocalData =
        watchOnly((TrProvider x) => x.trlocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgs =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    return Card(
      color: Colors.grey[50],
      elevation: 0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: reports.length,
          itemBuilder: (context, index) {
            final report = reports[index];
            return GestureDetector(
              onTap: () async {
                DataConnectionStatus status = await CheckInternet();
                if (status == DataConnectionStatus.connected) {
                  for (var i in reportsFormTrLocalData) {
                    if (i.id == report.id) {
                      if (report.databaseID == 0 || i.databaseID == 0) {
                        tempvar = i.trNo;
                        print(tempvar);
                        for (var q in reportsForArgs) {
                          if (q.trNo == tempvar) {
                            var argsDatabaseID = q.databaseID;
                            print(argsDatabaseID);

                            // add to remote database
                            var url = Uri.parse('${Env.URL_PREFIX}/tRelay/');
                            var response = await http.post(url, body: {
                              'trNo': argsDatabaseID.toString(),
                              'etype': i.etype.toString(),
                              'designation': i.designation.toString(),
                              'panel': i.panel.toString(),
                              'location': i.location.toString(),
                              'serialNo': i.serialNo.toString(),
                              'make': i.make.toString(),
                              'rtype': i.rtype.toString(),
                              'auxVoltage': i.auxVoltage.toString(),
                              'dateOfTesting': i.dateOfTesting.toString(),
                              'testedBy': i.testedBy.toString(),
                              'verifiedBy': i.verifiedBy.toString(),
                              'WitnessedBy': i.WitnessedBy.toString(),
                              // 'updateDate': _updateDate_Controller.text.toString(),
                            }, headers: {
                              'Authorization': 'Bearer $acc_token',
                            }).then((value) {
                              sl<TrProvider>().updateTr(
                                  TrModel(
                                    id: i.id,
                                    trNo: i.trNo,
                                    etype: i.etype,
                                    designation: i.designation,
                                    location: i.location,
                                    serialNo: i.serialNo,
                                    panel: i.panel,
                                    make: i.make,
                                    rtype: i.rtype,
                                    auxVoltage: i.auxVoltage,
                                    dateOfTesting: i.dateOfTesting,
                                    testedBy: i.testedBy,
                                    verifiedBy: i.verifiedBy,
                                    WitnessedBy: i.WitnessedBy,
                                    databaseID: json.decode(value.body)['id'],
                                    updateDate: DateTime.now(),
                                  ),
                                  report.id);
                              print('Response status: ${value.statusCode}');
                              print('Response body: ${value.body}');
                              print('Stored successfully');
                            });
                          }
                        }
                      }
                    }
                  }
                  // ----------------------------------------------------
                  Navigator.pushNamed(context, '/detail_TR', arguments: {
                    'id': report.id,
                    'trDatabaseID': ntr.databaseID
                  });
                } else if (status == DataConnectionStatus.disconnected) {
                  Navigator.pushNamed(context, '/detail_TR', arguments: {
                    'id': report.id,
                    'trDatabaseID': ntr.databaseID
                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    Card(
                      elevation: 5,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 40, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            report.databaseID == 0
                                ? Row(
                                    children: [
                                      Icon(
                                        Icons.replay_circle_filled_rounded,
                                        color: Color.fromARGB(255, 188, 24, 13),
                                        size: 15.0,
                                      ),
                                      Text(
                                        '  ' + report.etype + ' details',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Icon(
                                        Icons.circle_rounded,
                                        color: Color.fromARGB(255, 9, 230, 9),
                                        size: 10.0,
                                      ),
                                      Text(
                                        '  ' + report.etype + ' details',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ],
                                  ),
                            Text('DBID No : ' + report.databaseID.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Test Report No : ' + report.trNo.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text(
                                'Designation : ' +
                                    report.designation.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Location : ' + report.location.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('make : ' + report.make.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  generate_list_of_VR(TestReportModel ntr) {
    getX((VrProvider x) => x.getVrByTrNo(ntr.trNo));
    final List<VrModel> reports = watchOnly((VrProvider x) => x.vrTrnoList);

    getX((VrProvider x) => x.getVrLocalData());
    final List<VrModel> reportsFormVrLocalData =
        watchOnly((VrProvider x) => x.vrlocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgs =
        watchOnly((TestReportsProvider x) => x.reportListFuture);
    return Card(
      color: Colors.grey[50],
      elevation: 0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: reports.length,
          itemBuilder: (context, index) {
            final report = reports[index];
            return GestureDetector(
              onTap: () async {
                DataConnectionStatus status = await CheckInternet();
                if (status == DataConnectionStatus.connected) {
                  for (var i in reportsFormVrLocalData) {
                    if (i.id == report.id) {
                      if (report.databaseID == 0 || i.databaseID == 0) {
                        tempvar = i.trNo;
                        print(tempvar);
                        for (var q in reportsForArgs) {
                          if (q.trNo == tempvar) {
                            var argsDatabaseID = q.databaseID;
                            print(argsDatabaseID);
                            // add to remote database
                            var url = Uri.parse('${Env.URL_PREFIX}/vRelay/');
                            var response = await http.post(url, body: {
                              'trNo': argsDatabaseID.toString(),
                              'etype': i.etype.toString(),
                              'designation': i.designation.toString(),
                              'panel': i.panel.toString(),
                              'location': i.location.toString(),
                              'serialNo': i.serialNo.toString(),
                              'make': i.make.toString(),
                              'rtype': i.rtype.toString(),
                              'auxVoltage': i.auxVoltage.toString(),
                              'ptRatio': i.ptRatio.toString(),
                              'Vn': i.Vn.toString(),
                              'dateOfTesting': i.dateOfTesting.toString(),
                              'testedBy': i.testedBy.toString(),
                              'verifiedBy': i.verifiedBy.toString(),
                              'WitnessedBy': i.WitnessedBy.toString(),
                              // 'updateDate': _updateDate_Controller.text.toString(),
                            }, headers: {
                              'Authorization': 'Bearer $acc_token',
                            }).then((value) {
                              sl<VrProvider>().updateVr(
                                  VrModel(
                                    id: i.id,
                                    trNo: i.trNo,
                                    etype: i.etype,
                                    designation: i.designation,
                                    location: i.location,
                                    serialNo: i.serialNo,
                                    panel: i.panel,
                                    make: i.make,
                                    rtype: i.rtype,
                                    auxVoltage: i.auxVoltage,
                                    ptRatio: i.ptRatio,
                                    Vn: i.Vn,
                                    dateOfTesting: i.dateOfTesting,
                                    testedBy: i.testedBy,
                                    verifiedBy: i.verifiedBy,
                                    WitnessedBy: i.WitnessedBy,
                                    databaseID: json.decode(value.body)['id'],
                                    updateDate: DateTime.now(),
                                  ),
                                  report.id);

                              print('Response status: ${value.statusCode}');
                              print('Response body: ${value.body}');
                              print('Stored successfully');
                            });
                          }
                        }
                      }
                    }
                  }
                  // --------------------------------------------------
                  Navigator.pushNamed(context, '/detail_VR', arguments: {
                    'id': report.id,
                    'trDatabaseID': ntr.databaseID
                  });
                } else if (status == DataConnectionStatus.disconnected) {
                  Navigator.pushNamed(context, '/detail_VR', arguments: {
                    'id': report.id,
                    'trDatabaseID': ntr.databaseID
                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    Card(
                      elevation: 5,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 40, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            report.databaseID == 0
                                ? Row(
                                    children: [
                                      Icon(
                                        Icons.replay_circle_filled_rounded,
                                        color: Color.fromARGB(255, 188, 24, 13),
                                        size: 15.0,
                                      ),
                                      Text(
                                        '  ' + report.etype + ' details',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Icon(
                                        Icons.circle_rounded,
                                        color: Color.fromARGB(255, 9, 230, 9),
                                        size: 10.0,
                                      ),
                                      Text(
                                        '  ' + report.etype + ' details',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ],
                                  ),
                            Text('DBID No : ' + report.databaseID.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Test Report No : ' + report.trNo.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text(
                                'Designation : ' +
                                    report.designation.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Location : ' + report.location.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('make : ' + report.make.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  generate_list_of_EFELR(TestReportModel ntr) {
    getX((EfElrProvider x) => x.getEfElrByTrNo(ntr.trNo));
    final List<EfElrModel> reports =
        watchOnly((EfElrProvider x) => x.efelrTrnoList);

    getX((EfElrProvider x) => x.getEFELRLocalData());
    final List<EfElrModel> reportsFormEFERLLocalData =
        watchOnly((EfElrProvider x) => x.efelrlocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsTestrep =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    return Card(
      color: Colors.grey[50],
      elevation: 0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: reports.length,
          itemBuilder: (context, index) {
            final report = reports[index];
            return GestureDetector(
              onTap: () async {
                DataConnectionStatus status = await CheckInternet();
                if (status == DataConnectionStatus.connected) {
                  for (var i in reportsFormEFERLLocalData) {
                    if (i.id == report.id) {
                      if (report.databaseID == 0 || i.databaseID == 0) {
                        tempvar = i.trNo;
                        print(tempvar);
                        for (var q in reportsForArgsTestrep) {
                          if (q.trNo == tempvar) {
                            var argsDatabaseID = q.databaseID;
                            print(argsDatabaseID);
                            // add to remote database
                            var url = Uri.parse('${Env.URL_PREFIX}/efelRelay/');
                            var response = await http.post(url, body: {
                              'trNo': argsDatabaseID.toString(),
                              'etype': i.etype.toString(),
                              'designation': i.designation.toString(),
                              'panel': i.panel.toString(),
                              'location': i.location.toString(),
                              'serialNo': i.serialNo.toString(),
                              'make': i.make.toString(),
                              'rtype': i.rtype.toString(),
                              'auxVoltage': i.auxVoltage.toString(),
                              'ctRatio': i.ctRatio.toString(),
                              'dateOfTesting': i.dateOfTesting.toString(),
                              'testedBy': i.testedBy.toString(),
                              'verifiedBy': i.verifiedBy.toString(),
                              'WitnessedBy': i.WitnessedBy.toString(),
                              // 'updateDate': _updateDate_Controller.text.toString(),
                            }, headers: {
                              'Authorization': 'Bearer $acc_token',
                            }).then((value) {
                              sl<EfElrProvider>().updateEfElr(
                                  EfElrModel(
                                    id: i.id,
                                    trNo: i.trNo,
                                    etype: i.etype,
                                    designation: i.designation,
                                    location: i.location,
                                    serialNo: i.serialNo,
                                    panel: i.panel,
                                    make: i.make,
                                    rtype: i.rtype,
                                    auxVoltage: i.auxVoltage,
                                    ctRatio: i.ctRatio,
                                    dateOfTesting: i.dateOfTesting,
                                    testedBy: i.testedBy,
                                    verifiedBy: i.verifiedBy,
                                    WitnessedBy: i.WitnessedBy,
                                    databaseID: json.decode(value.body)['id'],
                                    updateDate: DateTime.now(),
                                  ),
                                  report.id);
                              print('Response status: ${value.statusCode}');
                              print('Response body: ${value.body}');
                              print('Stored successfully');
                            });
                          }
                        }
                      }
                    }
                  }

                  // --------------------------------------------------
                  Navigator.pushNamed(context, '/detail_EFELR', arguments: {
                    'id': report.id,
                    'trDatabaseID': ntr.databaseID
                  });
                } else if (status == DataConnectionStatus.disconnected) {
                  Navigator.pushNamed(context, '/detail_EFELR', arguments: {
                    'id': report.id,
                    'trDatabaseID': ntr.databaseID
                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    Card(
                      elevation: 5,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 40, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            report.databaseID == 0
                                ? Row(
                                    children: [
                                      Icon(
                                        Icons.replay_circle_filled_rounded,
                                        color: Color.fromARGB(255, 188, 24, 13),
                                        size: 15.0,
                                      ),
                                      Text(
                                        '  ' + report.etype + ' details',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Icon(
                                        Icons.circle_rounded,
                                        color: Color.fromARGB(255, 9, 230, 9),
                                        size: 10.0,
                                      ),
                                      Text(
                                        '  ' + report.etype + ' details',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ],
                                  ),
                            Text('DBID No : ' + report.databaseID.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Test Report No : ' + report.trNo.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text(
                                'Designation : ' +
                                    report.designation.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Location : ' + report.location.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('make : ' + report.make.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  generate_list_of_OCEFR(TestReportModel ntr) {
    getX((OcEfrProvider x) => x.getOcEfrByTrNo(ntr.trNo));
    final List<OcEfrModel> reports =
        watchOnly((OcEfrProvider x) => x.ocefrTrnoList);

    getX((OcEfrProvider x) => x.getOcEfrLocalData());
    final List<OcEfrModel> reportsFormOcfrLocalData =
        watchOnly((OcEfrProvider x) => x.ocefrlocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsTestrep =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    return Card(
      color: Colors.grey[50],
      elevation: 0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return GestureDetector(
            onTap: () async {
              DataConnectionStatus status = await CheckInternet();
              if (status == DataConnectionStatus.connected) {
                for (var i in reportsFormOcfrLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      tempvar = i.trNo;
                      print(tempvar);
                      for (var q in reportsForArgsTestrep) {
                        if (q.trNo == tempvar) {
                          var argsDatabaseID = q.databaseID;
                          print(argsDatabaseID);

                          // add to remote database
                          var url = Uri.parse('${Env.URL_PREFIX}/ocefRelay/');
                          var response = await http.post(url, body: {
                            'trNo': argsDatabaseID.toString(),
                            'etype': i.etype.toString(),
                            'designation': i.designation.toString(),
                            'panel': i.panel.toString(),
                            'location': i.location.toString(),
                            'serialNo_Rph': i.serialNo_Rph.toString(),
                            'serialNo_Yph': i.serialNo_Yph.toString(),
                            'serialNo_Bph': i.serialNo_Bph.toString(),
                            'make': i.make.toString(),
                            'rtype': i.rtype.toString(),
                            'auxVoltage': i.auxVoltage.toString(),
                            'ctRatio': i.ctRatio.toString(),
                            'dateOfTesting': i.dateOfTesting.toString(),
                            'testedBy': i.testedBy.toString(),
                            'verifiedBy': i.verifiedBy.toString(),
                            'WitnessedBy': i.WitnessedBy.toString(),
                            // 'updateDate': _updateDate_Controller.text.toString(),
                          }, headers: {
                            'Authorization': 'Bearer $acc_token',
                          }).then((value) {
                            sl<OcEfrProvider>().updateOcEfr(
                                OcEfrModel(
                                  id: i.id,
                                  trNo: i.trNo,
                                  etype: i.etype,
                                  designation: i.designation,
                                  location: i.location,
                                  serialNo_Rph: i.serialNo_Rph,
                                  serialNo_Yph: i.serialNo_Yph,
                                  serialNo_Bph: i.serialNo_Bph,
                                  panel: i.panel,
                                  make: i.make,
                                  rtype: i.rtype,
                                  auxVoltage: i.auxVoltage,
                                  ctRatio: i.ctRatio,
                                  dateOfTesting: i.dateOfTesting,
                                  testedBy: i.testedBy,
                                  verifiedBy: i.verifiedBy,
                                  WitnessedBy: i.WitnessedBy,
                                  databaseID: json.decode(value.body)['id'],
                                  updateDate: DateTime.now(),
                                ),
                                report.id);
                            print('Response status: ${value.statusCode}');
                            print('Response body: ${value.body}');
                            print('Stored successfully');
                          });
                        }
                      }
                    }
                  }
                }

                // ----------------------------------------------------
                Navigator.pushNamed(context, '/detail_OCEFR', arguments: {
                  'id': report.id,
                  'trDatabaseID': ntr.databaseID
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_OCEFR', arguments: {
                  'id': report.id,
                  'trDatabaseID': ntr.databaseID
                });
              }
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Card(
                    elevation: 5,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 40, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          report.databaseID == 0
                              ? Row(
                                  children: [
                                    Icon(
                                      Icons.replay_circle_filled_rounded,
                                      color: Color.fromARGB(255, 188, 24, 13),
                                      size: 15.0,
                                    ),
                                    Text(
                                      '  ' + report.etype + ' details',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
                                    ),
                                  ],
                                )
                              : Row(
                                  children: [
                                    Icon(
                                      Icons.circle_rounded,
                                      color: Color.fromARGB(255, 9, 230, 9),
                                      size: 10.0,
                                    ),
                                    Text(
                                      '  ' + report.etype + ' details',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
                                    ),
                                  ],
                                ),
                          Text('DBID No : ' + report.databaseID.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  letterSpacing: 1)),
                          Text('Test Report No : ' + report.trNo.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  letterSpacing: 1)),
                          Text('Designation : ' + report.designation.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  letterSpacing: 1)),
                          Text('Location : ' + report.location.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  letterSpacing: 1)),
                          Text('make : ' + report.make.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  letterSpacing: 1)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  generate_list_of_IT(TestReportModel ntr) {
    getX((ItProvider x) => x.getItByTrNo(ntr.trNo));
    final List<ItModel> reports = watchOnly((ItProvider x) => x.itTrnoList);

    getX((ItProvider x) => x.FutureGetITLocalData());
    final List<ItModel> reportsFormITLocalData =
        watchOnly((ItProvider x) => x.itlocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsTestrep =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    return Card(
      color: Colors.grey[50],
      elevation: 0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return GestureDetector(
            onTap: () async {
              DataConnectionStatus status = await CheckInternet();
              if (status == DataConnectionStatus.connected) {
                for (var i in reportsFormITLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      tempvar = i.trNo;
                      print(tempvar);
                      for (var q in reportsForArgsTestrep) {
                        if (q.trNo == tempvar) {
                          var argsDatabaseID = q.databaseID;
                          print(argsDatabaseID);

                          print('insdie of powt3win remote yet to start');

                          // add to remote database
                          var url = Uri.parse('${Env.URL_PREFIX}/itEquip/');
                          var response = await http.post(url, body: {
                            'trNo': argsDatabaseID.toString(),
                            'etype': i.etype.toString(),
                            'designation': i.designation.toString(),
                            'location': i.location.toString(),
                            'serialNo': i.serialNo.toString(),
                            'rating': i.rating.toString(),
                            'ratedVoltage_HV': i.ratedVoltage_HV.toString(),
                            'ratedVoltage_LV': i.ratedVoltage_LV.toString(),
                            'ratedCurrent_HV': i.ratedCurrent_HV.toString(),
                            'ratedCurrent_LV': i.ratedCurrent_LV.toString(),
                            'vectorGroup': i.vectorGroup.toString(),
                            'impedanceVoltage_HV_LV1':
                                i.impedanceVoltage_HV_LV1.toString(),
                            'impedanceVoltage_HV_LV2':
                                i.impedanceVoltage_HV_LV2.toString(),
                            'impedanceVoltage_HV_LV3':
                                i.impedanceVoltage_HV_LV3.toString(),
                            'impedanceVoltage_HV_LV4':
                                i.impedanceVoltage_HV_LV4.toString(),
                            'impedanceVoltage_LV_LV':
                                i.impedanceVoltage_LV_LV.toString(),
                            'frequency': i.frequency.toString(),
                            'typeOfCooling': i.typeOfCooling.toString(),
                            'noOfPhases': i.noOfPhases.toString(),
                            'make': i.make.toString(),
                            'yom': i.yom.toString(),
                            'noOfTaps': i.noOfTaps.toString(),
                            'onOfNominalTaps': i.noOfNominalTaps.toString(),
                            'oilTemp': i.oilTemp.toString(),
                            'windingTemp': i.windingTemp.toString(),
                            'ambientTemp': i.ambientTemp.toString(),
                            'dateOfTesting': i.dateOfTesting.toString(),
                            'testedBy': i.testedBy.toString(),
                            'verifiedBy': i.verifiedBy.toString(),
                            'WitnessedBy': i.WitnessedBy.toString(),
                            // 'updateDate': _dateOfTesting,
                          }, headers: {
                            'Authorization': 'Bearer $acc_token',
                          }).then((value) {
                            sl<ItProvider>().updateIt(
                                ItModel(
                                  id: i.id,
                                  trNo: i.trNo,
                                  etype: i.etype,
                                  designation: i.designation,
                                  location: i.location,
                                  serialNo: i.serialNo,
                                  rating: i.rating,
                                  ratedVoltage_HV: i.ratedVoltage_HV,
                                  ratedVoltage_LV: i.ratedVoltage_LV,
                                  ratedCurrent_HV: i.ratedCurrent_HV,
                                  ratedCurrent_LV: i.ratedCurrent_LV,
                                  vectorGroup: i.vectorGroup,
                                  impedanceVoltage_HV_LV1:
                                      i.impedanceVoltage_HV_LV1,
                                  impedanceVoltage_HV_LV2:
                                      i.impedanceVoltage_HV_LV2,
                                  impedanceVoltage_HV_LV3:
                                      i.impedanceVoltage_HV_LV3,
                                  impedanceVoltage_HV_LV4:
                                      i.impedanceVoltage_HV_LV4,
                                  impedanceVoltage_LV_LV:
                                      i.impedanceVoltage_LV_LV,
                                  frequency: i.frequency,
                                  typeOfCooling: i.typeOfCooling,
                                  noOfPhases: i.noOfPhases,
                                  make: i.make,
                                  yom: i.yom,
                                  noOfTaps: i.noOfTaps,
                                  noOfNominalTaps: i.noOfNominalTaps,
                                  oilTemp: i.oilTemp,
                                  windingTemp: i.windingTemp,
                                  ambientTemp: i.ambientTemp,
                                  dateOfTesting: i.dateOfTesting,
                                  testedBy: i.testedBy,
                                  verifiedBy: i.verifiedBy,
                                  WitnessedBy: i.WitnessedBy,
                                  databaseID: json.decode(value.body)['id'],
                                  updateDate: DateTime.now(),
                                ),
                                report.id);
                            print('Response status: ${value.statusCode}');
                            print('Response body: ${value.body}');
                            print('Stored successfully');
                          });
                        }
                      }
                    }
                  }
                }

                // ----------------------------------------------------
                Navigator.pushNamed(context, '/detail_IT', arguments: {
                  'id': report.id,
                  'trDatabaseID': ntr.databaseID
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_IT', arguments: {
                  'id': report.id,
                  'trDatabaseID': ntr.databaseID
                });
              }
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Card(
                    elevation: 5,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 40, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          report.databaseID == 0
                              ? Row(
                                  children: [
                                    Icon(
                                      Icons.replay_circle_filled_rounded,
                                      color: Color.fromARGB(255, 188, 24, 13),
                                      size: 15.0,
                                    ),
                                    Text(
                                      '  ' + report.etype + ' details',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
                                    ),
                                  ],
                                )
                              : Row(
                                  children: [
                                    Icon(
                                      Icons.circle_rounded,
                                      color: Color.fromARGB(255, 9, 230, 9),
                                      size: 10.0,
                                    ),
                                    Text(
                                      '  ' + report.etype + ' details',
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
                                    ),
                                  ],
                                ),
                          Text('DBID No : ' + report.databaseID.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  letterSpacing: 1)),
                          Text('Test Report No : ' + report.trNo.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  letterSpacing: 1)),
                          // Text('Designation : ' + report.designation.toString(),
                          //     style: TextStyle(
                          //         color: Colors.black,
                          //         fontSize: 13,
                          //         letterSpacing: 1)),
                          Text('Location : ' + report.location.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  letterSpacing: 1)),
                          Text('make : ' + report.make.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  letterSpacing: 1)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Container build_body(TestReportModel ntr) {
    //print(ntr);
    return Container(
      child: Padding(
        padding:
            const EdgeInsets.fromLTRB(12, 12, 0, 0), //out of the box padding
        child: Column(
          children: [
            Card(
              elevation: 2,
              //shadowColor: Color.fromARGB(255, 144, 34, 26),
              color: Colors.white,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        SizedBox(
                            child: Text('DBID Number',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    letterSpacing: 0.5))),
                        Text(ntr.databaseID.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13)),
                        Divider(height: 10, color: Colors.white),
                        const SizedBox(
                            child: Text('Test Report Number',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    letterSpacing: 0.5))),
                        Text(ntr.trNo.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13)),
                        Divider(height: 10, color: Colors.white),
                        const SizedBox(
                            child: Text('Client Name',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    letterSpacing: 0.5))),
                        Text(ntr.client,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13)),
                        ntr.customer == "0"
                            ? Container()
                            : Column(
                                children: [
                                  Divider(height: 10, color: Colors.white),
                                  const SizedBox(
                                      child: Text('Customer Name',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                              letterSpacing: 0.5))),
                                  Text(ntr.customer,
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 13)),
                                ],
                              ),
                        Divider(height: 10, color: Colors.white),
                        const SizedBox(
                            child: Text('Project Name',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    letterSpacing: 0.5))),
                        Text(ntr.project,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13)),
                        Divider(height: 10, color: Colors.white),
                        const SizedBox(
                            child: Text('Date Of Testing',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    letterSpacing: 0.5))),
                        Text(
                            DateFormat('dd-MM-yyyy')
                                .format(ntr.testDate)
                                .toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  generate_list_of_DG(TestReportModel ntr) {
    getX((DgProvider x) => x.getDgByTrNo(ntr.trNo));
    final List<DgModel> reports = watchOnly((DgProvider x) => x.dgTrnoList);

    getX((DgProvider x) => x.getDgLocalData());
    final List<DgModel> reportsFormDgLocalData =
        watchOnly((DgProvider x) => x.dglocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsTestrep =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    return Card(
      color: Colors.grey[50],
      elevation: 0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: reports.length,
          itemBuilder: (context, index) {
            final report = reports[index];
            return GestureDetector(
              onTap: () async {
                DataConnectionStatus status = await CheckInternet();
                if (status == DataConnectionStatus.connected) {
                  for (var i in reportsFormDgLocalData) {
                    if (i.id == report.id) {
                      if (report.databaseID == 0 || i.databaseID == 0) {
                        tempvar = i.trNo;
                        print(tempvar);
                        for (var q in reportsForArgsTestrep) {
                          if (q.trNo == tempvar) {
                            var argsDatabaseID = q.databaseID;
                            print(argsDatabaseID);
                            // add to remote database
                            var url = Uri.parse('${Env.URL_PREFIX}/dgEquip/');
                            var response = await http.post(url, body: {
                              'trNo': argsDatabaseID.toString(),
                              'etype': i.etype.toString(),
                              'design': i.design.toString(),
                              'location': i.location.toString(),
                              'serialNo': i.serialNo.toString(),
                              'make': i.make.toString(),
                              'model': i.model.toString(),
                              'voltage': i.voltage.toString(),
                              'speed': i.speed.toString(),
                              'powerFactor': i.powerFactor.toString(),
                              'yom': i.yom.toString(),
                              'rating': i.rating.toString(),
                              'testedBy': i.TestedBy.toString(),
                              'verifiedBy': i.VerifiedBy.toString(),
                              'WitnessedBy': i.WitnessedBy.toString(),
                              'dateOfTesting': i.dateOfTesting.toString(),
                            }, headers: {
                              'Authorization': 'Bearer $acc_token',
                            }).then((value) {
                              sl<DgProvider>().updateDg(
                                  DgModel(
                                    id: i.id,
                                    trNo: i.trNo,
                                    etype: i.etype,
                                    design: i.design,
                                    location: i.location,
                                    rating: i.rating,
                                    serialNo: i.serialNo,
                                    make: i.make,
                                    model: i.model,
                                    voltage: i.voltage,
                                    speed: i.speed,
                                    powerFactor: i.powerFactor,
                                    yom: i.yom,
                                    dateOfTesting: i.dateOfTesting,
                                    TestedBy: i.TestedBy,
                                    VerifiedBy: i.VerifiedBy,
                                    WitnessedBy: i.WitnessedBy,
                                    databaseID: json.decode(value.body)['id'],
                                    updateDate: DateTime.now(),
                                  ),
                                  report.id);
                              print('Response status: ${value.statusCode}');
                              print('Response body: ${value.body}');
                              print('Stored successfully');
                            });
                          }
                        }
                      }
                    }
                  }
                  // ----------------------------------------------------
                  Navigator.pushNamed(context, '/detail_DG', arguments: {
                    'id': report.id,
                    'trDatabaseID': ntr.databaseID,
                  });
                } else if (status == DataConnectionStatus.disconnected) {
                  Navigator.pushNamed(context, '/detail_DG', arguments: {
                    'id': report.id,
                    'trDatabaseID': ntr.databaseID,
                  });
                }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    Card(
                      elevation: 5,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            report.databaseID == 0
                                ? Row(
                                    children: [
                                      Icon(
                                        Icons.replay_circle_filled_rounded,
                                        color: Color.fromARGB(255, 188, 24, 13),
                                        size: 15.0,
                                      ),
                                      Text(
                                        '  ' + report.etype + ' details',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Icon(
                                        Icons.circle_rounded,
                                        color: Color.fromARGB(255, 9, 230, 9),
                                        size: 10.0,
                                      ),
                                      Text(
                                        '  ' + report.etype + ' details',
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ],
                                  ),
                            Text('DBID No : ' + report.databaseID.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Test Report No : ' + report.trNo.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Design : ' + report.design.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Location : ' + report.location.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                            Text('Serial_No : ' + report.serialNo.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    letterSpacing: 1)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
