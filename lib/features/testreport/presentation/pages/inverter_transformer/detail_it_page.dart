// ignore_for_file: prefer_const_constructors, missing_return, prefer_interpolation_to_compose_strings, file_names, use_build_context_synchronously

// import 'dart:html';

import 'dart:convert';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/IT/it_ir_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/it_provider/it_ir_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/it_provider/it_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/IT/it_mb_model.dart';
import '../../../data/models/equipment/IT/it_mc_model.dart';
import '../../../data/models/equipment/IT/it_model.dart';
import '../../../data/models/equipment/IT/it_r_model.dart';
import '../../../data/models/equipment/IT/it_vg_model.dart';
import '../../../data/models/equipment/IT/it_wr_model.dart';
import '../../../data/models/test_report_model.dart';
import '../../providers/equipment_acb_provider/test_report_provider.dart';
import '../../providers/it_provider/it_mb_provider.dart';
import '../../providers/it_provider/it_mc_provider.dart';
import '../../providers/it_provider/it_r_provider.dart';
import '../../providers/it_provider/it_vg_provider.dart';
import '../../providers/it_provider/it_wr_provider.dart';
import '../dropdown_All/responsive_tool/google_sign_in_out/InternetConnChecker.dart';
import '../equipment_acb/detail_test_report_page.dart';

class DetailItPage extends StatelessWidget with GetItMixin {
  Map args = {};
  ItModel ntr;
  int trDbId;
  DetailItPage(@required this.args, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getX((ItProvider x) => x.getItByID(args['id']));
    final ItModel ntr = watchOnly((ItProvider x) => x.itModel);

    var mob = const Text('Inverter Transformer Details',
        style: TextStyle(fontSize: 15));
    var desk = const Text('Inverter Transformer Details',
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
                  Navigator.popAndPushNamed(context, '/edit_IT', arguments: {
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
                          child: display_It_details(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_It_IR(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_It_WR(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_It_R(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_It_MC(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_It_MB(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_It_VG(ntr)),
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
                          child: display_It_details(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_It_IR(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_It_WR(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_It_R(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_It_MC(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_It_MB(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_It_VG(ntr)),
                    ],
                  ),
                ),
              ],
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
                    Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FloatingActionButton.extended(
                          heroTag: 'addItIr',
                          onPressed: () {
                            Navigator.popAndPushNamed(context, '/add_IT_IR',
                                arguments: {
                                  'TrNo': ntr.trNo,
                                  'IT_ID': ntr.id,
                                  'serialNo': ntr.serialNo,
                                  'itDatabaseID': ntr.databaseID,
                                  'trDatabaseID': args['trDatabaseID'],
                                });
                          },
                          label: const Text('Insulation Resistance Test',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white)),
                          icon: const Icon(Icons.add, color: Colors.white),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FloatingActionButton.extended(
                          heroTag: 'addItWr',
                          onPressed: () {
                            Navigator.popAndPushNamed(context, '/add_IT_WR',
                                arguments: {
                                  'TrNo': ntr.trNo,
                                  'IT_ID': ntr.id,
                                  'serialNo': ntr.serialNo,
                                  'itDatabaseID': ntr.databaseID,
                                  'trDatabaseID': args['trDatabaseID'],
                                });
                          },
                          label: const Text('Winding Resistance Test',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white)),
                          icon: const Icon(Icons.add, color: Colors.white),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FloatingActionButton.extended(
                          heroTag: 'addItr',
                          onPressed: () {
                            Navigator.popAndPushNamed(context, '/add_IT_R',
                                arguments: {
                                  'TrNo': ntr.trNo,
                                  'IT_ID': ntr.id,
                                  'serialNo': ntr.serialNo,
                                  'itDatabaseID': ntr.databaseID,
                                  'trDatabaseID': args['trDatabaseID'],
                                });
                          },
                          label: const Text('Ratio Test',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white)),
                          icon: const Icon(Icons.add, color: Colors.white),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FloatingActionButton.extended(
                          heroTag: 'addItMc',
                          onPressed: () {
                            Navigator.popAndPushNamed(context, '/add_IT_MC',
                                arguments: {
                                  'TrNo': ntr.trNo,
                                  'IT_ID': ntr.id,
                                  'serialNo': ntr.serialNo,
                                  'itDatabaseID': ntr.databaseID,
                                  'trDatabaseID': args['trDatabaseID'],
                                });
                          },
                          label: const Text('Magnetizing Current Test',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white)),
                          icon: const Icon(Icons.add, color: Colors.white),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FloatingActionButton.extended(
                          heroTag: 'addItMb',
                          onPressed: () {
                            Navigator.popAndPushNamed(context, '/add_IT_MB',
                                arguments: {
                                  'TrNo': ntr.trNo,
                                  'IT_ID': ntr.id,
                                  'serialNo': ntr.serialNo,
                                  'itDatabaseID': ntr.databaseID,
                                  'trDatabaseID': args['trDatabaseID'],
                                });
                          },
                          label: const Text('Magnetic Balance Test:',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white)),
                          icon: const Icon(Icons.add, color: Colors.white),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FloatingActionButton.extended(
                          heroTag: 'addItVG',
                          onPressed: () {
                            Navigator.popAndPushNamed(context, '/add_IT_VG',
                                arguments: {
                                  'TrNo': ntr.trNo,
                                  'IT_ID': ntr.id,
                                  'serialNo': ntr.serialNo,
                                  'itDatabaseID': ntr.databaseID,
                                  'trDatabaseID': args['trDatabaseID'],
                                });
                          },
                          label: const Text('Vector Group Test',
                              style:
                                  TextStyle(fontSize: 10, color: Colors.white)),
                          icon: const Icon(Icons.add, color: Colors.white),
                        )),
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
      getX((ItProvider x) => x.deleteIt(args['id']));
      Navigator.pop(context);
    });
  }

  ReadMoreDisplay_IT_details(ItModel ntr) {
    var dotdate = DateFormat('dd-MM-yyyy').format(ntr.dateOfTesting).toString();

    return 'DBID : ' +
        ntr.databaseID.toString() +
        '\n' +
        'etype : ' +
        ntr.etype +
        '\n' +
        'trNo : ' +
        ntr.trNo.toString() +
        '\n' +
        'designation : ' +
        ntr.designation +
        '\n' +
        'location : ' +
        ntr.location +
        '\n' +
        'serialNo : ' +
        ntr.serialNo +
        '\n' +
        'rating : ' +
        ntr.rating +
        '\n' +
        'ratedVoltage_HV : ' +
        ntr.ratedVoltage_HV.toString() +
        '\n' +
        'ratedVoltage_LV : ' +
        ntr.ratedVoltage_LV.toString() +
        '\n' +
        'ratedCurrent_HV : ' +
        ntr.ratedCurrent_HV.toString() +
        '\n' +
        'ratedCurrent_LV : ' +
        ntr.ratedCurrent_LV.toString() +
        '\n' +
        'vectorGroup : ' +
        ntr.vectorGroup +
        '\n' +
        'impedanceVoltage HV LV1 : ' +
        ntr.impedanceVoltage_HV_LV1.toString() +
        '\n' +
        'impedanceVoltage HV LV2 : ' +
        ntr.impedanceVoltage_HV_LV2.toString() +
        '\n' +
        'impedanceVoltage HV LV3 : ' +
        ntr.impedanceVoltage_HV_LV3.toString() +
        '\n' +
        'impedanceVoltage HV LV4 : ' +
        ntr.impedanceVoltage_HV_LV4.toString() +
        '\n' +
        'impedanceVoltage LV1 Lv2 : ' +
        ntr.impedanceVoltage_LV_LV.toString() +
        '\n' +
        'frequency : ' +
        ntr.frequency.toString() +
        '\n' +
        'typeOfCooling : ' +
        ntr.typeOfCooling +
        '\n' +
        'noOfPhases : ' +
        ntr.noOfPhases.toString() +
        '\n' +
        'make : ' +
        ntr.make +
        '\n' +
        'yom : ' +
        ntr.yom.toString() +
        '\n' +
        'noOfTaps : ' +
        ntr.noOfTaps.toString() +
        '\n' +
        'onOfNominalTaps : ' +
        ntr.noOfNominalTaps.toString() +
        '\n' +
        'oilTemp : ' +
        ntr.oilTemp.toString() +
        '\n' +
        'windingTemp : ' +
        ntr.windingTemp.toString() +
        '\n' +
        'ambientTemp : ' +
        ntr.ambientTemp.toString() +
        '\n' +
        ' dateOfTesting : ' +
        dotdate +
        '\n' +
        'testedBy : ' +
        ntr.testedBy +
        '\n' +
        'verifiedBy : ' +
        ntr.verifiedBy +
        '\n' +
        'WitnessedBy : ' +
        ntr.WitnessedBy +
        '\n';
  }

  // ReadMoreDisplay_CT_details2(CTModel ntr) {
  //   return TextSelection();
  // }

  display_It_details(ItModel ntr) {
    return Container(
      alignment: Alignment.center,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(80, 10, 80, 10),
          child: ReadMoreText(
            ReadMoreDisplay_IT_details(ntr),
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
                      getX((ItProvider x) => x.deleteIt(args['id']));
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

  generate_list_of_It_IR(ItModel ntr) {
    getX((ItIrProvider x) => x.getItIrBySerialNo(ntr.serialNo));
    final List<ItIrTestModel> reports =
        watchOnly((ItIrProvider x) => x.itIrSerialNoList);

    getX((ItProvider x) => x.FutureGetITLocalData());
    final List<ItModel> reportsForArgsfrom_ITmodel =
        watchOnly((ItProvider x) => x.itlocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((ItIrProvider x) => x.getItIrEquipmentList());
    final List<ItIrTestModel> reportsFormITirLocalData =
        watchOnly((ItIrProvider x) => x.itIrEquipmentList);

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
                for (var i in reportsFormITirLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print('tDatabaseID >> ');
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_ITmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print('argsSerialNo >> ');
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;
                                print(
                                    'inside of if argsSnoDB [serialNo DBID]  ');
                                print(argsSnoDB);

                                // add to remote database
                                var url =
                                    Uri.parse('${Env.URL_PREFIX}/itIrTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                  'hvE_60': i.hvE_60.toString(),
                                  'hvE_600': i.hvE_600.toString(),
                                  'hvLv1_60': i.hvLv1_60.toString(),
                                  'hvLv1_600': i.hvLv1_600.toString(),
                                  'hvLv2_60': i.hvLv2_60.toString(),
                                  'hvLv2_600': i.hvLv2_600.toString(),
                                  'hvLv3_60': i.hvLv3_60.toString(),
                                  'hvLv3_600': i.hvLv3_600.toString(),
                                  'hvLv4_60': i.hvLv4_60.toString(),
                                  'hvLv4_600': i.hvLv4_600.toString(),
                                  'lv1E': i.lv1E.toString(),
                                  'lv2E': i.lv2E.toString(),
                                  'lv3E': i.lv3E.toString(),
                                  'lv4E': i.lv4E.toString(),
                                  'lv1Lv2': i.lv1Lv2.toString(),
                                  'lv1Lv3': i.lv1Lv3.toString(),
                                  'lv1Lv4': i.lv1Lv4.toString(),
                                  'lv2Lv3': i.lv2Lv3.toString(),
                                  'lv2Lv4': i.lv2Lv4.toString(),
                                  'lv3Lv4': i.lv3Lv4.toString(),
                                  'lv4Lv1': i.lv4Lv1.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<ItIrProvider>().updateItIr(
                                      ItIrTestModel(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        hvE_60: i.hvE_60,
                                        hvE_600: i.hvE_600,
                                        hvLv1_60: i.hvLv1_60,
                                        hvLv1_600: i.hvLv1_600,
                                        hvLv2_60: i.hvLv2_60,
                                        hvLv2_600: i.hvLv2_600,
                                        hvLv3_60: i.hvLv3_60,
                                        hvLv3_600: i.hvLv3_600,
                                        hvLv4_60: i.hvLv4_60,
                                        hvLv4_600: i.hvLv4_600,
                                        lv1E: i.lv1E,
                                        lv2E: i.lv2E,
                                        lv3E: i.lv3E,
                                        lv4E: i.lv4E,
                                        lv1Lv2: i.lv1Lv2,
                                        lv1Lv3: i.lv1Lv3,
                                        lv1Lv4: i.lv1Lv4,
                                        lv2Lv3: i.lv2Lv3,
                                        lv2Lv4: i.lv2Lv4,
                                        lv3Lv4: i.lv3Lv4,
                                        lv4Lv1: i.lv4Lv1,
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
                Navigator.pushNamed(context, '/detail_IT_IR', arguments: {
                  'id': report.id,
                  'itirDatabaseID': report.databaseID,
                  'serialNo': ntr.serialNo,
                  'itDatabaseID': args['itDatabaseID'],
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_IT_IR', arguments: {
                  'id': report.id,
                  'itirDatabaseID': report.databaseID,
                  'serialNo': ntr.serialNo,
                  'itDatabaseID': args['itDatabaseID'],
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
                              ntr.etype == 'it'
                                  ? const Text(
                                      'IT IR Details ',
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
                              ntr.etype == 'it'
                                  ? const Text(
                                      'IT IR Details ',
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
                    Text('serialNo : ' + report.serialNo,
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

  generate_list_of_It_WR(ItModel ntr) {
    getX((ItWrProvider x) => x.getItWrBySerialNo(ntr.serialNo));
    final List<ItWrTestModel> reports =
        watchOnly((ItWrProvider x) => x.itWrSerialNoList);

    getX((ItProvider x) => x.FutureGetITLocalData());
    final List<ItModel> reportsForArgsfrom_ITmodel =
        watchOnly((ItProvider x) => x.itlocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((ItWrProvider x) => x.getItWrEquipmentList());
    final List<ItWrTestModel> reportsFormITwrLocalData =
        watchOnly((ItWrProvider x) => x.itWrEquipmentList);

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
                for (var i in reportsFormITwrLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print('tDatabaseID >> ');
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_ITmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print('argsSerialNo >> ');
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;
                                print(
                                    'inside of if argsSnoDB [serialNo DBID]  ');
                                print(argsSnoDB);

                                // add to remote database
                                var url =
                                    Uri.parse('${Env.URL_PREFIX}/itWrTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                  'uV': i.uV.toString(),
                                  'vW': i.vW.toString(),
                                  'wU': i.wU.toString(),
                                  'tapPosition': i.tapPosition.toString(),
                                  'hvLVOpt': i.hvLVOpt.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<ItWrProvider>().updateItWr(
                                      ItWrTestModel(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        uV: i.uV,
                                        vW: i.vW,
                                        wU: i.wU,
                                        tapPosition: i.tapPosition,
                                        hvLVOpt: i.hvLVOpt,
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

                // ------------------------------------------------------
                Navigator.pushNamed(context, '/detail_IT_WR', arguments: {
                  'id': report.id,
                  'itirDatabaseID': report.databaseID,
                  'serialNo': ntr.serialNo,
                  'itDatabaseID': args['itDatabaseID'],
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_IT_WR', arguments: {
                  'id': report.id,
                  'itirDatabaseID': report.databaseID,
                  'serialNo': ntr.serialNo,
                  'itDatabaseID': args['itDatabaseID'],
                  'trDatabaseID': args['trDatabaseID'],
                });
              }
            },
            child: checkVectoreGroup(ntr) &&
                    (report.hvLVOpt == 'lv3' || report.hvLVOpt == 'lv4')
                ? Container()
                : Card(
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
                                    ntr.etype == 'it'
                                        ? const Text(
                                            'IT WR Details ',
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
                                    ntr.etype == 'it'
                                        ? const Text(
                                            'IT WR Details ',
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
                          Text('trNo : ' + report.trNo.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Text('serialNo : ' + report.serialNo,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                          Text('uV : ' + report.uV.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 13)),
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }

  generate_list_of_It_R(ItModel ntr) {
    getX((ItRProvider x) => x.getItRBySerialNo(ntr.serialNo));
    final List<ItRTestModel> reports =
        watchOnly((ItRProvider x) => x.itRSerialNoList);

    getX((ItProvider x) => x.FutureGetITLocalData());
    final List<ItModel> reportsForArgsfrom_ITmodel =
        watchOnly((ItProvider x) => x.itlocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((ItRProvider x) => x.getItREquipmentList());
    final List<ItRTestModel> reportsFormITrLocalData =
        watchOnly((ItRProvider x) => x.itREquipmentList);

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
                for (var i in reportsFormITrLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print('tDatabaseID >> ');
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_ITmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print('argsSerialNo >> ');
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;
                                print(
                                    'inside of if argsSnoDB [serialNo DBID]  ');
                                print(argsSnoDB);

                                // add to remote database
                                var url =
                                    Uri.parse('${Env.URL_PREFIX}/itRTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                  'tapPosition': i.tapPosition.toString(),
                                  'hv_uv': i.hv_uv.toString(),
                                  'hv_vw': i.hv_vw.toString(),
                                  'hv_wu': i.hv_wu.toString(),
                                  'lv1_uv': i.lv1_uv.toString(),
                                  'lv1_vw': i.lv1_vw.toString(),
                                  'lv1_wu': i.lv1_wu.toString(),
                                  'lv2_uv': i.lv2_uv.toString(),
                                  'lv2_vw': i.lv2_vw.toString(),
                                  'lv2_wu': i.lv2_wu.toString(),
                                  'lv3_uv': i.lv3_uv.toString(),
                                  'lv3_vw': i.lv3_vw.toString(),
                                  'lv3_wu': i.lv3_wu.toString(),
                                  'lv4_uv': i.lv4_uv.toString(),
                                  'lv4_vw': i.lv4_vw.toString(),
                                  'lv4_wu': i.lv4_wu.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<ItRProvider>().updateItR(
                                      ItRTestModel(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        tapPosition: i.tapPosition,
                                        hv_uv: i.hv_uv,
                                        hv_vw: i.hv_vw,
                                        hv_wu: i.hv_wu,
                                        lv1_uv: i.lv1_uv,
                                        lv1_vw: i.lv1_vw,
                                        lv1_wu: i.lv1_wu,
                                        lv2_uv: i.lv2_uv,
                                        lv2_vw: i.lv2_vw,
                                        lv2_wu: i.lv2_wu,
                                        lv3_uv: i.lv3_uv,
                                        lv3_vw: i.lv3_vw,
                                        lv3_wu: i.lv3_wu,
                                        lv4_uv: i.lv4_uv,
                                        lv4_vw: i.lv4_vw,
                                        lv4_wu: i.lv4_wu,
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

                // ---------------------------------------------------------
                Navigator.pushNamed(context, '/detail_IT_R', arguments: {
                  'id': report.id,
                  'itirDatabaseID': report.databaseID,
                  'serialNo': ntr.serialNo,
                  'itDatabaseID': args['itDatabaseID'],
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_IT_R', arguments: {
                  'id': report.id,
                  'itirDatabaseID': report.databaseID,
                  'serialNo': ntr.serialNo,
                  'itDatabaseID': args['itDatabaseID'],
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
                              ntr.etype == 'it'
                                  ? const Text(
                                      'IT R Details ',
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
                              ntr.etype == 'it'
                                  ? const Text(
                                      'IT R Details ',
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
                    Text('serialNo : ' + report.serialNo,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('Hv-uV : ' + report.hv_uv.toString(),
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

  generate_list_of_It_MC(ItModel ntr) {
    getX((ItMcProvider x) => x.getItMcBySerialNo(ntr.serialNo));
    final List<ItMcTestModel> reports =
        watchOnly((ItMcProvider x) => x.itMcSerialNoList);

    getX((ItProvider x) => x.FutureGetITLocalData());
    final List<ItModel> reportsForArgsfrom_ITmodel =
        watchOnly((ItProvider x) => x.itlocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((ItMcProvider x) => x.getItMcEquipmentList());
    final List<ItMcTestModel> reportsFormITmcocalData =
        watchOnly((ItMcProvider x) => x.itMcEquipmentList);

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
                for (var i in reportsFormITmcocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print('tDatabaseID >> ');
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_ITmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print('argsSerialNo >> ');
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;
                                print(
                                    'inside of if argsSnoDB [serialNo DBID]  ');
                                print(argsSnoDB);

                                // add to remote database
                                var url =
                                    Uri.parse('${Env.URL_PREFIX}/itMcTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                  'tapPosition': i.tapPosition.toString(),
                                  'uv': i.uv.toString(),
                                  'vw': i.vw.toString(),
                                  'wu': i.wu.toString(),
                                  'u': i.u.toString(),
                                  'v': i.v.toString(),
                                  'w': i.w.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<ItMcProvider>().updateItMc(
                                      ItMcTestModel(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        tapPosition: i.tapPosition,
                                        uv: i.uv,
                                        vw: i.vw,
                                        wu: i.wu,
                                        u: i.u,
                                        v: i.v,
                                        w: i.w,
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

                // ------------------------------------------------------
                Navigator.pushNamed(context, '/detail_IT_MC', arguments: {
                  'id': report.id,
                  'itirDatabaseID': report.databaseID,
                  'serialNo': ntr.serialNo,
                  'itDatabaseID': args['itDatabaseID'],
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_IT_MC', arguments: {
                  'id': report.id,
                  'itirDatabaseID': report.databaseID,
                  'serialNo': ntr.serialNo,
                  'itDatabaseID': args['itDatabaseID'],
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
                              ntr.etype == 'it'
                                  ? const Text(
                                      'IT MC Details ',
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
                              ntr.etype == 'it'
                                  ? const Text(
                                      'IT MC Details ',
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
                    Text('serialNo : ' + report.serialNo,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text(
                        'Applied Voltage HV Side (V) : ' + report.uv.toString(),
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

  bool checkVectoreGroup(ItModel ntr) {
    return ntr.vectorGroup.toLowerCase() == 'dd0/dd0' ||
        ntr.vectorGroup.toLowerCase() == 'dd6/dd6' ||
        ntr.vectorGroup.toLowerCase() == 'yd1d1' ||
        ntr.vectorGroup.toLowerCase() == 'yd11d11';
  }

  generate_list_of_It_MB(ItModel ntr) {
    getX((ItMbProvider x) => x.getItMbBySerialNo(ntr.serialNo));
    final List<ItMbTestModel> reports =
        watchOnly((ItMbProvider x) => x.itMbSerialNoList);

    getX((ItProvider x) => x.FutureGetITLocalData());
    final List<ItModel> reportsForArgsfrom_ITmodel =
        watchOnly((ItProvider x) => x.itlocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((ItMbProvider x) => x.getItMbEquipmentList());
    final List<ItMbTestModel> reportsFormITmbocalData =
        watchOnly((ItMbProvider x) => x.itMbEquipmentList);

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
                for (var i in reportsFormITmbocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print('tDatabaseID >> ');
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_ITmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print('argsSerialNo >> ');
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;
                                print(
                                    'inside of if argsSnoDB [serialNo DBID]  ');
                                print(argsSnoDB);

                                // add to remote database
                                var url =
                                    Uri.parse('${Env.URL_PREFIX}/itMbTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                  'r_hv_uv': i.r_hv_uv.toString(),
                                  'r_hv_vw': i.r_hv_vw.toString(),
                                  'r_hv_wu': i.r_hv_wu.toString(),
                                  'r_lv1_uv': i.r_lv1_uv.toString(),
                                  'r_lv1_vw': i.r_lv1_vw.toString(),
                                  'r_lv1_wu': i.r_lv1_wu.toString(),
                                  'r_lv2_uv': i.r_lv2_uv.toString(),
                                  'r_lv2_vw': i.r_lv2_vw.toString(),
                                  'r_lv2_wu': i.r_lv2_wu.toString(),
                                  'r_lv3_uv': i.r_lv3_uv.toString(),
                                  'r_lv3_vw': i.r_lv3_vw.toString(),
                                  'r_lv3_wu': i.r_lv3_wu.toString(),
                                  'r_lv4_uv': i.r_lv4_uv.toString(),
                                  'r_lv4_vw': i.r_lv4_vw.toString(),
                                  'r_lv4_wu': i.r_lv4_wu.toString(),
                                  'y_hv_uv': i.y_hv_uv.toString(),
                                  'y_hv_vw': i.y_hv_vw.toString(),
                                  'y_hv_wu': i.y_hv_wu.toString(),
                                  'y_lv1_uv': i.y_lv1_uv.toString(),
                                  'y_lv1_vw': i.y_lv1_vw.toString(),
                                  'y_lv1_wu': i.y_lv1_wu.toString(),
                                  'y_lv2_uv': i.y_lv2_uv.toString(),
                                  'y_lv2_vw': i.y_lv2_vw.toString(),
                                  'y_lv2_wu': i.y_lv2_wu.toString(),
                                  'y_lv3_uv': i.y_lv3_uv.toString(),
                                  'y_lv3_vw': i.y_lv3_vw.toString(),
                                  'y_lv3_wu': i.y_lv3_wu.toString(),
                                  'y_lv4_uv': i.y_lv4_uv.toString(),
                                  'y_lv4_vw': i.y_lv4_vw.toString(),
                                  'y_lv4_wu': i.y_lv4_wu.toString(),
                                  'b_hv_uv': i.b_hv_uv.toString(),
                                  'b_hv_vw': i.b_hv_vw.toString(),
                                  'b_hv_wu': i.b_hv_wu.toString(),
                                  'b_lv1_uv': i.b_lv1_uv.toString(),
                                  'b_lv1_vw': i.b_lv1_vw.toString(),
                                  'b_lv1_wu': i.b_lv1_wu.toString(),
                                  'b_lv2_uv': i.b_lv2_uv.toString(),
                                  'b_lv2_vw': i.b_lv2_vw.toString(),
                                  'b_lv2_wu': i.b_lv2_wu.toString(),
                                  'b_lv3_uv': i.b_lv3_uv.toString(),
                                  'b_lv3_vw': i.b_lv3_vw.toString(),
                                  'b_lv3_wu': i.b_lv3_wu.toString(),
                                  'b_lv4_uv': i.b_lv4_uv.toString(),
                                  'b_lv4_vw': i.b_lv4_vw.toString(),
                                  'b_lv4_wu': i.b_lv4_wu.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<ItMbProvider>().updateItMb(
                                      ItMbTestModel(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        r_hv_uv: i.r_hv_uv,
                                        r_hv_vw: i.r_hv_vw,
                                        r_hv_wu: i.r_hv_wu,
                                        r_lv1_uv: i.r_lv1_uv,
                                        r_lv1_vw: i.r_lv1_vw,
                                        r_lv1_wu: i.r_lv1_wu,
                                        r_lv2_uv: i.r_lv2_uv,
                                        r_lv2_vw: i.r_lv2_vw,
                                        r_lv2_wu: i.r_lv2_wu,
                                        r_lv3_uv: i.r_lv3_uv,
                                        r_lv3_vw: i.r_lv3_vw,
                                        r_lv3_wu: i.r_lv3_wu,
                                        r_lv4_uv: i.r_lv4_uv,
                                        r_lv4_vw: i.r_lv4_vw,
                                        r_lv4_wu: i.r_lv4_wu,
                                        y_hv_uv: i.y_hv_uv,
                                        y_hv_vw: i.y_hv_vw,
                                        y_hv_wu: i.y_hv_wu,
                                        y_lv1_uv: i.y_lv1_uv,
                                        y_lv1_vw: i.y_lv1_vw,
                                        y_lv1_wu: i.y_lv1_wu,
                                        y_lv2_uv: i.y_lv2_uv,
                                        y_lv2_vw: i.y_lv2_vw,
                                        y_lv2_wu: i.y_lv2_wu,
                                        y_lv3_uv: i.y_lv3_uv,
                                        y_lv3_vw: i.y_lv3_vw,
                                        y_lv3_wu: i.y_lv3_wu,
                                        y_lv4_uv: i.y_lv4_uv,
                                        y_lv4_vw: i.y_lv4_vw,
                                        y_lv4_wu: i.y_lv4_wu,
                                        b_hv_uv: i.b_hv_uv,
                                        b_hv_vw: i.b_hv_vw,
                                        b_hv_wu: i.b_hv_wu,
                                        b_lv1_uv: i.b_lv1_uv,
                                        b_lv1_vw: i.b_lv1_vw,
                                        b_lv1_wu: i.b_lv1_wu,
                                        b_lv2_uv: i.b_lv2_uv,
                                        b_lv2_vw: i.b_lv2_vw,
                                        b_lv2_wu: i.b_lv2_wu,
                                        b_lv3_uv: i.b_lv3_uv,
                                        b_lv3_vw: i.b_lv3_vw,
                                        b_lv3_wu: i.b_lv3_wu,
                                        b_lv4_uv: i.b_lv4_uv,
                                        b_lv4_vw: i.b_lv4_vw,
                                        b_lv4_wu: i.b_lv4_wu,
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
                Navigator.pushNamed(context, '/detail_IT_MB', arguments: {
                  'id': report.id,
                  'itirDatabaseID': report.databaseID,
                  'serialNo': ntr.serialNo,
                  'itDatabaseID': args['itDatabaseID'],
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_IT_MB', arguments: {
                  'id': report.id,
                  'itirDatabaseID': report.databaseID,
                  'serialNo': ntr.serialNo,
                  'itDatabaseID': args['itDatabaseID'],
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
                              ntr.etype == 'it'
                                  ? const Text(
                                      'IT MB Details ',
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
                              ntr.etype == 'it'
                                  ? const Text(
                                      'IT MB Details ',
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
                    Text('serialNo : ' + report.serialNo,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text(
                        'Measured Voltage HV Side (V) R-Cut : ' +
                            report.r_hv_uv.toString(),
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

  generate_list_of_It_VG(ItModel ntr) {
    getX((ItVgProvider x) => x.getItVgBySerialNo(ntr.serialNo));
    final List<ItVgTestModel> reports =
        watchOnly((ItVgProvider x) => x.itVgSerialNoList);

    getX((ItProvider x) => x.FutureGetITLocalData());
    final List<ItModel> reportsForArgsfrom_ITmodel =
        watchOnly((ItProvider x) => x.itlocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((ItVgProvider x) => x.getItVgEquipmentList());
    final List<ItVgTestModel> reportsFormITVGocalData =
        watchOnly((ItVgProvider x) => x.itVgEquipmentList);

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
                for (var i in reportsFormITVGocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print('tDatabaseID >> ');
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_ITmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print('argsSerialNo >> ');
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;
                                print(
                                    'inside of if argsSnoDB [serialNo DBID]  ');
                                print(argsSnoDB);

                                // add to remote database
                                var url =
                                    Uri.parse('${Env.URL_PREFIX}/itVgTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                  'lv1_v1': i.lv1_v1.toString(),
                                  'lv1_v2': i.lv1_v2.toString(),
                                  'lv1_v3': i.lv1_v3.toString(),
                                  'lv1_v4': i.lv1_v4.toString(),
                                  'lv2_v1': i.lv2_v1.toString(),
                                  'lv2_v2': i.lv2_v2.toString(),
                                  'lv2_v3': i.lv2_v3.toString(),
                                  'lv2_v4': i.lv2_v4.toString(),
                                  'lv3_v1': i.lv3_v1.toString(),
                                  'lv3_v2': i.lv3_v2.toString(),
                                  'lv3_v3': i.lv3_v3.toString(),
                                  'lv3_v4': i.lv3_v4.toString(),
                                  'lv4_v1': i.lv4_v1.toString(),
                                  'lv4_v2': i.lv4_v2.toString(),
                                  'lv4_v3': i.lv4_v3.toString(),
                                  'lv4_v4': i.lv4_v4.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<ItVgProvider>().updateItVg(
                                      ItVgTestModel(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        lv1_v1: i.lv1_v1,
                                        lv1_v2: i.lv1_v2,
                                        lv1_v3: i.lv1_v3,
                                        lv1_v4: i.lv1_v4,
                                        lv2_v1: i.lv2_v1,
                                        lv2_v2: i.lv2_v2,
                                        lv2_v3: i.lv2_v3,
                                        lv2_v4: i.lv2_v4,
                                        lv3_v1: i.lv3_v1,
                                        lv3_v2: i.lv3_v2,
                                        lv3_v3: i.lv3_v3,
                                        lv3_v4: i.lv3_v4,
                                        lv4_v1: i.lv4_v1,
                                        lv4_v2: i.lv4_v2,
                                        lv4_v3: i.lv4_v3,
                                        lv4_v4: i.lv4_v4,
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
                Navigator.pushNamed(context, '/detail_IT_VG', arguments: {
                  'id': report.id,
                  'itirDatabaseID': report.databaseID,
                  'serialNo': ntr.serialNo,
                  'itDatabaseID': args['itDatabaseID'],
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_IT_VG', arguments: {
                  'id': report.id,
                  'itirDatabaseID': report.databaseID,
                  'serialNo': ntr.serialNo,
                  'itDatabaseID': args['itDatabaseID'],
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
                              ntr.etype == 'it'
                                  ? const Text(
                                      'IT Vg Details ',
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
                              ntr.etype == 'it'
                                  ? const Text(
                                      'IT Vg Details ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11.5,
                                          letterSpacing: 1.5),
                                    )
                                  : Container(),
                            ],
                          ),
                    Text('DBID : ' + report.id.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('trNo : ' + report.trNo.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('serialNo : ' + report.serialNo,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('2w1U : ' + report.lv1_v1.toString(),
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
