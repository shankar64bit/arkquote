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
import '../../../../data/models/equipment/Relays/OCEFRelay/ocefr_model.dart';
import '../../../../data/models/equipment/Relays/OCEFRelay/ocefr_pac_model.dart';
import '../../../../data/models/test_report_model.dart';
import '../../../providers/Relays_providers/OCEFRelay_provider/ocefr_pac_provider.dart';
import '../../../providers/Relays_providers/OCEFRelay_provider/ocefr_provider.dart';
import '../../../providers/equipment_acb_provider/test_report_provider.dart';
import '../../dropdown_All/responsive_tool/google_sign_in_out/InternetConnChecker.dart';
import '../../equipment_acb/detail_test_report_page.dart';

class DetailOcEfrPage extends StatelessWidget with GetItMixin {
  Map args = {};
  OcEfrModel ntr;
  int trDbId;
  DetailOcEfrPage(@required this.args, {Key key}) : super(key: key);
  var datetime;

  @override
  Widget build(BuildContext context) {
    getX((OcEfrProvider x) => x.getOcEfrByID(args['id']));
    final OcEfrModel ntr = watchOnly((OcEfrProvider x) => x.ocefrModel);

    var mob = Text(ntr.designation.toString() + ' Relay Details',
        style: TextStyle(fontSize: 15));
    var desk = Text(ntr.designation + ' Relay Details',
        style: TextStyle(fontSize: 20));
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
                  Navigator.popAndPushNamed(context, '/edit_OCEFR', arguments: {
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
                          child: display_OCEFR_details(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_OcEfrPac(ntr)),
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
                          child: display_OCEFR_details(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_OcEfrPac(ntr)),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),

      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'addOcEfrPac',
        onPressed: () async {
          Navigator.popAndPushNamed(context, '/add_OCEFR_PAC', arguments: {
            'TrNo': ntr.trNo,
            'OCEFR_ID': ntr.id,
            'Serial_No_Rph': ntr.serialNo_Rph,
            'ocefrelayDatabaseID': ntr.databaseID,
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
      getX((OcEfrProvider x) => x.deleteOcEfr(args['id']));
      Navigator.pop(context);
    });
  }

  ReadMoreDisplay_OCEFR_details(OcEfrModel ntr) {
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
        'Serial No Rph: ' +
        ntr.serialNo_Rph.toString() +
        '\n' +
        'Serial No Yph: ' +
        ntr.serialNo_Yph.toString() +
        '\n' +
        'Serial No Bph: ' +
        ntr.serialNo_Bph.toString() +
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

  display_OCEFR_details(OcEfrModel ntr) {
    return Container(
      alignment: Alignment.center,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.fromLTRB(80, 10, 80, 10),
          child: ReadMoreText(
            ReadMoreDisplay_OCEFR_details(ntr),
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
                      getX((OcEfrProvider x) => x.deleteOcEfr(args['id']));
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

  generate_list_of_OcEfrPac(OcEfrModel ntr) {
    getX((OcEfrPacProvider x) => x.getOcEfrPacserialNo(ntr.serialNo_Rph));
    final List<OcEfrPacModel> reports =
        watchOnly((OcEfrPacProvider x) => x.ocefrPac_serialNoList);

    getX((OcEfrProvider x) => x.getOcEfrLocalData());
    final List<OcEfrModel> reportsForArgsfrom_OcEfrmodel =
        watchOnly((OcEfrProvider x) => x.ocefrlocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((OcEfrPacProvider x) => x.getOcEfrPacEquipmentList());
    final List<OcEfrPacModel> reportsFormOcefrPacLocalData =
        watchOnly((OcEfrPacProvider x) => x.ocefrPac_loacaldataList);

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
                for (var i in reportsFormOcefrPacLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_OcEfrmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo_Bph;
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                //add to remote database
                                var url =
                                    Uri.parse('${Env.URL_PREFIX}/ocefrPac/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'r_plugSetting': i.r_plugSetting.toString(),
                                  'r_TMS': i.r_TMS.toString(),
                                  'r_plugSetting_Hi':
                                      i.r_plugSetting_Hi.toString(),
                                  'r_time': i.r_time.toString(),
                                  'y_plugSetting': i.y_plugSetting.toString(),
                                  'y_TMS': i.y_TMS.toString(),
                                  'y_plugSetting_Hi':
                                      i.y_plugSetting_Hi.toString(),
                                  'y_time': i.y_time.toString(),
                                  'b_plugSetting': i.b_plugSetting.toString(),
                                  'b_TMS': i.b_TMS.toString(),
                                  'b_plugSetting_Hi':
                                      i.b_plugSetting_Hi.toString(),
                                  'b_time': i.b_time.toString(),
                                  'r_coilResistanace':
                                      i.r_coilResistanace.toString(),
                                  'y_coilResistanace':
                                      i.y_coilResistanace.toString(),
                                  'b_coilResistanace':
                                      i.b_coilResistanace.toString(),
                                  'plugSettingMul_2x':
                                      i.plugSettingMul_2x.toString(),
                                  'plugSettingMul_5x':
                                      i.plugSettingMul_5x.toString(),
                                  'r_pickupCurrent':
                                      i.r_pickupCurrent.toString(),
                                  'y_pickupCurrent':
                                      i.y_pickupCurrent.toString(),
                                  'b_pickupCurrent':
                                      i.b_pickupCurrent.toString(),
                                  'r_relayOprTime_2x':
                                      i.r_relayOprTime_2x.toString(),
                                  'r_relayOprTime_5x':
                                      i.r_relayOprTime_5x.toString(),
                                  'r_relayOprTime_Hi':
                                      i.r_relayOprTime_Hi.toString(),
                                  'y_relayOprTime_2x':
                                      i.y_relayOprTime_2x.toString(),
                                  'y_relayOprTime_5x':
                                      i.y_relayOprTime_5x.toString(),
                                  'y_relayOprTime_Hi':
                                      i.y_relayOprTime_Hi.toString(),
                                  'b_relayOprTime_2x':
                                      i.b_relayOprTime_2x.toString(),
                                  'b_relayOprTime_5x':
                                      i.b_relayOprTime_5x.toString(),
                                  'b_relayOprTime_Hi':
                                      i.b_relayOprTime_Hi.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<OcEfrPacProvider>().updateOcEfrPac(
                                      OcEfrPacModel(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        r_plugSetting: i.r_plugSetting,
                                        r_TMS: i.r_TMS,
                                        r_plugSetting_Hi: i.r_plugSetting_Hi,
                                        r_time: i.r_time,
                                        y_plugSetting: i.y_plugSetting,
                                        y_TMS: i.y_TMS,
                                        y_plugSetting_Hi: i.y_plugSetting_Hi,
                                        y_time: i.y_time,
                                        b_plugSetting: i.b_plugSetting,
                                        b_TMS: i.b_TMS,
                                        b_plugSetting_Hi: i.b_plugSetting_Hi,
                                        b_time: i.b_time,
                                        r_coilResistanace: i.r_coilResistanace,
                                        y_coilResistanace: i.y_coilResistanace,
                                        b_coilResistanace: i.b_coilResistanace,
                                        plugSettingMul_2x: i.plugSettingMul_2x,
                                        plugSettingMul_5x: i.plugSettingMul_5x,
                                        r_pickupCurrent: i.r_pickupCurrent,
                                        y_pickupCurrent: i.y_pickupCurrent,
                                        b_pickupCurrent: i.b_pickupCurrent,
                                        r_relayOprTime_2x: i.r_relayOprTime_2x,
                                        r_relayOprTime_5x: i.r_relayOprTime_5x,
                                        r_relayOprTime_Hi: i.r_relayOprTime_Hi,
                                        y_relayOprTime_2x: i.y_relayOprTime_2x,
                                        y_relayOprTime_5x: i.y_relayOprTime_5x,
                                        y_relayOprTime_Hi: i.y_relayOprTime_Hi,
                                        b_relayOprTime_2x: i.b_relayOprTime_2x,
                                        b_relayOprTime_5x: i.b_relayOprTime_5x,
                                        b_relayOprTime_Hi: i.b_relayOprTime_Hi,
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
                Navigator.pushNamed(context, '/detail_OCEFR_PAC', arguments: {
                  'id': report.id,
                  'OCEFR_ID': ntr.id,
                  // 'make': ntr.,
                  'ocefrelayDatabaseID': ntr.databaseID,
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_OCEFR_PAC', arguments: {
                  'id': report.id,
                  'OCEFR_ID': ntr.id,
                  // 'make': ntr.,
                  'ocefrelayDatabaseID': ntr.databaseID,
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
                                'Protection Accuracy Check Details ',
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
                                'Protection Accuracy Check Details ',
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
                        'R- coil Resistance : ' +
                            report.r_coilResistanace.toString(),
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
