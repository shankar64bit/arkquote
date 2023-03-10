// ignore_for_file: prefer_const_constructors, missing_return, prefer_interpolation_to_compose_strings, file_names, use_build_context_synchronously, non_constant_identifier_names
// import 'dart:html';
import 'dart:convert';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:readmore/readmore.dart';
import '../../../../../env.sample.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/AT/AT_ir_model.dart';
import '../../../data/models/equipment/AT/AT_mb_model.dart';
import '../../../data/models/equipment/AT/AT_mc_model.dart';
import '../../../data/models/equipment/AT/AT_model.dart';
import '../../../data/models/equipment/AT/AT_r_model.dart';
import '../../../data/models/equipment/AT/AT_wrHv_model.dart';
import '../../../data/models/equipment/AT/AT_wrLv_model.dart';
import '../../../data/models/test_report_model.dart';
import '../../providers/at_provider/at_ir_provider.dart';
import '../../providers/at_provider/at_mb_provider.dart';
import '../../providers/at_provider/at_mc_provider.dart';
import '../../providers/at_provider/at_provider.dart';
import '../../providers/at_provider/at_r_provider.dart';
import '../../providers/at_provider/at_wrHv_provider.dart';
import '../../providers/at_provider/at_wrLv_provider.dart';
import '../../providers/equipment_acb_provider/test_report_provider.dart';
import '../dropdown_All/responsive_tool/google_sign_in_out/InternetConnChecker.dart';
import '../equipment_acb/detail_test_report_page.dart';

class Detail_AT_Page extends StatelessWidget with GetItMixin {
  Map args = {};
  ATModel ntr;
  int trDbId;
  Detail_AT_Page(@required this.args, {Key key}) : super(key: key);
  var datetime;

  @override
  Widget build(BuildContext context) {
    getX((ATProvider x) => x.getATByID(args['id']));
    final ATModel ntr = watchOnly((ATProvider x) => x.atModel);

    var mob = const Text('AT  Details', style: TextStyle(fontSize: 15));
    var desk = const Text('AT  Details', style: TextStyle(fontSize: 20));
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
                  Navigator.popAndPushNamed(context, '/edit_AT',
                      arguments: ntr.id);
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
                          child: display_AT_details(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_ATcoreIR(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_ATwrHv(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_ATwrLv(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_AT_R(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_AT_mc(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_AT_mb(ntr)),
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
                          child: display_AT_details(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_ATcoreIR(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_ATwrHv(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_ATwrLv(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_AT_R(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_AT_mc(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_AT_mb(ntr)),
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
                        heroTag: 'addATcoreIR',
                        onPressed: () async {
                          Navigator.popAndPushNamed(context, '/add_ATcoreIR',
                              arguments: {
                                'TrNo': ntr.trNo,
                                'AT_ID': ntr.id,
                                'serial_no_bph': ntr.serialNo,
                                'atDatabaseID': ntr.databaseID,
                                'trDatabaseID': args['trDatabaseID'],
                              });
                        },
                        label: const Text('Add ATcoreIR',
                            style:
                                TextStyle(fontSize: 10, color: Colors.white)),
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton.extended(
                        heroTag: 'addATwrHv',
                        onPressed: () async {
                          Navigator.popAndPushNamed(context, '/add_ATwrHv',
                              arguments: {
                                'TrNo': ntr.trNo,
                                'AT_ID': ntr.id,
                                'serial_no_bph': ntr.serialNo,
                                'atDatabaseID': ntr.databaseID,
                                'trDatabaseID': args['trDatabaseID'],
                              });
                        },
                        label: const Text('Add ATwrHv',
                            style:
                                TextStyle(fontSize: 10, color: Colors.white)),
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton.extended(
                        heroTag: 'addATwrLv',
                        onPressed: () async {
                          Navigator.popAndPushNamed(context, '/add_ATwrLv',
                              arguments: {
                                'TrNo': ntr.trNo,
                                'AT_ID': ntr.id,
                                'serial_no_bph': ntr.serialNo,
                                'atDatabaseID': ntr.databaseID,
                                'trDatabaseID': args['trDatabaseID'],
                              });
                        },
                        label: const Text('Add ATwrLv',
                            style:
                                TextStyle(fontSize: 10, color: Colors.white)),
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton.extended(
                        heroTag: 'addAT_R',
                        onPressed: () async {
                          Navigator.popAndPushNamed(context, '/add_AT_R',
                              arguments: {
                                'TrNo': ntr.trNo,
                                'AT_ID': ntr.id,
                                'serial_no_bph': ntr.serialNo,
                                'atDatabaseID': ntr.databaseID,
                                'trDatabaseID': args['trDatabaseID'],
                              });
                        },
                        label: const Text('Add AT_R',
                            style:
                                TextStyle(fontSize: 10, color: Colors.white)),
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton.extended(
                        heroTag: 'addAT_mc',
                        onPressed: () async {
                          Navigator.popAndPushNamed(context, '/add_AT_mc',
                              arguments: {
                                'TrNo': ntr.trNo,
                                'AT_ID': ntr.id,
                                'serial_no_bph': ntr.serialNo,
                                'atDatabaseID': ntr.databaseID,
                                'trDatabaseID': args['trDatabaseID'],
                              });
                        },
                        label: const Text('Add AT_mc',
                            style:
                                TextStyle(fontSize: 10, color: Colors.white)),
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton.extended(
                        heroTag: 'addAT_mb',
                        onPressed: () async {
                          Navigator.popAndPushNamed(context, '/add_AT_mb',
                              arguments: {
                                'TrNo': ntr.trNo,
                                'AT_ID': ntr.id,
                                'serial_no_bph': ntr.serialNo,
                                'atDatabaseID': ntr.databaseID,
                                'trDatabaseID': args['trDatabaseID'],
                              });
                        },
                        label: const Text('Add AT_mb',
                            style:
                                TextStyle(fontSize: 10, color: Colors.white)),
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
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
      getX((ATProvider x) => x.deleteAT(args['id']));
      Navigator.pop(context);
    });
  }

  ReadMoreDisplay_AT_details(ATModel ntr) {
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
        'serialNo : ' +
        ntr.serialNo +
        '\n' +
        'rating : ' +
        ntr.rating.toString() +
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
        ntr.vectorGroup.toString() +
        '\n' +
        'impedanceVoltage : ' +
        ntr.impedanceVoltage.toString() +
        '\n' +
        'frequency : ' +
        ntr.frequency.toString() +
        '\n' +
        'typeOfCooling : ' +
        ntr.typeOfCooling.toString() +
        '\n' +
        'noOfTaps : ' +
        ntr.noOfTaps.toString() +
        '\n' +
        'onOfNominalTaps : ' +
        ntr.onOfNominalTaps.toString() +
        '\n' +
        'Make : ' +
        ntr.make +
        '\n' +
        'yom : ' +
        ntr.yom.toString() +
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

  display_AT_details(ATModel ntr) {
    return Container(
      alignment: Alignment.center,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(80, 10, 80, 10),
          child: ReadMoreText(
            ReadMoreDisplay_AT_details(ntr),
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
                      getX((ATProvider x) => x.deleteAT(args['id']));
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

  generate_list_of_ATcoreIR(ATModel ntr) {
    getX((ATcoreIRProvider x) => x.getATcoreIR_BySerialNo(ntr.serialNo));
    final List<ATcoreIRModel> reports =
        watchOnly((ATcoreIRProvider x) => x.atcoreIR_serialNoList);

    getX((ATProvider x) => x.getATLocalData());
    final List<ATModel> reportsForArgsfrom_Acbmodel =
        watchOnly((ATProvider x) => x.atlocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((ATcoreIRProvider x) => x.getATLocalDataEquipmentList());
    final List<ATcoreIRModel> reportsFormATirLocalData =
        watchOnly((ATcoreIRProvider x) => x.atcoreIR_localdataList);

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
                for (var i in reportsFormATirLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_Acbmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                // add to remote database
                                var url =
                                    Uri.parse('${Env.URL_PREFIX}/atIrTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                  'hvE_1min': i.hvE_1min.toString(),
                                  'hvE_10min': i.hvE_10min.toString(),
                                  'hvE_PImin': i.hvE_PImin.toString(),
                                  'hvLV_1min': i.hvLV_1min.toString(),
                                  'hvLV_10min': i.hvLV_10min.toString(),
                                  'hvLV_PImin': i.hvLV_PImin.toString(),
                                  'lvE_1min': i.lvE_1min.toString(),
                                  'lvE_10min': i.lvE_10min.toString(),
                                  'lvE_PImin': i.lvE_PImin.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<ATcoreIRProvider>().updateATcoreIR(
                                      ATcoreIRModel(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        hvE_1min: i.hvE_1min,
                                        hvE_10min: i.hvE_10min,
                                        hvE_PImin: i.hvE_PImin,
                                        hvLV_1min: i.hvLV_1min,
                                        hvLV_10min: i.hvLV_10min,
                                        hvLV_PImin: i.hvLV_PImin,
                                        lvE_1min: i.lvE_1min,
                                        lvE_10min: i.lvE_10min,
                                        lvE_PImin: i.lvE_PImin,
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

                Navigator.pushNamed(context, '/detail_ATcoreIR', arguments: {
                  'id': report.id,
                  'AT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo,
                  'atDatabaseID': args['atDatabaseID'],
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_ATcoreIR', arguments: {
                  'id': report.id,
                  'AT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo,
                  'atDatabaseID': args['atDatabaseID'],
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
                              ntr.etype == 'at'
                                  ? const Text(
                                      ' ATcoreIR Details ',
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
                              ntr.etype == 'at'
                                  ? const Text(
                                      ' ATcoreIR Details ',
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
                    Text('serialNo_bph : ' + report.serialNo,
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

  generate_list_of_ATwrHv(ATModel ntr) {
    getX((ATwrHv_Provider x) => x.getATwrHvserialNo(ntr.serialNo));
    final List<ATwrHv_Model> reports =
        watchOnly((ATwrHv_Provider x) => x.atwrHv_serialNoList);

    getX((ATProvider x) => x.getATLocalData());
    final List<ATModel> reportsForArgsfrom_Acbmodel =
        watchOnly((ATProvider x) => x.atlocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((ATwrHv_Provider x) => x.getATwrHvLocalDataEquipmentList());
    final List<ATwrHv_Model> reportsFormATwrHvLocalData =
        watchOnly((ATwrHv_Provider x) => x.atwrHv_loacaldataList);

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
                for (var i in reportsFormATwrHvLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_Acbmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                // add to remote databse
                                var url =
                                    Uri.parse('${Env.URL_PREFIX}/atWrHvTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'hv_1u_1n': i.hv_1u_1n.toString(),
                                  'hv_1v_1n': i.hv_1v_1n.toString(),
                                  'hv_1w_1n': i.hv_1w_1n.toString(),
                                  'tapPosition': i.tapPosition.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<ATwrHv_Provider>().updateATwrHv(
                                      ATwrHv_Model(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        hv_1u_1n: i.hv_1u_1n,
                                        hv_1v_1n: i.hv_1v_1n,
                                        hv_1w_1n: i.hv_1w_1n,
                                        tapPosition: i.tapPosition,
                                        databaseID:
                                            json.decode(value.body)['id'],
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

                Navigator.pushNamed(context, '/detail_ATwrHv', arguments: {
                  'id': report.id,
                  'AT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo,
                  'atDatabaseID': args['atDatabaseID'],
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_ATwrHv', arguments: {
                  'id': report.id,
                  'AT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo,
                  'atDatabaseID': args['atDatabaseID'],
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
                              ntr.etype == 'at'
                                  ? const Text(
                                      ' ATwrHv Details ',
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
                              ntr.etype == 'at'
                                  ? const Text(
                                      ' ATwrHv Details ',
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
                    Text('hv_1u_1n : ' + report.hv_1u_1n.toString(),
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

  generate_list_of_ATwrLv(ATModel ntr) {
    getX((ATwrLv_Provider x) => x.getATwrLvserialNo(ntr.serialNo));
    final List<ATwrLv_Model> reports =
        watchOnly((ATwrLv_Provider x) => x.atwrLv_serialNoList);

    getX((ATProvider x) => x.getATLocalData());
    final List<ATModel> reportsForArgsfrom_Acbmodel =
        watchOnly((ATProvider x) => x.atlocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((ATwrLv_Provider x) => x.getATwrLvEquipmentList());
    final List<ATwrLv_Model> reportsFormATwrLvLocalData =
        watchOnly((ATwrLv_Provider x) => x.atwrLv_loacaldataList);

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
                for (var i in reportsFormATwrLvLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_Acbmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                var url =
                                    Uri.parse('${Env.URL_PREFIX}/atWrLvTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'lv_2u_2v': i.lv_2u_2v.toString(),
                                  'lv_2v_2w': i.lv_2v_2w.toString(),
                                  'lv_2w_2u': i.lv_2w_2u.toString(),
                                  'tapPosition': i.tapPosition.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<ATwrLv_Provider>().updateATwrLv(
                                      ATwrLv_Model(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        lv_2u_2v: i.lv_2u_2v,
                                        lv_2v_2w: i.lv_2v_2w,
                                        lv_2w_2u: i.lv_2w_2u,
                                        equipmentUsed: i.equipmentUsed,
                                        tapPosition: i.tapPosition,
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

                Navigator.pushNamed(context, '/detail_ATwrLv', arguments: {
                  'id': report.id,
                  'AT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo,
                  'atDatabaseID': args['atDatabaseID'],
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_ATwrLv', arguments: {
                  'id': report.id,
                  'AT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo,
                  'atDatabaseID': args['atDatabaseID'],
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
                              ntr.etype == 'at'
                                  ? const Text(
                                      ' ATwrLv Details ',
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
                              ntr.etype == 'at'
                                  ? const Text(
                                      ' ATwrLv Details ',
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
                    Text('lv_2u_2v : ' + report.lv_2u_2v.toString(),
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

  generate_list_of_AT_R(ATModel ntr) {
    getX((AT_R_Provider x) => x.getATrserialNo(ntr.serialNo));
    final List<AT_R_Model> reports =
        watchOnly((AT_R_Provider x) => x.at_R_serialNoList);

    getX((ATProvider x) => x.getATLocalData());
    final List<ATModel> reportsForArgsfrom_Acbmodel =
        watchOnly((ATProvider x) => x.atlocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((AT_R_Provider x) => x.getATrEquipmentList());
    final List<AT_R_Model> reportsFormATwrLvLocalData =
        watchOnly((AT_R_Provider x) => x.at_R_loacaldataList);

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
                for (var i in reportsFormATwrLvLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_Acbmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                var url =
                                    Uri.parse('${Env.URL_PREFIX}/atRTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'hv_1u_1v': i.hv_1u_1v.toString(),
                                  'hv_1v_1w': i.hv_1v_1w.toString(),
                                  'hv_1w_1u': i.hv_1w_1u.toString(),
                                  'hv_1u_1n': i.hv_1u_1n.toString(),
                                  'hv_1v_1n': i.hv_1v_1n.toString(),
                                  'hv_1w_1n': i.hv_1w_1n.toString(),
                                  'lv_2u_2v': i.lv_2u_2v.toString(),
                                  'lv_2v_2w': i.lv_2v_2w.toString(),
                                  'lv_2w_2u': i.lv_2w_2u.toString(),
                                  'lv_2u_2n': i.lv_2u_2n.toString(),
                                  'lv_2v_2n': i.lv_2v_2n.toString(),
                                  'lv_2w_2n': i.lv_2w_2n.toString(),
                                  'tapPosition': i.tapPosition.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<AT_R_Provider>().updateATr(
                                      AT_R_Model(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        hv_1u_1v: i.hv_1u_1v,
                                        hv_1v_1w: i.hv_1v_1w,
                                        hv_1w_1u: i.hv_1w_1u,
                                        hv_1u_1n: i.hv_1u_1n,
                                        hv_1v_1n: i.hv_1v_1n,
                                        hv_1w_1n: i.hv_1w_1n,
                                        lv_2u_2v: i.lv_2u_2v,
                                        lv_2v_2w: i.lv_2v_2w,
                                        lv_2w_2u: i.lv_2w_2u,
                                        lv_2u_2n: i.lv_2u_2n,
                                        lv_2v_2n: i.lv_2v_2n,
                                        lv_2w_2n: i.lv_2w_2n,
                                        equipmentUsed: i.equipmentUsed,
                                        tapPosition: i.tapPosition,
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

                Navigator.pushNamed(context, '/detail_AT_R', arguments: {
                  'id': report.id,
                  'AT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo,
                  'atDatabaseID': args['atDatabaseID'],
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_AT_R', arguments: {
                  'id': report.id,
                  'AT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo,
                  'atDatabaseID': args['atDatabaseID'],
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
                              ntr.etype == 'at'
                                  ? Text(
                                      ' AT_R Details ',
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
                              ntr.etype == 'at'
                                  ? Text(
                                      ' AT_R Details ',
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

  generate_list_of_AT_mc(ATModel ntr) {
    getX((AT_mc_Provider x) => x.getAT_mcserialNo(ntr.serialNo));
    final List<AT_mc_Model> reports =
        watchOnly((AT_mc_Provider x) => x.at_mc_serialNoList);

    getX((ATProvider x) => x.getATLocalData());
    final List<ATModel> reportsForArgsfrom_Acbmodel =
        watchOnly((ATProvider x) => x.atlocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((AT_mc_Provider x) => x.getATmcEquipmentList());
    final List<AT_mc_Model> reportsFormATmcLocalData =
        watchOnly((AT_mc_Provider x) => x.at_mc_loacaldataList);

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
                for (var i in reportsFormATmcLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_Acbmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                var url =
                                    Uri.parse('${Env.URL_PREFIX}/atMcTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'hv_1u_1n': i.hv_1u_1n.toString(),
                                  'hv_1v_1n': i.hv_1v_1n.toString(),
                                  'hv_1w_1n': i.hv_1w_1n.toString(),
                                  'hv_1u': i.hv_1u.toString(),
                                  'hv_1v': i.hv_1v.toString(),
                                  'hv_1w': i.hv_1w.toString(),
                                  'hv_1n': i.hv_1n.toString(),
                                  'tapPosition': i.tapPosition.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<AT_mc_Provider>().updateAT_mc(
                                      AT_mc_Model(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        hv_1u_1n: i.hv_1u_1n,
                                        hv_1v_1n: i.hv_1v_1n,
                                        hv_1w_1n: i.hv_1w_1n,
                                        hv_1u: i.hv_1u,
                                        hv_1v: i.hv_1v,
                                        hv_1w: i.hv_1w,
                                        hv_1n: i.hv_1n,
                                        equipmentUsed: i.equipmentUsed,
                                        tapPosition: i.tapPosition,
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

                Navigator.pushNamed(context, '/detail_AT_mc', arguments: {
                  'id': report.id,
                  'AT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo,
                  'atDatabaseID': args['atDatabaseID'],
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_AT_mc', arguments: {
                  'id': report.id,
                  'AT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo,
                  'atDatabaseID': args['atDatabaseID'],
                  'trDatabaseID': args['trDatabaseID'],
                });
              }
              // ----------------------------------------------
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
                              ntr.etype == 'at'
                                  ? const Text(
                                      ' AT_mc Details ',
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
                              ntr.etype == 'at'
                                  ? const Text(
                                      ' AT_mc Details ',
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

  generate_list_of_AT_mb(ATModel ntr) {
    getX((AT_mb_Provider x) => x.getAT_mbserialNo(ntr.serialNo));
    final List<AT_mb_Model> reports =
        watchOnly((AT_mb_Provider x) => x.at_mb_serialNoList);

    getX((ATProvider x) => x.getATLocalData());
    final List<ATModel> reportsForArgsfrom_Acbmodel =
        watchOnly((ATProvider x) => x.atlocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((AT_mb_Provider x) => x.getATmbEquipmentList());
    final List<AT_mb_Model> reportsFormATmbLocalData =
        watchOnly((AT_mb_Provider x) => x.at_mb_loacaldataList);

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
                for (var i in reportsFormATmbLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_Acbmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                var url =
                                    Uri.parse('${Env.URL_PREFIX}/atMbTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'ry_hv_1u_1v': i.ry_hv_1u_1v.toString(),
                                  'ry_hv_1v_1w': i.ry_hv_1v_1w.toString(),
                                  'ry_hv_1w_1u': i.ry_hv_1w_1u.toString(),
                                  'ry_hv_1u_1n': i.ry_hv_1u_1n.toString(),
                                  'ry_hv_1v_1n': i.ry_hv_1v_1n.toString(),
                                  'ry_hv_1w_1n': i.ry_hv_1w_1n.toString(),
                                  'ry_lv_2u_2v': i.ry_lv_2u_2v.toString(),
                                  'ry_lv_2v_2w': i.ry_lv_2v_2w.toString(),
                                  'ry_lv_2w_2u': i.ry_lv_2w_2u.toString(),
                                  'ry_lv_2u_2n': i.ry_lv_2u_2n.toString(),
                                  'ry_lv_2v_2n': i.ry_lv_2v_2n.toString(),
                                  'ry_lv_2w_2n': i.ry_lv_2w_2n.toString(),
                                  'yb_hv_1u_1v': i.yb_hv_1u_1v.toString(),
                                  'yb_hv_1v_1w': i.yb_hv_1v_1w.toString(),
                                  'yb_hv_1w_1u': i.yb_hv_1w_1u.toString(),
                                  'yb_hv_1u_1n': i.yb_hv_1u_1n.toString(),
                                  'yb_hv_1v_1n': i.yb_hv_1v_1n.toString(),
                                  'yb_hv_1w_1n': i.yb_hv_1w_1n.toString(),
                                  'yb_lv_2u_2v': i.yb_lv_2u_2v.toString(),
                                  'yb_lv_2v_2w': i.yb_lv_2v_2w.toString(),
                                  'yb_lv_2w_2u': i.yb_lv_2w_2u.toString(),
                                  'yb_lv_2u_2n': i.yb_lv_2u_2n.toString(),
                                  'yb_lv_2v_2n': i.yb_lv_2v_2n.toString(),
                                  'yb_lv_2w_2n': i.yb_lv_2w_2n.toString(),
                                  'br_hv_1u_1v': i.br_hv_1u_1v.toString(),
                                  'br_hv_1v_1w': i.br_hv_1v_1w.toString(),
                                  'br_hv_1w_1u': i.br_hv_1w_1u.toString(),
                                  'br_hv_1u_1n': i.br_hv_1u_1n.toString(),
                                  'br_hv_1v_1n': i.br_hv_1v_1n.toString(),
                                  'br_hv_1w_1n': i.br_hv_1w_1n.toString(),
                                  'br_lv_2u_2v': i.br_lv_2u_2v.toString(),
                                  'br_lv_2v_2w': i.br_lv_2v_2w.toString(),
                                  'br_lv_2w_2u': i.br_lv_2w_2u.toString(),
                                  'br_lv_2u_2n': i.br_lv_2u_2n.toString(),
                                  'br_lv_2v_2n': i.br_lv_2v_2n.toString(),
                                  'br_lv_2w_2n': i.br_lv_2w_2n.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<AT_mb_Provider>().updateATmb(
                                      AT_mb_Model(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        ry_hv_1u_1v: i.ry_hv_1u_1v,
                                        ry_hv_1v_1w: i.ry_hv_1v_1w,
                                        ry_hv_1w_1u: i.ry_hv_1w_1u,
                                        ry_hv_1u_1n: i.ry_hv_1u_1n,
                                        ry_hv_1v_1n: i.ry_hv_1v_1n,
                                        ry_hv_1w_1n: i.ry_hv_1w_1n,
                                        ry_lv_2u_2v: i.ry_lv_2u_2v,
                                        ry_lv_2v_2w: i.ry_lv_2v_2w,
                                        ry_lv_2w_2u: i.ry_lv_2w_2u,
                                        ry_lv_2u_2n: i.ry_lv_2u_2n,
                                        ry_lv_2v_2n: i.ry_lv_2v_2n,
                                        ry_lv_2w_2n: i.ry_lv_2w_2n,
                                        yb_hv_1u_1v: i.yb_hv_1u_1v,
                                        yb_hv_1v_1w: i.yb_hv_1v_1w,
                                        yb_hv_1w_1u: i.yb_hv_1w_1u,
                                        yb_hv_1u_1n: i.yb_hv_1u_1n,
                                        yb_hv_1v_1n: i.yb_hv_1v_1n,
                                        yb_hv_1w_1n: i.yb_hv_1w_1n,
                                        yb_lv_2u_2v: i.yb_lv_2u_2v,
                                        yb_lv_2v_2w: i.yb_lv_2v_2w,
                                        yb_lv_2w_2u: i.yb_lv_2w_2u,
                                        yb_lv_2u_2n: i.yb_lv_2u_2n,
                                        yb_lv_2v_2n: i.yb_lv_2v_2n,
                                        yb_lv_2w_2n: i.yb_lv_2w_2n,
                                        br_hv_1u_1v: i.br_hv_1u_1v,
                                        br_hv_1v_1w: i.br_hv_1v_1w,
                                        br_hv_1w_1u: i.br_hv_1w_1u,
                                        br_hv_1u_1n: i.br_hv_1u_1n,
                                        br_hv_1v_1n: i.br_hv_1v_1n,
                                        br_hv_1w_1n: i.br_hv_1w_1n,
                                        br_lv_2u_2v: i.br_lv_2u_2v,
                                        br_lv_2v_2w: i.br_lv_2v_2w,
                                        br_lv_2w_2u: i.br_lv_2w_2u,
                                        br_lv_2u_2n: i.br_lv_2u_2n,
                                        br_lv_2v_2n: i.br_lv_2v_2n,
                                        br_lv_2w_2n: i.br_lv_2w_2n,
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

                Navigator.pushNamed(context, '/detail_AT_mb', arguments: {
                  'id': report.id,
                  'AT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo,
                  'atDatabaseID': args['atDatabaseID'],
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_AT_mb', arguments: {
                  'id': report.id,
                  'AT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo,
                  'atDatabaseID': args['atDatabaseID'],
                  'trDatabaseID': args['trDatabaseID'],
                });
              }
              // ----------------------------------------------
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
                              ntr.etype == 'at'
                                  ? const Text(
                                      ' AT_mb Details ',
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
                              ntr.etype == 'at'
                                  ? const Text(
                                      ' AT_mb Details ',
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
}
