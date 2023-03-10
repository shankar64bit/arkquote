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
import '../../../../data/models/equipment/Relays/VoltageRelay/vr_model.dart';
import '../../../../data/models/equipment/Relays/VoltageRelay/vr_pac_model.dart';
import '../../../../data/models/test_report_model.dart';
import '../../../providers/Relays_providers/voltageRelay_provider/vr_pac_provider.dart';
import '../../../providers/Relays_providers/voltageRelay_provider/vr_provider.dart';
import '../../../providers/equipment_acb_provider/test_report_provider.dart';
import '../../dropdown_All/responsive_tool/google_sign_in_out/InternetConnChecker.dart';
import '../../equipment_acb/detail_test_report_page.dart';

class DetailVrPage extends StatelessWidget with GetItMixin {
  Map args = {};
  VrModel ntr;
  int trDbId;
  DetailVrPage(@required this.args, {Key key}) : super(key: key);
  var datetime;

  @override
  Widget build(BuildContext context) {
    getX((VrProvider x) => x.getVrByID(args['id']));
    final VrModel ntr = watchOnly((VrProvider x) => x.vrModel);

    var mob =
        const Text('Voltage Relay Details', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Voltage Relay Details', style: TextStyle(fontSize: 20));
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
                  Navigator.popAndPushNamed(context, '/edit_VR', arguments: {
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
                          child: display_VR_details(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_VrPac(ntr)),
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
                          child: display_VR_details(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_VrPac(ntr)),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),

      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'addVrPac',
        onPressed: () async {
          Navigator.popAndPushNamed(context, '/add_VR_PAC', arguments: {
            'TrNo': ntr.trNo,
            'VR_ID': ntr.id,
            'Serial_No': ntr.serialNo,
            'vrelayDatabaseID': ntr.databaseID,
            'trDatabaseID': args['trDatabaseID'],
          });
        },
        label: const Text('Add Protection\nAccuracy Check',
            style: TextStyle(fontSize: 10, color: Colors.white)),
        icon: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Function dialog_box_action(BuildContext context) {
    return (() {
      getX((VrProvider x) => x.deleteVr(args['id']));
      Navigator.pop(context);
    });
  }

  ReadMoreDisplay_VR_details(VrModel ntr) {
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
        'PT Ratio : ' +
        ntr.ptRatio +
        '\n' +
        'Vn : ' +
        ntr.Vn +
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

  display_VR_details(VrModel ntr) {
    return Container(
      alignment: Alignment.center,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.fromLTRB(80, 10, 80, 10),
          child: ReadMoreText(
            ReadMoreDisplay_VR_details(ntr),
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
                      getX((VrProvider x) => x.deleteVr(args['id']));
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

  generate_list_of_VrPac(VrModel ntr) {
    getX((VrPacProvider x) => x.getVrPacserialNo(ntr.serialNo));
    final List<VrPacModel> reports =
        watchOnly((VrPacProvider x) => x.vrPac_serialNoList);

    getX((VrProvider x) => x.getVrLocalData());
    final List<VrModel> reportsForArgsfrom_Vrmodel =
        watchOnly((VrProvider x) => x.vrlocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((VrPacProvider x) => x.getVrPacEquipmentList());
    final List<VrPacModel> reportsFormVrpacLocalData =
        watchOnly((VrPacProvider x) => x.vrPac_loacaldataList);

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
                for (var i in reportsFormVrpacLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_Vrmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                var url = Uri.parse('${Env.URL_PREFIX}/vrPac/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'plugSetting': i.plugSetting.toString(),
                                  'TMS': i.TMS.toString(),
                                  'coilResistanace':
                                      i.coilResistanace.toString(),
                                  'plugSettingMul1':
                                      i.plugSettingMul1.toString(),
                                  'plugSettingMul2':
                                      i.plugSettingMul2.toString(),
                                  'relayOprTime_1x':
                                      i.relayOprTime_1x.toString(),
                                  'relayOprTime_3x':
                                      i.relayOprTime_3x.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<VrPacProvider>().updateVrPac(
                                      VrPacModel(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        plugSetting: i.plugSetting,
                                        TMS: i.TMS,
                                        coilResistanace: i.coilResistanace,
                                        plugSettingMul1: i.plugSettingMul1,
                                        plugSettingMul2: i.plugSettingMul2,
                                        relayOprTime_1x: i.relayOprTime_1x,
                                        relayOprTime_3x: i.relayOprTime_3x,
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

                // -------------------------------------------------------
                Navigator.pushNamed(context, '/detail_VR_PAC', arguments: {
                  'id': report.id,
                  'VR_ID': ntr.id,
                  // 'make': ntr.,
                  'vrelayDatabaseID': ntr.databaseID,
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_VR_PAC', arguments: {
                  'id': report.id,
                  'VR_ID': ntr.id,
                  // 'make': ntr.,
                  'vrelayDatabaseID': ntr.databaseID,
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
                                'VR PAC Details ',
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
                              const Text(
                                'VR PAC Details ',
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
