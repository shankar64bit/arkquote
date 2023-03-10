// ignore_for_file: prefer_const_constructors, missing_return

import 'dart:convert';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/EE/eeLoc.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import '../../../../../env.sample.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/EE/ee_model.dart';
import '../../../data/models/test_report_model.dart';
import 'package:http/http.dart' as http;
import '../../providers/ee_provider/ee_loc_provider.dart';
import '../../providers/ee_provider/ee_provider.dart';
import '../../providers/equipment_acb_provider/test_report_provider.dart';
import '../dropdown_All/equipmentUsed.dart';
import '../dropdown_All/responsive_tool/google_sign_in_out/InternetConnChecker.dart';
import '../equipment_acb/detail_test_report_page.dart';

class DetailEEPage extends StatelessWidget with GetItMixin {
  Map args = {};
  EEModel ntr;
  DetailEEPage(@required this.args, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getX((EEProvider x) => x.getEEByID(args['id']));
    final EEModel ntr = watchOnly((EEProvider x) => x.eeModel);

    var mob = const Text('Earth Electrode', style: TextStyle(fontSize: 15));
    var desk = const Text('Earth Electrode', style: TextStyle(fontSize: 20));
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
                Navigator.popAndPushNamed(context, '/edit_EE', arguments: {
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
                              constraints:
                                  BoxConstraints(minHeight: 0, maxWidth: 1000),
                              child: display_EE_details(ntr)),
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
                                        child: generate_list_of_EE_Loc(ntr)),
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
                        child: display_EE_details(ntr)),
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
                                      child: generate_list_of_EE_Loc(ntr)),
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
            'Add Location',
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
                    ///////////////////////////Add EE - Loc button///////////////////////////////
                    Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FloatingActionButton.extended(
                            heroTag: 'addEELoc',
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
                              EquipmentTypeList().getEquipUsetoDefaultValue();
                              Navigator.of(context).pop();
                              Navigator.popAndPushNamed(context, '/add_EE_LOC',
                                  arguments: {
                                    // 'TrNo': ntr.trNo,
                                    'id': args['id'],
                                    'EE_ID': ntr.databaseID,
                                    'trDatabaseID': args['trDatabaseID'],
                                  });
                            },
                            label: const Text('EE-Location',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white)),
                            icon: const Icon(Icons.add, color: Colors.white)))
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
      getX((EEProvider x) => x.deleteEE(args['id']));
//                        watchOnly((TestReportsProvider x) => {});
      Navigator.pop(context);
    });
  }

  display_EE_details(EEModel ntr) {
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
                        getX((EEProvider x) => x.deleteEE(args['id']));
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

  generate_list_of_EE_Loc(EEModel ntr) {
    getX((EE_loc_Provider x) => x.getEELocByEENoID(ntr.id));
    final List<EELocModel> reports =
        watchOnly((EE_loc_Provider x) => x.ee_loc_eeNoIDList);

    getX((EEProvider x) => x.getEELocalData());
    final List<EEModel> reportsForArgsfrom_EElocmodel =
        watchOnly((EEProvider x) => x.eelocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((EE_loc_Provider x) => x.getEElocLocalDataEquipmentList());
    final List<EELocModel> reportsFormATwrHvLocalData =
        watchOnly((EE_loc_Provider x) => x.ee_loc_loacaldataList);

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
                for (var i in reportsFormATwrHvLocalData) {
                  print('here is something prints ');

                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.eeRef;
                      print(tempvar); // current TrNo of Acbcrm Test -- 1

                      for (var t in reportsForArgsfrom_TestReports) {
                        print('here is something prints 2');

                        if (t.id == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_EElocmodel) {
                            print('here is something prints 3 ');

                            if (q.id == tempvar) {
                              var argseeRef = q.databaseID;
                              print(argseeRef); // current serialNo > 37

                              print('here is something prints 4 ');
                              print(argseeRef);
                              // add to remote database
                              var url = Uri.parse('${Env.URL_PREFIX}/eeLoc/');
                              var response = await http.post(url, body: {
                                'location': i.location.toString(),
                                'eeRef': argseeRef.toString(),
                              }, headers: {
                                'Authorization': 'Bearer $acc_token'
                              }).then((value) {
                                sl<EE_loc_Provider>().updateEELoc(
                                    EELocModel(
                                      id: i.id,
                                      location: i.location,
                                      databaseID: json.decode(value.body)['id'],
                                      eeRef: i.eeRef,
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
                // -----------------------------------------------------
                Navigator.pushNamed(context, '/detail_EE_LOC', arguments: {
                  'id': report.id,
                  'EE_ID': ntr.databaseID,
                  'trNo': ntr.trNo,
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_EE_LOC', arguments: {
                  'id': report.id,
                  'EE_ID': ntr.databaseID,
                  'trNo': ntr.trNo,
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
                              ntr.etype == 'ee'
                                  ? const Text(
                                      'EE- Details ',
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
                              ntr.etype == 'ee'
                                  ? const Text(
                                      'EE- Details ',
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
                    Text('EENo : ' + report.eeRef.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('Location : ' + report.location.toString(),
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
