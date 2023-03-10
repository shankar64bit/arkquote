// ignore_for_file: prefer_const_constructors, missing_return

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../../../../../env.sample.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/busbar/bb_cr_test_model.dart';
import '../../../data/models/equipment/busbar/bb_hv_test_model.dart';
import '../../../data/models/equipment/busbar/bb_ir_test_model.dart';
import '../../../data/models/equipment/busbar/bb_model.dart';
import '../../../data/models/test_report_model.dart';
import '../../providers/busbar_provider/bb_cr_provider.dart';
import '../../providers/busbar_provider/bb_hv_provider.dart';
import '../../providers/busbar_provider/bb_ir_provider.dart';
import '../../providers/busbar_provider/bb_provider.dart';
import '../../providers/equipment_acb_provider/test_report_provider.dart';
import '../dropdown_All/equipmentUsed.dart';
import '../equipment_acb/detail_test_report_page.dart';

class DetailBbPage extends StatelessWidget with GetItMixin {
  Map args = {};
  BbModel ntr;
  DetailBbPage(@required this.args, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getX((BbProvider x) => x.getBbByID(args['id']));
    final BbModel ntr = watchOnly((BbProvider x) => x.bbModel);

    var mob = const Text('Busbar Details ', style: TextStyle(fontSize: 15));
    var desk = const Text('Busbar Details ', style: TextStyle(fontSize: 20));
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
                Navigator.popAndPushNamed(context, '/edit_BB', arguments: {
                  'id': ntr.id,
                  'BB_ID': ntr.databaseID,
                  'trDatabaseID': args['trDatabaseID']
                });
              },
              icon: const Icon(Icons.edit)),
          IconButton(
            onPressed: () {
              _showAlertDialog(context);
              //CustomShowDialogBox('Alert', 'Do you want to Delete?',dialog_box_action(context), context);
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
                      Column(
                        children: [
                          ConstrainedBox(
                              constraints:
                                  BoxConstraints(minHeight: 0, maxWidth: 1000),
                              child: display_bb_details(ntr)),
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        width: 250,
                                        height: 140,
                                        child: generate_list_of_BB_IR(ntr)),
                                    SizedBox(
                                        width: 250,
                                        height: 140,
                                        child: generate_list_of_BB_HV(ntr)),
                                    SizedBox(
                                        width: 250,
                                        height: 140,
                                        child: generate_list_of_BB_CR(ntr)),
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
                        child: display_bb_details(ntr)),
                  ],
                ),
                Container(
                  child: Expanded(
                    child: ListView.builder(
                      //Represents the number of expanded rows that can be scrollable vertically,
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
                                      child: generate_list_of_BB_IR(ntr)),
                                  SizedBox(
                                      width: 350,
                                      height: 150,
                                      child: generate_list_of_BB_HV(ntr)),
                                  SizedBox(
                                      width: 350,
                                      height: 150,
                                      child: generate_list_of_BB_CR(ntr)),
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
                    ///////////////////////////Add Power Cable- IR button///////////////////////////////
                    Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FloatingActionButton.extended(
                            heroTag: 'addBBIR',
                            onPressed: () {
                              EquipmentTypeList().getEquipUsetoDefaultValue();
                              Navigator.popAndPushNamed(context, '/add_BB_IR',
                                  arguments: {
                                    'TrNo': ntr.trNo,
                                    'id': ntr.id,
                                    'BB_ID': ntr.databaseID,
                                    'trDatabaseID': args['trDatabaseID'],
                                  });
                            },
                            label: const Text('Insulation Resistance Test',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white)),
                            icon: const Icon(Icons.add, color: Colors.white))),
                    ///////////////////////////Add Power Cable _ HV button///////////////////////////////
                    ntr.etype == 'bbh' || ntr.etype == 'bbhc'
                        ? Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FloatingActionButton.extended(
                                heroTag: 'addBBHV',
                                onPressed: () {
                                  EquipmentTypeList()
                                      .getEquipUsetoDefaultValue();
                                  Navigator.popAndPushNamed(
                                      context, '/add_BB_HV',
                                      arguments: {
                                        'TrNo': ntr.trNo,
                                        'id': ntr.id,
                                        'BB_ID': ntr.databaseID,
                                        'trDatabaseID': args['trDatabaseID'],
                                      });
                                },
                                label: const Text('High Voltage Test',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white)),
                                icon:
                                    const Icon(Icons.add, color: Colors.white)))
                        : Container(),
                    ///////////////////////////Add Power Cable _ CR button///////////////////////////////
                    ntr.etype == 'bbc' || ntr.etype == 'bbhc'
                        ? Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FloatingActionButton.extended(
                                heroTag: 'addBBCR',
                                onPressed: () {
                                  EquipmentTypeList()
                                      .getEquipUsetoDefaultValue();
                                  Navigator.popAndPushNamed(
                                      context, '/add_BB_CR',
                                      arguments: {
                                        'TrNo': ntr.trNo,
                                        'id': ntr.id,
                                        'BB_ID': ntr.databaseID,
                                        'trDatabaseID': args['trDatabaseID'],
                                      });
                                },
                                label: const Text('Contact Resistance Test',
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
      getX((BbProvider x) => x.deleteBb(args['id']));
      Navigator.pop(context);
    });
  }

  display_bb_details(BbModel ntr) {
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
                      Text('Designation : ' + ntr.designation,
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
                            Text('Panel : ' + ntr.panel.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Divider(height: 5),
                            Text('Rating : ' + ntr.rating.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Divider(height: 5),
                            Text('No of Bar : ' + ntr.noOfBar.toString(),
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
                      getX((BbProvider x) => x.deleteBb(args['id']));
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

  generate_list_of_BB_IR(BbModel ntr) {
    getX((BbIrProvider x) => x.getBbIrBybbRefID(ntr.id));
    final List<BbIrTestModel> reports =
        watchOnly((BbIrProvider x) => x.bbIrbbRefIdList);

    getX((BbProvider x) => x.getBBLocalData());
    final List<BbModel> reportsForArgsfrom_BBmodel =
        watchOnly((BbProvider x) => x.bblocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((BbIrProvider x) => x.getBbIrEquipmentList());
    final List<BbIrTestModel> reportsFormBBHvLocalData =
        watchOnly((BbIrProvider x) => x.bbIrEquipmentList);

    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return GestureDetector(
            onTap: () async {
              for (var i in reportsFormBBHvLocalData) {
                if (i.id == report.id) {
                  if (report.databaseID == 0 || i.databaseID == 0) {
                    var tempvar = i.trNo;
                    print(tempvar); // current TrNo of Acbcrm Test

                    for (var t in reportsForArgsfrom_TestReports) {
                      if (t.trNo == tempvar) {
                        var tDatabaseID = t.databaseID;
                        print(tDatabaseID); // current TrNo of TestReport args

                        for (var q in reportsForArgsfrom_BBmodel) {
                          if (q.trNo == tempvar) {
                            var argsSerialNo = q.id;
                            print(argsSerialNo); // current serialNo of Acb args

                            if (report.bbRefId == argsSerialNo &&
                                i.bbRefId == argsSerialNo) {
                              var argsSnoDB = q.databaseID;
                              print(argsSnoDB);

                              // //add to remote database
                              var url =
                                  Uri.parse('${Env.URL_PREFIX}/bbIrTest/');
                              var response = await http.post(url, body: {
                                'trNo': tDatabaseID.toString(),
                                'bbRef': argsSnoDB.toString(),
                                'rB': i.rB.toString(),
                                'yB': i.yB.toString(),
                                'bB': i.bB.toString(),
                                'rA': i.rA.toString(),
                                'yA': i.yA.toString(),
                                'bA': i.bA.toString(),
                                'nA': i.nA.toString(),
                                'nB': i.nB.toString(),
                                'ryB': i.ryB.toString(),
                                'ybB': i.ybB.toString(),
                                'brB': i.brB.toString(),
                                'ryA': i.ryA.toString(),
                                'ybA': i.ybA.toString(),
                                'brA': i.brA.toString(),
                                'rnA': i.rnA.toString(),
                                'rnB': i.rnB.toString(),
                                'ynA': i.ynA.toString(),
                                'ynB': i.ynB.toString(),
                                'bnA': i.bnA.toString(),
                                'bnB': i.bnB.toString(),
                                'equipmentUsed': i.EquipmentType.toString(),
                              }, headers: {
                                'Authorization': 'Bearer $acc_token',
                              }).then((value) {
                                sl<BbIrProvider>().updateBbIr(
                                    BbIrTestModel(
                                      id: i.id,
                                      trNo: i.trNo,
                                      bbRefId: i.bbRefId,
                                      rB: i.rB,
                                      yB: i.yB,
                                      bB: i.bB,
                                      rA: i.rA,
                                      yA: i.yA,
                                      bA: i.bA,
                                      nA: i.nA,
                                      nB: i.nB,
                                      ryB: i.ryB,
                                      ybB: i.ybB,
                                      brB: i.brB,
                                      ryA: i.ryA,
                                      ybA: i.ybA,
                                      brA: i.brA,
                                      rnA: i.rnA,
                                      rnB: i.rnB,
                                      ynA: i.ynA,
                                      ynB: i.ynB,
                                      bnA: i.bnA,
                                      bnB: i.bnB,
                                      EquipmentType: i.EquipmentType,
                                      databaseID: json.decode(value.body)['id'],
                                      lastUpdated: DateTime.now(),
                                    ),
                                    report.id);
                                print('Response status: ${value.statusCode}');
                                print('Response body: ${value.body}');
                                print('Stored successfully to remote DB');
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
              Navigator.pushNamed(context, '/detail_BB_IR', arguments: {
                'id': report.id,
                'BB_ID': ntr.id,
                'bbDatabaseID': ntr.databaseID,
                'trDatabaseID': args['trDatabaseID'],
              });
            },
            child: Card(
              // color: Color.fromARGB(255, 42, 54, 76),

              color: Colors.white,
              elevation: 5,
              margin: EdgeInsets.fromLTRB(20, 10, 0, 25),
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
                              ntr.etype == 'bb' || ntr.etype == 'bbh'
                                  ? const Text(
                                      ' Bb-IR-Test Details ',
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
                              ntr.etype == 'bb' || ntr.etype == 'bbh'
                                  ? const Text(
                                      ' Bb-IR-Test Details ',
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
                    Text('TrNo : ' + report.trNo.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('R Before High Voltage : ' + report.rA.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('Y After High Voltage : ' + report.yA.toString(),
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

  generate_list_of_BB_HV(BbModel ntr) {
    getX((BbHvProvider x) => x.getBbHvBybbRefId(ntr.id));
    final List<BbHvTestModel> reports =
        watchOnly((BbHvProvider x) => x.bbHvBbRefIdList);

    getX((BbProvider x) => x.getBBLocalData());
    final List<BbModel> reportsForArgsfrom_BBmodel =
        watchOnly((BbProvider x) => x.bblocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((BbHvProvider x) => x.getBbHvEquipmentList());
    final List<BbHvTestModel> reportsFormBBHvLocalData =
        watchOnly((BbHvProvider x) => x.bbHvEquipmentList);

    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return GestureDetector(
            onTap: () async {
              // ----------------------------------------------------

              for (var i in reportsFormBBHvLocalData) {
                if (i.id == report.id) {
                  if (report.databaseID == 0 || i.databaseID == 0) {
                    var tempvar = i.trNo;
                    print(tempvar); // current TrNo of Acbcrm Test

                    for (var t in reportsForArgsfrom_TestReports) {
                      if (t.trNo == tempvar) {
                        var tDatabaseID = t.databaseID;
                        print(tDatabaseID); // current TrNo of TestReport args

                        for (var q in reportsForArgsfrom_BBmodel) {
                          if (q.trNo == tempvar) {
                            var argsSerialNo = q.id;
                            print(argsSerialNo); // current serialNo of Acb args

                            if (report.bbRefId == argsSerialNo &&
                                i.bbRefId == argsSerialNo) {
                              var argsSnoDB = q.databaseID;

                              // //add to remote database
                              var url =
                                  Uri.parse('${Env.URL_PREFIX}/bbHvTest/');
                              var response = await http.post(url, body: {
                                'trNo': tDatabaseID.toString(),
                                'bbRef': argsSnoDB.toString(),
                                'r': i.r.toString(),
                                'y': i.y.toString(),
                                'b': i.b.toString(),
                                'n': i.n.toString(),
                                'equipmentUsed': i.EquipmentType.toString(),
                              }, headers: {
                                'Authorization': 'Bearer $acc_token',
                              }).then((value) {
                                sl<BbHvProvider>().updateBbHv(
                                    BbHvTestModel(
                                      id: i.id,
                                      trNo: i.trNo,
                                      bbRefId: i.bbRefId,
                                      r: i.r,
                                      y: i.y,
                                      b: i.b,
                                      n: i.n,
                                      EquipmentType: i.EquipmentType,
                                      databaseID: json.decode(value.body)['id'],
                                      lastUpdated: DateTime.now(),
                                    ),
                                    report.id);
                                print('Response status: ${value.statusCode}');
                                print('Response body: ${value.body}');
                                print('Stored successfully to remote DB');
                              });
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
              Navigator.pushNamed(context, '/detail_BB_HV', arguments: {
                'id': report.id,
                'BB_ID': ntr.id,
                'bbDatabaseID': ntr.databaseID,
                'trDatabaseID': args['trDatabaseID'],
              });
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
                              ntr.etype == 'bb'
                                  ? const Text(
                                      ' BB_HV-Test Details',
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
                              ntr.etype == 'bb' || ntr.etype == 'bbh'
                                  ? const Text(
                                      ' BB_HV-Test Details',
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
                    Text('TrNo : ' + report.trNo.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text(
                        'R-R\'Measured Leakage Current (mA)' +
                            report.r.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text(
                        'Y-Y\' Measured Leakage Current (mA) ' +
                            report.y.toString(),
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

  generate_list_of_BB_CR(BbModel ntr) {
    getX((BbCrProvider x) => x.getBbCrBybbRefId(ntr.id));
    final List<BbCrTestModel> reports =
        watchOnly((BbCrProvider x) => x.bbCrBbRefIdList);

    getX((BbProvider x) => x.getBBLocalData());
    final List<BbModel> reportsForArgsfrom_BBmodel =
        watchOnly((BbProvider x) => x.bblocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((BbCrProvider x) => x.getBbCrEquipmentList());
    final List<BbCrTestModel> reportsFormBBHvLocalData =
        watchOnly((BbCrProvider x) => x.bbCrEquipmentList);

    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return GestureDetector(
            onTap: () async {
              for (var i in reportsFormBBHvLocalData) {
                if (i.id == report.id) {
                  if (report.databaseID == 0 || i.databaseID == 0) {
                    var tempvar = i.trNo;
                    print(tempvar); // current TrNo of Acbcrm Test

                    for (var t in reportsForArgsfrom_TestReports) {
                      if (t.trNo == tempvar) {
                        var tDatabaseID = t.databaseID;
                        print(tDatabaseID); // current TrNo of TestReport args

                        for (var q in reportsForArgsfrom_BBmodel) {
                          if (q.trNo == tempvar) {
                            var argsSerialNo = q.id;
                            print(argsSerialNo); // current serialNo of Acb args

                            if (report.bbRefId == argsSerialNo &&
                                i.bbRefId == argsSerialNo) {
                              var argsSnoDB = q.databaseID;

                              // //add to remote database
                              var url =
                                  Uri.parse('${Env.URL_PREFIX}/bbCrTest/');
                              var response = await http.post(url, body: {
                                'trNo': tDatabaseID.toString(),
                                'bbRef': argsSnoDB.toString(),
                                'r': i.r.toString(),
                                'y': i.y.toString(),
                                'b': i.b.toString(),
                                'n': i.n.toString(),
                                'equipmentUsed': i.EquipmentType.toString(),
                              }, headers: {
                                'Authorization': 'Bearer $acc_token',
                              }).then((value) {
                                sl<BbCrProvider>().updateBbCr(
                                    BbCrTestModel(
                                      id: i.id,
                                      trNo: i.trNo,
                                      bbRefId: i.bbRefId,
                                      r: i.r,
                                      y: i.y,
                                      b: i.b,
                                      n: i.n,
                                      EquipmentType: i.EquipmentType,
                                      databaseID: json.decode(value.body)['id'],
                                      lastUpdated: DateTime.now(),
                                    ),
                                    report.id);
                                print('Response status: ${value.statusCode}');
                                print('Response body: ${value.body}');
                                print('Stored successfully to remote DB');
                              });
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
              // ------------------------------------------------------
              Navigator.pushNamed(context, '/detail_BB_CR', arguments: {
                'id': report.id,
                'BB_ID': ntr.id,
                'bbDatabaseID': ntr.databaseID,
                'trDatabaseID': args['trDatabaseID'],
              });
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
                              ntr.etype == 'bbc' || ntr.etype == 'bbhc'
                                  ? const Text(
                                      'Bb-CR-Test Details ',
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
                              ntr.etype == 'bbc' || ntr.etype == 'bbhc'
                                  ? const Text(
                                      'Bb-CR-Test Details ',
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
                    Text('TrNo : ' + report.trNo.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text(
                        'R-R\'Measured Resistance Value (µΩ) : ' +
                            report.r.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text(
                        'Y-Y\' Measured Resistance Value (µΩ): ' +
                            report.y.toString(),
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
