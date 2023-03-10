// ignore_for_file: prefer_const_constructors, missing_return

import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/EE/eeLoc.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../data/models/equipment/EE/ee_r_test_model.dart';
import '../../../data/models/equipment/EE/ee_test_model.dart';
import '../../providers/ee_provider/ee_loc_provider.dart';
import '../../providers/ee_provider/ee_provider.dart';
import '../../providers/ee_provider/ee_rtest_provider.dart';
import '../../providers/ee_provider/ee_test_provider.dart';
import '../dropdown_All/equipmentUsed.dart';

class DetailEELocPage extends StatelessWidget with GetItMixin {
  Map args = {};
  DetailEELocPage(@required this.args, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getX((EE_loc_Provider x) => x.getEELocById(args['id']));
    final EELocModel ntr = watchOnly((EE_loc_Provider x) => x.ee_loc_Model);

    var mob =
        const Text('Earth Electrode Location', style: TextStyle(fontSize: 15));
    var desk =
        const Text('Earth Electrode Location', style: TextStyle(fontSize: 20));
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
                Navigator.popAndPushNamed(context, '/edit_EE_LOC', arguments: {
                  'id': ntr.id,
                  'EE_ID': args['EE_ID'],
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
                              child: display_EE_LOC_details(ntr)),
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        width: 250,
                                        height: 140,
                                        child: generate_list_of_EE_Test(ntr)),
                                    SizedBox(
                                        width: 250,
                                        height: 140,
                                        child: generate_list_of_EE_RTest(ntr)),
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
                        child: display_EE_LOC_details(ntr)),
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
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
                              child: Column(
                                children: [
                                  SizedBox(
                                      width: 350,
                                      height: 150,
                                      child: generate_list_of_EE_Test(ntr)),
                                  SizedBox(
                                      width: 850,
                                      height: 150,
                                      child: generate_list_of_EE_RTest(ntr)),
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
                    ///////////////////////////Add EE TEst button///////////////////////////////
                    Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FloatingActionButton.extended(
                            heroTag: 'addEETest',
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
                              Navigator.popAndPushNamed(context, '/add_EE_TEST',
                                  arguments: {
                                    'eeDatabaseID': args['EE_ID'],
                                    'EE_LOC_ID': ntr.id,
                                    'eeLocDatabaseID': ntr.databaseID,
                                    'trNo': args['trNo'],
                                    'trDatabaseID': args['trDatabaseID'],
                                  });
                            },
                            label: const Text('EE-Test',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white)),
                            icon: const Icon(Icons.add, color: Colors.white))),
                    ///////////////////////////Add EE RTEst button///////////////////////////////
                    Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FloatingActionButton.extended(
                            heroTag: 'addEERTest',
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
                              Navigator.popAndPushNamed(
                                  context, '/add_EE_RTEST',
                                  arguments: {
                                    'eeDatabaseID': args['EE_ID'],
                                    'EE_LOC_ID': ntr.id,
                                    'eeLocDatabaseID': ntr.databaseID,
                                    'trNo': args['trNo'],
                                    'trDatabaseID': args['trDatabaseID'],
                                  });
                            },
                            label: const Text('EE-Recondition Test',
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
      Navigator.pop(context);
    });
  }

  display_EE_LOC_details(EELocModel ntr) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Text('DBID : ' + ntr.databaseID.toString(),
                      style:
                          const TextStyle(color: Colors.black, fontSize: 12)),
                  Divider(height: 5),
                  Text('Location : ' + ntr.location.toString(),
                      style:
                          const TextStyle(color: Colors.black, fontSize: 12)),
                  Divider(height: 5),
                  Text('eeRef : ' + ntr.eeRef.toString(),
                      style:
                          const TextStyle(color: Colors.black, fontSize: 12)),
                ],
              ),
            ),
          ),
        ]),
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

  generate_list_of_EE_Test(EELocModel ntr) {
    getX((EETestProvider x) => x.getEETestByLocNo(ntr.id));
    final List<EETestModel> reports =
        watchOnly((EETestProvider x) => x.eeTestLocNoList);

    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return GestureDetector(
            onTap: () async {
              // ----------------------------------------------------
              Navigator.pushNamed(context, '/edit_EE_TEST', arguments: {
                'id': report.id, //test id
                'eeDatabaseID': args['EE_ID'],
                'EE_LOC_ID': ntr.id,
                'eeLocDatabaseID': ntr.databaseID,
                'trNo': args['trNo'],
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
                    const Text(
                      'EE-Test Details',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 11.5,
                          letterSpacing: 1.5),
                    ),
                    Divider(height: 10),
                    Text('DBID : ' + report.databaseID.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('Earth Electrode Name : ' + report.eeName.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text(
                        'Resistance Value : ' +
                            report.resistanceValue.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('Location ID : ' + report.locNo.toString(),
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

  generate_list_of_EE_RTest(EELocModel ntr) {
    getX((EERTestProvider x) => x.getEERTestByLocNo(ntr.id));
    final List<EERTestModel> reports =
        watchOnly((EERTestProvider x) => x.eeRTestLocNoList);

    return Container(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: reports.length,
            itemBuilder: (context, index) {
              final report = reports[index];
              return GestureDetector(
                onTap: () async {
                  // ------------------------------------------------------
                  Navigator.pushNamed(context, '/edit_EE_RTEST', arguments: {
                    'id': report.id, //test id
                    'eeDatabaseID': args['EE_ID'],
                    'EE_LOC_ID': ntr.id,
                    'eeLocDatabaseID': ntr.databaseID,
                    'trNo': args['trNo'],
                    'trDatabaseID': args['trDatabaseID'],
                  });
                },
                child: Card(
                  color: Colors.white,
                  elevation: 5,
                  margin: EdgeInsets.fromLTRB(20, 10, 0, 15),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 30, 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ////////////////////////CARD-TITLE-Controller////////////////////
                        const Text(
                          'EE-Recondition Test Details',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 11.5,
                              letterSpacing: 1.5),
                        ),

                        ////////////////////////CARD-TITLE-Controller////////////////////
                        Divider(height: 10),
                        Text('DBID : ' + report.databaseID.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13)),
                        Text(
                            'Earth Electrode Name : ' +
                                report.eeName.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13)),
                        Text(
                            'Resistance Value Before Recondition: ' +
                                report.resistanceValue_BR.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13)),
                        Text(
                            'Resistance Value After Recondition: ' +
                                report.resistanceValue_AR.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13)),
                        Text('Location ID : ' + report.locNo.toString(),
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
