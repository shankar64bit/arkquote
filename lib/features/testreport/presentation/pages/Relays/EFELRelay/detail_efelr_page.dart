// ignore_for_file: prefer_const_constructors, missing_return, prefer_interpolation_to_compose_strings, file_names, use_build_context_synchronously, non_constant_identifier_names
// import 'dart:html';
import 'dart:convert';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import 'package:http/http.dart' as http;
import '../../../../../../env.sample.dart';
import '../../../../../../injection_container.dart';
import '../../../../data/models/equipment/Relays/EFELRelay/efelr_model.dart';
import '../../../../data/models/equipment/Relays/EFELRelay/efelr_pac_model.dart';
import '../../../../data/models/test_report_model.dart';
import '../../../providers/Relays_providers/EFELRelay_provider/efelr_pac_provider.dart';
import '../../../providers/Relays_providers/EFELRelay_provider/efelr_provider.dart';
import '../../../providers/equipment_acb_provider/test_report_provider.dart';
import '../../dropdown_All/responsive_tool/google_sign_in_out/InternetConnChecker.dart';
import '../../equipment_acb/detail_test_report_page.dart';

class DetailEfElrPage extends StatelessWidget with GetItMixin {
  Map args = {};
  EfElrModel ntr;
  int trDbId;
  DetailEfElrPage(@required this.args, {Key key}) : super(key: key);
  var datetime;

  @override
  Widget build(BuildContext context) {
    getX((EfElrProvider x) => x.getEfElrByID(args['id']));
    final EfElrModel ntr = watchOnly((EfElrProvider x) => x.efelrModel);

    var mob = const Text('Relay Details', style: TextStyle(fontSize: 15));
    var desk = const Text('Relay Details', style: TextStyle(fontSize: 20));
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
                  Navigator.popAndPushNamed(context, '/edit_EFELR', arguments: {
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
                          child: display_EFELR_details(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_EfElrPac(ntr)),
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
                          child: display_EFELR_details(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_EfElrPac(ntr)),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),

      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'addEfElrPac',
        onPressed: () async {
          Navigator.popAndPushNamed(context, '/add_EFELR_PAC', arguments: {
            'TrNo': ntr.trNo,
            'EFELR_ID': ntr.id,
            'Serial_No': ntr.serialNo,
            'efelrelayDatabaseID': ntr.databaseID,
            'trDatabaseID': args['trDatabaseID'],
          });
        },
        label: const Text('Add Protection\n Accuracy Check',
            style: TextStyle(fontSize: 10, color: Colors.white)),
        icon: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Function dialog_box_action(BuildContext context) {
    return (() {
      getX((EfElrProvider x) => x.deleteEfElr(args['id']));
      Navigator.pop(context);
    });
  }

  ReadMoreDisplay_EFELR_details(EfElrModel ntr) {
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
        'Serial No : ' +
        ntr.serialNo.toString() +
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
        'Make : ' +
        ntr.make +
        '\n' +
        'CT Ratio : ' +
        ntr.ctRatio +
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

  display_EFELR_details(EfElrModel ntr) {
    return Container(
      alignment: Alignment.center,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.fromLTRB(80, 10, 80, 10),
          child: ReadMoreText(
            ReadMoreDisplay_EFELR_details(ntr),
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
                      getX((EfElrProvider x) => x.deleteEfElr(args['id']));
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

  generate_list_of_EfElrPac(EfElrModel ntr) {
    getX((EfElrPacProvider x) => x.getEfElrPacserialNo(ntr.serialNo));
    final List<EfElrPacModel> reports =
        watchOnly((EfElrPacProvider x) => x.efelrPac_serialNoList);

    getX((EfElrProvider x) => x.getEFELRLocalData());
    final List<EfElrModel> reportsForArgsfrom_EFELRmodel =
        watchOnly((EfElrProvider x) => x.efelrlocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((EfElrPacProvider x) => x.getEfElrPacEquipmentList());
    final List<EfElrPacModel> reportsFormEfelrPacLocalData =
        watchOnly((EfElrPacProvider x) => x.efelrPac_loacaldataList);

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
                for (var i in reportsFormEfelrPacLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_EFELRmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                var url =
                                    Uri.parse('${Env.URL_PREFIX}/efelrPac/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'plugSetting': i.plugSetting.toString(),
                                  'TMS': i.TMS.toString(),
                                  'plugSetting_Hi': i.plugSetting_Hi.toString(),
                                  'time': i.time.toString(),
                                  'coilResistanace':
                                      i.coilResistanace.toString(),
                                  'plugSettingMul_2x':
                                      i.plugSettingMul_2x.toString(),
                                  'plugSettingMul_5x':
                                      i.plugSettingMul_5x.toString(),
                                  'pickupCurrent': i.pickupCurrent.toString(),
                                  'relayOprTime_2x':
                                      i.relayOprTime_2x.toString(),
                                  'relayOprTime_5x':
                                      i.relayOprTime_5x.toString(),
                                  'relayOprTime_Hi':
                                      i.relayOprTime_Hi.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<EfElrPacProvider>().updateEfElrPac(
                                      EfElrPacModel(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        plugSetting: i.plugSetting,
                                        TMS: i.TMS,
                                        plugSetting_Hi: i.plugSetting_Hi,
                                        time: i.time,
                                        coilResistanace: i.coilResistanace,
                                        plugSettingMul_2x: i.plugSettingMul_2x,
                                        plugSettingMul_5x: i.plugSettingMul_5x,
                                        pickupCurrent: i.pickupCurrent,
                                        relayOprTime_2x: i.relayOprTime_2x,
                                        relayOprTime_5x: i.relayOprTime_5x,
                                        relayOprTime_Hi: i.relayOprTime_Hi,
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

                // --------------------------------------------------------
                Navigator.pushNamed(context, '/detail_EFELR_PAC', arguments: {
                  'id': report.id,
                  'EFELR_ID': ntr.id,
                  // 'make': ntr.,
                  'efelrelayDatabaseID': ntr.databaseID,
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_EFELR_PAC', arguments: {
                  'id': report.id,
                  'EFELR_ID': ntr.id,
                  // 'make': ntr.,
                  'efelrelayDatabaseID': ntr.databaseID,
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
                              Text(
                                'Earth Fault/Leakage PAC Details ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11.5,
                                    letterSpacing: 1.5),
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
                                'Earth Fault/Leakage PAC Details ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11.5,
                                    letterSpacing: 1.5),
                              ),
                            ],
                          ),
                    Text('DBID : ' + report.databaseID.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('trNo : ' + report.trNo.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('serialNO : ' + report.serialNo,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text(
                        'coil Resistance : ' +
                            report.coilResistanace.toString(),
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
