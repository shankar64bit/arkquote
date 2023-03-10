// ignore_for_file: prefer_const_constructors, missing_return, prefer_interpolation_to_compose_strings, file_names, use_build_context_synchronously, non_constant_identifier_names
// import 'dart:html';
import 'dart:convert';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import '../../../../../../env.sample.dart';
import '../../../../../../injection_container.dart';
import '../../../../data/models/equipment/Relays/AuxiliaryRelay/AR_model.dart';
import '../../../../data/models/equipment/Relays/AuxiliaryRelay/AR_pudo_model.dart';
import '../../../../data/models/test_report_model.dart';
import 'package:http/http.dart' as http;
import '../../../providers/Relays_providers/AuxiliaryRelay_providers/AR_provider.dart';
import '../../../providers/Relays_providers/AuxiliaryRelay_providers/AR_pudo_provider.dart';
import '../../../providers/equipment_acb_provider/test_report_provider.dart';
import '../../dropdown_All/responsive_tool/google_sign_in_out/InternetConnChecker.dart';
import '../../equipment_acb/detail_test_report_page.dart';

class Detail_AR_Page extends StatelessWidget with GetItMixin {
  Map args = {};
  ARModel ntr;
  int trDbId;
  Detail_AR_Page(@required this.args, {Key key}) : super(key: key);
  var datetime;

  @override
  Widget build(BuildContext context) {
    getX((ARProvider x) => x.getARByID(args['id']));
    final ARModel ntr = watchOnly((ARProvider x) => x.arModel);

    var mob = const Text('AR  Details', style: TextStyle(fontSize: 15));
    var desk = const Text('AR  Details', style: TextStyle(fontSize: 20));
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
                  Navigator.popAndPushNamed(context, '/edit_AR', arguments: {
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
                          child: display_AR_details(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_ARpudo(ntr)),
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
                          child: display_AR_details(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_ARpudo(ntr)),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),

      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'addARpudo',
        onPressed: () async {
          Navigator.popAndPushNamed(context, '/add_ARpudo', arguments: {
            'TrNo': ntr.trNo,
            'AR_ID': ntr.id,
            // 'make': ntr.make,
            'arDatabaseID': ntr.databaseID,
            'trDatabaseID': args['trDatabaseID'],
          });
        },
        label: const Text('Add Pickup/Drop off\nVoltage Test',
            style: TextStyle(fontSize: 10, color: Colors.white)),
        icon: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Function dialog_box_action(BuildContext context) {
    return (() {
      getX((ARProvider x) => x.deleteAR(args['id']));
      Navigator.pop(context);
    });
  }

  ReadMoreDisplay_AR_details(ARModel ntr) {
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
        'noOfCoil : ' +
        ntr.noOfCoil.toString() +
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

  display_AR_details(ARModel ntr) {
    return Container(
      alignment: Alignment.center,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.fromLTRB(80, 10, 80, 10),
          child: ReadMoreText(
            ReadMoreDisplay_AR_details(ntr),
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
                      getX((ARProvider x) => x.deleteAR(args['id']));
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

  generate_list_of_ARpudo(ARModel ntr) {
    getX((ARpudoProvider x) => x.getARpudotrNoID(ntr.trNo));
    final List<ARpudoModel> reports =
        watchOnly((ARpudoProvider x) => x.arpudo_trNoIDList);

    getX((ARProvider x) => x.getARLocalData());
    final List<ARModel> reportsForArgsfrom_ARmodel =
        watchOnly((ARProvider x) => x.arLocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((ARpudoProvider x) => x.getARpudoEquipmentList());
    final List<ARpudoModel> reportsFormARpudoLocalData =
        watchOnly((ARpudoProvider x) => x.arpudo_loacaldataList);

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
                for (var i in reportsFormARpudoLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_ARmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.id;
                              print(argsSerialNo); // current serial Acb args

                              if (report.id == argsSerialNo &&
                                  i.id == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                var url =
                                    Uri.parse('${Env.URL_PREFIX}/arPuDo/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'arRef': argsSnoDB.toString(),
                                  'coilRef': i.coilRef.toString(),
                                  'coilResistenace':
                                      i.coilResistenace.toString(),
                                  'pickUp': i.pickUp.toString(),
                                  'dropOff': i.dropOff.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<ARpudoProvider>().updateARpudo(
                                      ARpudoModel(
                                        id: i.id,
                                        trNo: i.trNo,
                                        arRef: i.arRef,
                                        coilRef: i.coilRef,
                                        coilResistenace: i.coilResistenace,
                                        pickUp: i.pickUp,
                                        dropOff: i.dropOff,
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

                // -----------------------------------------------------
                Navigator.pushNamed(context, '/detail_ARpudo', arguments: {
                  'id': report.id,
                  'AR_ID': report.databaseID,
                  // 'make': ntr.,
                  'arDatabaseID': args['arDatabaseID'],
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_ARpudo', arguments: {
                  'id': report.id,
                  'AR_ID': report.databaseID,
                  // 'make': ntr.,
                  'arDatabaseID': args['arDatabaseID'],
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
                              ntr.etype == 'ar'
                                  ? const Text(
                                      'ARpudo Details ',
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
                              ntr.etype == 'ar'
                                  ? const Text(
                                      'ARpudo Details ',
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
                    Text('coilRef : ' + report.coilRef,
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
