// ignore_for_file: prefer_const_constructors, missing_return

import 'dart:convert';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/DG/dg_ir_test_model.dart';
import '../../../data/models/equipment/DG/dg_model.dart';
import '../../../data/models/equipment/DG/dg_wr_test_model.dart';
import '../../../data/models/test_report_model.dart';
import '../../providers/dg_provider/dg_ir_provider.dart';
import '../../providers/dg_provider/dg_provider.dart';
import '../../providers/dg_provider/dg_wr_provider.dart';
import '../../providers/equipment_acb_provider/test_report_provider.dart';
import '../dropdown_All/equipmentUsed.dart';
import '../dropdown_All/responsive_tool/google_sign_in_out/InternetConnChecker.dart';
import '../equipment_acb/detail_test_report_page.dart';

class DetailDgPage extends StatelessWidget with GetItMixin {
  Map args = {};
  DgModel ntr;
  int trDbId;
  DetailDgPage(@required this.args, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getX((DgProvider x) => x.getDgByID(args['id']));
    final DgModel ntr = watchOnly((DgProvider x) => x.dgModel);

    var mob = const Text('Diesel Generator ', style: TextStyle(fontSize: 15));
    var desk = const Text('Diesel Generator', style: TextStyle(fontSize: 20));
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
                Navigator.popAndPushNamed(context, '/edit_DG', arguments: {
                  'id': ntr.id,
                  'trDatabaseID': args['trDatabaseID'],
                });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              _showAlertDialog(context);
            },
            icon: const Icon(Icons.delete_forever),
          ),
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/');
              },
              icon: const Icon(Icons.home)),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 770) {
            return ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          ConstrainedBox(
                              constraints:
                                  BoxConstraints(minHeight: 0, maxWidth: 1000),
                              child: display_dg_details(ntr)),
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        width: 250,
                                        height: 140,
                                        child: generate_list_of_DG_IR(ntr)),
                                    SizedBox(
                                        width: 250,
                                        height: 140,
                                        child: generate_list_of_DG_WR(ntr)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );

            /////////////////////////////////////MOBILE-VIEW///////////////////////////////////////////////////////////
          } else if (constraints.maxWidth < 770) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: [
                Column(
                  children: [
                    ConstrainedBox(
                        constraints: BoxConstraints(minHeight: 0),
                        child: display_dg_details(ntr)),
                  ],
                ),
                Container(
                  child: Expanded(
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: ((context, index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 100),
                              child: Column(
                                children: [
                                  SizedBox(
                                      width: 350,
                                      height: 150,
                                      child: generate_list_of_DG_IR(ntr)),
                                  SizedBox(
                                      width: 350,
                                      height: 150,
                                      child: generate_list_of_DG_WR(ntr)),
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                ),
              ]),
            );
          }
        },
      ),
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
                    ntr.etype == 'dg'
                        ? Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FloatingActionButton.extended(
                                heroTag: 'addDGIR',
                                onPressed: () {
                                  EquipmentTypeList()
                                      .getEquipUsetoDefaultValue();
                                  Navigator.pop(context);
                                  Navigator.popAndPushNamed(
                                      context, '/add_DG_IR',
                                      arguments: {
                                        'TrNo': ntr.trNo,
                                        'DG_ID': ntr.id,
                                        'Serial_No': ntr.serialNo,
                                        'dgDatabaseID': ntr.databaseID,
                                        'trDatabaseID': args['trDatabaseID'],
                                      });
                                },
                                label: const Text('Insulation Resistance Test',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white)),
                                icon:
                                    const Icon(Icons.add, color: Colors.white)))
                        : Container(),
                    ///////////////////////////Add Diesel Generator _ CR button///////////////////////////////
                    ntr.etype == 'dg'
                        ? Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FloatingActionButton.extended(
                                heroTag: 'addDGWR',
                                onPressed: () {
                                  EquipmentTypeList()
                                      .getEquipUsetoDefaultValue();
                                  Navigator.pop(context);
                                  Navigator.popAndPushNamed(
                                      context, '/add_DG_WR',
                                      arguments: {
                                        'TrNo': ntr.trNo,
                                        'DG_ID': ntr.id,
                                        'Serial_No': ntr.serialNo,
                                        'dgDatabaseID': ntr.databaseID,
                                        'trDatabaseID': args['trDatabaseID'],
                                      });
                                },
                                label: const Text('Winding Resistance Test',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white)),
                                icon:
                                    const Icon(Icons.add, color: Colors.white)))
                        : Container(),
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
      getX((DgProvider x) => x.deleteDg(args['id']));
      Navigator.pop(context);
    });
  }

  display_dg_details(DgModel ntr) {
    return Container(
      child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Text('DBID : ' + ntr.databaseID.toString(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 12)),
                      Divider(height: 5),
                      Text('Etype : ' + ntr.etype.toString(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 12)),
                      Divider(height: 5),
                      Text('TrNo : ' + ntr.trNo.toString(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 12)),
                      Divider(height: 5),
                      Text('Design : ' + ntr.design,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 12)),
                      Divider(height: 5),
                      Text('Location : ' + ntr.location,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 12)),
                    ],
                  ),
                ),
              ),
              Divider(height: 5, color: Colors.grey[100]),
              Card(
                elevation: 2,
                child: Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Text(' Nameplate  Details ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  fontSize: 12)),
                        )
                      ]),
                  Card(
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('SerialNo : ' + ntr.serialNo.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Divider(height: 5),
                            Text('Rating : ' + ntr.rating.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Divider(height: 5),
                            Text('Make : ' + ntr.make,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Divider(height: 5),
                            Text('Model : ' + ntr.model.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Divider(height: 5),
                            Text('Voltage : ' + ntr.voltage.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Divider(height: 5),
                            Text('Speed : ' + ntr.speed.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Divider(height: 5),
                            Text('Power Factor : ' + ntr.powerFactor.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Divider(height: 5),
                            Text(
                                'DateOfTest : ' +
                                    DateFormat('dd-MM-yyyy')
                                        .format(ntr.dateOfTesting)
                                        .toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Divider(height: 5),
                            Text('TestedBy : ' + ntr.TestedBy.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Divider(height: 5),
                            Text('VerifiedBy : ' + ntr.VerifiedBy.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Divider(height: 5),
                            Text('WitnessedBy : ' + ntr.WitnessedBy.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 12)),
                          ]),
                    ),
                  )
                ]),
              ),
            ],
          )),
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
                        getX((DgProvider x) => x.deleteDg(args['id']));
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
        });
  }

  generate_list_of_DG_IR(DgModel ntr) {
    getX((DgIrProvider x) => x.getDgIrBySerialNo(ntr.serialNo));
    final List<DgIrTestModel> reports =
        watchOnly((DgIrProvider x) => x.dgIrSerialNoList);

    getX((DgProvider x) => x.getDgLocalData());
    final List<DgModel> reportsForArgsfrom_Dgmodel =
        watchOnly((DgProvider x) => x.dglocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((DgIrProvider x) => x.getDgIrEquipmentList());
    final List<DgIrTestModel> reportsFormDgIRLocalData =
        watchOnly((DgIrProvider x) => x.dgIrEquipmentList);

    return Container(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: reports.length,
            itemBuilder: (context, index) {
              final report = reports[index];
              return GestureDetector(
                onTap: () async {
                  DataConnectionStatus status = await CheckInternet();
                  if (status == DataConnectionStatus.connected) {
                    for (var i in reportsFormDgIRLocalData) {
                      if (i.id == report.id) {
                        if (report.databaseID == 0 || i.databaseID == 0) {
                          var tempvar = i.trNo;
                          print(tempvar); // current TrNo of Acbcrm Test

                          for (var t in reportsForArgsfrom_TestReports) {
                            if (t.trNo == tempvar) {
                              var tDatabaseID = t.databaseID;
                              print(
                                  tDatabaseID); // current TrNo of TestReport args

                              for (var q in reportsForArgsfrom_Dgmodel) {
                                if (q.trNo == tempvar) {
                                  var argsSerialNo = q.serialNo;
                                  print(
                                      argsSerialNo); // current serialNo of Acb args

                                  if (report.serialNo == argsSerialNo &&
                                      i.serialNo == argsSerialNo) {
                                    var argsSnoDB = q.databaseID;

                                    //add to remote database
                                    var url = Uri.parse(
                                        '${Env.URL_PREFIX}/dgIrTest/');
                                    var response = await http.post(url, body: {
                                      'trNo': tDatabaseID.toString(),
                                      'serialNo': argsSnoDB.toString(),
                                      're_mResistance':
                                          i.re_mResistance.toString(),
                                      'ye_mResistance':
                                          i.ye_mResistance.toString(),
                                      'be_mResistance':
                                          i.be_mResistance.toString(),
                                      'equipmentUsed':
                                          i.EquipmentType.toString(),
                                    }, headers: {
                                      'Authorization': 'Bearer $acc_token',
                                    }).then((value) {
                                      sl<DgIrProvider>().updateDgIr(
                                          DgIrTestModel(
                                            id: i.id,
                                            trNo: i.trNo,
                                            serialNo: i.serialNo,
                                            re_mResistance: i.re_mResistance,
                                            ye_mResistance: i.ye_mResistance,
                                            be_mResistance: i.be_mResistance,
                                            EquipmentType: i.EquipmentType,
                                            databaseID:
                                                json.decode(value.body)['id'],
                                            lastUpdated: DateTime.now(),
                                          ),
                                          report.id);
                                      print(
                                          'Response status: ${value.statusCode}');
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
                    Navigator.pushNamed(context, '/detail_DG_IR', arguments: {
                      'id': report.id,
                      'DG_ID': ntr.databaseID,
                      'trDatabaseID': args['trDatabaseID'],
                    });
                  } else if (status == DataConnectionStatus.disconnected) {
                    Navigator.pushNamed(context, '/detail_DG_IR', arguments: {
                      'id': report.id,
                      'DG_ID': ntr.databaseID,
                      'trDatabaseID': args['trDatabaseID'],
                    });
                  }
                },
                child: Card(
                  // color: Color.fromARGB(255, 42, 54, 76),

                  color: Colors.white,
                  elevation: 5,
                  margin: EdgeInsets.fromLTRB(20, 10, 0, 15),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 30, 5),
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
                                  ntr.etype == 'dg'
                                      ? const Text(
                                          'Dg-IR-Test Details ',
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
                                  ntr.etype == 'dg'
                                      ? const Text(
                                          'Dg-IR-Test Details ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11.5,
                                              letterSpacing: 1.5),
                                        )
                                      : Container(),
                                ],
                              ),
                        ////////////////////////CARD-TITLE-Controller////////////////////

                        ////////////////////////CARD-TITLE-Controller////////////////////
                        Divider(height: 10),
                        Text('DBID : ' + report.databaseID.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13)),
                        Text('TrNo : ' + report.trNo.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13)),
                        Text('SerialNo : ' + report.serialNo.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13)),
                        Text(
                            're_Resistance : ' +
                                report.re_mResistance.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13)),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }

  generate_list_of_DG_WR(DgModel ntr) {
    getX((DgWrProvider x) => x.getDgWrBySerialNo(ntr.serialNo));
    final List<DgWrTestModel> reports =
        watchOnly((DgWrProvider x) => x.dgWrSerialNoList);

    getX((DgProvider x) => x.getDgLocalData());
    final List<DgModel> reportsForArgsfrom_Dgmodel =
        watchOnly((DgProvider x) => x.dglocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((DgWrProvider x) => x.getDgWrEquipmentList());
    final List<DgWrTestModel> reportsFormDGwrLocalData =
        watchOnly((DgWrProvider x) => x.dgWrEquipmentList);

    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return GestureDetector(
            onTap: () async {
              DataConnectionStatus status = await CheckInternet();
              if (status == DataConnectionStatus.connected) {
                for (var i in reportsFormDGwrLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_Dgmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                //add to remote database
                                var url =
                                    Uri.parse('${Env.URL_PREFIX}/dgWrTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'uv': i.uv.toString(),
                                  'vw': i.vw.toString(),
                                  'wu': i.wu.toString(),
                                  'equipmentUsed': i.EquipmentType.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<DgWrProvider>().updateDgWr(
                                      DgWrTestModel(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        uv: i.uv,
                                        vw: i.vw,
                                        wu: i.wu,
                                        EquipmentType: i.EquipmentType,
                                        databaseID:
                                            json.decode(value.body)['id'],
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
                    }
                  }
                }
                // ----------------------------------------------------
                Navigator.pushNamed(context, '/detail_DG_WR', arguments: {
                  'id': report.id,
                  'DG_ID': ntr.databaseID,
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_DG_WR', arguments: {
                  'id': report.id,
                  'DG_ID': ntr.databaseID,
                  'trDatabaseID': args['trDatabaseID'],
                });
              }
              // --------------------------------------
            },
            child: Card(
              // color: Color.fromARGB(255, 42, 54, 76),

              color: Colors.white,
              elevation: 5,
              margin: EdgeInsets.fromLTRB(20, 10, 0, 15),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 30, 5),
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
                              const Text(
                                'Dg-WR-Test Details',
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
                                'Dg-WR-Test Details',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11.5,
                                    letterSpacing: 1.5),
                              ),
                            ],
                          ),
                    ////////////////////////CARD-TITLE-Controller////////////////////

                    ////////////////////////CARD-TITLE-Controller////////////////////
                    Divider(height: 10),
                    Text('DBID : ' + report.databaseID.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('TrNo : ' + report.trNo.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('SerialNo : ' + report.serialNo.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('uv: ' + report.uv.toString(),
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
