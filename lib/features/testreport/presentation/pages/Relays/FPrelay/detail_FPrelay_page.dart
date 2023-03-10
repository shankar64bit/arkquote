// ignore_for_file: prefer_const_constructors, missing_return, prefer_interpolation_to_compose_strings, file_names, use_build_context_synchronously, non_constant_identifier_names
// import 'dart:html';
import 'dart:convert';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:readmore/readmore.dart';
import '../../../../../../env.sample.dart';
import '../../../../../../injection_container.dart';
import '../../../../data/models/equipment/Relays/FPrelay/FPR_currentMgmt_model.dart';
import '../../../../data/models/equipment/Relays/FPrelay/FPR_earthfault_model.dart';
import '../../../../data/models/equipment/Relays/FPrelay/FPR_overcurrent_model.dart';
import '../../../../data/models/equipment/Relays/FPrelay/FPR_overfreq_model.dart';
import '../../../../data/models/equipment/Relays/FPrelay/FPR_overvoltage_model.dart';
import '../../../../data/models/equipment/Relays/FPrelay/FPR_underfreq_model.dart';
import '../../../../data/models/equipment/Relays/FPrelay/FPR_undervoltage_model.dart';
import '../../../../data/models/equipment/Relays/FPrelay/FPR_voltageMgmt_model.dart';
import '../../../../data/models/equipment/Relays/FPrelay/FPrelay_model.dart';
import '../../../../data/models/test_report_model.dart';
import '../../../providers/Relays_providers/FPrelay_providers/FPR_currentMgmt_provider.dart';
import '../../../providers/Relays_providers/FPrelay_providers/FPR_earthfault_provider.dart';
import '../../../providers/Relays_providers/FPrelay_providers/FPR_overcurrent_provider.dart';
import '../../../providers/Relays_providers/FPrelay_providers/FPR_overfreq_provider.dart';
import '../../../providers/Relays_providers/FPrelay_providers/FPR_overvoltage_provider.dart';
import '../../../providers/Relays_providers/FPrelay_providers/FPR_underfreq_provider.dart';
import '../../../providers/Relays_providers/FPrelay_providers/FPR_undervoltage_provider.dart';
import '../../../providers/Relays_providers/FPrelay_providers/FPR_voltageMgmt_provider.dart';
import '../../../providers/Relays_providers/FPrelay_providers/FPrelay_providers.dart';
import '../../../providers/equipment_acb_provider/test_report_provider.dart';
import '../../dropdown_All/responsive_tool/google_sign_in_out/InternetConnChecker.dart';
import '../../equipment_acb/detail_test_report_page.dart';

class Detail_Fprelay_Page extends StatelessWidget with GetItMixin {
  Map args = {};
  FPrelayModel ntr;
  int trDbId;
  Detail_Fprelay_Page(@required this.args, {Key key}) : super(key: key);
  var datetime;

  @override
  Widget build(BuildContext context) {
    getX((FPrelayProvider x) => x.getFPrelayByID(args['id']));
    final FPrelayModel ntr = watchOnly((FPrelayProvider x) => x.fprelayModel);

    var mob = const Text('FPrelay  Details', style: TextStyle(fontSize: 15));
    var desk = const Text('FPrelay  Details', style: TextStyle(fontSize: 20));
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
                  Navigator.popAndPushNamed(context, '/edit_FPrelay',
                      arguments: {
                        'id': ntr.id,
                        'trDatabaseID': args['trDatabaseID'],
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
                          child: display_FPrelay_details(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_FPRcurrentMgmt(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_FPRvoltageMgmt(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_FPRovercurrent(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_FPRearthfault(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_FPRovervoltage(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_FPRundervoltage(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_FPRoverfreq(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_FPRunderfreq(ntr)),
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
                          child: display_FPrelay_details(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_FPRcurrentMgmt(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_FPRvoltageMgmt(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_FPRovercurrent(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_FPRearthfault(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_FPRovervoltage(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_FPRundervoltage(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_FPRoverfreq(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_FPRunderfreq(ntr)),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),

      floatingActionButton: PopupMenuButton(
        child: FloatingActionButton.extended(
          label: Text(
            'Add Accuracy Check',
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
                        heroTag: 'addFPRcurrentMgmt',
                        onPressed: () async {
                          Navigator.popAndPushNamed(
                              context, '/add_FPRcurrentMgmt',
                              arguments: {
                                'TrNo': ntr.trNo,
                                'FPR_ID': ntr.id,
                                'serialno': ntr.serialNo,
                                'fprDatabaseID': ntr.databaseID,
                                'trDatabaseID': args['trDatabaseID'],
                              });
                        },
                        label: const Text('current Mgmt',
                            style:
                                TextStyle(fontSize: 10, color: Colors.white)),
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton.extended(
                        heroTag: 'addFPRvoltageMgmt',
                        onPressed: () async {
                          Navigator.popAndPushNamed(
                              context, '/add_FPRvoltageMgmt',
                              arguments: {
                                'TrNo': ntr.trNo,
                                'FPR_ID': ntr.id,
                                'serialno': ntr.serialNo,
                                'fprDatabaseID': ntr.databaseID,
                                'trDatabaseID': args['trDatabaseID'],
                              });
                        },
                        label: const Text('Voltage Mgmt',
                            style:
                                TextStyle(fontSize: 10, color: Colors.white)),
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton.extended(
                        heroTag: 'addFPRovercurrent',
                        onPressed: () async {
                          Navigator.popAndPushNamed(
                              context, '/add_FPRovercurrent',
                              arguments: {
                                'TrNo': ntr.trNo,
                                'FPR_ID': ntr.id,
                                'serialno': ntr.serialNo,
                                'fprDatabaseID': ntr.databaseID,
                                'trDatabaseID': args['trDatabaseID'],
                              });
                        },
                        label: const Text('Over current',
                            style:
                                TextStyle(fontSize: 10, color: Colors.white)),
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton.extended(
                        heroTag: 'addFPRearthfault',
                        onPressed: () async {
                          Navigator.popAndPushNamed(
                              context, '/add_FPRearthfault',
                              arguments: {
                                'TrNo': ntr.trNo,
                                'FPR_ID': ntr.id,
                                'serialno': ntr.serialNo,
                                'fprDatabaseID': ntr.databaseID,
                                'trDatabaseID': args['trDatabaseID'],
                              });
                        },
                        label: const Text('Earth Fault',
                            style:
                                TextStyle(fontSize: 10, color: Colors.white)),
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton.extended(
                        heroTag: 'addFPRovervoltage',
                        onPressed: () async {
                          Navigator.popAndPushNamed(
                              context, '/add_FPRovervoltage',
                              arguments: {
                                'TrNo': ntr.trNo,
                                'FPR_ID': ntr.id,
                                'serialno': ntr.serialNo,
                                'fprDatabaseID': ntr.databaseID,
                                'trDatabaseID': args['trDatabaseID'],
                              });
                        },
                        label: const Text('Over Voltage',
                            style:
                                TextStyle(fontSize: 10, color: Colors.white)),
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton.extended(
                        heroTag: 'addFPRundervoltage',
                        onPressed: () async {
                          Navigator.popAndPushNamed(
                              context, '/add_FPRundervoltage',
                              arguments: {
                                'TrNo': ntr.trNo,
                                'FPR_ID': ntr.id,
                                'serialno': ntr.serialNo,
                                'fprDatabaseID': ntr.databaseID,
                                'trDatabaseID': args['trDatabaseID'],
                              });
                        },
                        label: const Text('Under Voltage',
                            style:
                                TextStyle(fontSize: 10, color: Colors.white)),
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton.extended(
                        heroTag: 'addFPRoverfreq',
                        onPressed: () async {
                          Navigator.popAndPushNamed(context, '/add_FPRoverfreq',
                              arguments: {
                                'TrNo': ntr.trNo,
                                'FPR_ID': ntr.id,
                                'serialno': ntr.serialNo,
                                'fprDatabaseID': ntr.databaseID,
                                'trDatabaseID': args['trDatabaseID'],
                              });
                        },
                        label: const Text('Over Frequency',
                            style:
                                TextStyle(fontSize: 10, color: Colors.white)),
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton.extended(
                        heroTag: 'addFPRunderfreq',
                        onPressed: () async {
                          Navigator.popAndPushNamed(
                              context, '/add_FPRunderfreq',
                              arguments: {
                                'TrNo': ntr.trNo,
                                'FPR_ID': ntr.id,
                                'serialno': ntr.serialNo,
                                'fprDatabaseID': ntr.databaseID,
                                'trDatabaseID': args['trDatabaseID'],
                              });
                        },
                        label: const Text('Under Frequency',
                            style:
                                TextStyle(fontSize: 10, color: Colors.white)),
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
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

  Function dialog_box_action(BuildContext context) {
    return (() {
      getX((FPrelayProvider x) => x.deleteFPrelay(args['id']));
      Navigator.pop(context);
    });
  }

  ReadMoreDisplay_FPrelay_details(FPrelayModel ntr) {
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
        'serialNo : ' +
        ntr.serialNo +
        '\n' +
        'panel : ' +
        ntr.panel.toString() +
        '\n' +
        'make : ' +
        ntr.make.toString() +
        '\n' +
        'rtype : ' +
        ntr.rtype.toString() +
        '\n' +
        'auxVoltage : ' +
        ntr.auxVoltage.toString() +
        '\n' +
        'CT Ratio Primary : ' +
        ntr.ctRatioPri.toString() +
        '\n' +
        'CT Ratio Secondary : ' +
        ntr.ctRatioSec.toString() +
        '\n' +
        'ptRatio : ' +
        ntr.ptRatio.toString() +
        '\n' +
        'Make : ' +
        ntr.make +
        '\n' +
        'DateOfTest : ' +
        gotdate +
        '\n' +
        'TestedBy : ' +
        ntr.testedBy +
        '\n' +
        'VerifiedBy : ' +
        ntr.verifiedBy +
        '\n' +
        'WitnessedBy : ' +
        ntr.WitnessedBy +
        '\n';
  }

  // ReadMoreDisplay_CT_details2(CTModel ntr) {
  //   return TextSelection();
  // }

  display_FPrelay_details(FPrelayModel ntr) {
    return Container(
      alignment: Alignment.center,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.fromLTRB(80, 10, 80, 10),
          child: ReadMoreText(
            ReadMoreDisplay_FPrelay_details(ntr),
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
                      getX((FPrelayProvider x) => x.deleteFPrelay(args['id']));
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

  generate_list_of_FPRcurrentMgmt(FPrelayModel ntr) {
    getX((FPRcurrentMgmtProvider x) =>
        x.getFPRcurrentMgmtserialNo(ntr.serialNo));
    final List<FPRcurrentMgmtModel> reports =
        watchOnly((FPRcurrentMgmtProvider x) => x.fprcurrentMgmt_serialNoList);

    getX((FPrelayProvider x) => x.getFPrelayLocalData());
    final List<FPrelayModel> reportsForArgsfrom_FPRmodel =
        watchOnly((FPrelayProvider x) => x.fprelaylocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((FPRcurrentMgmtProvider x) => x.getFPRcurrentmgmtEquipmentList());
    final List<FPRcurrentMgmtModel> reportsFormfprcurrLocalData = watchOnly(
        (FPRcurrentMgmtProvider x) => x.fprcurrentMgmt_loacaldataList);

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
                for (var i in reportsFormfprcurrLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_FPRmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(argsSerialNo); // current serial Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                var url = Uri.parse('${Env.URL_PREFIX}/fprCm/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'rn_measurePrimCurrent':
                                      i.rn_measurePrimCurrent.toString(),
                                  'yn_measurePrimCurrent':
                                      i.yn_measurePrimCurrent.toString(),
                                  'bn_measurePrimCurrent':
                                      i.bn_measurePrimCurrent.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<FPRcurrentMgmtProvider>()
                                      .updateFPRcurrentMgmt(
                                          FPRcurrentMgmtModel(
                                            id: i.id,
                                            trNo: i.trNo,
                                            serialNo: i.serialNo,
                                            rn_measurePrimCurrent:
                                                i.rn_measurePrimCurrent,
                                            yn_measurePrimCurrent:
                                                i.yn_measurePrimCurrent,
                                            bn_measurePrimCurrent:
                                                i.bn_measurePrimCurrent,
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

                // --------------------------------------------------
                Navigator.pushNamed(context, '/detail_FPRcurrentMgmt',
                    arguments: {
                      'id': report.id,
                      'FPR_ID': report.databaseID,
                      'serialno': ntr.serialNo,
                      'fprDatabaseID': args['fprDatabaseID'],
                      'trDatabaseID': args['trDatabaseID'],
                    });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_FPRcurrentMgmt',
                    arguments: {
                      'id': report.id,
                      'FPR_ID': report.databaseID,
                      'serialno': ntr.serialNo,
                      'fprDatabaseID': args['fprDatabaseID'],
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
                              ntr.etype == 'fpr'
                                  ? const Text(
                                      'FPRcurrentMgmt Details ',
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
                              ntr.etype == 'fpr'
                                  ? const Text(
                                      'FPRcurrentMgmt Details ',
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

  generate_list_of_FPRvoltageMgmt(FPrelayModel ntr) {
    getX((FPRvoltageMgmtProvider x) =>
        x.getFPRvoltageMgmtserialNo(ntr.serialNo));
    final List<FPRvoltageMgmtModel> reports =
        watchOnly((FPRvoltageMgmtProvider x) => x.fprvoltageMgmt_serialNoList);

    getX((FPrelayProvider x) => x.getFPrelayLocalData());
    final List<FPrelayModel> reportsForArgsfrom_FPRmodel =
        watchOnly((FPrelayProvider x) => x.fprelaylocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((FPRvoltageMgmtProvider x) => x.getFPRvoltmgmtEquipmentList());
    final List<FPRvoltageMgmtModel> reportsFormfprvoltmgmtLocalData = watchOnly(
        (FPRvoltageMgmtProvider x) => x.fprvoltageMgmt_loacaldataList);

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
                for (var i in reportsFormfprvoltmgmtLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_FPRmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(argsSerialNo); // current serial Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;
                                print(argsSnoDB);

                                var url = Uri.parse('${Env.URL_PREFIX}/fprVm/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'rn_applSecVoltage':
                                      i.rn_applSecVoltage.toString(),
                                  'rn_measurePrimVoltage':
                                      i.rn_measurePrimVoltage.toString(),
                                  'yn_applSecVoltage':
                                      i.yn_applSecVoltage.toString(),
                                  'yn_measurePrimVoltage':
                                      i.yn_measurePrimVoltage.toString(),
                                  'bn_applSecVoltage':
                                      i.bn_applSecVoltage.toString(),
                                  'bn_measurePrimVoltage':
                                      i.bn_measurePrimVoltage.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<FPRvoltageMgmtProvider>()
                                      .updateFPRvoltageMgmt(
                                          FPRvoltageMgmtModel(
                                            id: i.id,
                                            trNo: i.trNo,
                                            serialNo: i.serialNo,
                                            rn_applSecVoltage:
                                                i.rn_applSecVoltage,
                                            rn_measurePrimVoltage:
                                                i.rn_measurePrimVoltage,
                                            yn_applSecVoltage:
                                                i.yn_applSecVoltage,
                                            yn_measurePrimVoltage:
                                                i.yn_measurePrimVoltage,
                                            bn_applSecVoltage:
                                                i.bn_applSecVoltage,
                                            bn_measurePrimVoltage:
                                                i.bn_measurePrimVoltage,
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

                // --------------------------------------------------
                Navigator.pushNamed(context, '/detail_FPRvoltageMgmt',
                    arguments: {
                      'id': report.id,
                      'FPR_ID': report.databaseID,
                      'serialno': ntr.serialNo,
                      'fprDatabaseID': args['fprDatabaseID'],
                      'trDatabaseID': args['trDatabaseID'],
                    });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_FPRvoltageMgmt',
                    arguments: {
                      'id': report.id,
                      'FPR_ID': report.databaseID,
                      'serialno': ntr.serialNo,
                      'fprDatabaseID': args['fprDatabaseID'],
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
                              ntr.etype == 'fpr'
                                  ? const Text(
                                      'FPRvoltageMgmt Details ',
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
                              ntr.etype == 'fpr'
                                  ? const Text(
                                      'FPRvoltageMgmt Details ',
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

  generate_list_of_FPRovercurrent(FPrelayModel ntr) {
    getX((FPRovercurrentProvider x) =>
        x.getFPRovercurrentserialNo(ntr.serialNo));
    final List<FPRovercurrentModel> reports =
        watchOnly((FPRovercurrentProvider x) => x.fprovercurrent_serialNoList);

    getX((FPrelayProvider x) => x.getFPrelayLocalData());
    final List<FPrelayModel> reportsForArgsfrom_FPRmodel =
        watchOnly((FPrelayProvider x) => x.fprelaylocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((FPRovercurrentProvider x) => x.getFPRovercurrEquipmentList());
    final List<FPRovercurrentModel> reportsFormfprovercurrLocalData = watchOnly(
        (FPRovercurrentProvider x) => x.fprovercurrent_loacaldataList);

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
                for (var i in reportsFormfprovercurrLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_FPRmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(argsSerialNo); // current serial Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                var url = Uri.parse('${Env.URL_PREFIX}/fprOc/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'CurrentSet': i.CurrentSet.toString(),
                                  'TMS': i.TMS.toString(),
                                  'delay': i.delay.toString(),
                                  'rn_pickupCurrent':
                                      i.rn_pickupCurrent.toString(),
                                  'rn_relayOprTime_2x':
                                      i.rn_relayOprTime_2x.toString(),
                                  'rn_relayOprTime_5x':
                                      i.rn_relayOprTime_5x.toString(),
                                  'yn_pickupCurrent':
                                      i.yn_pickupCurrent.toString(),
                                  'yn_relayOprTime_2x':
                                      i.yn_relayOprTime_2x.toString(),
                                  'yn_relayOprTime_5x':
                                      i.yn_relayOprTime_5x.toString(),
                                  'bn_pickupCurrent':
                                      i.bn_pickupCurrent.toString(),
                                  'bn_relayOprTime_2x':
                                      i.bn_relayOprTime_2x.toString(),
                                  'bn_relayOprTime_5x':
                                      i.bn_relayOprTime_5x.toString(),
                                  'stageNo': i.stageNo.toString(),
                                  'curve': i.curve.toString(),
                                  'function': i.function.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<FPRovercurrentProvider>()
                                      .updateFPRovercurrent(
                                          FPRovercurrentModel(
                                            id: i.id,
                                            trNo: i.trNo,
                                            serialNo: i.serialNo,
                                            CurrentSet: i.CurrentSet,
                                            TMS: i.TMS,
                                            delay: i.delay,
                                            rn_pickupCurrent:
                                                i.rn_pickupCurrent,
                                            rn_relayOprTime_2x:
                                                i.rn_relayOprTime_2x,
                                            rn_relayOprTime_5x:
                                                i.rn_relayOprTime_5x,
                                            yn_pickupCurrent:
                                                i.yn_pickupCurrent,
                                            yn_relayOprTime_2x:
                                                i.yn_relayOprTime_2x,
                                            yn_relayOprTime_5x:
                                                i.yn_relayOprTime_5x,
                                            bn_pickupCurrent:
                                                i.bn_pickupCurrent,
                                            bn_relayOprTime_2x:
                                                i.bn_relayOprTime_2x,
                                            bn_relayOprTime_5x:
                                                i.bn_relayOprTime_5x,
                                            stageNo: i.stageNo,
                                            curve: i.curve,
                                            function: i.function,
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

                // --------------------------------------------------
                Navigator.pushNamed(context, '/detail_FPRovercurrent',
                    arguments: {
                      'id': report.id,
                      'FPR_ID': report.databaseID,
                      'serialno': ntr.serialNo,
                      'fprDatabaseID': args['fprDatabaseID'],
                      'trDatabaseID': args['trDatabaseID'],
                    });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_FPRovercurrent',
                    arguments: {
                      'id': report.id,
                      'FPR_ID': report.databaseID,
                      'serialno': ntr.serialNo,
                      'fprDatabaseID': args['fprDatabaseID'],
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
                              ntr.etype == 'fpr'
                                  ? const Text(
                                      'FPRovercurrent Details ',
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
                              ntr.etype == 'fpr'
                                  ? const Text(
                                      'FPRovercurrent Details ',
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

  generate_list_of_FPRearthfault(FPrelayModel ntr) {
    getX((FPRearthfaultProvider x) => x.getFPRearthfaultserialNo(ntr.serialNo));
    final List<FPRearthfaultModel> reports =
        watchOnly((FPRearthfaultProvider x) => x.fprearthfault_serialNoList);

    getX((FPrelayProvider x) => x.getFPrelayLocalData());
    final List<FPrelayModel> reportsForArgsfrom_FPRmodel =
        watchOnly((FPrelayProvider x) => x.fprelaylocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((FPRearthfaultProvider x) => x.getFPRearthfaultEquipmentList());
    final List<FPRearthfaultModel> reportsFormfprearthfaultLocalData =
        watchOnly((FPRearthfaultProvider x) => x.fprearthfault_loacaldataList);

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
                for (var i in reportsFormfprearthfaultLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_FPRmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(argsSerialNo); // current serial Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                var url = Uri.parse('${Env.URL_PREFIX}/fprEf/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'currentSet': i.currentSet.toString(),
                                  'TMS': i.TMS.toString(),
                                  'delay': i.delay.toString(),
                                  'pickupCurrent': i.pickupCurrent.toString(),
                                  'relayOprTime_2x':
                                      i.relayOprTime_2x.toString(),
                                  'relayOprTime_5x':
                                      i.relayOprTime_5x.toString(),
                                  'stageNo': i.stageNo.toString(),
                                  'curve': i.curve.toString(),
                                  'function': i.function.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<FPRearthfaultProvider>()
                                      .updateFPRearthfault(
                                          FPRearthfaultModel(
                                            id: i.id,
                                            trNo: i.trNo,
                                            serialNo: i.serialNo,
                                            currentSet: i.currentSet,
                                            TMS: i.TMS,
                                            delay: i.delay,
                                            pickupCurrent: i.pickupCurrent,
                                            relayOprTime_2x: i.relayOprTime_2x,
                                            relayOprTime_5x: i.relayOprTime_5x,
                                            stageNo: i.stageNo,
                                            curve: i.curve,
                                            function: i.function,
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

                // -------------------------------------------------

                Navigator.pushNamed(context, '/detail_FPRearthfault',
                    arguments: {
                      'id': report.id,
                      'FPR_ID': report.databaseID,
                      'serialno': ntr.serialNo,
                      'fprDatabaseID': args['fprDatabaseID'],
                      'trDatabaseID': args['trDatabaseID'],
                    });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_FPRearthfault',
                    arguments: {
                      'id': report.id,
                      'FPR_ID': report.databaseID,
                      'serialno': ntr.serialNo,
                      'fprDatabaseID': args['fprDatabaseID'],
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
                              ntr.etype == 'fpr'
                                  ? const Text(
                                      'FPRearthfault Details ',
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
                              ntr.etype == 'fpr'
                                  ? const Text(
                                      'FPRearthfault Details ',
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

  generate_list_of_FPRovervoltage(FPrelayModel ntr) {
    getX((FPRovervoltageProvider x) =>
        x.getFPRovervoltageserialNo(ntr.serialNo));
    final List<FPRovervoltageModel> reports =
        watchOnly((FPRovervoltageProvider x) => x.fprovervoltage_serialNoList);

    getX((FPrelayProvider x) => x.getFPrelayLocalData());
    final List<FPrelayModel> reportsForArgsfrom_FPRmodel =
        watchOnly((FPrelayProvider x) => x.fprelaylocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((FPRovervoltageProvider x) => x.getFPRovervoltEquipmentList());
    final List<FPRovervoltageModel> reportsFormfprovervoltLocalData = watchOnly(
        (FPRovervoltageProvider x) => x.fprovervoltage_loacaldataList);

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
                for (var i in reportsFormfprovervoltLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_FPRmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(argsSerialNo); // current serial Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                var url = Uri.parse('${Env.URL_PREFIX}/fprOv/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'voltageSet': i.voltageSet.toString(),
                                  'delay': i.delay.toString(),
                                  'rn_secVoltageSet':
                                      i.rn_secVoltageSet.toString(),
                                  'rn_appliedSecVoltage':
                                      i.rn_appliedSecVoltage.toString(),
                                  'rn_relayOprTime':
                                      i.rn_relayOprTime.toString(),
                                  'yn_secVoltageSet':
                                      i.yn_secVoltageSet.toString(),
                                  'yn_appliedSecVoltage':
                                      i.yn_appliedSecVoltage.toString(),
                                  'yn_relayOprTime':
                                      i.yn_relayOprTime.toString(),
                                  'bn_secVoltageSet':
                                      i.bn_secVoltageSet.toString(),
                                  'bn_appliedSecVoltage':
                                      i.bn_appliedSecVoltage.toString(),
                                  'bn_relayOprTime':
                                      i.bn_relayOprTime.toString(),
                                  'stageNo': i.stageNo.toString(),
                                  'function': i.function.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<FPRovervoltageProvider>()
                                      .updateFPRovervoltage(
                                          FPRovervoltageModel(
                                            id: i.id,
                                            trNo: i.trNo,
                                            serialNo: i.serialNo,
                                            voltageSet: i.voltageSet,
                                            delay: i.delay,
                                            rn_secVoltageSet:
                                                i.rn_secVoltageSet,
                                            rn_appliedSecVoltage:
                                                i.rn_appliedSecVoltage,
                                            rn_relayOprTime: i.rn_relayOprTime,
                                            yn_secVoltageSet:
                                                i.yn_secVoltageSet,
                                            yn_appliedSecVoltage:
                                                i.yn_appliedSecVoltage,
                                            yn_relayOprTime: i.yn_relayOprTime,
                                            bn_secVoltageSet:
                                                i.bn_secVoltageSet,
                                            bn_appliedSecVoltage:
                                                i.bn_appliedSecVoltage,
                                            bn_relayOprTime: i.bn_relayOprTime,
                                            stageNo: i.stageNo,
                                            function: i.function,
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
                Navigator.pushNamed(context, '/detail_FPRovervoltage',
                    arguments: {
                      'id': report.id,
                      'FPR_ID': report.databaseID,
                      'serialno': ntr.serialNo,
                      'fprDatabaseID': args['fprDatabaseID'],
                      'trDatabaseID': args['trDatabaseID'],
                    });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_FPRovervoltage',
                    arguments: {
                      'id': report.id,
                      'FPR_ID': report.databaseID,
                      'serialno': ntr.serialNo,
                      'fprDatabaseID': args['fprDatabaseID'],
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
                              ntr.etype == 'fpr'
                                  ? const Text(
                                      'FPRovervoltage Details ',
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
                              ntr.etype == 'fpr'
                                  ? const Text(
                                      'FPRovervoltage Details ',
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

  generate_list_of_FPRundervoltage(FPrelayModel ntr) {
    getX((FPRundervoltageProvider x) =>
        x.getFPRundervoltageserialNo(ntr.serialNo));
    final List<FPRundervoltageModel> reports = watchOnly(
        (FPRundervoltageProvider x) => x.fprundervoltage_serialNoList);

    getX((FPrelayProvider x) => x.getFPrelayLocalData());
    final List<FPrelayModel> reportsForArgsfrom_FPRmodel =
        watchOnly((FPrelayProvider x) => x.fprelaylocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((FPRundervoltageProvider x) => x.getFPRundervoltEquipmentList());
    final List<FPRundervoltageModel> reportsFormfprovervoltLocalData =
        watchOnly(
            (FPRundervoltageProvider x) => x.fprundervoltage_loacaldataList);

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
                for (var i in reportsFormfprovervoltLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_FPRmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(argsSerialNo); // current serial Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                var url = Uri.parse('${Env.URL_PREFIX}/fprUv/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'voltageSet': i.voltageSet.toString(),
                                  'delay': i.delay.toString(),
                                  'rn_secVoltageSet':
                                      i.rn_secVoltageSet.toString(),
                                  'rn_appliedSecVoltage':
                                      i.rn_appliedSecVoltage.toString(),
                                  'rn_relayOprTime':
                                      i.rn_relayOprTime.toString(),
                                  'yn_secVoltageSet':
                                      i.yn_secVoltageSet.toString(),
                                  'yn_appliedSecVoltage':
                                      i.yn_appliedSecVoltage.toString(),
                                  'yn_relayOprTime':
                                      i.yn_relayOprTime.toString(),
                                  'bn_secVoltageSet':
                                      i.bn_secVoltageSet.toString(),
                                  'bn_appliedSecVoltage':
                                      i.bn_appliedSecVoltage.toString(),
                                  'bn_relayOprTime':
                                      i.bn_relayOprTime.toString(),
                                  'stageNo': i.stageNo.toString(),
                                  'function': i.function.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<FPRundervoltageProvider>()
                                      .updateFPRundervoltage(
                                          FPRundervoltageModel(
                                            id: i.id,
                                            trNo: i.id,
                                            serialNo: i.serialNo,
                                            voltageSet: i.voltageSet,
                                            delay: i.delay,
                                            rn_secVoltageSet:
                                                i.rn_secVoltageSet,
                                            rn_appliedSecVoltage:
                                                i.rn_appliedSecVoltage,
                                            rn_relayOprTime: i.rn_relayOprTime,
                                            yn_secVoltageSet:
                                                i.yn_secVoltageSet,
                                            yn_appliedSecVoltage:
                                                i.yn_appliedSecVoltage,
                                            yn_relayOprTime: i.yn_relayOprTime,
                                            bn_secVoltageSet:
                                                i.bn_secVoltageSet,
                                            bn_appliedSecVoltage:
                                                i.bn_appliedSecVoltage,
                                            bn_relayOprTime: i.bn_relayOprTime,
                                            stageNo: i.stageNo,
                                            function: i.function,
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
                Navigator.pushNamed(context, '/detail_FPRundervoltage',
                    arguments: {
                      'id': report.id,
                      'FPR_ID': report.databaseID,
                      'serialno': ntr.serialNo,
                      'fprDatabaseID': args['fprDatabaseID'],
                      'trDatabaseID': args['trDatabaseID'],
                    });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_FPRundervoltage',
                    arguments: {
                      'id': report.id,
                      'FPR_ID': report.databaseID,
                      'serialno': ntr.serialNo,
                      'fprDatabaseID': args['fprDatabaseID'],
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
                              ntr.etype == 'fpr'
                                  ? const Text(
                                      'FPRundervoltage Details ',
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
                              ntr.etype == 'fpr'
                                  ? const Text(
                                      'FPRundervoltage Details ',
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

  generate_list_of_FPRoverfreq(FPrelayModel ntr) {
    getX((FPRoverfreqProvider x) => x.getFPRoverfreqserialNo(ntr.serialNo));
    final List<FPRoverfreqModel> reports =
        watchOnly((FPRoverfreqProvider x) => x.fproverfreq_serialNoList);

    getX((FPrelayProvider x) => x.getFPrelayLocalData());
    final List<FPrelayModel> reportsForArgsfrom_FPRmodel =
        watchOnly((FPrelayProvider x) => x.fprelaylocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((FPRoverfreqProvider x) => x.getFPRoverfreqEquipmentList());
    final List<FPRoverfreqModel> reportsFormfproverfreqLocalData =
        watchOnly((FPRoverfreqProvider x) => x.fproverfreq_loacaldataList);

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
                for (var i in reportsFormfproverfreqLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_FPRmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(argsSerialNo); // current serial Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                var url = Uri.parse('${Env.URL_PREFIX}/fprOf/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'frequencySet': i.frequencySet.toString(),
                                  'delay': i.delay.toString(),
                                  'rn_relayOprTime':
                                      i.rn_relayOprTime.toString(),
                                  'yn_relayOprTime':
                                      i.yn_relayOprTime.toString(),
                                  'bn_relayOprTime':
                                      i.bn_relayOprTime.toString(),
                                  'stageNo': i.stageNo.toString(),
                                  'function': i.function.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<FPRoverfreqProvider>().updateFPRoverfreq(
                                      FPRoverfreqModel(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        frequencySet: i.frequencySet,
                                        delay: i.delay,
                                        rn_relayOprTime: i.rn_relayOprTime,
                                        yn_relayOprTime: i.yn_relayOprTime,
                                        bn_relayOprTime: i.bn_relayOprTime,
                                        stageNo: i.stageNo,
                                        function: i.function,
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

                // -----------------------------------------------
                Navigator.pushNamed(context, '/detail_FPRoverfreq', arguments: {
                  'id': report.id,
                  'FPR_ID': report.databaseID,
                  'serialno': ntr.serialNo,
                  'fprDatabaseID': args['fprDatabaseID'],
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_FPRoverfreq', arguments: {
                  'id': report.id,
                  'FPR_ID': report.databaseID,
                  'serialno': ntr.serialNo,
                  'fprDatabaseID': args['fprDatabaseID'],
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
                              ntr.etype == 'fpr'
                                  ? const Text(
                                      'FPRoverfreq Details ',
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
                              ntr.etype == 'fpr'
                                  ? const Text(
                                      'FPRoverfreq Details ',
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

  generate_list_of_FPRunderfreq(FPrelayModel ntr) {
    getX((FPRunderfreqProvider x) => x.getFPRunderfreqserialNo(ntr.serialNo));
    final List<FPRunderfreqModel> reports =
        watchOnly((FPRunderfreqProvider x) => x.fprunderfreq_serialNoList);

    getX((FPrelayProvider x) => x.getFPrelayLocalData());
    final List<FPrelayModel> reportsForArgsfrom_FPRmodel =
        watchOnly((FPrelayProvider x) => x.fprelaylocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((FPRunderfreqProvider x) => x.getFPRunderfreqEquipmentList());
    final List<FPRunderfreqModel> reportsFormfprunderfreqLocalData =
        watchOnly((FPRunderfreqProvider x) => x.fprunderfreq_loacaldataList);

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
                for (var i in reportsFormfprunderfreqLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_FPRmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(argsSerialNo); // current serial Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                var url = Uri.parse('${Env.URL_PREFIX}/fprUf/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'frequencySet': i.frequencySet.toString(),
                                  'delay': i.delay.toString(),
                                  'rn_relayOprTime':
                                      i.rn_relayOprTime.toString(),
                                  'yn_relayOprTime':
                                      i.yn_relayOprTime.toString(),
                                  'bn_relayOprTime':
                                      i.bn_relayOprTime.toString(),
                                  'stageNo': i.stageNo.toString(),
                                  'function': i.function.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<FPRunderfreqProvider>().updateFPRunderfreq(
                                      FPRunderfreqModel(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        frequencySet: i.frequencySet,
                                        delay: i.delay,
                                        rn_relayOprTime: i.rn_relayOprTime,
                                        yn_relayOprTime: i.yn_relayOprTime,
                                        bn_relayOprTime: i.bn_relayOprTime,
                                        stageNo: i.stageNo,
                                        function: i.function,
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

                // ------------------------------------------------
                Navigator.pushNamed(context, '/detail_FPRunderfreq',
                    arguments: {
                      'id': report.id,
                      'FPR_ID': report.databaseID,
                      'serialno': ntr.serialNo,
                      'fprDatabaseID': args['fprDatabaseID'],
                      'trDatabaseID': args['trDatabaseID'],
                    });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_FPRunderfreq',
                    arguments: {
                      'id': report.id,
                      'FPR_ID': report.databaseID,
                      'serialno': ntr.serialNo,
                      'fprDatabaseID': args['fprDatabaseID'],
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
                              ntr.etype == 'fpr'
                                  ? const Text(
                                      'FPRunderfreq Details ',
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
                              ntr.etype == 'fpr'
                                  ? const Text(
                                      'FPRunderfreq Details ',
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
