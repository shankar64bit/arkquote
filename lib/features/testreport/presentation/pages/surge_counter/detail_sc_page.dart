// ignore_for_file: prefer_const_constructors, missing_return

import 'dart:convert';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/sc_provider/sc_c_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import '../../../../../env.sample.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/SC/sc_c_test_model.dart';
import '../../../data/models/equipment/SC/sc_model.dart';
import 'package:http/http.dart' as http;
import '../../../data/models/test_report_model.dart';
import '../../providers/equipment_acb_provider/test_report_provider.dart';
import '../../providers/sc_provider/sc_provider.dart';
import '../dropdown_All/equipmentUsed.dart';
import '../dropdown_All/responsive_tool/google_sign_in_out/InternetConnChecker.dart';
import '../equipment_acb/detail_test_report_page.dart';

class DetailScPage extends StatelessWidget with GetItMixin {
  Map args = {};
  ScModel ntr;
  int trDbId;
  DetailScPage(@required this.args, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getX((ScProvider x) => x.getScByID(args['id']));
    final ScModel ntr = watchOnly((ScProvider x) => x.scModel);

    var mob = const Text('Surge counter', style: TextStyle(fontSize: 15));
    var desk = const Text('Surge Counter', style: TextStyle(fontSize: 20));
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
                  Navigator.popAndPushNamed(context, '/edit_SC', arguments: {
                    'id': ntr.id,
                    'trDatabaseID': args['trDatabaseID'],
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
                                constraints: BoxConstraints(
                                    minHeight: 0, maxWidth: 1000),
                                child: display_Sc_details(ntr)),
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
                                          child: generate_list_of_SC_C(ntr)),
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
                          child: display_Sc_details(ntr)),
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
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 0, 100),
                                child: Column(
                                  children: [
                                    SizedBox(
                                        width: 350,
                                        height: 150,
                                        child: generate_list_of_SC_C(ntr)),
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
        floatingActionButton:
            // PopupMenuButton(
            //   child: FloatingActionButton.extended(
            //     label: Text(
            //       'Add Test',
            //       style: TextStyle(color: Colors.white, fontSize: 12),
            //     ),
            //     icon: const Icon(Icons.account_tree_outlined, color: Colors.white),
            //   ),
            //   itemBuilder: (context) {
            //     return List.generate(
            //       1,
            //       (index) {
            //         //list.generate
            //         return PopupMenuItem(
            //           child: Column(
            //             children: [
            //               ///////////////////////////////ALL-POP-UP-MENU-BUTTON-STARTS-FROM-HERE///////////////////////////
            //               ///////////////////////////Add SC- IR button///////////////////////////////
            //                Padding(
            //                       padding: const EdgeInsets.all(5.0),
            //                       child:
            FloatingActionButton.extended(
                heroTag: 'addSCC',
                onPressed: () {
                  EquipmentTypeList().getEquipUsetoDefaultValue();
                  Navigator.popAndPushNamed(context, '/add_SC_C', arguments: {
                    'TrNo': ntr.trNo,
                    'SC_ID': ntr.id,
                    'Serial_No': ntr.serialNo,
                    'scDatabaseID': ntr.databaseID,
                    'trDatabaseID': args['trDatabaseID'],
                  });
                },
                label: const Text('Add Counter Test',
                    style: TextStyle(fontSize: 10, color: Colors.white)),
                icon: const Icon(Icons.add, color: Colors.white))
        //                               )
        //             ],
        //           ),
        //         );
        //       },
        //     );
        //   },
        // ),
        );
  }

  Function dialog_box_action(BuildContext context) {
    return (() {
      getX((ScProvider x) => x.deleteSc(args['id']));
//                        watchOnly((TestReportsProvider x) => {});
      Navigator.pop(context);
    });
  }

  display_Sc_details(ScModel ntr) {
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
                            Text('SerialNo : ' + ntr.serialNo.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Divider(height: 5),
                            Text('Make : ' + ntr.make,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Divider(height: 5),
                            Text('Equipment Type : ' + ntr.equipType.toString(),
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
                        getX((ScProvider x) => x.deleteSc(args['id']));
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

  generate_list_of_SC_C(ScModel ntr) {
    getX((ScCProvider x) => x.getScCBySerialNo(ntr.serialNo));
    final List<ScCTestModel> reports =
        watchOnly((ScCProvider x) => x.scCSerialNoList);

    getX((ScProvider x) => x.getScLocalData());
    final List<ScModel> reportsForArgsfrom_SCmodel =
        watchOnly((ScProvider x) => x.sclocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((ScCProvider x) => x.getScCEquipmentList());
    final List<ScCTestModel> reportsFormSccLocalData =
        watchOnly((ScCProvider x) => x.scCEquipmentList);

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
                for (var i in reportsFormSccLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_SCmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                //add to remote database
                                var url =
                                    Uri.parse('${Env.URL_PREFIX}/scCTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'rA': i.rA.toString(),
                                  'rB': i.rB.toString(),
                                  'yA': i.yA.toString(),
                                  'yB': i.yB.toString(),
                                  'bA': i.bA.toString(),
                                  'bB': i.bB.toString(),
                                  'equipmentUsed':
                                      selectedValueForEquipmentUse.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<ScCProvider>().updateScC(
                                      ScCTestModel(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        rA: i.rA,
                                        rB: i.rB,
                                        yA: i.yA,
                                        yB: i.yB,
                                        bA: i.bA,
                                        bB: i.bB,
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

                // ------------------------------------------------------
                Navigator.pushNamed(context, '/detail_SC_C', arguments: {
                  'id': report.id,
                  'SC_ID': ntr.databaseID,
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_SC_C', arguments: {
                  'id': report.id,
                  'SC_ID': ntr.databaseID,
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
                              ntr.etype == 'sc'
                                  ? const Text(
                                      'SC-C-Test Details ',
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
                              ntr.etype == 'sc'
                                  ? const Text(
                                      'SC-C-Test Details ',
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
                    Text('SerialNo : ' + report.serialNo.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('Primary-Earth R Before : ' + report.rB.toString(),
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
