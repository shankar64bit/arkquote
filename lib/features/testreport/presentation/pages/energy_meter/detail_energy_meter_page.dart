// ignore_for_file: prefer_const_constructors, missing_return

import 'dart:convert';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/energy_meter/energu_meter_aprp_test.dart';
import '../../../data/models/equipment/energy_meter/energy_meter_Fi_test.dart';
import '../../../data/models/equipment/energy_meter/energy_meter_Pfi_test.dart';
import '../../../data/models/equipment/energy_meter/energy_meter_ap_test.dart';
import '../../../data/models/equipment/energy_meter/energy_meter_ci_test.dart';
import '../../../data/models/equipment/energy_meter/energy_meter_model.dart';
import '../../../data/models/equipment/energy_meter/energy_meter_rp_test.dart';
import '../../../data/models/equipment/energy_meter/energy_meter_vi_test_model.dart';
import '../../../data/models/test_report_model.dart';
import '../../providers/energy_meter_provider/energy_meter_ap_provider.dart';
import '../../providers/energy_meter_provider/energy_meter_aprp_provider.dart';
import '../../providers/energy_meter_provider/energy_meter_ci_provider.dart';
import '../../providers/energy_meter_provider/energy_meter_fi_provider.dart';
import '../../providers/energy_meter_provider/energy_meter_pfi_provider.dart';
import '../../providers/energy_meter_provider/energy_meter_provider.dart';
import '../../providers/energy_meter_provider/energy_meter_rp_provider.dart';
import '../../providers/energy_meter_provider/energy_meter_vi_provider.dart';
import '../../providers/equipment_acb_provider/test_report_provider.dart';
import '../dropdown_All/equipmentUsed.dart';
import '../dropdown_All/responsive_tool/google_sign_in_out/InternetConnChecker.dart';
import '../equipment_acb/detail_test_report_page.dart';

class DetailEnergyMeterPage extends StatelessWidget with GetItMixin {
  Map args = {};
  EnergyMeterModel ntr;
  int trDbId;
  DetailEnergyMeterPage(@required this.args, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getX((EnergyMeterProvider x) => x.getEnergyMeterByID(args['id']));
    final EnergyMeterModel ntr =
        watchOnly((EnergyMeterProvider x) => x.energymeterModel);

    var mob = const Text('Energy Meter ', style: TextStyle(fontSize: 15));
    var desk = const Text('Energy Meter ', style: TextStyle(fontSize: 20));
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
                Navigator.popAndPushNamed(context, '/edit_EM', arguments: {
                  'id': ntr.id,
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
                              child: display_energy_meter_details(ntr)),
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
                                        child: generate_list_of_EM_VI(ntr)),
                                    SizedBox(
                                        width: 250,
                                        height: 140,
                                        child: generate_list_of_EM_CI(ntr)),
                                    SizedBox(
                                        width: 250,
                                        height: 140,
                                        child: generate_list_of_EM_FI(ntr)),
                                    SizedBox(
                                        width: 250,
                                        height: 140,
                                        child: generate_list_of_EM_PFI(ntr)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        width: 340,
                                        height: 150,
                                        child: generate_list_of_EM_AP(ntr)),
                                    SizedBox(
                                        width: 340,
                                        height: 150,
                                        child: generate_list_of_EM_RP(ntr)),
                                    SizedBox(
                                        width: 340,
                                        height: 150,
                                        child: generate_list_of_EM_Aprp(ntr)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Container(
                          //   child: Column(
                          //     children: [
                          //       Row(
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         //crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [],
                          //       ),
                          //     ],
                          //   ),
                          // ),
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
                        child: display_energy_meter_details(ntr)),
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
                                      child: generate_list_of_EM_VI(ntr)),
                                  SizedBox(
                                      width: 350,
                                      height: 150,
                                      child: generate_list_of_EM_CI(ntr)),
                                  SizedBox(
                                      width: 350,
                                      height: 150,
                                      child: generate_list_of_EM_FI(ntr)),
                                  SizedBox(
                                      width: 350,
                                      height: 150,
                                      child: generate_list_of_EM_PFI(ntr)),
                                  SizedBox(
                                      width: 350,
                                      height: 150,
                                      child: generate_list_of_EM_AP(ntr)),
                                  SizedBox(
                                      width: 350,
                                      height: 150,
                                      child: generate_list_of_EM_RP(ntr)),
                                  SizedBox(
                                      width: 350,
                                      height: 150,
                                      child: generate_list_of_EM_Aprp(ntr)),
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
                    ///////////////////////////Add Energy Meter _ VI button///////////////////////////////
                    ntr.etype == 'energy meter'
                        ? Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FloatingActionButton.extended(
                                heroTag: 'addEMVI',
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
                                      context, '/add_EM_VI',
                                      arguments: {
                                        'TrNo': ntr.trNo,
                                        'EM_ID': ntr.id,
                                        'Serial_No': ntr.serialNo,
                                        'emDatabaseID': ntr.databaseID,
                                        'trDatabaseID': args['trDatabaseID'],
                                      });
                                },
                                label: const Text('Voltage Injection',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white)),
                                icon:
                                    const Icon(Icons.add, color: Colors.white)))
                        : Container(),
                    ///////////////////////////Add Energy Meter _ CI button///////////////////////////////
                    ntr.etype == 'energy meter'
                        ? Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FloatingActionButton.extended(
                                heroTag: 'addEMCI',
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
                                      context, '/add_EM_CI',
                                      arguments: {
                                        'TrNo': ntr.trNo,
                                        'EM_ID': ntr.id,
                                        'Serial_No': ntr.serialNo,
                                        'emDatabaseID': ntr.databaseID,
                                        'trDatabaseID': args['trDatabaseID'],
                                      });
                                },
                                label: const Text('Current Injection',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white)),
                                icon:
                                    const Icon(Icons.add, color: Colors.white)))
                        : Container(),
                    ///////////////////////////Add Energy Meter _ FI button///////////////////////////////
                    ntr.etype == 'energy meter'
                        ? Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FloatingActionButton.extended(
                                heroTag: 'addEMFI',
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
                                      context, '/add_EM_FI',
                                      arguments: {
                                        'TrNo': ntr.trNo,
                                        'EM_ID': ntr.id,
                                        'Serial_No': ntr.serialNo,
                                        'emDatabaseID': ntr.databaseID,
                                        'trDatabaseID': args['trDatabaseID'],
                                      });
                                },
                                label: const Text('Frequency Injection',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white)),
                                icon:
                                    const Icon(Icons.add, color: Colors.white)))
                        : Container(),
                    ///////////////////////////Add Energy Meter _ PFI///////////////////////////////
                    ntr.etype == 'energy meter'
                        ? Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FloatingActionButton.extended(
                                heroTag: 'addEMPFI',
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
                                      context, '/add_EM_PFI',
                                      arguments: {
                                        'TrNo': ntr.trNo,
                                        'EM_ID': ntr.id,
                                        'Serial_No': ntr.serialNo,
                                        'emDatabaseID': ntr.databaseID,
                                        'trDatabaseID': args['trDatabaseID'],
                                      });
                                },
                                label: const Text('Power Factor Injection',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white)),
                                icon:
                                    const Icon(Icons.add, color: Colors.white)))
                        : Container(),
                    ///////////////////////////Add Energy Meter AP///////////////////////////////
                    ntr.etype == 'energy meter'
                        ? Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FloatingActionButton.extended(
                                heroTag: 'addEMAP',
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
                                      context, '/add_EM_AP',
                                      arguments: {
                                        'TrNo': ntr.trNo,
                                        'EM_ID': ntr.id,
                                        'Serial_No': ntr.serialNo,
                                        'emDatabaseID': ntr.databaseID,
                                        'trDatabaseID': args['trDatabaseID'],
                                      });
                                },
                                label: const Text('Active Power',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white)),
                                icon:
                                    const Icon(Icons.add, color: Colors.white)))
                        : Container(),
                    ///////////////////////////Add Energy Meter RP button///////////////////////////////
                    ntr.etype == 'energy meter'
                        ? Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FloatingActionButton.extended(
                                heroTag: 'addEMRP',
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
                                      context, '/add_EM_RP',
                                      arguments: {
                                        'TrNo': ntr.trNo,
                                        'EM_ID': ntr.id,
                                        'Serial_No': ntr.serialNo,
                                        'emDatabaseID': ntr.databaseID,
                                        'trDatabaseID': args['trDatabaseID'],
                                      });
                                },
                                label: const Text('Reactive Power',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white)),
                                icon:
                                    const Icon(Icons.add, color: Colors.white)))
                        : Container(),
                    ///////////////////////////Add Energy Meter Aprp button///////////////////////////////
                    ntr.etype == 'energy meter'
                        ? Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: FloatingActionButton.extended(
                                heroTag: 'addEMAprp',
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
                                      context, '/add_EM_APRP',
                                      arguments: {
                                        'TrNo': ntr.trNo,
                                        'EM_ID': ntr.id,
                                        'Serial_No': ntr.serialNo,
                                        'emDatabaseID': ntr.databaseID,
                                        'trDatabaseID': args['trDatabaseID'],
                                      });
                                },
                                label: const Text('Apparent Power',
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
      getX((EnergyMeterProvider x) => x.deleteEnergyMeter(args['id']));
//                        watchOnly((TestReportsProvider x) => {});
      Navigator.pop(context);
    });
  }

  display_energy_meter_details(EnergyMeterModel ntr) {
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
                            Text('Panel : ' + ntr.panel.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Divider(height: 5),
                            Text('Make : ' + ntr.make,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Divider(height: 5),
                            Text('Frequency : ' + ntr.frequency.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Divider(height: 5),
                            Text('Voltage : ' + ntr.voltage.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Divider(height: 5),
                            Text('eqClass : ' + ntr.eqClass.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Divider(height: 5),
                            Text('ctr : ' + ntr.ctr.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Divider(height: 5),
                            Text('ptr : ' + ntr.ptr.toString(),
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
                        getX((EnergyMeterProvider x) =>
                            x.deleteEnergyMeter(args['id']));
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

  generate_list_of_EM_VI(EnergyMeterModel ntr) {
    getX((EnergyMeterViProvider x) =>
        x.getEnergyMeterViBySerialNo(ntr.serialNo));
    final List<EnergyMeterViTestModel> reports =
        watchOnly((EnergyMeterViProvider x) => x.energymeterViSerialNoList);

    getX((EnergyMeterProvider x) => x.getEMLocalData());
    final List<EnergyMeterModel> reportsForArgsfrom_EMmodel =
        watchOnly((EnergyMeterProvider x) => x.emloacaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((EnergyMeterViProvider x) => x.getEnergyMetereEquipmentList());
    final List<EnergyMeterViTestModel> reportsFormEMviLocalData =
        watchOnly((EnergyMeterViProvider x) => x.energymeterViEquipmentList);

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
                    for (var i in reportsFormEMviLocalData) {
                      if (i.id == report.id) {
                        if (report.databaseID == 0 || i.databaseID == 0) {
                          var tempvar = i.trNo;
                          print(tempvar); // current TrNo of Acbcrm Test

                          for (var t in reportsForArgsfrom_TestReports) {
                            if (t.trNo == tempvar) {
                              var tDatabaseID = t.databaseID;
                              print(
                                  tDatabaseID); // current TrNo of TestReport args

                              for (var q in reportsForArgsfrom_EMmodel) {
                                if (q.trNo == tempvar) {
                                  var argsSerialNo = q.serialNo;
                                  print(
                                      argsSerialNo); // current serialNo of Acb args

                                  if (report.serialNo == argsSerialNo &&
                                      i.serialNo == argsSerialNo) {
                                    var argsSnoDB = q.databaseID;

                                    //add to remote database
                                    var url =
                                        Uri.parse('${Env.URL_PREFIX}/viTest/');
                                    var response = await http.post(url, body: {
                                      'trNo': tDatabaseID.toString(),
                                      'serialNo': argsSnoDB.toString(),
                                      'rr': i.rr.toString(),
                                      'ra': i.ra.toString(),
                                      'yr': i.yr.toString(),
                                      'ya': i.ya.toString(),
                                      'ba': i.ba.toString(),
                                      'br': i.br.toString(),
                                      'equipmentUsed':
                                          i.EquipmentType.toString(),
                                    }, headers: {
                                      'Authorization': 'Bearer $acc_token',
                                    }).then(
                                      (value) {
                                        sl<EnergyMeterViProvider>()
                                            .updateEnergyMeterVi(
                                                EnergyMeterViTestModel(
                                                  id: i.id,
                                                  trNo: i.trNo,
                                                  serialNo: i.serialNo,
                                                  rr: i.rr,
                                                  ra: i.ra,
                                                  br: i.br,
                                                  ba: i.ba,
                                                  yr: i.yr,
                                                  ya: i.ya,
                                                  EquipmentType:
                                                      i.EquipmentType,
                                                  databaseID: json
                                                      .decode(value.body)['id'],
                                                  updateDate: DateTime.now(),
                                                ),
                                                report.id);
                                        print(
                                            'Response status: ${value.statusCode}');
                                        print('Response body: ${value.body}');
                                        print('Stored successfully');
                                      },
                                    );
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }

                    // ----------------------------------------------------
                    Navigator.pushNamed(context, '/detail_EM_VI', arguments: {
                      'id': report.id,
                      'EM_ID': report.databaseID,
                      'trDatabaseID': args['trDatabaseID'],
                    });
                  } else if (status == DataConnectionStatus.disconnected) {
                    Navigator.pushNamed(context, '/detail_EM_VI', arguments: {
                      'id': report.id,
                      'EM_ID': report.databaseID,
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
                                  ntr.etype == 'energy meter'
                                      ? const Text(
                                          'Energy Meter VI-Test Details ',
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
                                  ntr.etype == 'energy meter'
                                      ? const Text(
                                          'Energy Meter VI-Test Details ',
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
                        Text('SerialNo : ' + report.serialNo.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13)),
                        Text('rr : ' + report.rr.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13)),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }

  generate_list_of_EM_CI(EnergyMeterModel ntr) {
    getX((EnergyMeterCiProvider x) =>
        x.getEnergyMeterCiBySerialNo(ntr.serialNo));
    final List<EnergyMeterCiTestModel> reports =
        watchOnly((EnergyMeterCiProvider x) => x.energymeterCiSerialNoList);

    getX((EnergyMeterProvider x) => x.getEMLocalData());
    final List<EnergyMeterModel> reportsForArgsfrom_EMmodel =
        watchOnly((EnergyMeterProvider x) => x.emloacaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((EnergyMeterCiProvider x) => x.getEnergyMeterCIEquipmentList());
    final List<EnergyMeterCiTestModel> reportsFormEMciLocalData =
        watchOnly((EnergyMeterCiProvider x) => x.energymeterCiEquipmentList);

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
                    for (var i in reportsFormEMciLocalData) {
                      if (i.id == report.id) {
                        if (report.databaseID == 0 || i.databaseID == 0) {
                          var tempvar = i.trNo;
                          print(tempvar); // current TrNo of Acbcrm Test

                          for (var t in reportsForArgsfrom_TestReports) {
                            if (t.trNo == tempvar) {
                              var tDatabaseID = t.databaseID;
                              print(tDatabaseID); //  TrNo of TestReport args

                              for (var q in reportsForArgsfrom_EMmodel) {
                                if (q.trNo == tempvar) {
                                  var argsSerialNo = q.serialNo;
                                  print(argsSerialNo); //  serialNo of Acb args

                                  if (report.serialNo == argsSerialNo &&
                                      i.serialNo == argsSerialNo) {
                                    var argsSnoDB = q.databaseID;

                                    //add to remote database
                                    var url =
                                        Uri.parse('${Env.URL_PREFIX}/ciTest/');
                                    var response = await http.post(url, body: {
                                      'trNo': tDatabaseID.toString(),
                                      'serialNo': argsSnoDB.toString(),
                                      'rr': i.rr.toString(),
                                      'ra': i.ra.toString(),
                                      'yr': i.yr.toString(),
                                      'ya': i.ya.toString(),
                                      'ba': i.ba.toString(),
                                      'br': i.br.toString(),
                                      'equipmentUsed':
                                          i.EquipmentType.toString(),
                                    }, headers: {
                                      'Authorization': 'Bearer $acc_token',
                                    }).then((value) {
                                      sl<EnergyMeterCiProvider>()
                                          .updateEnergyMeterCi(
                                              EnergyMeterCiTestModel(
                                                id: i.id,
                                                trNo: i.trNo,
                                                serialNo: i.serialNo,
                                                rr: i.rr,
                                                ra: i.ra,
                                                br: i.br,
                                                ba: i.ba,
                                                yr: i.yr,
                                                ya: i.ya,
                                                EquipmentType: i.EquipmentType,
                                                databaseID: json
                                                    .decode(value.body)['id'],
                                                updateDate: DateTime.now(),
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
                    Navigator.pushNamed(context, '/detail_EM_CI', arguments: {
                      'id': report.id,
                      'EM_ID': report.databaseID,
                      'trDatabaseID': args['trDatabaseID'],
                    });
                  } else if (status == DataConnectionStatus.disconnected) {
                    Navigator.pushNamed(context, '/detail_EM_CI', arguments: {
                      'id': report.id,
                      'EM_ID': report.databaseID,
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
                                  ntr.etype == 'energy meter'
                                      ? const Text(
                                          'Energy Meter CI-Test Details',
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
                                  ntr.etype == 'energy meter'
                                      ? const Text(
                                          'Energy Meter CI-Test Details',
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
                        Text('SerialNo : ' + report.serialNo.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13)),
                        Text('rr : ' + report.rr.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13)),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }

  generate_list_of_EM_FI(EnergyMeterModel ntr) {
    getX((EnergyMeterFiProvider x) =>
        x.getEnergyMeterFiBySerialNo(ntr.serialNo));
    final List<EnergyMeterFiTestModel> reports =
        watchOnly((EnergyMeterFiProvider x) => x.energymeterFiSerialNoList);

    getX((EnergyMeterProvider x) => x.getEMLocalData());
    final List<EnergyMeterModel> reportsForArgsfrom_EMmodel =
        watchOnly((EnergyMeterProvider x) => x.emloacaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((EnergyMeterFiProvider x) => x.getEnergyMeterfiEquipmentList());
    final List<EnergyMeterFiTestModel> reportsFormEMfiLocalData =
        watchOnly((EnergyMeterFiProvider x) => x.energymeterFiEquipmentList);

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
                    for (var i in reportsFormEMfiLocalData) {
                      if (i.id == report.id) {
                        if (report.databaseID == 0 || i.databaseID == 0) {
                          var tempvar = i.trNo;
                          print(tempvar); // current TrNo of Acbcrm Test

                          for (var t in reportsForArgsfrom_TestReports) {
                            if (t.trNo == tempvar) {
                              var tDatabaseID = t.databaseID;
                              print(
                                  tDatabaseID); // current TrNo of TestReport args

                              for (var q in reportsForArgsfrom_EMmodel) {
                                if (q.trNo == tempvar) {
                                  var argsSerialNo = q.serialNo;
                                  print(
                                      argsSerialNo); // current serialNo of Acb args

                                  if (report.serialNo == argsSerialNo &&
                                      i.serialNo == argsSerialNo) {
                                    var argsSnoDB = q.databaseID;

                                    //add to remote database
                                    var url = Uri.parse(
                                        '${Env.URL_PREFIX}/freqiTest/');
                                    var response = await http.post(url, body: {
                                      'trNo': tDatabaseID.toString(),
                                      'serialNo': argsSnoDB.toString(),
                                      'rr': i.rr.toString(),
                                      'ra': i.ra.toString(),
                                      'yr': i.yr.toString(),
                                      'ya': i.ya.toString(),
                                      'ba': i.ba.toString(),
                                      'br': i.br.toString(),
                                      'equipmentUsed':
                                          i.EquipmentType.toString(),
                                    }, headers: {
                                      'Authorization': 'Bearer $acc_token',
                                    }).then(
                                      (value) {
                                        sl<EnergyMeterFiProvider>()
                                            .updateEnergyMeterFi(
                                                EnergyMeterFiTestModel(
                                                    id: i.id,
                                                    trNo: i.trNo,
                                                    serialNo: i.serialNo,
                                                    rr: i.rr,
                                                    ra: i.ra,
                                                    br: i.br,
                                                    ba: i.ba,
                                                    yr: i.yr,
                                                    ya: i.ya,
                                                    EquipmentType:
                                                        i.EquipmentType,
                                                    databaseID: json.decode(
                                                        value.body)['id'],
                                                    updateDate: DateTime.now()),
                                                report.id);
                                        print(
                                            'Response status: ${value.statusCode}');
                                        print('Response body: ${value.body}');
                                        print('Stored successfully');
                                      },
                                    );
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                    // ----------------------------------------------------
                    Navigator.pushNamed(context, '/detail_EM_FI', arguments: {
                      'id': report.id,
                      'EM_ID': report.databaseID,
                      'trDatabaseID': args['trDatabaseID'],
                    });
                  } else if (status == DataConnectionStatus.disconnected) {
                    Navigator.pushNamed(context, '/detail_EM_FI', arguments: {
                      'id': report.id,
                      'EM_ID': report.databaseID,
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
                                  ntr.etype == 'energy meter'
                                      ? const Text(
                                          'Energy Meter FI-Test Details',
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
                                  ntr.etype == 'energy meter'
                                      ? const Text(
                                          'Energy Meter FI-Test Details',
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
                        Text('SerialNo : ' + report.serialNo.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13)),
                        Text('rr : ' + report.rr.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13)),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }

  generate_list_of_EM_PFI(EnergyMeterModel ntr) {
    getX((EnergyMeterPfiProvider x) =>
        x.getEnergyMeterPfiBySerialNo(ntr.serialNo));
    final List<EnergyMeterPfiTestModel> reports =
        watchOnly((EnergyMeterPfiProvider x) => x.energymeterPfiSerialNoList);

    getX((EnergyMeterProvider x) => x.getEMLocalData());
    final List<EnergyMeterModel> reportsForArgsfrom_EMmodel =
        watchOnly((EnergyMeterProvider x) => x.emloacaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((EnergyMeterPfiProvider x) => x.getEnergyMeterPFIEquipmentList());
    final List<EnergyMeterPfiTestModel> reportsFormEMpfiLocalData =
        watchOnly((EnergyMeterPfiProvider x) => x.energymeterPfiEquipmentList);

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
                for (var i in reportsFormEMpfiLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_EMmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                //add to remote database
                                var url =
                                    Uri.parse('${Env.URL_PREFIX}/pfiTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'rr': i.rr.toString(),
                                  'ra': i.ra.toString(),
                                  'yr': i.yr.toString(),
                                  'ya': i.ya.toString(),
                                  'ba': i.ba.toString(),
                                  'br': i.br.toString(),
                                  'equipmentUsed': i.EquipmentType.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<EnergyMeterPfiProvider>()
                                      .updateEnergyMeterPfi(
                                          EnergyMeterPfiTestModel(
                                            id: i.id,
                                            trNo: i.trNo,
                                            serialNo: i.serialNo,
                                            rr: i.rr,
                                            ra: i.ra,
                                            br: i.br,
                                            ba: i.ba,
                                            yr: i.yr,
                                            ya: i.ya,
                                            EquipmentType: i.EquipmentType,
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
                // ------------------------------------------------------
                Navigator.pushNamed(context, '/detail_EM_PFI', arguments: {
                  'id': report.id,
                  'EM_ID': report.databaseID,
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_EM_PFI', arguments: {
                  'id': report.id,
                  'EM_ID': report.databaseID,
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
                              ntr.etype == 'energy meter'
                                  ? const Text(
                                      'Energy Meter PFI-Test Details',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11.5,
                                          letterSpacing: 1.2),
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
                              ntr.etype == 'energy meter'
                                  ? const Text(
                                      'Energy Meter PFI-Test Details',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11.5,
                                          letterSpacing: 1.2),
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
                    Text('rr : ' + report.rr.toString(),
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

  generate_list_of_EM_AP(EnergyMeterModel ntr) {
    getX((EnergyMeterApProvider x) =>
        x.getEnergyMeterApBySerialNo(ntr.serialNo));
    final List<EnergyMeterApTestModel> reports =
        watchOnly((EnergyMeterApProvider x) => x.energymeterApSerialNoList);

    getX((EnergyMeterProvider x) => x.getEMLocalData());
    final List<EnergyMeterModel> reportsForArgsfrom_EMmodel =
        watchOnly((EnergyMeterProvider x) => x.emloacaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((EnergyMeterApProvider x) => x.getEnergyMeterAPEquipmentList());
    final List<EnergyMeterApTestModel> reportsFormEMAPLocalData =
        watchOnly((EnergyMeterApProvider x) => x.energymeterApEquipmentList);

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
                for (var i in reportsFormEMAPLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_EMmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                //add to remote database
                                var url =
                                    Uri.parse('${Env.URL_PREFIX}/apTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'initialTestMeterReading':
                                      i.initialTestMeterReading.toString(),
                                  'afterTestMeterReading':
                                      i.afterTestMeterReading.toString(),
                                  'testMeterReading_R':
                                      i.testMeterReading_R.toString(),
                                  'initialStandardMeterReading':
                                      i.initialStandardMeterReading.toString(),
                                  'afterStandardMeterReading':
                                      i.afterStandardMeterReading.toString(),
                                  'standardMeterReading_A':
                                      i.standardMeterReading_A.toString(),
                                  'equipmentUsed': i.EquipmentType.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<EnergyMeterApProvider>()
                                      .updateEnergyMeterAp(
                                          EnergyMeterApTestModel(
                                            id: i.id,
                                            trNo: i.trNo,
                                            serialNo: i.serialNo,
                                            initialTestMeterReading:
                                                i.initialTestMeterReading,
                                            afterTestMeterReading:
                                                i.afterTestMeterReading,
                                            testMeterReading_R:
                                                i.testMeterReading_R,
                                            initialStandardMeterReading:
                                                i.initialStandardMeterReading,
                                            afterStandardMeterReading:
                                                i.afterStandardMeterReading,
                                            standardMeterReading_A:
                                                i.standardMeterReading_A,
                                            EquipmentType: i.EquipmentType,
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

                // ----------------------------------------------------
                Navigator.pushNamed(context, '/detail_EM_AP', arguments: {
                  'id': report.id,
                  'EM_ID': report.databaseID,
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_EM_AP', arguments: {
                  'id': report.id,
                  'EM_ID': report.databaseID,
                  'trDatabaseID': args['trDatabaseID'],
                });
              }
            },
            child: Card(
              // color: Color.fromARGB(255, 42, 54, 76),

              color: Colors.white,
              elevation: 5,
              margin: EdgeInsets.fromLTRB(20, 10, 10, 8),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 100, 5),
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
                              ntr.etype == 'energy meter'
                                  ? const Text(
                                      'EM AP-Test Details',
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
                              ntr.etype == 'energy meter'
                                  ? const Text(
                                      'EM AP-Test Details',
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
                    Text(
                        'InitialTestMeterReading : ' +
                            report.initialTestMeterReading.toString(),
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

  generate_list_of_EM_RP(EnergyMeterModel ntr) {
    getX((EnergyMeterRpProvider x) =>
        x.getEnergyMeterRpBySerialNo(ntr.serialNo));
    final List<EnergyMeterRpTestModel> reports =
        watchOnly((EnergyMeterRpProvider x) => x.energymeterRpSerialNoList);

    getX((EnergyMeterProvider x) => x.getEMLocalData());
    final List<EnergyMeterModel> reportsForArgsfrom_EMmodel =
        watchOnly((EnergyMeterProvider x) => x.emloacaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((EnergyMeterRpProvider x) => x.getEnergyMeterRPEquipmentList());
    final List<EnergyMeterRpTestModel> reportsFormEMRPLocalData =
        watchOnly((EnergyMeterRpProvider x) => x.energymeterRpEquipmentList);

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
                    for (var i in reportsFormEMRPLocalData) {
                      if (i.id == report.id) {
                        if (report.databaseID == 0 || i.databaseID == 0) {
                          var tempvar = i.trNo;
                          print(tempvar); // current TrNo of Acbcrm Test

                          for (var t in reportsForArgsfrom_TestReports) {
                            if (t.trNo == tempvar) {
                              var tDatabaseID = t.databaseID;
                              print(
                                  tDatabaseID); // current TrNo of TestReport args

                              for (var q in reportsForArgsfrom_EMmodel) {
                                if (q.trNo == tempvar) {
                                  var argsSerialNo = q.serialNo;
                                  print(
                                      argsSerialNo); // current serialNo of Acb args

                                  if (report.serialNo == argsSerialNo &&
                                      i.serialNo == argsSerialNo) {
                                    var argsSnoDB = q.databaseID;

                                    //add to remote database
                                    var url =
                                        Uri.parse('${Env.URL_PREFIX}/rpTest/');
                                    var response = await http.post(url, body: {
                                      'trNo': tDatabaseID.toString(),
                                      'serialNo': argsSnoDB.toString(),
                                      'initialTestMeterReading':
                                          i.initialTestMeterReading.toString(),
                                      'afterTestMeterReading':
                                          i.afterTestMeterReading.toString(),
                                      'testMeterReading_R':
                                          i.testMeterReading_R.toString(),
                                      'initialStandardMeterReading': i
                                          .initialStandardMeterReading
                                          .toString(),
                                      'afterStandardMeterReading': i
                                          .afterStandardMeterReading
                                          .toString(),
                                      'standardMeterReading_A':
                                          i.standardMeterReading_A.toString(),
                                      'equipmentUsed':
                                          i.EquipmentType.toString(),
                                    }, headers: {
                                      'Authorization': 'Bearer $acc_token',
                                    }).then((value) {
                                      sl<EnergyMeterRpProvider>()
                                          .updateEnergyMeterRp(
                                              EnergyMeterRpTestModel(
                                                id: i.id,
                                                trNo: i.trNo,
                                                serialNo: i.serialNo,
                                                initialTestMeterReading:
                                                    i.initialTestMeterReading,
                                                afterTestMeterReading:
                                                    i.afterTestMeterReading,
                                                testMeterReading_R:
                                                    i.testMeterReading_R,
                                                initialStandardMeterReading: i
                                                    .initialStandardMeterReading,
                                                afterStandardMeterReading:
                                                    i.afterStandardMeterReading,
                                                standardMeterReading_A:
                                                    i.standardMeterReading_A,
                                                EquipmentType: i.EquipmentType,
                                                databaseID: json
                                                    .decode(value.body)['id'],
                                                updateDate: DateTime.now(),
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
                    // ---------------------------------------------------
                    Navigator.pushNamed(context, '/detail_EM_RP', arguments: {
                      'id': report.id,
                      'EM_ID': report.databaseID,
                      'trDatabaseID': args['trDatabaseID'],
                    });
                  } else if (status == DataConnectionStatus.disconnected) {
                    Navigator.pushNamed(context, '/detail_EM_RP', arguments: {
                      'id': report.id,
                      'EM_ID': report.databaseID,
                      'trDatabaseID': args['trDatabaseID'],
                    });
                  }
                },
                child: Card(
                  // color: Color.fromARGB(255, 42, 54, 76),

                  color: Colors.white,
                  elevation: 5,
                  margin: EdgeInsets.fromLTRB(20, 10, 10, 8),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 100, 5),
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
                                  ntr.etype == 'energy meter'
                                      ? const Text(
                                          'EM RP-Test Details',
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
                                  ntr.etype == 'energy meter'
                                      ? const Text(
                                          'EM RP-Test Details',
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
                        Text('SerialNo : ' + report.serialNo.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13)),
                        Text(
                            'InitialTestMeterReading : ' +
                                report.initialTestMeterReading.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13)),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }

  generate_list_of_EM_Aprp(EnergyMeterModel ntr) {
    getX((EnergyMeterAprpProvider x) =>
        x.getEnergyMeterAprpBySerialNo(ntr.serialNo));
    final List<EnergyMeterAprpTestModel> reports =
        watchOnly((EnergyMeterAprpProvider x) => x.energymeterAprpSerialNoList);

    getX((EnergyMeterProvider x) => x.getEMLocalData());
    final List<EnergyMeterModel> reportsForArgsfrom_EMmodel =
        watchOnly((EnergyMeterProvider x) => x.emloacaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((EnergyMeterAprpProvider x) => x.getEnergyMeterAPRPEquipmentList());
    final List<EnergyMeterAprpTestModel> reportsFormEMaprpLocalData = watchOnly(
        (EnergyMeterAprpProvider x) => x.energymeterAprpEquipmentList);

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
                for (var i in reportsFormEMaprpLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_EMmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                //add to remote database
                                var url =
                                    Uri.parse('${Env.URL_PREFIX}/aprpTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'initialTestMeterReading':
                                      i.initialTestMeterReading.toString(),
                                  'afterTestMeterReading':
                                      i.afterTestMeterReading.toString(),
                                  'testMeterReading_R':
                                      i.testMeterReading_R.toString(),
                                  'initialStandardMeterReading':
                                      i.initialStandardMeterReading.toString(),
                                  'afterStandardMeterReading':
                                      i.afterStandardMeterReading.toString(),
                                  'standardMeterReading_A':
                                      i.standardMeterReading_A.toString(),
                                  'equipmentUsed': i.EquipmentType.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<EnergyMeterAprpProvider>()
                                      .updateEnergyMeterAprp(
                                          EnergyMeterAprpTestModel(
                                              id: i.id,
                                              trNo: i.trNo,
                                              serialNo: i.serialNo,
                                              initialTestMeterReading:
                                                  i.initialTestMeterReading,
                                              afterTestMeterReading:
                                                  i.afterTestMeterReading,
                                              testMeterReading_R:
                                                  i.testMeterReading_R,
                                              initialStandardMeterReading:
                                                  i.initialStandardMeterReading,
                                              afterStandardMeterReading:
                                                  i.afterStandardMeterReading,
                                              standardMeterReading_A:
                                                  i.standardMeterReading_A,
                                              EquipmentType: i.EquipmentType,
                                              databaseID:
                                                  json.decode(value.body)['id'],
                                              updateDate: DateTime.now()),
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
                // ------------------------------------------
                Navigator.pushNamed(context, '/detail_EM_APRP', arguments: {
                  'id': report.id,
                  'EM_ID': report.databaseID,
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_EM_APRP', arguments: {
                  'id': report.id,
                  'EM_ID': report.databaseID,
                  'trDatabaseID': args['trDatabaseID'],
                });
              }
            },
            child: Card(
              color: Colors.white,
              elevation: 5,
              margin: EdgeInsets.fromLTRB(20, 10, 10, 8),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 100, 5),
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
                              ntr.etype == 'energy meter'
                                  ? const Text(
                                      'EM APRP-Test Details',
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
                              ntr.etype == 'energy meter'
                                  ? const Text(
                                      'EM APRP-Test Details',
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
                    Text(
                        'InitialTestMeterReading : ' +
                            report.initialTestMeterReading.toString(),
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
