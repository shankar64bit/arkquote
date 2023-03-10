// ignore_for_file: prefer_const_constructors, missing_return

import 'dart:convert';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import '../../../../../env.sample.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/power_cable/pc_hv_test_model.dart';
import '../../../data/models/equipment/power_cable/pc_ir_test_model.dart';
import '../../../data/models/equipment/power_cable/pc_model.dart';
import '../../../data/models/test_report_model.dart';
import '../../providers/equipment_acb_provider/test_report_provider.dart';
import '../../providers/pc_provider/pc_hv_provider.dart';
import '../../providers/pc_provider/pc_ir_provider.dart';
import '../../providers/pc_provider/pc_provider.dart';
import '../dropdown_All/equipmentUsed.dart';
import 'package:http/http.dart' as http;

import '../dropdown_All/responsive_tool/google_sign_in_out/InternetConnChecker.dart';
import '../equipment_acb/detail_test_report_page.dart';

class DetailPcPage extends StatelessWidget with GetItMixin {
  Map args = {};
  PcModel ntr;
  DetailPcPage(@required this.args, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getX((PcProvider x) => x.getPcByID(args['id']));
    final PcModel ntr = watchOnly((PcProvider x) => x.pcModel);

    var mob = const Text('Power Cable ', style: TextStyle(fontSize: 15));
    var desk = const Text('Power Cable ', style: TextStyle(fontSize: 20));
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
                Navigator.popAndPushNamed(context, '/edit_PC', arguments: {
                  'id': ntr.id,
                  'PC_ID': ntr.databaseID,
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
                              child: display_pc_details(ntr)),
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
                                        child: generate_list_of_PC_IR(ntr)),
                                    SizedBox(
                                        width: 250,
                                        height: 140,
                                        child: generate_list_of_PC_HV(ntr)),
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
                        child: display_pc_details(ntr)),
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
                                      child: generate_list_of_PC_IR(ntr)),
                                  SizedBox(
                                      width: 350,
                                      height: 150,
                                      child: generate_list_of_PC_HV(ntr)),
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
                    ///////////////////////////////ALL-POP-UP-MENU-BUTTON-STARTS-FROM-HERE///////////////////////////
                    ///////////////////////////Add Power Cable- IR button///////////////////////////////
                    ntr.etype == 'pc'
                        ? Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FloatingActionButton.extended(
                                heroTag: 'addPCIR',
                                onPressed: () {
                                  // loading to add details to remote server & local server
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    },
                                  );
                                  EquipmentTypeList()
                                      .getEquipUsetoDefaultValue();
                                  Navigator.of(context).pop();
                                  Navigator.popAndPushNamed(
                                      context, '/add_PC_IR',
                                      arguments: {
                                        'TrNo': ntr.trNo,
                                        'id': ntr.id,
                                        'PC_ID': ntr.databaseID,
                                        'trDatabaseID': args['trDatabaseID'],
                                      });
                                },
                                label: const Text('Insulation Resistance Test',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white)),
                                icon:
                                    const Icon(Icons.add, color: Colors.white)))
                        : Container(),
                    ///////////////////////////Add Power Cable _ HV button///////////////////////////////
                    ntr.etype == 'pc'
                        ? Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FloatingActionButton.extended(
                                heroTag: 'addPCHV',
                                onPressed: () {
                                  // loading to add details to remote server & local server
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    },
                                  );
                                  EquipmentTypeList()
                                      .getEquipUsetoDefaultValue();
                                  Navigator.of(context).pop();
                                  Navigator.popAndPushNamed(
                                      context, '/add_PC_HV',
                                      arguments: {
                                        'TrNo': ntr.trNo,
                                        'id': ntr.id,
                                        'PC_ID': ntr.databaseID,
                                        'trDatabaseID': args['trDatabaseID'],
                                      });
                                },
                                label: const Text('High Voltage Test',
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
      getX((PcProvider x) => x.deletePc(args['id']));
//                        watchOnly((TestReportsProvider x) => {});
      Navigator.pop(context);
    });
  }

  display_pc_details(PcModel ntr) {
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
                            Text('Make : ' + ntr.make,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Divider(height: 5),
                            Text('Size : ' + ntr.size.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Divider(height: 5),
                            Text('Length : ' + ntr.length.toString(),
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
                        getX((PcProvider x) => x.deletePc(args['id']));
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

  generate_list_of_PC_IR(PcModel ntr) {
    getX((PcIrProvider x) => x.getPcIrBypcRefID(ntr.id));
    final List<PcIrTestModel> reports =
        watchOnly((PcIrProvider x) => x.pcIrpcRefIdList);

    getX((PcProvider x) => x.getPCLocalData());
    final List<PcModel> reportsForArgsfrom_PCmodel =
        watchOnly((PcProvider x) => x.pclocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((PcIrProvider x) => x.getPcIrEquipmentList());
    final List<PcIrTestModel> reportsFormPCIRLocalData =
        watchOnly((PcIrProvider x) => x.pcIrEquipmentList);

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
                    for (var i in reportsFormPCIRLocalData) {
                      if (i.id == report.id) {
                        if (report.databaseID == 0 || i.databaseID == 0) {
                          var tempvar = i.trNo;
                          print(tempvar); // current TrNo of Acbcrm Test

                          for (var t in reportsForArgsfrom_TestReports) {
                            if (t.trNo == tempvar) {
                              var tDatabaseID = t.databaseID;
                              print(
                                  tDatabaseID); // current TrNo of TestReport args

                              for (var q in reportsForArgsfrom_PCmodel) {
                                if (q.trNo == tempvar) {
                                  var argsSerialNo = q.trNo;
                                  print(
                                      argsSerialNo); // current serialNo of Acb args

                                  if (report.trNo == argsSerialNo &&
                                      i.trNo == argsSerialNo) {
                                    var argsSnoDB = q.databaseID;
                                    print(argsSnoDB);

                                    //add to remote database
                                    var url = Uri.parse(
                                        '${Env.URL_PREFIX}/pcIrTest/');
                                    var response = await http.post(url, body: {
                                      'trNo': tDatabaseID.toString(),
                                      'pcRef': argsSnoDB.toString(),
                                      'rB': i.rB.toString(),
                                      'yB': i.yB.toString(),
                                      'bB': i.bB.toString(),
                                      'rA': i.rA.toString(),
                                      'yA': i.yA.toString(),
                                      'bA': i.bA.toString(),
                                      'ryB': i.ryB.toString(),
                                      'ybB': i.ybB.toString(),
                                      'brB': i.brB.toString(),
                                      'ryA': i.ryA.toString(),
                                      'ybA': i.ybA.toString(),
                                      'brA': i.brA.toString(),
                                      'equipmentUsed':
                                          i.EquipmentType.toString(),
                                    }, headers: {
                                      'Authorization': 'Bearer $acc_token',
                                    }).then((value) {
                                      sl<PcIrProvider>().updatePcIr(
                                          PcIrTestModel(
                                            id: i.id,
                                            trNo: i.trNo,
                                            pcRefId: i.pcRefId,
                                            rB: i.rB,
                                            yB: i.yB,
                                            bB: i.bB,
                                            rA: i.rA,
                                            yA: i.yA,
                                            bA: i.bA,
                                            ryB: i.ryB,
                                            ybB: i.ybB,
                                            brB: i.brB,
                                            ryA: i.ryA,
                                            ybA: i.ybA,
                                            brA: i.brA,
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
                    // ----------------------------------------------------
                    Navigator.pushNamed(context, '/detail_PC_IR', arguments: {
                      'id': report.id,
                      'PC_ID': ntr.databaseID,
                      'trDatabaseID': args['trDatabaseID'],
                    });
                  } else if (status == DataConnectionStatus.disconnected) {
                    Navigator.pushNamed(context, '/detail_PC_IR', arguments: {
                      'id': report.id,
                      'PC_ID': ntr.databaseID,
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
                                  ntr.etype == 'pc'
                                      ? const Text(
                                          'Pc-IR-Test Details ',
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
                                  ntr.etype == 'pc'
                                      ? const Text(
                                          'Pc-IR-Test Details ',
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
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13)),
                        Text('TrNo : ' + report.trNo.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13)),
                        Text('R Before High Voltage : ' + report.rA.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13)),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }

  generate_list_of_PC_HV(PcModel ntr) {
    getX((PcHvProvider x) => x.getPcHvBypcRefId(ntr.id));
    final List<PcHvTestModel> reports =
        watchOnly((PcHvProvider x) => x.pcHvPcRefIdList);

    getX((PcProvider x) => x.getPCLocalData());
    final List<PcModel> reportsForArgsfrom_PCmodel =
        watchOnly((PcProvider x) => x.pclocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((PcHvProvider x) => x.getPcHvEquipmentList());
    final List<PcHvTestModel> reportsFormPCHvLocalData =
        watchOnly((PcHvProvider x) => x.pcHvEquipmentList);

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
                    for (var i in reportsFormPCHvLocalData) {
                      if (i.id == report.id) {
                        if (report.databaseID == 0 || i.databaseID == 0) {
                          var tempvar = i.trNo;
                          print(tempvar); // current TrNo of Acbcrm Test

                          for (var t in reportsForArgsfrom_TestReports) {
                            if (t.trNo == tempvar) {
                              var tDatabaseID = t.databaseID;
                              print(
                                  tDatabaseID); // current TrNo of TestReport args

                              for (var q in reportsForArgsfrom_PCmodel) {
                                if (q.trNo == tempvar) {
                                  var argsSerialNo = q.id;
                                  print(
                                      argsSerialNo); // current serialNo of Acb args

                                  if (report.id == argsSerialNo &&
                                      i.id == argsSerialNo) {
                                    var argsSnoDB = q.databaseID;

                                    //add to remote database
                                    var url = Uri.parse(
                                        '${Env.URL_PREFIX}/PcHvTest/');
                                    var response = await http.post(url, body: {
                                      'trNo': tDatabaseID.toString(),
                                      'pcRef': argsSnoDB.toString(),
                                      'rCurrent': i.rCurrent.toString(),
                                      'yCurrent': i.yCurrent.toString(),
                                      'bCurrent': i.bCurrent.toString(),
                                      'rVoltage': i.rVoltage.toString(),
                                      'yVoltage': i.yVoltage.toString(),
                                      'bVoltage': i.bVoltage.toString(),
                                      'equipmentUsed':
                                          i.EquipmentType.toString(),
                                    }, headers: {
                                      'Authorization': 'Bearer $acc_token',
                                    }).then((value) {
                                      sl<PcHvProvider>().updatePcHv(
                                          PcHvTestModel(
                                            id: i.id,
                                            trNo: i.trNo,
                                            pcRefId: i.pcRefId,
                                            rCurrent: i.rCurrent,
                                            yCurrent: i.yCurrent,
                                            bCurrent: i.bCurrent,
                                            rVoltage: i.rVoltage,
                                            yVoltage: i.yVoltage,
                                            bVoltage: i.bVoltage,
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
                    // -----------------------------------------
                    Navigator.pushNamed(context, '/detail_PC_HV', arguments: {
                      'id': report.id,
                      'PC_ID': ntr.databaseID,
                      'trDatabaseID': args['trDatabaseID'],
                    });
                  } else if (status == DataConnectionStatus.disconnected) {
                    Navigator.pushNamed(context, '/detail_PC_HV', arguments: {
                      'id': report.id,
                      'PC_ID': ntr.databaseID,
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
                                  ntr.etype == 'pc'
                                      ? const Text(
                                          'PC_HV-Test Details',
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
                                  ntr.etype == 'pc'
                                      ? const Text(
                                          'PC_HV-Test Details',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 11.5,
                                              letterSpacing: 1.5),
                                        )
                                      : Container(),
                                ],
                              ),
                        Text('DBID :' + report.databaseID.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13)),
                        Text('TrNo : ' + report.trNo.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13)),
                        Text('R-Applied Voltage :' + report.rVoltage.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13)),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
