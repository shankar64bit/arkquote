// ignore_for_file: prefer_const_constructors, missing_return, prefer_interpolation_to_compose_strings, file_names, use_build_context_synchronously
// import 'dart:html';
import 'dart:convert';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/equipmentUsed.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:readmore/readmore.dart';
import '../../../../../env.sample.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/PT/pt_core_model.dart';
import '../../../data/models/equipment/PT/pt_core_r_model.dart';
import '../../../data/models/equipment/PT/pt_core_wr_model.dart';
import '../../../data/models/equipment/PT/pt_ir_model.dart';
import '../../../data/models/equipment/PT/pt_model.dart';
import '../../../data/models/test_report_model.dart';
import '../../providers/equipment_acb_provider/test_report_provider.dart';
import '../../providers/pt_provider/pt_core_provider.dart';
import '../../providers/pt_provider/pt_core_r_provider.dart';
import '../../providers/pt_provider/pt_core_wr_provider.dart';
import '../../providers/pt_provider/pt_ir_provider.dart';
import '../../providers/pt_provider/pt_provider.dart';
import '../dropdown_All/MegaGigaTeraRadioButton/ct_wr_radio_button_page.dart';
import '../dropdown_All/pt_coreName_dropdown.dart';
import '../dropdown_All/responsive_tool/google_sign_in_out/InternetConnChecker.dart';
import '../equipment_acb/detail_test_report_page.dart';

class Detail_PT_Page extends StatelessWidget with GetItMixin {
  Map args = {};
  PTModel ntr;
  int trDbId;
  Detail_PT_Page(@required this.args, {Key key}) : super(key: key);
  var datetime;

  @override
  Widget build(BuildContext context) {
    getX((PTProvider x) => x.getPTByID(args['id']));
    final PTModel ntr = watchOnly((PTProvider x) => x.ptModel);

    var mob = const Text('PT  Details', style: TextStyle(fontSize: 15));
    var desk = const Text('PT  Details', style: TextStyle(fontSize: 20));
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
                  Navigator.popAndPushNamed(context, '/edit_PT', arguments: {
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
                          child: display_PT_details(ntr)),
                      SizedBox(
                          width: 500,
                          height: 100,
                          child: generate_list_of_PT_core(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_PTcoreIR(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_PTcoreWR(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_PTcoreR(ntr)),
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
                          child: display_PT_details(ntr)),
                      SizedBox(
                          width: 350,
                          height: 100,
                          child: generate_list_of_PT_core(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_PTcoreIR(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_PTcoreWR(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_PTcoreR(ntr)),
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
                          heroTag: 'addPTcore',
                          onPressed: () {
                            core_Name_drop().get_CoreName_Default_value();
                            Navigator.popAndPushNamed(context, '/add_PT_core',
                                arguments: {
                                  'TrNo': ntr.trNo,
                                  'PT_ID': ntr.id,
                                  // 'serial_no_bph': ntr.serialNo_Bph,
                                  'ptDatabaseID': ntr.databaseID,
                                  'trDatabaseID': args['trDatabaseID'],
                                });
                          },
                          label: const Text('Add PT core',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white)),
                          icon: const Icon(Icons.add, color: Colors.white),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FloatingActionButton.extended(
                          heroTag: 'addPTcoreIR',
                          onPressed: () {
                            EquipmentTypeList().getEquipUsetoDefaultValue();
                            Navigator.popAndPushNamed(context, '/add_PTcoreIR',
                                arguments: {
                                  'TrNo': ntr.trNo,
                                  'PT_ID': ntr.id,
                                  'serial_no_bph': ntr.serialNo_Bph,
                                  'ptDatabaseID': ntr.databaseID,
                                  'trDatabaseID': args['trDatabaseID'],
                                });
                          },
                          label: const Text('Insulation Resistance Test',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white)),
                          icon: const Icon(Icons.add, color: Colors.white),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FloatingActionButton.extended(
                          heroTag: 'addPTcoreWR',
                          onPressed: () {
                            EquipmentTypeList().getEquipUsetoDefaultValue();
                            Radio_R_1S1_1S2()
                                .get_Radio_R_1S1_1S2_default_value();
                            Radio_R_2S1_2S2()
                                .get_Radio_R_2S1_2S2_default_value();
                            Radio_R_3S1_3S2()
                                .get_Radio_R_3S1_3S2_default_value();

                            Radio_Y_1S1_1S2()
                                .get_Radio_Y_1S1_1S2_default_value();
                            Radio_Y_2S1_2S2()
                                .get_Radio_Y_2S1_2S2_default_value();
                            Radio_Y_3S1_3S2()
                                .get_Radio_Y_3S1_3S2_default_value();

                            Radio_B_1S1_1S2()
                                .get_Radio_B_1S1_1S2_default_value();
                            Radio_B_2S1_2S2()
                                .get_Radio_B_2S1_2S2_default_value();
                            Radio_B_3S1_3S2()
                                .get_Radio_B_3S1_3S2_default_value();

                            Navigator.popAndPushNamed(context, '/add_PTcoreWR',
                                arguments: {
                                  'TrNo': ntr.trNo,
                                  'PT_ID': ntr.id,
                                  'serial_no_bph': ntr.serialNo_Bph,
                                  'ptDatabaseID': ntr.databaseID,
                                  'trDatabaseID': args['trDatabaseID'],
                                });
                          },
                          label: const Text('Winding Resistance Test',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white)),
                          icon: const Icon(Icons.add, color: Colors.white),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FloatingActionButton.extended(
                          heroTag: 'addPTcoreR',
                          onPressed: () {
                            EquipmentTypeList().getEquipUsetoDefaultValue();

                            Navigator.popAndPushNamed(context, '/add_PTcoreR',
                                arguments: {
                                  'TrNo': ntr.trNo,
                                  'PT_ID': ntr.id,
                                  'serial_no_bph': ntr.serialNo_Bph,
                                  'ptDatabaseID': ntr.databaseID,
                                  'trDatabaseID': args['trDatabaseID'],
                                });
                          },
                          label: const Text('Ratio Test',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white)),
                          icon: const Icon(Icons.add, color: Colors.white),
                        )),
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
      getX((PTProvider x) => x.deletePT(args['id']));
      Navigator.pop(context);
    });
  }

  ReadMoreDisplay_PT_details(PTModel ntr) {
    var gotdate = DateFormat('dd-MM-yyyy').format(ntr.dateOfTesting).toString();

    return 'DBID : ' +
        ntr.databaseID.toString() +
        '\n' +
        'Etype : ' +
        ntr.etype +
        '\n' +
        'TrNo : ' +
        ntr.trNo.toString() +
        '\n' +
        'Designation : ' +
        ntr.designation +
        '\n' +
        'Location : ' +
        ntr.location +
        '\n\n' +
        'NAMEPLATE DETAILS' +
        '\n' +
        'serial No-Bph : ' +
        ntr.serialNo_Bph +
        '\n' +
        'serial No-Rph : ' +
        ntr.serialNo_Rph +
        '\n' +
        'serial No-Yph : ' +
        ntr.serialNo_Yph +
        '\n' +
        'Panel : ' +
        ntr.panel +
        '\n' +
        'Make : ' +
        ntr.make +
        '\n' +
        'Ratio(Primary) : ' +
        ntr.pRatio.toString() +
        '\n' +
        'Ratio(Secondary) : ' +
        ntr.sRatio.toString() +
        '\n' +
        'Rated Voltage : ' +
        ntr.ratedVoltage.toString() +
        '\n' +
        'No Of Cores : ' +
        ntr.noOfCores.toString() +
        '\n' +
        'Year of Manufacturing : ' +
        ntr.yom.toString() +
        '\n' +
        'Date Of Test : ' +
        gotdate +
        '\n' +
        'Tested By : ' +
        ntr.testedBy +
        '\n' +
        'Verified By : ' +
        ntr.verifiedBy +
        '\n' +
        'Witnessed By : ' +
        ntr.WitnessedBy +
        '\n';
  }

  display_PT_details(PTModel ntr) {
    return Container(
      alignment: Alignment.center,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(80, 10, 80, 10),
          child: ReadMoreText(
            ReadMoreDisplay_PT_details(ntr),
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
                      getX((PTProvider x) => x.deletePT(args['id']));
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

  generate_list_of_PT_core(PTModel ntr) {
    getX((PT_core_Provider x) => x.getPTcoreByptNoID(ntr.id));
    final List<PT_core_Model> reports =
        watchOnly((PT_core_Provider x) => x.pt_core_ptNoIDList);

    getX((PT_core_Provider x) => x.getPTcoreEquipmentList());
    final List<PT_core_Model> reportsFormLocalData =
        watchOnly((PT_core_Provider x) => x.pt_core_loacaldataList);

    getX((PTProvider x) => x.getPTLocalData());
    final List<PTModel> reportsForArgsPTmodel =
        watchOnly((PTProvider x) => x.ptlocaldataList);

    // -------------------------------------------------------

    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 20, 0),
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
                      var tempvar = i.ptNo;
                      print(tempvar);

                      for (var q in reportsForArgsPTmodel) {
                        if (q.id == tempvar) {
                          var argsDatabaseID = q.databaseID;
                          print(argsDatabaseID);

                          // add to remote database
                          var url =
                              Uri.parse('${Env.URL_PREFIX}/ptCoreDetails/');
                          var response = await http.post(url, body: {
                            'ptNo': argsDatabaseID.toString(),
                            'coreNo': i.coreNo.toString(),
                            'coreName': i.coreName.toString(),
                            'ratio': i.ratio.toString(),
                            'coreClass': i.coreClass.toString(),
                            'burden': i.burden.toString(),
                          }, headers: {
                            'Authorization': 'Bearer $acc_token',
                          }).then((value) {
                            sl<PT_core_Provider>().updatePT_core(
                                PT_core_Model(
                                    id: i.id,
                                    ptNo: i.ptNo,
                                    burden: i.burden,
                                    coreClass: i.coreClass,
                                    coreName: i.coreName,
                                    ratio: i.ratio,
                                    coreNo: i.coreNo,
                                    databaseID: json.decode(value.body)['id'],
                                    updateDate: DateTime.now()),
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

                // ------------------------------------------------------
                Navigator.pushNamed(context, '/detail_PT_core', arguments: {
                  'id': report.id,
                  'PT_ID': ntr.id,
                  'serial_no_bph': ntr.serialNo_Bph,
                  'ptDatabaseID': ntr.databaseID,
                  'trDatabaseID': args['trDatabaseID'],
                });
              }
            },
            child: Card(
              color: Colors.white,
              elevation: 2,
              //margin: EdgeInsets.fromLTRB(20, 10, 0, 70),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 40, 5),
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
                              ntr.etype == 'pt'
                                  ? const Text(
                                      'PTcore Details ',
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
                              ntr.etype == 'pt'
                                  ? const Text(
                                      'PTcore Details ',
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
                    Text('ptNo : ' + report.ptNo.toString(),
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

  generate_list_of_PTcoreIR(PTModel ntr) {
    getX((PTcoreIRProvider x) => x.getPTcoreIR_BySerialNo(ntr.serialNo_Bph));
    final List<PTcoreIRModel> reports =
        watchOnly((PTcoreIRProvider x) => x.ptcoreIR_serialNoList);

    getX((PTProvider x) => x.getPTLocalData());
    final List<PTModel> reportsForArgsfrom_PTmodel =
        watchOnly((PTProvider x) => x.ptlocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((PTcoreIRProvider x) => x.getPTirEquipmentList());
    final List<PTcoreIRModel> reportsFormPTirLocalData =
        watchOnly((PTcoreIRProvider x) => x.ptcoreIR_localdataList);

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
                for (var i in reportsFormPTirLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_PTmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo_Bph;
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                // add to remote database
                                var url =
                                    Uri.parse('${Env.URL_PREFIX}/ptIrTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                  'peR': i.peR.toString(),
                                  'peY': i.peY.toString(),
                                  'peB': i.peB.toString(),
                                  'pc1R': i.pc1R.toString(),
                                  'pc2R': i.pc2R.toString(),
                                  'pc3R': i.pc3R.toString(),
                                  'pc1Y': i.pc1Y.toString(),
                                  'pc2Y': i.pc2Y.toString(),
                                  'pc3Y': i.pc3Y.toString(),
                                  'pc1B': i.pc1B.toString(),
                                  'pc2B': i.pc2B.toString(),
                                  'pc3B': i.pc3B.toString(),
                                  'c1eR': i.c1eR.toString(),
                                  'c2eR': i.c2eR.toString(),
                                  'c3eR': i.c3eR.toString(),
                                  'c1eY': i.c1eY.toString(),
                                  'c2eY': i.c2eY.toString(),
                                  'c3eY': i.c3eY.toString(),
                                  'c1eB': i.c1eB.toString(),
                                  'c2eB': i.c2eB.toString(),
                                  'c3eB': i.c3eB.toString(),
                                  'c1c2R': i.c1c2R.toString(),
                                  'c1c2Y': i.c1c2Y.toString(),
                                  'c1c2B': i.c1c2B.toString(),
                                  'c2c3R': i.c2c3R.toString(),
                                  'c2c3Y': i.c2c3Y.toString(),
                                  'c2c3B': i.c2c3B.toString(),
                                  'clc1R': i.clc1R.toString(),
                                  'clc1Y': i.clc1Y.toString(),
                                  'clc1B': i.clc1B.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<PTcoreIRProvider>().updatePTcoreIR(
                                      PTcoreIRModel(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        peR: i.peR,
                                        peY: i.peY,
                                        peB: i.peB,
                                        pc1R: i.pc1R,
                                        pc2R: i.pc2R,
                                        pc3R: i.pc3R,
                                        pc1Y: i.pc1Y,
                                        pc2Y: i.pc2Y,
                                        pc3Y: i.pc3Y,
                                        pc1B: i.pc1B,
                                        pc2B: i.pc2B,
                                        pc3B: i.pc3B,
                                        c1eR: i.c1eR,
                                        c2eR: i.c2eR,
                                        c3eR: i.c3eR,
                                        c1eY: i.c1eY,
                                        c2eY: i.c2eY,
                                        c3eY: i.c3eY,
                                        c1eB: i.c1eB,
                                        c2eB: i.c2eB,
                                        c3eB: i.c3eB,
                                        c1c2R: i.c1c2R,
                                        c1c2Y: i.c1c2Y,
                                        c1c2B: i.c1c2B,
                                        c2c3R: i.c2c3R,
                                        c2c3Y: i.c2c3Y,
                                        c2c3B: i.c2c3B,
                                        clc1R: i.clc1R,
                                        clc1Y: i.clc1Y,
                                        clc1B: i.clc1B,
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

                // ---------------------------------------------------------
                Navigator.pushNamed(context, '/detail_PTcoreIR', arguments: {
                  'id': report.id,
                  'PT_ID': ntr.id,
                  'serial_no_bph': ntr.serialNo_Bph,
                  'ptDatabaseID': ntr.databaseID,
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
                              ntr.etype == 'pt'
                                  ? const Text(
                                      'PTcoreIR Details ',
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
                              ntr.etype == 'pt'
                                  ? const Text(
                                      'PTcoreIR Details ',
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

  generate_list_of_PTcoreWR(PTModel ntr) {
    getX((PTcoreWRProvider x) => x.getPTcoreWR_BySerialNo(ntr.serialNo_Bph));
    final List<PTcoreWRModel> reports =
        watchOnly((PTcoreWRProvider x) => x.ptcoreWR_serialNoList);

    getX((PTProvider x) => x.getPTLocalData());
    final List<PTModel> reportsForArgsfrom_PTmodel =
        watchOnly((PTProvider x) => x.ptlocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((PTcoreWRProvider x) => x.getPTWREquipmentList());
    final List<PTcoreWRModel> reportsFormPTwrLocalData =
        watchOnly((PTcoreWRProvider x) => x.ptcoreWR_localdataList);

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
                for (var i in reportsFormPTwrLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_PTmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo_Bph;
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                // add to remote database
                                var url =
                                    Uri.parse('${Env.URL_PREFIX}/ptWrTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                  'R_1a_1n': i.R_1a_1n.toString(),
                                  'R_2a_2n': i.R_2a_2n.toString(),
                                  'R_3a_3n': i.R_3a_3n.toString(),
                                  'Y_1a_1n': i.Y_1a_1n.toString(),
                                  'Y_2a_2n': i.Y_2a_2n.toString(),
                                  'Y_3a_3n': i.Y_3a_3n.toString(),
                                  'B_1a_1n': i.B_1a_1n.toString(),
                                  'B_2a_2n': i.B_2a_2n.toString(),
                                  'B_3a_3n': i.B_3a_3n.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<PTcoreWRProvider>().updatePTcoreWR(
                                      PTcoreWRModel(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        R_1a_1n: i.R_1a_1n,
                                        R_2a_2n: i.R_2a_2n,
                                        R_3a_3n: i.R_3a_3n,
                                        Y_1a_1n: i.Y_1a_1n,
                                        Y_2a_2n: i.Y_2a_2n,
                                        Y_3a_3n: i.Y_3a_3n,
                                        B_1a_1n: i.B_1a_1n,
                                        B_2a_2n: i.B_2a_2n,
                                        B_3a_3n: i.B_3a_3n,
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
                // ---------------------------------------------
                Navigator.pushNamed(context, '/detail_PTcoreWR', arguments: {
                  'id': report.id,
                  'PT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo_Bph,
                  'ptDatabaseID': args['ptDatabaseID'],
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_PTcoreWR', arguments: {
                  'id': report.id,
                  'PT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo_Bph,
                  'ptDatabaseID': args['ptDatabaseID'],
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
                              ntr.etype == 'pt'
                                  ? const Text(
                                      'PTcoreWR Details ',
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
                              ntr.etype == 'pt'
                                  ? const Text(
                                      'PTcoreWR Details ',
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

  generate_list_of_PTcoreR(PTModel ntr) {
    getX((PTcoreRProvider x) => x.getPTcoreR_BySerialNo(ntr.serialNo_Bph));
    final List<PTcoreRModel> reports =
        watchOnly((PTcoreRProvider x) => x.ptcoreR_serialNoList);

    getX((PTProvider x) => x.getPTLocalData());
    final List<PTModel> reportsForArgsfrom_PTmodel =
        watchOnly((PTProvider x) => x.ptlocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((PTcoreRProvider x) => x.getPTcoreREquipmentList());
    final List<PTcoreRModel> reportsFormPTrLocalData =
        watchOnly((PTcoreRProvider x) => x.ptcoreR_localdataList);

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
                for (var i in reportsFormPTrLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_PTmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo_Bph;
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                // add to remote database
                                var url =
                                    Uri.parse('${Env.URL_PREFIX}/ptRTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                  'R_1a_1n_1000': i.R_1a_1n_1000.toString(),
                                  'R_2a_2n_1000': i.R_2a_2n_1000.toString(),
                                  'R_3a_3n_1000': i.R_3a_3n_1000.toString(),
                                  'Y_1a_1n_1000': i.Y_1a_1n_1000.toString(),
                                  'Y_2a_2n_1000': i.Y_2a_2n_1000.toString(),
                                  'Y_3a_3n_1000': i.Y_3a_3n_1000.toString(),
                                  'B_1a_1n_1000': i.B_1a_1n_1000.toString(),
                                  'B_2a_2n_1000': i.B_2a_2n_1000.toString(),
                                  'B_3a_3n_1000': i.B_3a_3n_1000.toString(),
                                  'R_1a_1n_2000': i.R_1a_1n_2000.toString(),
                                  'R_2a_2n_2000': i.R_2a_2n_2000.toString(),
                                  'R_3a_3n_2000': i.R_3a_3n_2000.toString(),
                                  'Y_1a_1n_2000': i.Y_1a_1n_2000.toString(),
                                  'Y_2a_2n_2000': i.Y_2a_2n_2000.toString(),
                                  'Y_3a_3n_2000': i.Y_3a_3n_2000.toString(),
                                  'B_1a_1n_2000': i.B_1a_1n_2000.toString(),
                                  'B_2a_2n_2000': i.B_2a_2n_2000.toString(),
                                  'B_3a_3n_2000': i.B_3a_3n_2000.toString(),
                                  'R_1a_1n_3000': i.R_1a_1n_3000.toString(),
                                  'R_2a_2n_3000': i.R_2a_2n_3000.toString(),
                                  'R_3a_3n_3000': i.R_3a_3n_3000.toString(),
                                  'Y_1a_1n_3000': i.Y_1a_1n_3000.toString(),
                                  'Y_2a_2n_3000': i.Y_2a_2n_3000.toString(),
                                  'Y_3a_3n_3000': i.Y_3a_3n_3000.toString(),
                                  'B_1a_1n_3000': i.B_1a_1n_3000.toString(),
                                  'B_2a_2n_3000': i.B_2a_2n_3000.toString(),
                                  'B_3a_3n_3000': i.B_3a_3n_3000.toString(),
                                  'R_1a_1n_4000': i.R_1a_1n_4000.toString(),
                                  'R_2a_2n_4000': i.R_2a_2n_4000.toString(),
                                  'R_3a_3n_4000': i.R_3a_3n_4000.toString(),
                                  'Y_1a_1n_4000': i.Y_1a_1n_4000.toString(),
                                  'Y_2a_2n_4000': i.Y_2a_2n_4000.toString(),
                                  'Y_3a_3n_4000': i.Y_3a_3n_4000.toString(),
                                  'B_1a_1n_4000': i.B_1a_1n_4000.toString(),
                                  'B_2a_2n_4000': i.B_2a_2n_4000.toString(),
                                  'B_3a_3n_4000': i.B_3a_3n_4000.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<PTcoreRProvider>().updatePTcoreR(
                                      PTcoreRModel(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        R_1a_1n_1000: i.R_1a_1n_1000,
                                        R_2a_2n_1000: i.R_2a_2n_1000,
                                        R_3a_3n_1000: i.R_3a_3n_1000,
                                        Y_1a_1n_1000: i.Y_1a_1n_1000,
                                        Y_2a_2n_1000: i.Y_2a_2n_1000,
                                        Y_3a_3n_1000: i.Y_3a_3n_1000,
                                        B_1a_1n_1000: i.B_1a_1n_1000,
                                        B_2a_2n_1000: i.B_2a_2n_1000,
                                        B_3a_3n_1000: i.B_3a_3n_1000,
                                        R_1a_1n_2000: i.R_1a_1n_2000,
                                        R_2a_2n_2000: i.R_2a_2n_2000,
                                        R_3a_3n_2000: i.R_3a_3n_2000,
                                        Y_1a_1n_2000: i.Y_1a_1n_2000,
                                        Y_2a_2n_2000: i.Y_2a_2n_2000,
                                        Y_3a_3n_2000: i.Y_3a_3n_2000,
                                        B_1a_1n_2000: i.B_1a_1n_2000,
                                        B_2a_2n_2000: i.B_2a_2n_2000,
                                        B_3a_3n_2000: i.B_3a_3n_2000,
                                        R_1a_1n_3000: i.R_1a_1n_3000,
                                        R_2a_2n_3000: i.R_2a_2n_3000,
                                        R_3a_3n_3000: i.R_3a_3n_3000,
                                        Y_1a_1n_3000: i.Y_1a_1n_3000,
                                        Y_2a_2n_3000: i.Y_2a_2n_3000,
                                        Y_3a_3n_3000: i.Y_3a_3n_3000,
                                        B_1a_1n_3000: i.B_1a_1n_3000,
                                        B_2a_2n_3000: i.B_2a_2n_3000,
                                        B_3a_3n_3000: i.B_3a_3n_3000,
                                        R_1a_1n_4000: i.R_1a_1n_4000,
                                        R_2a_2n_4000: i.R_2a_2n_4000,
                                        R_3a_3n_4000: i.R_3a_3n_4000,
                                        Y_1a_1n_4000: i.Y_1a_1n_4000,
                                        Y_2a_2n_4000: i.Y_2a_2n_4000,
                                        Y_3a_3n_4000: i.Y_3a_3n_4000,
                                        B_1a_1n_4000: i.B_1a_1n_4000,
                                        B_2a_2n_4000: i.B_2a_2n_4000,
                                        B_3a_3n_4000: i.B_3a_3n_4000,
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
                // ---------------------------------------------------------
                Navigator.pushNamed(context, '/detail_PTcoreR', arguments: {
                  'id': report.id,
                  'PT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo_Bph,
                  'ptDatabaseID': args['ptDatabaseID'],
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_PTcoreR', arguments: {
                  'id': report.id,
                  'PT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo_Bph,
                  'ptDatabaseID': args['ptDatabaseID'],
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
                              ntr.etype == 'pt'
                                  ? const Text(
                                      'PTcoreR Details ',
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
                              ntr.etype == 'pt'
                                  ? const Text(
                                      'PTcoreR Details ',
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
}
