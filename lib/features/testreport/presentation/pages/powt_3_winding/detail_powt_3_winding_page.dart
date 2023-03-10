// ignore_for_file: prefer_const_constructors, missing_return, prefer_interpolation_to_compose_strings, file_names, use_build_context_synchronously
// import 'dart:html';

import 'dart:convert';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import '../../../../../env.sample.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/powt_3_winding/powt3win_ir_model.dart';
import '../../../data/models/equipment/powt_3_winding/powt3win_mb_model.dart';
import '../../../data/models/equipment/powt_3_winding/powt3win_mcHv_model.dart';
import '../../../data/models/equipment/powt_3_winding/powt3win_mcIvT_model.dart';
import '../../../data/models/equipment/powt_3_winding/powt3win_mcLv_model.dart';
import '../../../data/models/equipment/powt_3_winding/powt3win_r_model.dart';
import '../../../data/models/equipment/powt_3_winding/powt3win_schvivt_model.dart';
import '../../../data/models/equipment/powt_3_winding/powt3win_schvlv_model.dart';
import '../../../data/models/equipment/powt_3_winding/powt3win_tsc_model.dart';
import '../../../data/models/equipment/powt_3_winding/powt3win_wrHv_model.dart';
import '../../../data/models/equipment/powt_3_winding/powt3win_wrIvT_model.dart';
import '../../../data/models/equipment/powt_3_winding/powt3win_wrLv_model.dart';
import '../../../data/models/equipment/powt_3_winding/powt3winding_model.dart';
import '../../../data/models/test_report_model.dart';
import 'package:http/http.dart' as http;
import '../../providers/equipment_acb_provider/test_report_provider.dart';
import '../../providers/powt_3_winding/powt3_wrLv_provider.dart';
import '../../providers/powt_3_winding/powt3win_ir_provider.dart';
import '../../providers/powt_3_winding/powt3win_mb_provider.dart';
import '../../providers/powt_3_winding/powt3win_mcHv_provider.dart';
import '../../providers/powt_3_winding/powt3win_mcIvT_provider.dart';
import '../../providers/powt_3_winding/powt3win_mcLv_provider.dart';
import '../../providers/powt_3_winding/powt3win_r_provider.dart';
import '../../providers/powt_3_winding/powt3win_schvivt_provider.dart';
import '../../providers/powt_3_winding/powt3win_schvlv_provider.dart';
import '../../providers/powt_3_winding/powt3win_tsc_provider.dart';
import '../../providers/powt_3_winding/powt3win_wrHv_provider.dart';
import '../../providers/powt_3_winding/powt3win_wrIvT_provider.dart';
import '../../providers/powt_3_winding/powt_3_winding_provider.dart';
import '../dropdown_All/responsive_tool/google_sign_in_out/InternetConnChecker.dart';
import '../equipment_acb/detail_test_report_page.dart';

class Detail_Powt3Winding_Page extends StatelessWidget with GetItMixin {
  Map args = {};
  Powt3WindingModel ntr;
  int trDbId;
  Detail_Powt3Winding_Page(@required this.args, {Key key}) : super(key: key);
  var datetime;

  @override
  Widget build(BuildContext context) {
    getX((Powt3WindingProvider x) => x.getPowt3WindingByID(args['id']));
    final Powt3WindingModel ntr =
        watchOnly((Powt3WindingProvider x) => x.powt3WindingModel);

    var mob =
        const Text('Powt3Winding  Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Powt3Winding  Details', style: TextStyle(fontSize: 20));
    return Scaffold(
      appBar: AppBar(
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
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/edit_Powt3Winding',
                      arguments: {
                        'id': ntr.id,
                        'trDatabaseID': args['trDatabaseID']
                      });
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
                icon: const Icon(Icons.home))
          ]),
      // ignore: missing_return
      body: LayoutBuilder(
        builder: (context, constraints) {
          /////////////////////////////////////DESKTOP-VIEW///////////////////////////////////////////////////////////
          if (constraints.maxWidth > 770) {
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      ConstrainedBox(
                          constraints: BoxConstraints(minHeight: 0),
                          child: display_Powt3Winding_details(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_Powt3winIR(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_Powt3wintsc(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_Powt3winwrHv(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_Powt3winwrLv(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_Powt3winr(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_Powt3winwrIvT(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_Powt3winmcHv(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_Powt3winmcLv(ntr)),
                      // SizedBox(
                      //     width: 500,
                      //     height: 130,
                      //     child: generate_list_of_Powt3winmb(ntr)),
                      // SizedBox(
                      //     width: 500,
                      //     height: 130,
                      //     child: generate_list_of_Powt3winmbLv(ntr)),
                      // SizedBox(
                      //     width: 500,
                      //     height: 130,
                      //     child: generate_list_of_Powt3winmbIvT(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_Powt3winmcIvT(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_Powt3winschvivt(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_Powt3winschvlv(ntr)),
                    ],
                  ),
                ),
              ],
            );

            /////////////////////////////////////MOBILE-VIEW///////////////////////////////////////////////////////////
          } else if (constraints.maxWidth < 770) {
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      ConstrainedBox(
                          constraints: BoxConstraints(minHeight: 0),
                          child: display_Powt3Winding_details(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_Powt3winIR(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_Powt3wintsc(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_Powt3winwrHv(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_Powt3winwrLv(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_Powt3winr(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_Powt3winwrIvT(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_Powt3winmcHv(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_Powt3winmcLv(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_Powt3winMBtest(ntr)),
                      // SizedBox(
                      //     width: 350,
                      //     height: 130,
                      //     child: generate_list_of_Powt3winmbLv(ntr)),
                      // SizedBox(
                      //     width: 350,
                      //     height: 130,
                      //     child: generate_list_of_Powt3winmbIvT(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_Powt3winmcIvT(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_Powt3winschvivt(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_Powt3winschvlv(ntr)),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),

      // if (limitAllow == ntr.noOfCores) {
      //   Text('Cores limit reached');
      //   print('limit Reached');
      //   Navigator.pop(context);
      // } else {
      //   limitAllow++;
      //   // EquipmentTypeList().getEquipUsetoDefaultValue();
      //   Navigator.popAndPushNamed(context, '/add_CT_Cores',
      //       arguments: {
      //         'ctDatabaseID': ntr.databaseID,
      //         'trDatabaseID': args['trDatabaseID'],
      //       });
      // }
      // floatingActionButton: Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     FloatingActionButton.extended(
      //         heroTag: 'addCTCores',
      //         onPressed: () {
      //           Navigator.popAndPushNamed(context, '/add_CT_Cores', arguments: {
      //             'TrNo': ntr.trNo,
      //             'ctId': ntr.id,
      //             'Serial_No': ntr.serialNo_Bph,
      //             'ctDatabaseID': ntr.databaseID,
      //             'trDatabaseID': args['trDatabaseID'],
      //           });
      //         },
      //         label: Text('Add Cores',
      //             style: TextStyle(fontSize: 10, color: Colors.white)),
      //         icon: const Icon(Icons.add, color: Colors.white))
      //   ],
      // ),

      floatingActionButton: PopupMenuButton(
        child: FloatingActionButton.extended(
          label: Text(
            'Add Test',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          icon: const Icon(Icons.account_tree_outlined, color: Colors.white),
        ),
        itemBuilder: (context) {
          return List.generate(
            1,
            (index) {
              //list.generate
              return PopupMenuItem(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton.extended(
                        heroTag: 'addPowt3winIR',
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.popAndPushNamed(context, '/add_POWT3WIN_ir',
                              arguments: {
                                'TrNo': ntr.trNo,
                                'POWT3WIN_ID': ntr.id,
                                'serialno': ntr.serialNo,
                                'powt3winDatabaseID': ntr.databaseID,
                                'trDatabaseID': args['trDatabaseID'],
                              });
                        },
                        label: const Text('Insulation Resistance Test',
                            style:
                                TextStyle(fontSize: 10, color: Colors.white)),
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton.extended(
                        heroTag: 'addPowt3wintsc',
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.popAndPushNamed(
                              context, '/add_POWT3WIN_tsc',
                              arguments: {
                                'TrNo': ntr.trNo,
                                'POWT3WIN_ID': ntr.id,
                                'serialno': ntr.serialNo,
                                'powt3winDatabaseID': ntr.databaseID,
                                'trDatabaseID': args['trDatabaseID'],
                              });
                        },
                        label: Text('Tap Selector Connection',
                            style:
                                TextStyle(fontSize: 10, color: Colors.white)),
                        icon: Icon(Icons.add, color: Colors.white),
                      ),
                    ),

                    // ----------------------------------------------------
                    PopupMenuButton(
                        child: FloatingActionButton.extended(
                          label: Text(
                            'Winding Resistance Test',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          icon: const Icon(Icons.add, color: Colors.white),
                        ),
                        itemBuilder: (context) {
                          return List.generate(1, (index) {
                            return PopupMenuItem(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FloatingActionButton.extended(
                                      heroTag: 'addPowt3winwrHv',
                                      onPressed: () {
                                        Navigator.popAndPushNamed(
                                            context, '/add_POWT3WIN_wrHv',
                                            arguments: {
                                              'TrNo': ntr.trNo,
                                              'POWT3WIN_ID': ntr.id,
                                              'serialno': ntr.serialNo,
                                              'powt3winDatabaseID':
                                                  ntr.databaseID,
                                              'trDatabaseID':
                                                  args['trDatabaseID'],
                                            });
                                      },
                                      label: const Text('HV Winding',
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
                                      heroTag: 'addPowt3winwrLv',
                                      onPressed: () {
                                        Navigator.popAndPushNamed(
                                            context, '/add_POWT3WIN_wrLv',
                                            arguments: {
                                              'TrNo': ntr.trNo,
                                              'POWT3WIN_ID': ntr.id,
                                              'serialno': ntr.serialNo,
                                              'powt3winDatabaseID':
                                                  ntr.databaseID,
                                              'trDatabaseID':
                                                  args['trDatabaseID'],
                                            });
                                      },
                                      label: const Text('LV Winding',
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
                                      heroTag: 'addPowt3winwrIvT',
                                      onPressed: () {
                                        Navigator.popAndPushNamed(
                                            context, '/add_POWT3WIN_wrIvT',
                                            arguments: {
                                              'TrNo': ntr.trNo,
                                              'POWT3WIN_ID': ntr.id,
                                              'serialno': ntr.serialNo,
                                              'powt3winDatabaseID':
                                                  ntr.databaseID,
                                              'trDatabaseID':
                                                  args['trDatabaseID'],
                                            });
                                      },
                                      label: const Text(
                                          'Tertiary Winding \n/IV Winding',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      icon: const Icon(Icons.add,
                                          color: Colors.white),
                                    ),
                                  ),
                                ]));
                          });
                        }),

                    // -----------------------------------------------------------

                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton.extended(
                        heroTag: 'addPowt3winr',
                        onPressed: () {
                          Navigator.popAndPushNamed(context, '/add_POWT3WIN_r',
                              arguments: {
                                'TrNo': ntr.trNo,
                                'POWT3WIN_ID': ntr.id,
                                'serialno': ntr.serialNo,
                                'powt3winDatabaseID': ntr.databaseID,
                                'trDatabaseID': args['trDatabaseID'],
                              });
                        },
                        label: const Text('Ratio Test',
                            style:
                                TextStyle(fontSize: 10, color: Colors.white)),
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),

                    // --------------------------------------------------------

                    PopupMenuButton(
                        child: FloatingActionButton.extended(
                          label: Text(
                            'Magnetizing Current Test',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          icon: const Icon(Icons.add, color: Colors.white),
                        ),
                        itemBuilder: (context) {
                          return List.generate(1, (index) {
                            return PopupMenuItem(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FloatingActionButton.extended(
                                      heroTag: 'addPowt3winmcHv',
                                      onPressed: () {
                                        Navigator.popAndPushNamed(
                                            context, '/add_POWT3WIN_mcHv',
                                            arguments: {
                                              'TrNo': ntr.trNo,
                                              'POWT3WIN_ID': ntr.id,
                                              'serialno': ntr.serialNo,
                                              'powt3winDatabaseID':
                                                  ntr.databaseID,
                                              'trDatabaseID':
                                                  args['trDatabaseID'],
                                            });
                                      },
                                      label: const Text('HV Side ',
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
                                      heroTag: 'addPowt3winmcLv',
                                      onPressed: () {
                                        Navigator.popAndPushNamed(
                                            context, '/add_POWT3WIN_mcLv',
                                            arguments: {
                                              'TrNo': ntr.trNo,
                                              'POWT3WIN_ID': ntr.id,
                                              'serialno': ntr.serialNo,
                                              'powt3winDatabaseID':
                                                  ntr.databaseID,
                                              'trDatabaseID':
                                                  args['trDatabaseID'],
                                            });
                                      },
                                      label: const Text('LV Side ',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      icon: const Icon(Icons.add,
                                          color: Colors.white),
                                    ),
                                  ),

                                  //---------------------------------------------------------

                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FloatingActionButton.extended(
                                      heroTag: 'addPowt3winmcIvT',
                                      onPressed: () {
                                        Navigator.popAndPushNamed(
                                            context, '/add_POWT3WIN_mcIvT',
                                            arguments: {
                                              'TrNo': ntr.trNo,
                                              'POWT3WIN_ID': ntr.id,
                                              'serialno': ntr.serialNo,
                                              'powt3winDatabaseID':
                                                  ntr.databaseID,
                                              'trDatabaseID':
                                                  args['trDatabaseID'],
                                            });
                                      },
                                      label: const Text(
                                          'TTertiary Side\n/IV Side',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      icon: const Icon(Icons.add,
                                          color: Colors.white),
                                    ),
                                  ),
                                ]));
                          });
                        }),

                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: FloatingActionButton.extended(
                        heroTag: 'addPowt3winmbHv',
                        onPressed: () {
                          Navigator.popAndPushNamed(context, '/add_POWT3WIN_mb',
                              arguments: {
                                'TrNo': ntr.trNo,
                                'POWT3WIN_ID': ntr.id,
                                'serialno': ntr.serialNo,
                                'powt3winDatabaseID': ntr.databaseID,
                                'trDatabaseID': args['trDatabaseID'],
                              });
                        },
                        label: Text('Magnetic Balance Test',
                            style:
                                TextStyle(fontSize: 10, color: Colors.white)),
                        icon: Icon(Icons.add, color: Colors.white),
                      ),
                    ),

                    // ---------------------------------------------------------

                    PopupMenuButton(
                        child: FloatingActionButton.extended(
                          label: Text(
                            'Short Circuit Test',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          icon: const Icon(Icons.add, color: Colors.white),
                        ),
                        itemBuilder: (context) {
                          return List.generate(1, (index) {
                            return PopupMenuItem(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FloatingActionButton.extended(
                                      heroTag: 'addPowt3winschvivt',
                                      onPressed: () {
                                        Navigator.popAndPushNamed(
                                            context, '/add_POWT3WIN_schvivt',
                                            arguments: {
                                              'TrNo': ntr.trNo,
                                              'POWT3WIN_ID': ntr.id,
                                              'serialno': ntr.serialNo,
                                              'powt3winDatabaseID':
                                                  ntr.databaseID,
                                              'trDatabaseID':
                                                  args['trDatabaseID'],
                                            });
                                      },
                                      label: const Text('HV-IV/Tertiary Side',
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
                                      heroTag: 'addPowt3winschvIv',
                                      onPressed: () {
                                        Navigator.popAndPushNamed(
                                            context, '/add_POWT3WIN_schvlv',
                                            arguments: {
                                              'TrNo': ntr.trNo,
                                              'POWT3WIN_ID': ntr.id,
                                              'serialno': ntr.serialNo,
                                              'powt3winDatabaseID':
                                                  ntr.databaseID,
                                              'trDatabaseID':
                                                  args['trDatabaseID'],
                                            });
                                      },
                                      label: const Text('HV-LV Side',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      icon: const Icon(Icons.add,
                                          color: Colors.white),
                                    ),
                                  ),
                                ]));
                          });
                        }),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Function dialog_box_action(BuildContext context) {
    return (() {
      getX((Powt3WindingProvider x) => x.deletePowt3Winding(args['id']));
      Navigator.pop(context);
    });
  }

  ReadMoreDisplay_powt3Winding_details(Powt3WindingModel ntr) {
    var gotdate = DateFormat('dd-MM-yyyy').format(ntr.dateOfTesting).toString();

    return 'DBID : ' +
        ntr.databaseID.toString() +
        '\n' +
        'etype : ' +
        ntr.etype +
        '\n' +
        'trNo : ' +
        ntr.trNo.toString() +
        '\n' +
        'designation : ' +
        ntr.designation +
        '\n' +
        'location : ' +
        ntr.location +
        '\n' +
        'serialNo : ' +
        ntr.serialNo +
        '\n' +
        'rating : ' +
        ntr.rating +
        '\n' +
        'ratedVoltage_HV : ' +
        ntr.ratedVoltage_HV.toString() +
        '\n' +
        'ratedVoltage_LV : ' +
        ntr.ratedVoltage_LV.toString() +
        '\n' +
        'ratedCurrent_HV : ' +
        ntr.ratedCurrent_HV +
        '\n' +
        'ratedCurrent_LV : ' +
        ntr.ratedCurrent_LV +
        '\n' +
        'ratedCurrent_TS : ' +
        ntr.ratedCurrent_TS.toString() +
        '\n' +
        'ratedVoltage_TS : ' +
        ntr.ratedVoltage_TS.toString() +
        '\n' +
        'vectorGroup : ' +
        ntr.vectorGroup +
        '\n' +
        'impedanceVoltageLTap : ' +
        ntr.impedanceVoltageLTap.toString() +
        '\n' +
        'impedanceVoltageRTap : ' +
        ntr.impedanceVoltageRTap.toString() +
        '\n' +
        'impedanceVoltageHTap : ' +
        ntr.impedanceVoltageHTap.toString() +
        '\n' +
        'frequency : ' +
        ntr.frequency.toString() +
        '\n' +
        'typeOfCooling : ' +
        ntr.typeOfCooling +
        '\n' +
        'noOfPhases : ' +
        ntr.noOfPhases.toString() +
        '\n' +
        'make : ' +
        ntr.make +
        '\n' +
        'yom : ' +
        ntr.yom.toString() +
        '\n' +
        'noOfTaps : ' +
        ntr.noOfTaps.toString() +
        '\n' +
        'onOfNominalTaps : ' +
        ntr.onOfNominalTaps.toString() +
        '\n' +
        'oilTemp : ' +
        ntr.oilTemp.toString() +
        '\n' +
        'windingTemp : ' +
        ntr.windingTemp.toString() +
        '\n' +
        'ambientTemp : ' +
        ntr.ambientTemp.toString() +
        '\n' +
        ' dateOfTesting : ' +
        gotdate +
        '\n' +
        'testedBy : ' +
        ntr.testedBy +
        '\n' +
        'verifiedBy : ' +
        ntr.verifiedBy +
        '\n' +
        'WitnessedBy : ' +
        ntr.WitnessedBy +
        '\n';
  }

  // ReadMoreDisplay_CT_details2(CTModel ntr) {
  //   return TextSelection();
  // }

  display_Powt3Winding_details(Powt3WindingModel ntr) {
    return Container(
      alignment: Alignment.center,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.fromLTRB(80, 10, 80, 10),
          child: ReadMoreText(
            ReadMoreDisplay_powt3Winding_details(ntr),
            trimLines: 6,
            textAlign: TextAlign.center,
            trimMode: TrimMode.Line,
            trimCollapsedText: " \n\nShow More... ",
            trimExpandedText: " \nShow Less ",
            delimiter: '',
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red[700],
            ),
            moreStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green[700],
            ),
            style: TextStyle(
                fontSize: 12,
                height: 1.3,
                fontWeight: FontWeight.w400,
                letterSpacing: 1),
          ),
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: [
            Expanded(
              child: AlertDialog(
                title: const Text('Alert'),
                content: const Text('Do you want to delete?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      getX((Powt3WindingProvider x) =>
                          x.deletePowt3Winding(args['id']));
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'YES',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'NO',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  generate_list_of_Powt3winIR(Powt3WindingModel ntr) {
    getX((Powt3winIRProvider x) => x.getPowt3winIRBySerialNo(ntr.serialNo));
    final List<Powt3winIRModel> reports =
        watchOnly((Powt3winIRProvider x) => x.powt3winIR_serialNoList);

    getX((Powt3WindingProvider x) => x.getPowt3WindingLocalData());
    final List<Powt3WindingModel> reportsForArgsfrom_Powt3winmodel =
        watchOnly((Powt3WindingProvider x) => x.powt3WindinglocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((Powt3winIRProvider x) => x.getPowt3winEquipmentList());
    final List<Powt3winIRModel> reportsFormPowt3winLocalData =
        watchOnly((Powt3winIRProvider x) => x.powt3winIR_localdataList);

    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return GestureDetector(
            onTap: () async {
              DataConnectionStatus status = await CheckInternet();
              if (status == DataConnectionStatus.connected) {
                for (var i in reportsFormPowt3winLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_Powt3winmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(argsSerialNo); // current serial Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                // add to remote database
                                var url = Uri.parse(
                                    '${Env.URL_PREFIX}/powt3wIrTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                  'hvE_60': i.hvE_60.toString(),
                                  'hvE_600': i.hvE_600.toString(),
                                  'hvLv_60': i.hvLv_60.toString(),
                                  'hvLv_600': i.hvLv_600.toString(),
                                  'hvT_60': i.hvT_60.toString(),
                                  'hvT_600': i.hvT_600.toString(),
                                  'lvE_60': i.lvE_60.toString(),
                                  'lvE_600': i.lvE_600.toString(),
                                  'lvT_60': i.lvT_60.toString(),
                                  'lvT_600': i.lvT_600.toString(),
                                  'tE_60': i.tE_60.toString(),
                                  'tE_600': i.tE_600.toString(),
                                  'cF_60': i.cF_60.toString(),
                                  'cT_60': i.cT_60.toString(),
                                  'fT_60': i.fT_60.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<Powt3winIRProvider>().updatePowt3winIR(
                                      Powt3winIRModel(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        hvE_60: i.hvE_60,
                                        hvE_600: i.hvE_600,
                                        hvLv_60: i.hvLv_60,
                                        hvLv_600: i.hvLv_600,
                                        hvT_60: i.hvT_60,
                                        hvT_600: i.hvT_600,
                                        lvE_60: i.lvE_60,
                                        lvE_600: i.lvE_600,
                                        lvT_60: i.lvT_60,
                                        lvT_600: i.lvT_600,
                                        tE_60: i.tE_60,
                                        tE_600: i.tE_600,
                                        cF_60: i.cF_60,
                                        cT_60: i.cT_60,
                                        fT_60: i.fT_60,
                                        equipmentUsed: i.equipmentUsed,
                                        databaseID:
                                            json.decode(value.body)['id'],
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
                    }
                  }
                }

                // ----------------------------------------------------------
                Navigator.pushNamed(context, '/detail_POWT3WIN_ir', arguments: {
                  'id': report.id,
                  'POWT3WIN_ID': ntr.databaseID,
                  'serialno': ntr.serialNo,
                  'powt3winDatabaseID': args['powt3winDatabaseID'],
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_POWT3WIN_ir', arguments: {
                  'id': report.id,
                  'POWT3WIN_ID': ntr.databaseID,
                  'serialno': ntr.serialNo,
                  'powt3winDatabaseID': args['powt3winDatabaseID'],
                  'trDatabaseID': args['trDatabaseID'],
                });
              }
            },
            child: Card(
              color: Colors.white,
              elevation: 2,
              //margin: EdgeInsets.fromLTRB(20, 10, 0, 70),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 50, 5),
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
                              ntr.etype == 'powt3w'
                                  ? const Text(
                                      'Powt3winIR Details ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11.5,
                                          letterSpacing: 1.5),
                                    )
                                  : Container(),
                            ],
                          )
                        : Row(
                            children: [
                              Icon(
                                Icons.circle_rounded,
                                color: Color.fromARGB(255, 9, 230, 9),
                                size: 10.0,
                              ),
                              ntr.etype == 'powt3w'
                                  ? const Text(
                                      'Powt3winIR Details ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11.5,
                                          letterSpacing: 1.5),
                                    )
                                  : Container(),
                            ],
                          ),
                    Text('DBID : ' + report.databaseID.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('trNo : ' + report.trNo.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('serialNo_bph : ' + report.serialNo,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('equipmentUsed : ' + report.equipmentUsed,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  generate_list_of_Powt3wintsc(Powt3WindingModel ntr) {
    getX((Powt3wintscProvider x) => x.getPowt3wintscserialNo(ntr.serialNo));
    final List<Powt3wintscModel> reports =
        watchOnly((Powt3wintscProvider x) => x.powt3wintsc_serialNoList);

    getX((Powt3WindingProvider x) => x.getPowt3WindingLocalData());
    final List<Powt3WindingModel> reportsForArgsfrom_Powt3winmodel =
        watchOnly((Powt3WindingProvider x) => x.powt3WindinglocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((Powt3wintscProvider x) => x.getPowt3wintscEquipmentList());
    final List<Powt3wintscModel> reportsFormPowt3wintscLocalData =
        watchOnly((Powt3wintscProvider x) => x.powt3wintsc_loacaldataList);

    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return GestureDetector(
            onTap: () async {
              DataConnectionStatus status = await CheckInternet();
              if (status == DataConnectionStatus.connected) {
                for (var i in reportsFormPowt3wintscLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_Powt3winmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(argsSerialNo); // current serial Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                var url = Uri.parse(
                                    '${Env.URL_PREFIX}/powt3wTscTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'hv_voltage': i.hv_voltage.toString(),
                                  'hv_current_Onan':
                                      i.hv_current_Onan.toString(),
                                  'hv_current_Onaf':
                                      i.hv_current_Onaf.toString(),
                                  'hv_current_Ofaf':
                                      i.hv_current_Ofaf.toString(),
                                  'tapPosition': i.tapPosition.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<Powt3wintscProvider>().updatePowt3wintsc(
                                      Powt3wintscModel(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        hv_voltage: i.hv_voltage,
                                        hv_current_Onan: i.hv_current_Onan,
                                        hv_current_Onaf: i.hv_current_Onaf,
                                        hv_current_Ofaf: i.hv_current_Ofaf,
                                        equipmentUsed: i.equipmentUsed,
                                        tapPosition: i.tapPosition,
                                        databaseID:
                                            json.decode(value.body)['id'],
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
                    }
                  }
                }

                // ------------------------------------------------------------
                Navigator.pushNamed(context, '/detail_POWT3WIN_tsc',
                    arguments: {
                      'id': report.id,
                      'POWT3WIN_ID': ntr.databaseID,
                      'serialno': ntr.serialNo,
                      'powt3winDatabaseID': args['powt3winDatabaseID'],
                      'trDatabaseID': args['trDatabaseID'],
                    });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_POWT3WIN_tsc',
                    arguments: {
                      'id': report.id,
                      'POWT3WIN_ID': ntr.databaseID,
                      'serialno': ntr.serialNo,
                      'powt3winDatabaseID': args['powt3winDatabaseID'],
                      'trDatabaseID': args['trDatabaseID'],
                    });
              }
            },
            child: Card(
              color: Colors.white,
              elevation: 2,
              //margin: EdgeInsets.fromLTRB(20, 10, 0, 70),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 50, 5),
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
                              ntr.etype == 'powt3w'
                                  ? Text(
                                      'Powt3wintsc Details ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11.5,
                                          letterSpacing: 1.5),
                                    )
                                  : Container(),
                            ],
                          )
                        : Row(
                            children: [
                              Icon(
                                Icons.circle_rounded,
                                color: Color.fromARGB(255, 9, 230, 9),
                                size: 10.0,
                              ),
                              ntr.etype == 'powt3w'
                                  ? Text(
                                      'Powt3wintsc Details ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11.5,
                                          letterSpacing: 1.5),
                                    )
                                  : Container(),
                            ],
                          ),
                    Text('DBID : ' + report.databaseID.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('trNo : ' + report.trNo.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('serialNo: ' + report.serialNo,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('equipmentUsed : ' + report.equipmentUsed,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  generate_list_of_Powt3winwrHv(Powt3WindingModel ntr) {
    getX((Powt3winwrHvProvider x) => x.getPowt3winwrHvserialNo(ntr.serialNo));
    final List<Powt3winwrHvModel> reports =
        watchOnly((Powt3winwrHvProvider x) => x.powt3winwrHv_serialNoList);

    getX((Powt3WindingProvider x) => x.getPowt3WindingLocalData());
    final List<Powt3WindingModel> reportsForArgsfrom_Powt3winmodel =
        watchOnly((Powt3WindingProvider x) => x.powt3WindinglocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((Powt3winwrHvProvider x) => x.getPowt3winwrHvEquipmentList());
    final List<Powt3winwrHvModel> reportsFormPowt3winwrHvLocalData =
        watchOnly((Powt3winwrHvProvider x) => x.powt3winwrHv_loacaldataList);

    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return GestureDetector(
            onTap: () async {
              DataConnectionStatus status = await CheckInternet();
              if (status == DataConnectionStatus.connected) {
                for (var i in reportsFormPowt3winwrHvLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_Powt3winmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(argsSerialNo); // current serial Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                var url = Uri.parse(
                                    '${Env.URL_PREFIX}/powt3wWrHvTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'hv_r_1u_1n': i.hv_r_1u_1n.toString(),
                                  'hv_r_1v_1n': i.hv_r_1v_1n.toString(),
                                  'hv_r_1w_1n': i.hv_r_1w_1n.toString(),
                                  'tapPosition': i.tapPosition.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<Powt3winwrHvProvider>().updatePowt3winwrHv(
                                      Powt3winwrHvModel(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        hv_r_1u_1n: i.hv_r_1u_1n,
                                        hv_r_1v_1n: i.hv_r_1v_1n,
                                        hv_r_1w_1n: i.hv_r_1w_1n,
                                        tapPosition: i.tapPosition,
                                        databaseID:
                                            json.decode(value.body)['id'],
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
                    }
                  }
                }

                // ------------------------------------------------------------
                Navigator.pushNamed(context, '/detail_POWT3WIN_wrHv',
                    arguments: {
                      'id': report.id,
                      'POWT3WIN_ID': report.databaseID,
                      'serialno': ntr.serialNo,
                      'powt3winDatabaseID': ntr.databaseID,
                      'trDatabaseID': args['trDatabaseID'],
                    });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_POWT3WIN_wrHv',
                    arguments: {
                      'id': report.id,
                      'POWT3WIN_ID': report.databaseID,
                      'serialno': ntr.serialNo,
                      'powt3winDatabaseID': ntr.databaseID,
                      'trDatabaseID': args['trDatabaseID'],
                    });
              }
            },
            child: Card(
              color: Colors.white,
              elevation: 2,
              //margin: EdgeInsets.fromLTRB(20, 10, 0, 70),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 50, 5),
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
                              ntr.etype == 'powt3w'
                                  ? const Text(
                                      'Powt3winwrHv Details ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11.5,
                                          letterSpacing: 1.5),
                                    )
                                  : Container(),
                            ],
                          )
                        : Row(
                            children: [
                              Icon(
                                Icons.circle_rounded,
                                color: Color.fromARGB(255, 9, 230, 9),
                                size: 10.0,
                              ),
                              ntr.etype == 'powt3w'
                                  ? const Text(
                                      'Powt3winwrHv Details ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11.5,
                                          letterSpacing: 1.5),
                                    )
                                  : Container(),
                            ],
                          ),
                    Text('DBID : ' + report.databaseID.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('trNo : ' + report.trNo.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('serialNo_bph : ' + report.serialNo,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('tapPosition : ' + report.tapPosition.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  generate_list_of_Powt3winwrIvT(Powt3WindingModel ntr) {
    getX((Powt3winwrIvTProvider x) => x.getPowt3winwrIvTserialNo(ntr.serialNo));
    final List<Powt3winwrIvTModel> reports =
        watchOnly((Powt3winwrIvTProvider x) => x.powt3winwrIvT_serialNoList);

    getX((Powt3WindingProvider x) => x.getPowt3WindingLocalData());
    final List<Powt3WindingModel> reportsForArgsfrom_Powt3winmodel =
        watchOnly((Powt3WindingProvider x) => x.powt3WindinglocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((Powt3winwrIvTProvider x) => x.getPowt3winwrIvtEquipmentList());
    final List<Powt3winwrIvTModel> reportsFormPowt3winwrIvtLocalData =
        watchOnly((Powt3winwrIvTProvider x) => x.powt3winwrIvT_loacaldataList);

    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return GestureDetector(
            onTap: () async {
              DataConnectionStatus status = await CheckInternet();
              if (status == DataConnectionStatus.connected) {
                for (var i in reportsFormPowt3winwrIvtLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_Powt3winmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(argsSerialNo); // current serial Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                var url = Uri.parse(
                                    '${Env.URL_PREFIX}/powt3wWrIvtTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'ivt_r_uvn': i.ivt_r_uvn.toString(),
                                  'ivt_r_vwn': i.ivt_r_vwn.toString(),
                                  'ivt_r_wun': i.ivt_r_wun.toString(),
                                  'tapPosition': i.tapPosition.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<Powt3winwrIvTProvider>()
                                      .updatePowt3winwrIvT(
                                          Powt3winwrIvTModel(
                                            id: i.id,
                                            trNo: i.trNo,
                                            serialNo: i.serialNo,
                                            ivt_r_uvn: i.ivt_r_uvn,
                                            ivt_r_vwn: i.ivt_r_vwn,
                                            ivt_r_wun: i.ivt_r_wun,
                                            tapPosition: i.tapPosition,
                                            databaseID:
                                                json.decode(value.body)['id'],
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
                    }
                  }
                }
                // --------------------------------------------------
                Navigator.pushNamed(context, '/detail_POWT3WIN_wrIvT',
                    arguments: {
                      'id': report.id,
                      'POWT3WIN_ID': report.databaseID,
                      'serialno': ntr.serialNo,
                      'powt3winDatabaseID': ntr.databaseID,
                      //args['powt3winDatabaseID'],
                      'trDatabaseID': args['trDatabaseID'],
                    });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_POWT3WIN_wrIvT',
                    arguments: {
                      'id': report.id,
                      'POWT3WIN_ID': report.databaseID,
                      'serialno': ntr.serialNo,
                      'powt3winDatabaseID': ntr.databaseID,
                      //args['powt3winDatabaseID'],
                      'trDatabaseID': args['trDatabaseID'],
                    });
              }
            },
            child: Card(
              color: Colors.white,
              elevation: 2,
              //margin: EdgeInsets.fromLTRB(20, 10, 0, 70),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 50, 5),
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
                              ntr.etype == 'powt3w'
                                  ? const Text(
                                      'Powt3winwrIvT Details ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11.5,
                                          letterSpacing: 1.5),
                                    )
                                  : Container(),
                            ],
                          )
                        : Row(
                            children: [
                              Icon(
                                Icons.circle_rounded,
                                color: Color.fromARGB(255, 9, 230, 9),
                                size: 10.0,
                              ),
                              ntr.etype == 'powt3w'
                                  ? const Text(
                                      'Powt3winwrIvT Details ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11.5,
                                          letterSpacing: 1.5),
                                    )
                                  : Container(),
                            ],
                          ),
                    Text('DBID : ' + report.databaseID.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('trNo : ' + report.trNo.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('serialNo_bph : ' + report.serialNo,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('tapPosition : ' + report.tapPosition.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  generate_list_of_Powt3winwrLv(Powt3WindingModel ntr) {
    getX((Powt3winwrLvProvider x) => x.getPowt3winwrLvserialNo(ntr.serialNo));
    final List<Powt3winwrLvModel> reports =
        watchOnly((Powt3winwrLvProvider x) => x.powt3winwrLv_serialNoList);

    getX((Powt3WindingProvider x) => x.getPowt3WindingLocalData());
    final List<Powt3WindingModel> reportsForArgsfrom_Powt3winmodel =
        watchOnly((Powt3WindingProvider x) => x.powt3WindinglocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((Powt3winwrLvProvider x) => x.getPowt3winwrlvEquipmentList());
    final List<Powt3winwrLvModel> reportsFormPowt3winwrlvLocalData =
        watchOnly((Powt3winwrLvProvider x) => x.powt3winwrLv_loacaldataList);

    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return GestureDetector(
            onTap: () async {
              DataConnectionStatus status = await CheckInternet();
              if (status == DataConnectionStatus.connected) {
                for (var i in reportsFormPowt3winwrlvLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_Powt3winmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(argsSerialNo); // current serial Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                var url = Uri.parse(
                                    '${Env.URL_PREFIX}/powt3wWrLvTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'lv_r_uv': i.lv_r_uv.toString(),
                                  'lv_r_vw': i.lv_r_vw.toString(),
                                  'lv_r_wu': i.lv_r_wu.toString(),
                                  'tapPosition': i.tapPosition.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<Powt3winwrLvProvider>().updatePowt3winwrLv(
                                      Powt3winwrLvModel(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        lv_r_uv: i.lv_r_uv,
                                        lv_r_vw: i.lv_r_vw,
                                        lv_r_wu: i.lv_r_wu,
                                        equipmentUsed: i.equipmentUsed,
                                        tapPosition: i.tapPosition,
                                        databaseID:
                                            json.decode(value.body)['id'],
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
                    }
                  }
                }

                // -------------------------------------------------
                Navigator.pushNamed(context, '/detail_POWT3WIN_wrLv',
                    arguments: {
                      'id': report.id,
                      'POWT3WIN_ID': report.databaseID,
                      'serialno': ntr.serialNo,
                      'powt3winDatabaseID': ntr.databaseID,
                      'trDatabaseID': args['trDatabaseID'],
                    });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_POWT3WIN_wrLv',
                    arguments: {
                      'id': report.id,
                      'POWT3WIN_ID': report.databaseID,
                      'serialno': ntr.serialNo,
                      'powt3winDatabaseID': ntr.databaseID,
                      'trDatabaseID': args['trDatabaseID'],
                    });
              }
            },
            child: Card(
              color: Colors.white,
              elevation: 2,
              //margin: EdgeInsets.fromLTRB(20, 10, 0, 70),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 50, 5),
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
                              ntr.etype == 'powt3w'
                                  ? const Text(
                                      'Powt3winwrLv Details ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11.5,
                                          letterSpacing: 1.5),
                                    )
                                  : Container(),
                            ],
                          )
                        : Row(
                            children: [
                              Icon(
                                Icons.circle_rounded,
                                color: Color.fromARGB(255, 9, 230, 9),
                                size: 10.0,
                              ),
                              ntr.etype == 'powt3w'
                                  ? const Text(
                                      'Powt3winwrLv Details ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11.5,
                                          letterSpacing: 1.5),
                                    )
                                  : Container(),
                            ],
                          ),
                    Text('DBID : ' + report.databaseID.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('trNo : ' + report.trNo.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('serialNo_bph : ' + report.serialNo,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('tapPosition : ' + report.tapPosition.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  generate_list_of_Powt3winr(Powt3WindingModel ntr) {
    getX((Powt3win_R_Provider x) => x.getPowt3winrserialNo(ntr.serialNo));
    final List<Powt3win_R_Model> reports =
        watchOnly((Powt3win_R_Provider x) => x.powt3win_R_serialNoList);

    getX((Powt3WindingProvider x) => x.getPowt3WindingLocalData());
    final List<Powt3WindingModel> reportsForArgsfrom_Powt3winmodel =
        watchOnly((Powt3WindingProvider x) => x.powt3WindinglocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((Powt3win_R_Provider x) => x.getpowt3winREquipmentList());
    final List<Powt3win_R_Model> reportsFormPowt3winRLocalData =
        watchOnly((Powt3win_R_Provider x) => x.powt3win_R_loacaldataList);

    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return GestureDetector(
            onTap: () async {
              DataConnectionStatus status = await CheckInternet();
              if (status == DataConnectionStatus.connected) {
                for (var i in reportsFormPowt3winRLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_Powt3winmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(argsSerialNo); // current serial Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                var url =
                                    Uri.parse('${Env.URL_PREFIX}/powt3wRTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'hv_1u_1vn': i.hv_1u_1vn.toString(),
                                  'hv_1v_1wn': i.hv_1v_1wn.toString(),
                                  'hv_1w_1un': i.hv_1w_1un.toString(),
                                  'lv_uvn': i.lv_uvn.toString(),
                                  'lv_vwn': i.lv_vwn.toString(),
                                  'lv_wun': i.lv_wun.toString(),
                                  'ivt_uvn': i.ivt_uvn.toString(),
                                  'ivt_vwn': i.ivt_vwn.toString(),
                                  'ivt_wun': i.ivt_wun.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                  'tapPosition': i.tapPosition.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<Powt3win_R_Provider>().updatePowt3winr(
                                      Powt3win_R_Model(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        hv_1u_1vn: i.hv_1u_1vn,
                                        hv_1v_1wn: i.hv_1v_1wn,
                                        hv_1w_1un: i.hv_1w_1un,
                                        lv_uvn: i.lv_uvn,
                                        lv_vwn: i.lv_vwn,
                                        lv_wun: i.lv_wun,
                                        ivt_uvn: i.ivt_uvn,
                                        ivt_vwn: i.ivt_vwn,
                                        ivt_wun: i.ivt_wun,
                                        tapPosition: i.tapPosition,
                                        equipmentUsed: i.equipmentUsed,
                                        databaseID:
                                            json.decode(value.body)['id'],
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
                    }
                  }
                }

                // ----------------------------------------------
                Navigator.pushNamed(context, '/detail_POWT3WIN_r', arguments: {
                  'id': report.id,
                  'POWT3WIN_ID': report.databaseID,
                  'serialno': ntr.serialNo,
                  'powt3winDatabaseID': ntr.databaseID,
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_POWT3WIN_r', arguments: {
                  'id': report.id,
                  'POWT3WIN_ID': report.databaseID,
                  'serialno': ntr.serialNo,
                  'powt3winDatabaseID': ntr.databaseID,
                  'trDatabaseID': args['trDatabaseID'],
                });
              }
            },
            child: Card(
              color: Colors.white,
              elevation: 2,
              //margin: EdgeInsets.fromLTRB(20, 10, 0, 70),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 50, 5),
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
                              ntr.etype == 'powt3w'
                                  ? const Text(
                                      'Powt3win R Details ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11.5,
                                          letterSpacing: 1.5),
                                    )
                                  : Container(),
                            ],
                          )
                        : Row(
                            children: [
                              Icon(
                                Icons.circle_rounded,
                                color: Color.fromARGB(255, 9, 230, 9),
                                size: 10.0,
                              ),
                              ntr.etype == 'powt3w'
                                  ? const Text(
                                      'Powt3win R Details ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11.5,
                                          letterSpacing: 1.5),
                                    )
                                  : Container(),
                            ],
                          ),
                    Text('DBID : ' + report.databaseID.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('trNo : ' + report.trNo.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('serialNo_bph : ' + report.serialNo,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('tapPosition : ' + report.tapPosition.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  generate_list_of_Powt3winmcHv(Powt3WindingModel ntr) {
    getX(
        (Powt3win_mcHv_Provider x) => x.getPowt3win_mcHvserialNo(ntr.serialNo));
    final List<Powt3win_mcHv_Model> reports =
        watchOnly((Powt3win_mcHv_Provider x) => x.powt3win_mcHv_serialNoList);

    getX((Powt3WindingProvider x) => x.getPowt3WindingLocalData());
    final List<Powt3WindingModel> reportsForArgsfrom_Powt3winmodel =
        watchOnly((Powt3WindingProvider x) => x.powt3WindinglocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((Powt3win_mcHv_Provider x) => x.getpowt3winmchvEquipmentList());
    final List<Powt3win_mcHv_Model> reportsFormPowt3winmchvLocalData =
        watchOnly((Powt3win_mcHv_Provider x) => x.powt3win_mcHv_loacaldataList);

    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return GestureDetector(
            onTap: () async {
              DataConnectionStatus status = await CheckInternet();
              if (status == DataConnectionStatus.connected) {
                for (var i in reportsFormPowt3winmchvLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_Powt3winmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(argsSerialNo); // current serial Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                var url = Uri.parse(
                                    '${Env.URL_PREFIX}/powt3wMcHvTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'hv_1u_1vn': i.hv_1u_1vn.toString(),
                                  'hv_1v_1wn': i.hv_1v_1wn.toString(),
                                  'hv_1w_1un': i.hv_1w_1un.toString(),
                                  'hv_1u': i.hv_1u.toString(),
                                  'hv_1v': i.hv_1v.toString(),
                                  'hv_1w': i.hv_1w.toString(),
                                  'hv_1n': i.hv_1n.toString(),
                                  'tapPosition': i.tapPosition.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<Powt3win_mcHv_Provider>()
                                      .updatePowt3win_mcHv(
                                          Powt3win_mcHv_Model(
                                            id: i.id,
                                            trNo: i.trNo,
                                            serialNo: i.serialNo,
                                            hv_1u_1vn: i.hv_1u_1vn,
                                            hv_1v_1wn: i.hv_1v_1wn,
                                            hv_1w_1un: i.hv_1w_1un,
                                            hv_1u: i.hv_1u,
                                            hv_1v: i.hv_1v,
                                            hv_1w: i.hv_1w,
                                            hv_1n: i.hv_1n,
                                            tapPosition: i.tapPosition,
                                            databaseID:
                                                json.decode(value.body)['id'],
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
                    }
                  }
                }

                // -------------------------------------------------
                Navigator.pushNamed(context, '/detail_POWT3WIN_mcHv',
                    arguments: {
                      'id': report.id,
                      'POWT3WIN_ID': report.databaseID,
                      'serialno': ntr.serialNo,
                      'powt3winDatabaseID': ntr.databaseID,
                      'trDatabaseID': args['trDatabaseID'],
                    });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_POWT3WIN_mcHv',
                    arguments: {
                      'id': report.id,
                      'POWT3WIN_ID': report.databaseID,
                      'serialno': ntr.serialNo,
                      'powt3winDatabaseID': ntr.databaseID,
                      'trDatabaseID': args['trDatabaseID'],
                    });
              }
            },
            child: Card(
              color: Colors.white,
              elevation: 2,
              //margin: EdgeInsets.fromLTRB(20, 10, 0, 70),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 50, 5),
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
                              ntr.etype == 'powt3w'
                                  ? const Text(
                                      'Powt3winmcHv Details ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11.5,
                                          letterSpacing: 1.5),
                                    )
                                  : Container(),
                            ],
                          )
                        : Row(
                            children: [
                              Icon(
                                Icons.circle_rounded,
                                color: Color.fromARGB(255, 9, 230, 9),
                                size: 10.0,
                              ),
                              ntr.etype == 'powt3w'
                                  ? const Text(
                                      'Powt3winmcHv Details ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11.5,
                                          letterSpacing: 1.5),
                                    )
                                  : Container(),
                            ],
                          ),
                    Text('DBID : ' + report.databaseID.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('trNo : ' + report.trNo.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('serialNo : ' + report.serialNo,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('tapPosition : ' + report.tapPosition.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  generate_list_of_Powt3winmcLv(Powt3WindingModel ntr) {
    getX(
        (Powt3win_mcLv_Provider x) => x.getPowt3win_mcLvserialNo(ntr.serialNo));
    final List<Powt3win_mcLv_Model> reports =
        watchOnly((Powt3win_mcLv_Provider x) => x.powt3win_mcLv_serialNoList);

    getX((Powt3WindingProvider x) => x.getPowt3WindingLocalData());
    final List<Powt3WindingModel> reportsForArgsfrom_Powt3winmodel =
        watchOnly((Powt3WindingProvider x) => x.powt3WindinglocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((Powt3win_mcLv_Provider x) => x.getPowt3winmclvEquipmentList());
    final List<Powt3win_mcLv_Model> reportsFormPowt3winmclvLocalData =
        watchOnly((Powt3win_mcLv_Provider x) => x.powt3win_mcLv_loacaldataList);

    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return GestureDetector(
            onTap: () async {
              DataConnectionStatus status = await CheckInternet();
              if (status == DataConnectionStatus.connected) {
                for (var i in reportsFormPowt3winmclvLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_Powt3winmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(argsSerialNo); // current serial Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                var url = Uri.parse(
                                    '${Env.URL_PREFIX}/powt3wMcLvTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'lv_u_vn': i.lv_u_vn.toString(),
                                  'lv_v_wn': i.lv_v_wn.toString(),
                                  'lv_w_un': i.lv_w_un.toString(),
                                  'lv_u': i.lv_u.toString(),
                                  'lv_v': i.lv_v.toString(),
                                  'lv_w': i.lv_w.toString(),
                                  'lv_n': i.lv_n.toString(),
                                  'tapPosition': i.tapPosition.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<Powt3win_mcLv_Provider>()
                                      .updatePowt3win_mcLv(
                                          Powt3win_mcLv_Model(
                                            id: i.id,
                                            trNo: i.trNo,
                                            serialNo: i.serialNo,
                                            lv_u_vn: i.lv_u_vn,
                                            lv_v_wn: i.lv_v_wn,
                                            lv_w_un: i.lv_w_un,
                                            lv_u: i.lv_u,
                                            lv_v: i.lv_v,
                                            lv_w: i.lv_w,
                                            lv_n: i.lv_n,
                                            tapPosition: i.tapPosition,
                                            databaseID:
                                                json.decode(value.body)['id'],
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
                    }
                  }
                }

                // ------------------------------------------------------------
                Navigator.pushNamed(context, '/detail_POWT3WIN_mcLv',
                    arguments: {
                      'id': report.id,
                      'POWT3WIN_ID': report.databaseID,
                      'serialno': ntr.serialNo,
                      'powt3winDatabaseID': ntr.databaseID,
                      'trDatabaseID': args['trDatabaseID'],
                    });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_POWT3WIN_mcLv',
                    arguments: {
                      'id': report.id,
                      'POWT3WIN_ID': report.databaseID,
                      'serialno': ntr.serialNo,
                      'powt3winDatabaseID': ntr.databaseID,
                      'trDatabaseID': args['trDatabaseID'],
                    });
              }
            },
            child: Card(
              color: Colors.white,
              elevation: 2,
              //margin: EdgeInsets.fromLTRB(20, 10, 0, 70),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 50, 5),
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
                              ntr.etype == 'powt3w'
                                  ? const Text(
                                      'Powt3winmcLv Details ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11.5,
                                          letterSpacing: 1.5),
                                    )
                                  : Container(),
                            ],
                          )
                        : Row(
                            children: [
                              Icon(
                                Icons.circle_rounded,
                                color: Color.fromARGB(255, 9, 230, 9),
                                size: 10.0,
                              ),
                              ntr.etype == 'powt3w'
                                  ? const Text(
                                      'Powt3winmcLv Details ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11.5,
                                          letterSpacing: 1.5),
                                    )
                                  : Container(),
                            ],
                          ),
                    Text('DBID : ' + report.databaseID.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('trNo : ' + report.trNo.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('serialNo_bph : ' + report.serialNo,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('tapPosition : ' + report.tapPosition.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  generate_list_of_Powt3winmcIvT(Powt3WindingModel ntr) {
    getX((Powt3winmcIvTProvider x) => x.getPowt3winmcIvTserialNo(ntr.serialNo));
    final List<Powt3winmcIvTModel> reports =
        watchOnly((Powt3winmcIvTProvider x) => x.powt3winmcIvTserialNoList);

    getX((Powt3WindingProvider x) => x.getPowt3WindingLocalData());
    final List<Powt3WindingModel> reportsForArgsfrom_Powt3winmodel =
        watchOnly((Powt3WindingProvider x) => x.powt3WindinglocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((Powt3winmcIvTProvider x) => x.getPowt3winmcIvtEquipmentList());
    final List<Powt3winmcIvTModel> reportsFormPowt3winmcIvtLocalData =
        watchOnly((Powt3winmcIvTProvider x) => x.powt3winmcIvTloacaldataList);

    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return GestureDetector(
            onTap: () async {
              DataConnectionStatus status = await CheckInternet();
              if (status == DataConnectionStatus.connected) {
                for (var i in reportsFormPowt3winmcIvtLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_Powt3winmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(argsSerialNo); // current serial Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                var url = Uri.parse(
                                    '${Env.URL_PREFIX}/powt3wMcIvtTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'ivt_u_vn': i.ivt_u_vn.toString(),
                                  'ivt_v_wn': i.ivt_v_wn.toString(),
                                  'ivt_w_un': i.ivt_w_un.toString(),
                                  'ivt_u': i.ivt_u.toString(),
                                  'ivt_v': i.ivt_v.toString(),
                                  'ivt_w': i.ivt_w.toString(),
                                  'ivt_n': i.ivt_n.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                  'tapPosition': i.tapPosition.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<Powt3winmcIvTProvider>()
                                      .updatePowt3winmcIvT(
                                          Powt3winmcIvTModel(
                                            id: i.id,
                                            trNo: i.trNo,
                                            serialNo: i.serialNo,
                                            ivt_u_vn: i.ivt_u_vn,
                                            ivt_v_wn: i.ivt_v_wn,
                                            ivt_w_un: i.ivt_w_un,
                                            ivt_u: i.ivt_u,
                                            ivt_v: i.ivt_v,
                                            ivt_w: i.ivt_w,
                                            ivt_n: i.ivt_n,
                                            tapPosition: i.tapPosition,
                                            equipmentUsed: i.equipmentUsed,
                                            databaseID:
                                                json.decode(value.body)['id'],
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
                    }
                  }
                }

                // ---------------------------------------------------
                Navigator.pushNamed(context, '/detail_POWT3WIN_mcIvT',
                    arguments: {
                      'id': report.id,
                      'POWT3WIN_ID': report.databaseID,
                      'serialno': ntr.serialNo,
                      'powt3winDatabaseID': ntr.databaseID,
                      'trDatabaseID': args['trDatabaseID'],
                    });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_POWT3WIN_mcIvT',
                    arguments: {
                      'id': report.id,
                      'POWT3WIN_ID': report.databaseID,
                      'serialno': ntr.serialNo,
                      'powt3winDatabaseID': ntr.databaseID,
                      'trDatabaseID': args['trDatabaseID'],
                    });
              }
            },
            child: Card(
              color: Colors.white,
              elevation: 2,
              //margin: EdgeInsets.fromLTRB(20, 10, 0, 70),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 50, 5),
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
                              ntr.etype == 'powt3w'
                                  ? const Text(
                                      'Powt3winmcIvT Details ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11.5,
                                          letterSpacing: 1.5),
                                    )
                                  : Container(),
                            ],
                          )
                        : Row(
                            children: [
                              Icon(
                                Icons.circle_rounded,
                                color: Color.fromARGB(255, 9, 230, 9),
                                size: 10.0,
                              ),
                              ntr.etype == 'powt3w'
                                  ? const Text(
                                      'Powt3winmcIvT Details ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11.5,
                                          letterSpacing: 1.5),
                                    )
                                  : Container(),
                            ],
                          ),
                    Text('DBID : ' + report.databaseID.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('trNo : ' + report.trNo.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('serialNo_bph : ' + report.serialNo,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('tapPosition : ' + report.tapPosition.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  generate_list_of_Powt3winschvlv(Powt3WindingModel ntr) {
    getX((Powt3winschvlvProvider x) =>
        x.getPowt3winschvlvserialNo(ntr.serialNo));
    final List<Powt3winschvlvModel> reports =
        watchOnly((Powt3winschvlvProvider x) => x.powt3winschvlvserialNoList);

    getX((Powt3WindingProvider x) => x.getPowt3WindingLocalData());
    final List<Powt3WindingModel> reportsForArgsfrom_Powt3winmodel =
        watchOnly((Powt3WindingProvider x) => x.powt3WindinglocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((Powt3winschvlvProvider x) => x.getPowt3winschvlvEquipmentList());
    final List<Powt3winschvlvModel> reportsFormPowt3winschvlvLocalData =
        watchOnly((Powt3winschvlvProvider x) => x.powt3winschvlvloacaldataList);

    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return GestureDetector(
            onTap: () async {
              DataConnectionStatus status = await CheckInternet();
              if (status == DataConnectionStatus.connected) {
                for (var i in reportsFormPowt3winschvlvLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_Powt3winmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(argsSerialNo); // current serial Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                var url = Uri.parse(
                                    '${Env.URL_PREFIX}/powt3wScHvLvTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'hv_u': i.hv_u.toString(),
                                  'hv_v': i.hv_v.toString(),
                                  'hv_w': i.hv_w.toString(),
                                  'hv_n': i.hv_n.toString(),
                                  'lv_u': i.lv_u.toString(),
                                  'lv_v': i.lv_v.toString(),
                                  'lv_w': i.lv_w.toString(),
                                  'lv_n': i.lv_n.toString(),
                                  'tapPosition': i.tapPosition.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<Powt3winschvlvProvider>()
                                      .updatePowt3winschvlv(
                                          Powt3winschvlvModel(
                                            id: i.id,
                                            trNo: i.trNo,
                                            serialNo: i.serialNo,
                                            hv_u: i.hv_u,
                                            hv_v: i.hv_v,
                                            hv_w: i.hv_w,
                                            hv_n: i.hv_n,
                                            lv_u: i.lv_u,
                                            lv_v: i.lv_v,
                                            lv_w: i.lv_w,
                                            lv_n: i.lv_n,
                                            tapPosition: i.tapPosition,
                                            databaseID:
                                                json.decode(value.body)['id'],
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
                    }
                  }
                }

                // ----------------------------------------------------
                Navigator.pushNamed(context, '/detail_POWT3WIN_schvlv',
                    arguments: {
                      'id': report.id,
                      'POWT3WIN_ID': report.databaseID,
                      'serialno': ntr.serialNo,
                      'powt3winDatabaseID': ntr.databaseID,
                      'trDatabaseID': args['trDatabaseID'],
                    });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_POWT3WIN_schvlv',
                    arguments: {
                      'id': report.id,
                      'POWT3WIN_ID': report.databaseID,
                      'serialno': ntr.serialNo,
                      'powt3winDatabaseID': ntr.databaseID,
                      'trDatabaseID': args['trDatabaseID'],
                    });
              }
            },
            child: Card(
              color: Colors.white,
              elevation: 2,
              //margin: EdgeInsets.fromLTRB(20, 10, 0, 70),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 50, 5),
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
                              ntr.etype == 'powt3w'
                                  ? const Text(
                                      'Powt3winschvlv Details ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11.5,
                                          letterSpacing: 1.5),
                                    )
                                  : Container(),
                            ],
                          )
                        : Row(
                            children: [
                              Icon(
                                Icons.circle_rounded,
                                color: Color.fromARGB(255, 9, 230, 9),
                                size: 10.0,
                              ),
                              ntr.etype == 'powt3w'
                                  ? const Text(
                                      'Powt3winschvlv Details ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11.5,
                                          letterSpacing: 1.5),
                                    )
                                  : Container(),
                            ],
                          ),
                    Text('DBID : ' + report.databaseID.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('trNo : ' + report.trNo.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('serialNo_bph : ' + report.serialNo,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('hv_u : ' + report.hv_u.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  generate_list_of_Powt3winschvivt(Powt3WindingModel ntr) {
    getX((Powt3winschvivtProvider x) =>
        x.getPowt3winschvivtserialNo(ntr.serialNo));
    final List<Powt3winschvivtModel> reports =
        watchOnly((Powt3winschvivtProvider x) => x.powt3winschvivtserialNoList);

    getX((Powt3WindingProvider x) => x.getPowt3WindingLocalData());
    final List<Powt3WindingModel> reportsForArgsfrom_Powt3winmodel =
        watchOnly((Powt3WindingProvider x) => x.powt3WindinglocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((Powt3winschvivtProvider x) => x.getPowt3winschvivtEquipmentList());
    final List<Powt3winschvivtModel> reportsFormPowt3winschvlvtLocalData =
        watchOnly(
            (Powt3winschvivtProvider x) => x.powt3winschvivtloacaldataList);

    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return GestureDetector(
            onTap: () async {
              DataConnectionStatus status = await CheckInternet();
              if (status == DataConnectionStatus.connected) {
                for (var i in reportsFormPowt3winschvlvtLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_Powt3winmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(argsSerialNo); // current serial Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                var url = Uri.parse(
                                    '${Env.URL_PREFIX}/powt3wScHvIvtTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'hv_u': i.hv_u.toString(),
                                  'hv_v': i.hv_v.toString(),
                                  'hv_w': i.hv_w.toString(),
                                  'hv_n': i.hv_n.toString(),
                                  'ivt_u': i.ivt_u.toString(),
                                  'ivt_v': i.ivt_v.toString(),
                                  'ivt_w': i.ivt_w.toString(),
                                  'ivt_n': i.ivt_n.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                  'tapPosition': i.tapPosition.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then(
                                  (value) {
                                    sl<Powt3winschvivtProvider>()
                                        .updatePowt3winschvivt(
                                            Powt3winschvivtModel(
                                              id: i.id,
                                              trNo: i.trNo,
                                              serialNo: i.serialNo,
                                              hv_u: i.hv_u,
                                              hv_v: i.hv_v,
                                              hv_w: i.hv_w,
                                              hv_n: i.hv_n,
                                              ivt_u: i.ivt_u,
                                              ivt_v: i.ivt_v,
                                              ivt_w: i.ivt_w,
                                              ivt_n: i.ivt_n,
                                              tapPosition: i.tapPosition,
                                              equipmentUsed: i.equipmentUsed,
                                              databaseID:
                                                  json.decode(value.body)['id'],
                                              updateDate: DateTime.now(),
                                            ),
                                            report.id);
                                    print(
                                        'Response status: ${value.statusCode}');
                                    print('Response body: ${value.body}');
                                    print('Stored successfully');
                                  },
                                );
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }

                // ----------------------------------------------------
                Navigator.pushNamed(context, '/detail_POWT3WIN_schvivt',
                    arguments: {
                      'id': report.id,
                      'POWT3WIN_ID': report.databaseID,
                      'serialno': ntr.serialNo,
                      'powt3winDatabaseID': ntr.databaseID,
                      'trDatabaseID': args['trDatabaseID'],
                    });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_POWT3WIN_schvivt',
                    arguments: {
                      'id': report.id,
                      'POWT3WIN_ID': report.databaseID,
                      'serialno': ntr.serialNo,
                      'powt3winDatabaseID': ntr.databaseID,
                      'trDatabaseID': args['trDatabaseID'],
                    });
              }
            },
            child: Card(
              color: Colors.white,
              elevation: 2,
              //margin: EdgeInsets.fromLTRB(20, 10, 0, 70),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 50, 5),
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
                              ntr.etype == 'powt3w'
                                  ? const Text(
                                      'Powt3winschvivt Details ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11.5,
                                          letterSpacing: 1.5),
                                    )
                                  : Container(),
                            ],
                          )
                        : Row(
                            children: [
                              Icon(
                                Icons.circle_rounded,
                                color: Color.fromARGB(255, 9, 230, 9),
                                size: 10.0,
                              ),
                              ntr.etype == 'powt3w'
                                  ? const Text(
                                      'Powt3winschvivt Details ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11.5,
                                          letterSpacing: 1.5),
                                    )
                                  : Container(),
                            ],
                          ),
                    Text('DBID : ' + report.databaseID.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('trNo : ' + report.trNo.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('serialNo_bph : ' + report.serialNo,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('hv_u : ' + report.hv_u.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  generate_list_of_Powt3winMBtest(Powt3WindingModel ntr) {
    getX((Powt3win_mb_Provider x) => x.getPowt3win_mbserialNo(ntr.serialNo));
    final List<Powt3win_mb_Model> reports =
        watchOnly((Powt3win_mb_Provider x) => x.powt3win_mb_serialNoList);

    getX((Powt3WindingProvider x) => x.getPowt3WindingLocalData());
    final List<Powt3WindingModel> reportsForArgsfrom_Powt3winmodel =
        watchOnly((Powt3WindingProvider x) => x.powt3WindinglocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((Powt3win_mb_Provider x) => x.getPowt3winMBEquipmentList());
    final List<Powt3win_mb_Model> reportsFormPowt3winMBLocalData =
        watchOnly((Powt3win_mb_Provider x) => x.powt3win_mb_loacaldataList);

    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return GestureDetector(
            onTap: () async {
              DataConnectionStatus status = await CheckInternet();
              if (status == DataConnectionStatus.connected) {
                for (var i in reportsFormPowt3winMBLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_Powt3winmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(argsSerialNo); // current serial Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                var url = Uri.parse(
                                    '${Env.URL_PREFIX}/powt3wMbTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'r_hv_un': i.r_hv_un.toString(),
                                  'r_hv_vn': i.r_hv_vn.toString(),
                                  'r_hv_wn': i.r_hv_wn.toString(),
                                  'y_hv_un': i.y_hv_un.toString(),
                                  'y_hv_vn': i.y_hv_vn.toString(),
                                  'y_hv_wn': i.y_hv_wn.toString(),
                                  'b_hv_un': i.b_hv_un.toString(),
                                  'b_hv_vn': i.b_hv_vn.toString(),
                                  'b_hv_wn': i.b_hv_wn.toString(),
                                  'r_lv_un': i.r_lv_un.toString(),
                                  'r_lv_vn': i.r_lv_vn.toString(),
                                  'r_lv_wn': i.r_lv_wn.toString(),
                                  'y_lv_un': i.y_lv_un.toString(),
                                  'y_lv_vn': i.y_lv_vn.toString(),
                                  'y_lv_wn': i.y_lv_wn.toString(),
                                  'b_lv_un': i.b_lv_un.toString(),
                                  'b_lv_vn': i.b_lv_vn.toString(),
                                  'b_lv_wn': i.b_lv_wn.toString(),
                                  'r_ivt_un': i.r_ivt_un.toString(),
                                  'r_ivt_vn': i.r_ivt_vn.toString(),
                                  'r_ivt_wn': i.r_ivt_wn.toString(),
                                  'y_ivt_un': i.y_ivt_un.toString(),
                                  'y_ivt_vn': i.y_ivt_vn.toString(),
                                  'y_ivt_wn': i.y_ivt_wn.toString(),
                                  'b_ivt_un': i.b_ivt_un.toString(),
                                  'b_ivt_vn': i.b_ivt_vn.toString(),
                                  'b_ivt_wn': i.b_ivt_wn.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<Powt3win_mb_Provider>().updatePowt3win_mb(
                                      Powt3win_mb_Model(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        r_lv_un: i.r_lv_un,
                                        r_lv_vn: i.r_lv_vn,
                                        r_lv_wn: i.r_lv_wn,
                                        y_lv_un: i.y_lv_un,
                                        y_lv_vn: i.y_lv_vn,
                                        y_lv_wn: i.y_lv_wn,
                                        b_lv_un: i.b_lv_un,
                                        b_lv_vn: i.b_lv_vn,
                                        b_lv_wn: i.b_lv_wn,
                                        r_ivt_un: i.r_ivt_un,
                                        r_ivt_vn: i.r_ivt_vn,
                                        r_ivt_wn: i.r_ivt_wn,
                                        y_ivt_un: i.y_ivt_un,
                                        y_ivt_vn: i.y_ivt_vn,
                                        y_ivt_wn: i.y_ivt_wn,
                                        b_ivt_un: i.b_ivt_un,
                                        b_ivt_vn: i.b_ivt_vn,
                                        b_ivt_wn: i.b_ivt_wn,
                                        r_hv_un: i.r_hv_un,
                                        r_hv_vn: i.r_hv_vn,
                                        r_hv_wn: i.r_hv_wn,
                                        y_hv_un: i.y_hv_un,
                                        y_hv_vn: i.y_hv_vn,
                                        y_hv_wn: i.y_hv_wn,
                                        b_hv_un: i.b_hv_un,
                                        b_hv_vn: i.b_hv_vn,
                                        b_hv_wn: i.b_hv_wn,
                                        equipmentUsed: i.equipmentUsed,
                                        databaseID:
                                            json.decode(value.body)['id'],
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
                    }
                  }
                }

                // ----------------------------------------------------
                Navigator.pushNamed(context, '/detail_POWT3WIN_mb', arguments: {
                  'id': report.id,
                  'POWT3WIN_ID': report.databaseID,
                  'serialno': ntr.serialNo,
                  'powt3winDatabaseID': ntr.databaseID,
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_POWT3WIN_mb', arguments: {
                  'id': report.id,
                  'POWT3WIN_ID': report.databaseID,
                  'serialno': ntr.serialNo,
                  'powt3winDatabaseID': ntr.databaseID,
                  'trDatabaseID': args['trDatabaseID'],
                });
              }
            },
            child: Card(
              color: Colors.white,
              elevation: 2,
              //margin: EdgeInsets.fromLTRB(20, 10, 0, 70),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 50, 5),
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
                              ntr.etype == 'powt3w'
                                  ? const Text(
                                      'Powt3winMB Details ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11.5,
                                          letterSpacing: 1.5),
                                    )
                                  : Container(),
                            ],
                          )
                        : Row(
                            children: [
                              Icon(
                                Icons.circle_rounded,
                                color: Color.fromARGB(255, 9, 230, 9),
                                size: 10.0,
                              ),
                              ntr.etype == 'powt3w'
                                  ? const Text(
                                      'Powt3winMB Details ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11.5,
                                          letterSpacing: 1.5),
                                    )
                                  : Container(),
                            ],
                          ),
                    Text('DBID : ' + report.databaseID.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('trNo : ' + report.trNo.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('serialNo_bph : ' + report.serialNo,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('b_hv_un : ' + report.b_hv_un.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
