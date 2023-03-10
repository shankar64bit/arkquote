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
import '../../../data/models/equipment/PT/pt_model.dart';
import '../../../data/models/equipment/powt/powt_bNamePlate_model.dart';
import '../../../data/models/equipment/powt/powt_ir_model.dart';
import '../../../data/models/equipment/powt/powt_mb_model.dart';
import '../../../data/models/equipment/powt/powt_mc_model.dart';
import '../../../data/models/equipment/powt/powt_model.dart';
import '../../../data/models/equipment/powt/powt_r_model.dart';
import '../../../data/models/equipment/powt/powt_sc_model.dart';
import '../../../data/models/equipment/powt/powt_td_model.dart';
import '../../../data/models/equipment/powt/powt_tsc_model.dart';
import '../../../data/models/equipment/powt/powt_wrHv_model.dart';
import '../../../data/models/equipment/powt/powt_wrLv_model.dart';
import '../../../data/models/test_report_model.dart';
import '../../providers/equipment_acb_provider/test_report_provider.dart';
import '../../providers/powt_provider/powt_bNamePlate_provider.dart';
import '../../providers/powt_provider/powt_ir_provider.dart';
import '../../providers/powt_provider/powt_mb_provider.dart';
import '../../providers/powt_provider/powt_mc_provider.dart';
import '../../providers/powt_provider/powt_provider.dart';
import '../../providers/powt_provider/powt_r_provider.dart';
import '../../providers/powt_provider/powt_sc_provider.dart';
import '../../providers/powt_provider/powt_td_provider.dart';
import '../../providers/powt_provider/powt_tsc_provider.dart';
import '../../providers/powt_provider/powt_wrHv_provider.dart';
import '../../providers/powt_provider/powt_wrLv_provider.dart';
import '../dropdown_All/responsive_tool/google_sign_in_out/InternetConnChecker.dart';
import '../equipment_acb/detail_test_report_page.dart';

class Detail_Powt_Page extends StatelessWidget with GetItMixin {
  Map args = {};
  PTModel ntr;
  int trDbId;
  Detail_Powt_Page(@required this.args, {Key key}) : super(key: key);
  var datetime;

  @override
  Widget build(BuildContext context) {
    getX((PowtProvider x) => x.getPowtByID(args['id']));
    final PowtModel ntr = watchOnly((PowtProvider x) => x.powtModel);

    var mob = const Text('Powt  Details', style: TextStyle(fontSize: 15));
    var desk = const Text('Powt  Details', style: TextStyle(fontSize: 20));
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
                  Navigator.popAndPushNamed(context, '/edit_POWT', arguments: {
                    'id': ntr.id,
                    'trDatabaseID': args['trDatabaseID']
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
                          child: display_Powt_details(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_Powt_IR(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_Powttsc(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_PowtwrHv(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_PowtwrLv(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_Powt_R(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_Powt_mc(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_Powt_mb(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_Powt_sc(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_Powttd(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_Powt_bNamePlate(ntr)),
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
                          child: display_Powt_details(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_Powt_IR(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_Powttsc(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_PowtwrHv(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_PowtwrLv(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_Powt_R(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_Powt_mc(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_Powt_mb(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_Powt_sc(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_Powttd(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_Powt_bNamePlate(ntr)),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),

      // if (limitAllow == ntr.noOfCores) {
      //   Text('Cores limit reached');
      //   print('limit Reached');
      //   Navigator.pop(context);
      // } else {
      //   limitAllow++;
      //   // EquipmentTypeList().getEquipUsetoDefaultValue();
      //   Navigator.popAndPushNamed(context, '/add_CT_Cores',
      //       arguments: {
      //         'ctDatabaseID': ntr.databaseID,
      //         'trDatabaseID': args['trDatabaseID'],
      //       });
      // }
      // floatingActionButton: Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     FloatingActionButton.extended(
      //         heroTag: 'addCTCores',
      //         onPressed: () {
      //           Navigator.popAndPushNamed(context, '/add_CT_Cores', arguments: {
      //             'TrNo': ntr.trNo,
      //             'ctId': ntr.id,
      //             'Serial_No': ntr.serialNo_Bph,
      //             'ctDatabaseID': ntr.databaseID,
      //             'trDatabaseID': args['trDatabaseID'],
      //           });
      //         },
      //         label: Text('Add Cores',
      //             style: TextStyle(fontSize: 10, color: Colors.white)),
      //         icon: const Icon(Icons.add, color: Colors.white))
      //   ],
      // ),

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
                        heroTag: 'addPowtcoreIR',
                        onPressed: () {
                          Navigator.popAndPushNamed(context, '/add_PowtcoreIR',
                              arguments: {
                                'TrNo': ntr.trNo,
                                'POWT_ID': ntr.id,
                                'serial_no_bph': ntr.serialNo,
                                'powtDatabaseID': ntr.databaseID,
                                'trDatabaseID': args['trDatabaseID'],
                              });
                        },
                        label: const Text('Insulation Resistance Test',
                            style:
                                TextStyle(fontSize: 10, color: Colors.white)),
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton.extended(
                        heroTag: 'addPowtTSC',
                        onPressed: () {
                          Navigator.popAndPushNamed(context, '/add_Powttsc',
                              arguments: {
                                'TrNo': ntr.trNo,
                                'POWT_ID': ntr.id,
                                'serial_no_bph': ntr.serialNo,
                                'powtDatabaseID': ntr.databaseID,
                                'trDatabaseID': args['trDatabaseID'],
                              });
                        },
                        label: const Text('Tap Selector Connection',
                            style:
                                TextStyle(fontSize: 10, color: Colors.white)),
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                    PopupMenuButton(
                        child: FloatingActionButton.extended(
                          label: Text(
                            'Winding Resistance Test',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          icon: const Icon(Icons.add, color: Colors.white),
                        ),
                        itemBuilder: (context) {
                          return List.generate(1, (index) {
                            return PopupMenuItem(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FloatingActionButton.extended(
                                      heroTag: 'addPowtwrHv',
                                      onPressed: () {
                                        Navigator.popAndPushNamed(
                                            context, '/add_PowtwrHv',
                                            arguments: {
                                              'TrNo': ntr.trNo,
                                              'POWT_ID': ntr.id,
                                              'serial_no_bph': ntr.serialNo,
                                              'powtDatabaseID': ntr.databaseID,
                                              'trDatabaseID':
                                                  args['trDatabaseID'],
                                            });
                                      },
                                      label: const Text('HV Winding',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      icon: const Icon(Icons.add,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: FloatingActionButton.extended(
                                      heroTag: 'addPowtwrLv',
                                      onPressed: () {
                                        Navigator.popAndPushNamed(
                                            context, '/add_PowtwrLv',
                                            arguments: {
                                              'TrNo': ntr.trNo,
                                              'POWT_ID': ntr.id,
                                              'serial_no_bph': ntr.serialNo,
                                              'powtDatabaseID': ntr.databaseID,
                                              'trDatabaseID':
                                                  args['trDatabaseID'],
                                            });
                                      },
                                      label: const Text('LV Winding',
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white)),
                                      icon: const Icon(Icons.add,
                                          color: Colors.white),
                                    ),
                                  ),
                                ]));
                          });
                        }),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton.extended(
                        heroTag: 'addPowt_R',
                        onPressed: () {
                          Navigator.popAndPushNamed(context, '/add_Powt_R',
                              arguments: {
                                'TrNo': ntr.trNo,
                                'POWT_ID': ntr.id,
                                'serial_no_bph': ntr.serialNo,
                                'powtDatabaseID': ntr.databaseID,
                                'trDatabaseID': args['trDatabaseID'],
                              });
                        },
                        label: const Text('Ratio Test',
                            style:
                                TextStyle(fontSize: 10, color: Colors.white)),
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton.extended(
                        heroTag: 'addPowt_mc',
                        onPressed: () {
                          Navigator.popAndPushNamed(context, '/add_Powt_mc',
                              arguments: {
                                'TrNo': ntr.trNo,
                                'POWT_ID': ntr.id,
                                'serial_no_bph': ntr.serialNo,
                                'powtDatabaseID': ntr.databaseID,
                                'trDatabaseID': args['trDatabaseID'],
                              });
                        },
                        label: const Text('Magnetizing Current Test',
                            style:
                                TextStyle(fontSize: 10, color: Colors.white)),
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton.extended(
                        heroTag: 'addPowt_mb',
                        onPressed: () {
                          Navigator.popAndPushNamed(context, '/add_Powt_mb',
                              arguments: {
                                'TrNo': ntr.trNo,
                                'POWT_ID': ntr.id,
                                'serial_no_bph': ntr.serialNo,
                                'powtDatabaseID': ntr.databaseID,
                                'trDatabaseID': args['trDatabaseID'],
                              });
                        },
                        label: const Text('Magnetic Balance Test',
                            style:
                                TextStyle(fontSize: 10, color: Colors.white)),
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton.extended(
                        heroTag: 'addPowtsc',
                        onPressed: () {
                          Navigator.popAndPushNamed(context, '/add_Powtsc',
                              arguments: {
                                'TrNo': ntr.trNo,
                                'POWT_ID': ntr.id,
                                'serial_no_bph': ntr.serialNo,
                                'powtDatabaseID': ntr.databaseID,
                                'trDatabaseID': args['trDatabaseID'],
                              });
                        },
                        label: const Text('Short Circuit Test',
                            style:
                                TextStyle(fontSize: 10, color: Colors.white)),
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton.extended(
                        heroTag: 'addPowttd',
                        onPressed: () {
                          Navigator.popAndPushNamed(context, '/add_Powttd',
                              arguments: {
                                'TrNo': ntr.trNo,
                                'POWT_ID': ntr.id,
                                'serial_no_bph': ntr.serialNo,
                                'powtDatabaseID': ntr.databaseID,
                                'trDatabaseID': args['trDatabaseID'],
                              });
                        },
                        label: const Text('Tan delta Testing',
                            style:
                                TextStyle(fontSize: 10, color: Colors.white)),
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FloatingActionButton.extended(
                        heroTag: 'addPowtbNamePlate',
                        onPressed: () {
                          Navigator.popAndPushNamed(
                              context, '/add_PowtbNameplate',
                              arguments: {
                                'TrNo': ntr.trNo,
                                'POWT_ID': ntr.id,
                                'serial_no_bph': ntr.serialNo,
                                'powtDatabaseID': ntr.databaseID,
                                'trDatabaseID': args['trDatabaseID'],
                              });
                        },
                        label: const Text('Bushings Name Plate',
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
      getX((PowtProvider x) => x.deletePowt(args['id']));
      Navigator.pop(context);
    });
  }

  ReadMoreDisplay_PT_details(PowtModel ntr) {
    var gotdate = DateFormat('dd-MM-yyyy').format(ntr.dateOfTesting).toString();

    return 'DBID : ' +
        ntr.databaseID.toString() +
        '\n' +
        'etype : ' +
        ntr.etype +
        '\n' +
        'trNo : ' +
        ntr.trNo.toString() +
        '\n' +
        'Designation : ' +
        ntr.designation +
        '\n' +
        'Location : ' +
        ntr.location +
        '\n' +
        'Serial No : ' +
        ntr.serialNo +
        '\n' +
        'Rating : ' +
        ntr.rating +
        '\n' +
        'Rated Voltage-HV : ' +
        ntr.ratedVoltage_HV.toString() +
        '\n' +
        'Rated Voltage-LV : ' +
        ntr.ratedVoltage_LV.toString() +
        '\n' +
        'Rated Current-HV : ' +
        ntr.ratedCurrent_HV +
        '\n' +
        'Rated Current-LV : ' +
        ntr.ratedCurrent_LV +
        '\n' +
        'Vector Group : ' +
        ntr.vectorGroup +
        '\n' +
        'Impedance Voltage L-Tap : ' +
        ntr.impedanceVoltageLTap.toString() +
        '\n' +
        'Impedance Voltage Rated-Tap : ' +
        ntr.impedanceVoltageRTap.toString() +
        '\n' +
        'Impedance Voltage H-Tap : ' +
        ntr.impedanceVoltageHTap.toString() +
        '\n' +
        'Frequency : ' +
        ntr.frequency.toString() +
        '\n' +
        'Type Of Cooling : ' +
        ntr.typeOfCooling +
        '\n' +
        'No Of Phases : ' +
        ntr.noOfPhases.toString() +
        '\n' +
        'Make : ' +
        ntr.make +
        '\n' +
        'Year of Manufacturing : ' +
        ntr.yom.toString() +
        '\n' +
        'No Of Taps : ' +
        ntr.noOfTaps.toString() +
        '\n' +
        'No Of Nominal Taps : ' +
        ntr.onOfNominalTaps.toString() +
        '\n' +
        'Oil Tempreture : ' +
        ntr.oilTemp.toString() +
        '\n' +
        'Winding Tempreture : ' +
        ntr.windingTemp.toString() +
        '\n' +
        'Ambient Tempreture : ' +
        ntr.ambientTemp.toString() +
        '\n' +
        'Date Of Testing : ' +
        gotdate +
        '\n' +
        'Tested By : ' +
        ntr.testedBy +
        '\n' +
        'Verified By : ' +
        ntr.verifiedBy +
        '\n' +
        'Witnessed By : ' +
        ntr.WitnessedBy +
        '\n';
  }

  // ReadMoreDisplay_CT_details2(CTModel ntr) {
  //   return TextSelection();
  // }

  display_Powt_details(PowtModel ntr) {
    return Container(
      alignment: Alignment.center,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(80, 10, 80, 10),
          child: ReadMoreText(
            ReadMoreDisplay_PT_details(ntr),
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
                      getX((PowtProvider x) => x.deletePowt(args['id']));
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

  // generate_list_of_Powt_core(PowtModel ntr) {
  //   getX((PowtcoreIRProvider x) => x.getPowtcoreIRBySerialNo(ntr.serialNo));
  //   final List<PowtcoreIRModel> reports =
  //       watchOnly((PowtcoreIRProvider x) => x.powtcoreIR_serialNoList);
  //   return Container(
  //     margin: EdgeInsets.fromLTRB(10, 20, 20, 0),
  //     child: ListView.builder(
  //       scrollDirection: Axis.horizontal,
  //       itemCount: reports.length,
  //       itemBuilder: (context, index) {
  //         final report = reports[index];
  //         return GestureDetector(
  //           onTap: () {
  //             Navigator.pushNamed(context, '/detail_POWT_ir', arguments: {
  //               'id': report.id,
  //               'POWT_ID': report.databaseID,
  //               'serial_no_bph': ntr.serialNo,
  //               'powtDatabaseID': args['powtDatabaseID'],
  //               'trDatabaseID': args['trDatabaseID'],
  //             });
  //           },
  //           child: Card(
  //             color: Colors.white,
  //             elevation: 2,
  //             //margin: EdgeInsets.fromLTRB(20, 10, 0, 70),
  //             child: Padding(
  //               padding: const EdgeInsets.fromLTRB(10, 10, 40, 5),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   ntr.etype == 'powt'
  //                       ? const Text(
  //                           'Powtcore Details ',
  //                           style: TextStyle(
  //                               color: Colors.black,
  //                               fontWeight: FontWeight.bold,
  //                               fontSize: 11.5,
  //                               letterSpacing: 1.5),
  //                         )
  //                       : Container(),
  //                   Text('serialNo : ' + report.serialNo,
  //                       style:
  //                           const TextStyle(color: Colors.black, fontSize: 13)),
  //                   Text('equipment : ' + report.equipmentUsed,
  //                       style:
  //                           const TextStyle(color: Colors.black, fontSize: 13)),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  generate_list_of_Powt_IR(PowtModel ntr) {
    getX((PowtcoreIRProvider x) => x.getPowtcoreIRBySerialNo(ntr.serialNo));
    final List<PowtcoreIRModel> reports =
        watchOnly((PowtcoreIRProvider x) => x.powtcoreIR_serialNoList);

    getX((PowtProvider x) => x.getPowtLocalData());
    final List<PowtModel> reportsForArgsfrom_Powtmodel =
        watchOnly((PowtProvider x) => x.powtlocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((PowtcoreIRProvider x) => x.getPowtIREquipmentList());
    final List<PowtcoreIRModel> reportsFormPowtIRLocalData =
        watchOnly((PowtcoreIRProvider x) => x.powtcoreIR_localdataList);

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
                for (var i in reportsFormPowtIRLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_Powtmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                // add to remote database
                                var url =
                                    Uri.parse('${Env.URL_PREFIX}/powtIrTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                  'hvE_60': i.hvE_60.toString(),
                                  'hvE_600': i.hvE_600.toString(),
                                  'hvLV_60': i.hvLV_60.toString(),
                                  'hvLV_600': i.hvLV_600.toString(),
                                  'lvE_60': i.lvE_60.toString(),
                                  'lvE_600': i.lvE_600.toString(),
                                  'cE_60': i.cE_60.toString(),
                                  'cT_60': i.cT_60.toString(),
                                  'tE_60': i.tE_60.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<PowtcoreIRProvider>().updatePowtcoreIR(
                                      PowtcoreIRModel(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        hvE_60: i.hvE_60,
                                        hvE_600: i.hvE_600,
                                        hvLV_60: i.hvLV_60,
                                        hvLV_600: i.hvLV_600,
                                        lvE_60: i.lvE_60,
                                        lvE_600: i.lvE_600,
                                        cE_60: i.cE_60,
                                        cT_60: i.cT_60,
                                        tE_60: i.tE_60,
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
                // ----------------------------------------------------------
                Navigator.pushNamed(context, '/detail_PowtcoreIR', arguments: {
                  'id': report.id,
                  'POWT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo,
                  'powtDatabaseID': args['powtDatabaseID'],
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_PowtcoreIR', arguments: {
                  'id': report.id,
                  'POWT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo,
                  'powtDatabaseID': args['powtDatabaseID'],
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
                              ntr.etype == 'powt'
                                  ? const Text(
                                      'PowtcoreIR Details ',
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
                              ntr.etype == 'powt'
                                  ? const Text(
                                      'PowtcoreIR Details ',
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
                    Text('Serial No : ' + report.serialNo,
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

  generate_list_of_Powttsc(PowtModel ntr) {
    getX((PowttscProvider x) => x.getPowttscserialNo(ntr.serialNo));
    final List<PowttscModel> reports =
        watchOnly((PowttscProvider x) => x.powttsc_serialNoList);

    getX((PowtProvider x) => x.getPowtLocalData());
    final List<PowtModel> reportsForArgsfrom_Powtmodel =
        watchOnly((PowtProvider x) => x.powtlocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((PowttscProvider x) => x.getPowttscEquipmentList());
    final List<PowttscModel> reportsFormPowttscLocalData =
        watchOnly((PowttscProvider x) => x.powttsc_loacaldataList);

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
                for (var i in reportsFormPowttscLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_Powtmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                var url =
                                    Uri.parse('${Env.URL_PREFIX}/powtTscTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'hv_voltage': i.hv_voltage.toString(),
                                  'hv_current': i.hv_current.toString(),
                                  'tapPosition': i.tapPosition.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<PowttscProvider>().updatePowttsc(
                                      PowttscModel(
                                          id: i.id,
                                          trNo: i.trNo,
                                          serialNo: i.serialNo,
                                          hv_voltage: i.hv_voltage,
                                          hv_current: i.hv_current,
                                          equipmentUsed: i.equipmentUsed,
                                          tapPosition: i.tapPosition,
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
                // ------------------------------------------------------
                Navigator.pushNamed(context, '/detail_Powttsc', arguments: {
                  'id': report.id,
                  'POWT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo,
                  'powtDatabaseID': args['powtDatabaseID'],
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_Powttsc', arguments: {
                  'id': report.id,
                  'POWT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo,
                  'powtDatabaseID': args['powtDatabaseID'],
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
                              ntr.etype == 'powt'
                                  ? Text(
                                      'Powttsc Details ',
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
                              ntr.etype == 'powt'
                                  ? Text(
                                      'Powttsc Details ',
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
                    Text('Serial No : ' + report.serialNo,
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

  generate_list_of_PowtwrHv(PowtModel ntr) {
    getX((PowtwrHvProvider x) => x.getPowtwrHvserialNo(ntr.serialNo));
    final List<PowtwrHvModel> reports =
        watchOnly((PowtwrHvProvider x) => x.powtwrHv_serialNoList);

    getX((PowtProvider x) => x.getPowtLocalData());
    final List<PowtModel> reportsForArgsfrom_Powtmodel =
        watchOnly((PowtProvider x) => x.powtlocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((PowtwrHvProvider x) => x.getPowtwrHvEquipmentList());
    final List<PowtwrHvModel> reportsFormPowtwrhvLocalData =
        watchOnly((PowtwrHvProvider x) => x.powtwrHv_loacaldataList);

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
                for (var i in reportsFormPowtwrhvLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_Powtmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                // add to remote databse
                                var url = Uri.parse(
                                    '${Env.URL_PREFIX}/powtWrHvTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'hv_r_1u_1vn': i.hv_r_1u_1vn.toString(),
                                  'hv_r_1v_1wn': i.hv_r_1v_1wn.toString(),
                                  'hv_r_1w_1un': i.hv_r_1w_1un.toString(),
                                  'tapPosition': i.tapPosition.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<PowtwrHvProvider>().updatePowtwrHv(
                                      PowtwrHvModel(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        hv_r_1u_1vn: i.hv_r_1u_1vn,
                                        hv_r_1v_1wn: i.hv_r_1v_1wn,
                                        hv_r_1w_1un: i.hv_r_1w_1un,
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
                // ------------------------------------------------
                Navigator.pushNamed(context, '/detail_PowtwrHv', arguments: {
                  'id': report.id,
                  'POWT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo,
                  'powtDatabaseID': args['powtDatabaseID'],
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_PowtwrHv', arguments: {
                  'id': report.id,
                  'POWT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo,
                  'powtDatabaseID': args['powtDatabaseID'],
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
                              ntr.etype == 'powt'
                                  ? const Text(
                                      'PowtwrHv Details ',
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
                              ntr.etype == 'powt'
                                  ? const Text(
                                      'PowtwrHv Details ',
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
                    Text('Serial No : ' + report.serialNo,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('Tap  Position : ' + report.tapPosition.toString(),
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

  generate_list_of_PowtwrLv(PowtModel ntr) {
    getX((PowtwrLvProvider x) => x.getPowtwrLvserialNo(ntr.serialNo));
    final List<PowtwrLvModel> reports =
        watchOnly((PowtwrLvProvider x) => x.powtwrLv_serialNoList);

    getX((PowtProvider x) => x.getPowtLocalData());
    final List<PowtModel> reportsForArgsfrom_Powtmodel =
        watchOnly((PowtProvider x) => x.powtlocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((PowtwrLvProvider x) => x.getPowtwrlvEquipmentList());
    final List<PowtwrLvModel> reportsFormPowtwrlvLocalData =
        watchOnly((PowtwrLvProvider x) => x.powtwrLv_loacaldataList);

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
                for (var i in reportsFormPowtwrlvLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_Powtmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                var url = Uri.parse(
                                    '${Env.URL_PREFIX}/powtWrLvTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'lv_r_2u_2vn': i.lv_r_2u_2vn.toString(),
                                  'lv_r_2v_2wn': i.lv_r_2v_2wn.toString(),
                                  'lv_r_2w_2un': i.lv_r_2w_2un.toString(),
                                  'tapPosition': i.tapPosition.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<PowtwrLvProvider>().updatePowtwrLv(
                                      PowtwrLvModel(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        lv_r_2u_2vn: i.lv_r_2u_2vn,
                                        lv_r_2v_2wn: i.lv_r_2v_2wn,
                                        lv_r_2w_2un: i.lv_r_2w_2un,
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
                // -------------------------------------------------------
                Navigator.pushNamed(context, '/detail_PowtwrLv', arguments: {
                  'id': report.id,
                  'POWT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo,
                  'powtDatabaseID': args['powtDatabaseID'],
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_PowtwrLv', arguments: {
                  'id': report.id,
                  'POWT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo,
                  'powtDatabaseID': args['powtDatabaseID'],
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
                              ntr.etype == 'powt'
                                  ? const Text(
                                      'PowtwrLv Details ',
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
                              ntr.etype == 'powt'
                                  ? const Text(
                                      'PowtwrLv Details ',
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
                    Text('Serial No : ' + report.serialNo,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('Tap Position : ' + report.tapPosition.toString(),
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

  generate_list_of_Powt_R(PowtModel ntr) {
    getX((Powt_R_Provider x) => x.getPowtrserialNo(ntr.serialNo));
    final List<Powt_R_Model> reports =
        watchOnly((Powt_R_Provider x) => x.powt_R_serialNoList);

    getX((PowtProvider x) => x.getPowtLocalData());
    final List<PowtModel> reportsForArgsfrom_Powtmodel =
        watchOnly((PowtProvider x) => x.powtlocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((Powt_R_Provider x) => x.getPowtREquipmentList());
    final List<Powt_R_Model> reportsFormPowtRLocalData =
        watchOnly((Powt_R_Provider x) => x.powt_R_loacaldataList);

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
                for (var i in reportsFormPowtRLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_Powtmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                var url =
                                    Uri.parse('${Env.URL_PREFIX}/powtRTest/');
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
                                  sl<Powt_R_Provider>().updatePowtr(
                                      Powt_R_Model(
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
                // ------------------------------------------
                Navigator.pushNamed(context, '/detail_Powt_R', arguments: {
                  'id': report.id,
                  'POWT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo,
                  'powtDatabaseID': args['powtDatabaseID'],
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_Powt_R', arguments: {
                  'id': report.id,
                  'POWT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo,
                  'powtDatabaseID': args['powtDatabaseID'],
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
                              ntr.etype == 'powt'
                                  ? const Text(
                                      'Powt_R Details ',
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
                              ntr.etype == 'powt'
                                  ? const Text(
                                      'Powt_R Details ',
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
                    Text('serial No : ' + report.serialNo,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('Tap Position : ' + report.tapPosition.toString(),
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

  generate_list_of_Powt_mc(PowtModel ntr) {
    getX((Powt_mc_Provider x) => x.getPowt_mcserialNo(ntr.serialNo));
    final List<Powt_mc_Model> reports =
        watchOnly((Powt_mc_Provider x) => x.powt_mc_serialNoList);

    getX((PowtProvider x) => x.getPowtLocalData());
    final List<PowtModel> reportsForArgsfrom_Powtmodel =
        watchOnly((PowtProvider x) => x.powtlocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((Powt_mc_Provider x) => x.getPowt_mcEquipmentList());
    final List<Powt_mc_Model> reportsFormPowtmcLocalData =
        watchOnly((Powt_mc_Provider x) => x.powt_mc_loacaldataList);

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
                for (var i in reportsFormPowtmcLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_Powtmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                var url =
                                    Uri.parse('${Env.URL_PREFIX}/powtMcTest/');
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
                                  sl<Powt_mc_Provider>().updatePowt_mc(
                                      Powt_mc_Model(
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

                // ------------------------------------------------------
                Navigator.pushNamed(context, '/detail_Powt_mc', arguments: {
                  'id': report.id,
                  'POWT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo,
                  'powtDatabaseID': args['powtDatabaseID'],
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_Powt_mc', arguments: {
                  'id': report.id,
                  'POWT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo,
                  'powtDatabaseID': args['powtDatabaseID'],
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
                              ntr.etype == 'powt'
                                  ? const Text(
                                      'Powt_mc Details ',
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
                              ntr.etype == 'powt'
                                  ? const Text(
                                      'Powt_mc Details ',
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
                    Text('Serial No : ' + report.serialNo,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('Tap Position : ' + report.tapPosition.toString(),
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

  generate_list_of_Powt_mb(PowtModel ntr) {
    getX((Powt_mb_Provider x) => x.getPowt_mbserialNo(ntr.serialNo));
    final List<Powt_mb_Model> reports =
        watchOnly((Powt_mb_Provider x) => x.powt_mb_serialNoList);

    getX((PowtProvider x) => x.getPowtLocalData());
    final List<PowtModel> reportsForArgsfrom_Powtmodel =
        watchOnly((PowtProvider x) => x.powtlocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((Powt_mb_Provider x) => x.getPowtMBEquipmentList());
    final List<Powt_mb_Model> reportsFormPowtmbLocalData =
        watchOnly((Powt_mb_Provider x) => x.powt_mb_loacaldataList);

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
                for (var i in reportsFormPowtmbLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_Powtmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                var url =
                                    Uri.parse('${Env.URL_PREFIX}/powtMbTest/');
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
                                  sl<Powt_mb_Provider>().updatePowt_mb(
                                      Powt_mb_Model(
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
                                        updateDate: DateTime.now(),
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

                // ------------------------------------------------------
                Navigator.pushNamed(context, '/detail_Powt_mb', arguments: {
                  'id': report.id,
                  'POWT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo,
                  'powtDatabaseID': args['powtDatabaseID'],
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_Powt_mb', arguments: {
                  'id': report.id,
                  'POWT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo,
                  'powtDatabaseID': args['powtDatabaseID'],
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
                              ntr.etype == 'powt'
                                  ? const Text(
                                      'Powt_mb Details ',
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
                              ntr.etype == 'powt'
                                  ? const Text(
                                      'Powt_mb Details ',
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
                    Text('Serial No : ' + report.serialNo,
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

  generate_list_of_Powt_sc(PowtModel ntr) {
    getX((Powtsc_Provider x) => x.getPowtscserialNo(ntr.serialNo));
    final List<PowtscModel> reports =
        watchOnly((Powtsc_Provider x) => x.powtsc_serialNoList);

    getX((PowtProvider x) => x.getPowtLocalData());
    final List<PowtModel> reportsForArgsfrom_Powtmodel =
        watchOnly((PowtProvider x) => x.powtlocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((Powtsc_Provider x) => x.getPowtscEquipmentList());
    final List<PowtscModel> reportsFormPowtscLocalData =
        watchOnly((Powtsc_Provider x) => x.powtsc_loacaldataList);

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
                for (var i in reportsFormPowtscLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_Powtmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                var url =
                                    Uri.parse('${Env.URL_PREFIX}/powtScTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'hv_1u': i.hv_1u.toString(),
                                  'hv_1v': i.hv_1v.toString(),
                                  'hv_1w': i.hv_1w.toString(),
                                  'hv_1n': i.hv_1n.toString(),
                                  'lv_2u': i.lv_2u.toString(),
                                  'lv_2v': i.lv_2v.toString(),
                                  'lv_2w': i.lv_2w.toString(),
                                  'lv_2n': i.lv_2n.toString(),
                                  'tapPosition': i.tapPosition.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<Powtsc_Provider>().updatePowtsc(
                                      PowtscModel(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        hv_1u: i.hv_1u,
                                        hv_1v: i.hv_1v,
                                        hv_1w: i.hv_1w,
                                        hv_1n: i.hv_1n,
                                        lv_2u: i.lv_2u,
                                        lv_2v: i.lv_2v,
                                        lv_2w: i.lv_2w,
                                        lv_2n: i.lv_2n,
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
                // ------------------------------------------------------
                Navigator.pushNamed(context, '/detail_Powtsc', arguments: {
                  'id': report.id,
                  'POWT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo,
                  'powtDatabaseID': args['powtDatabaseID'],
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_Powtsc', arguments: {
                  'id': report.id,
                  'POWT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo,
                  'powtDatabaseID': args['powtDatabaseID'],
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
                              ntr.etype == 'powt'
                                  ? const Text(
                                      'Powtsc Details ',
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
                              ntr.etype == 'powt'
                                  ? const Text(
                                      'Powtsc Details ',
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
                    Text('Serial No : ' + report.serialNo,
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

  generate_list_of_Powttd(PowtModel ntr) {
    getX((PowttdProvider x) => x.getPowttdBySerialNo(ntr.serialNo));
    final List<PowttdModel> reports =
        watchOnly((PowttdProvider x) => x.powttd_serialNoList);

    getX((PowtProvider x) => x.getPowtLocalData());
    final List<PowtModel> reportsForArgsfrom_Powtmodel =
        watchOnly((PowtProvider x) => x.powtlocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((PowttdProvider x) => x.getPowttdEquipmentList());
    final List<PowttdModel> reportsFormPowttdLocalData =
        watchOnly((PowttdProvider x) => x.powttd_localdataList);

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
                for (var i in reportsFormPowttdLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_Powtmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                // add to remote database
                                var url =
                                    Uri.parse('${Env.URL_PREFIX}/powtTdTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                  'ru1  ': i.ru1.toString(),
                                  'ru2  ': i.ru2.toString(),
                                  'ru3  ': i.ru3.toString(),
                                  'ri1  ': i.ri1.toString(),
                                  'ri2  ': i.ri2.toString(),
                                  'ri3  ': i.ri3.toString(),
                                  'rc1  ': i.rc1.toString(),
                                  'rc2  ': i.rc2.toString(),
                                  'rc3  ': i.rc3.toString(),
                                  'rtanD1  ': i.rtanD1.toString(),
                                  'rtanD2  ': i.rtanD2.toString(),
                                  'rtanD3  ': i.rtanD3.toString(),
                                  'rp1  ': i.rp1.toString(),
                                  'rp2  ': i.rp2.toString(),
                                  'rp3  ': i.rp3.toString(),
                                  'rVdf1  ': i.rVdf1.toString(),
                                  'rVdf2  ': i.rVdf2.toString(),
                                  'rVdf3  ': i.rVdf3.toString(),
                                  'yu1  ': i.yu1.toString(),
                                  'yu2  ': i.yu2.toString(),
                                  'yu3  ': i.yu3.toString(),
                                  'yi1  ': i.yi1.toString(),
                                  'yi2  ': i.yi2.toString(),
                                  'yi3  ': i.yi3.toString(),
                                  'yc1  ': i.yc1.toString(),
                                  'yc2  ': i.yc2.toString(),
                                  'yc3  ': i.yc3.toString(),
                                  'ytanD1  ': i.ytanD1.toString(),
                                  'ytanD2  ': i.ytanD2.toString(),
                                  'ytanD3  ': i.ytanD3.toString(),
                                  'yp1  ': i.yp1.toString(),
                                  'yp2  ': i.yp2.toString(),
                                  'yp3  ': i.yp3.toString(),
                                  'yVdf1  ': i.yVdf1.toString(),
                                  'yVdf2  ': i.yVdf2.toString(),
                                  'yVdf3  ': i.yVdf3.toString(),
                                  'bu1  ': i.bu1.toString(),
                                  'bu2  ': i.bu2.toString(),
                                  'bu3  ': i.bu3.toString(),
                                  'bi1  ': i.bi1.toString(),
                                  'bi2  ': i.bi2.toString(),
                                  'bi3  ': i.bi3.toString(),
                                  'bc1  ': i.bc1.toString(),
                                  'bc2  ': i.bc2.toString(),
                                  'bc3  ': i.bc3.toString(),
                                  'btanD1  ': i.btanD1.toString(),
                                  'btanD2  ': i.btanD2.toString(),
                                  'btanD3  ': i.btanD3.toString(),
                                  'bp1  ': i.bp1.toString(),
                                  'bp2  ': i.bp2.toString(),
                                  'bp3  ': i.bp3.toString(),
                                  'bVdf1  ': i.bVdf1.toString(),
                                  'bVdf2  ': i.bVdf2.toString(),
                                  'bVdf3  ': i.bVdf3.toString(),
                                  'hv_lv_u1  ': i.hv_lv_u1.toString(),
                                  'hv_lv_u2  ': i.hv_lv_u2.toString(),
                                  'hv_lv_u3  ': i.hv_lv_u3.toString(),
                                  'hv_lv_i1  ': i.hv_lv_i1.toString(),
                                  'hv_lv_i2  ': i.hv_lv_i2.toString(),
                                  'hv_lv_i3  ': i.hv_lv_i3.toString(),
                                  'hv_lv_c1  ': i.hv_lv_c1.toString(),
                                  'hv_lv_c2  ': i.hv_lv_c2.toString(),
                                  'hv_lv_c3  ': i.hv_lv_c3.toString(),
                                  'hv_lv_tanD1  ': i.hv_lv_tanD1.toString(),
                                  'hv_lv_tanD2  ': i.hv_lv_tanD2.toString(),
                                  'hv_lv_tanD3  ': i.hv_lv_tanD3.toString(),
                                  'hv_lv_p1  ': i.hv_lv_p1.toString(),
                                  'hv_lv_p2  ': i.hv_lv_p2.toString(),
                                  'hv_lv_p3  ': i.hv_lv_p3.toString(),
                                  'hv_lv_Vdf1  ': i.hv_lv_Vdf1.toString(),
                                  'hv_lv_Vdf2  ': i.hv_lv_Vdf2.toString(),
                                  'hv_lv_Vdf3  ': i.hv_lv_Vdf3.toString(),
                                  'hvE_G_u1  ': i.hvE_G_u1.toString(),
                                  'hvE_G_u2  ': i.hvE_G_u2.toString(),
                                  'hvE_G_u3  ': i.hvE_G_u3.toString(),
                                  'hvE_G_i1  ': i.hvE_G_i1.toString(),
                                  'hvE_G_i2  ': i.hvE_G_i2.toString(),
                                  'hvE_G_i3  ': i.hvE_G_i3.toString(),
                                  'hvE_G_c1  ': i.hvE_G_c1.toString(),
                                  'hvE_G_c2  ': i.hvE_G_c2.toString(),
                                  'hvE_G_c3  ': i.hvE_G_c3.toString(),
                                  'hvE_G_tanD1  ': i.hvE_G_tanD1.toString(),
                                  'hvE_G_tanD2  ': i.hvE_G_tanD2.toString(),
                                  'hvE_G_tanD3  ': i.hvE_G_tanD3.toString(),
                                  'hvE_G_p1  ': i.hvE_G_p1.toString(),
                                  'hvE_G_p2  ': i.hvE_G_p2.toString(),
                                  'hvE_G_p3  ': i.hvE_G_p3.toString(),
                                  'hvE_G_Vdf1  ': i.hvE_G_Vdf1.toString(),
                                  'hvE_G_Vdf2  ': i.hvE_G_Vdf2.toString(),
                                  'hvE_G_Vdf3  ': i.hvE_G_Vdf3.toString(),
                                  'hvE_Grnd_u1  ': i.hvE_Grnd_u1.toString(),
                                  'hvE_Grnd_u2  ': i.hvE_Grnd_u2.toString(),
                                  'hvE_Grnd_u3  ': i.hvE_Grnd_u3.toString(),
                                  'hvE_Grnd_i1  ': i.hvE_Grnd_i1.toString(),
                                  'hvE_Grnd_i2  ': i.hvE_Grnd_i2.toString(),
                                  'hvE_Grnd_i3  ': i.hvE_Grnd_i3.toString(),
                                  'hvE_Grnd_c1  ': i.hvE_Grnd_c1.toString(),
                                  'hvE_Grnd_c2  ': i.hvE_Grnd_c2.toString(),
                                  'hvE_Grnd_c3  ': i.hvE_Grnd_c3.toString(),
                                  'hvE_Grnd_tanD1  ':
                                      i.hvE_Grnd_tanD1.toString(),
                                  'hvE_Grnd_tanD2  ':
                                      i.hvE_Grnd_tanD2.toString(),
                                  'hvE_Grnd_tanD3  ':
                                      i.hvE_Grnd_tanD3.toString(),
                                  'hvE_Grnd_p1  ': i.hvE_Grnd_p1.toString(),
                                  'hvE_Grnd_p2  ': i.hvE_Grnd_p2.toString(),
                                  'hvE_Grnd_p3  ': i.hvE_Grnd_p3.toString(),
                                  'hvE_Grnd_Vdf1  ': i.hvE_Grnd_Vdf1.toString(),
                                  'hvE_Grnd_Vdf2  ': i.hvE_Grnd_Vdf2.toString(),
                                  'hvE_Grnd_Vdf3  ': i.hvE_Grnd_Vdf3.toString(),
                                  'lvEu1  ': i.lvEu1.toString(),
                                  'lvEu2  ': i.lvEu2.toString(),
                                  'lvEu3  ': i.lvEu3.toString(),
                                  'lvEi1  ': i.lvEi1.toString(),
                                  'lvEi2  ': i.lvEi2.toString(),
                                  'lvEi3  ': i.lvEi3.toString(),
                                  'lvEc1  ': i.lvEc1.toString(),
                                  'lvEc2  ': i.lvEc2.toString(),
                                  'lvEc3  ': i.lvEc3.toString(),
                                  'lvEtanD1  ': i.lvEtanD1.toString(),
                                  'lvEtanD2  ': i.lvEtanD2.toString(),
                                  'lvEtanD3  ': i.lvEtanD3.toString(),
                                  'lvEp1  ': i.lvEp1.toString(),
                                  'lvEp2  ': i.lvEp2.toString(),
                                  'lvEp3  ': i.lvEp3.toString(),
                                  'lvEVdf1  ': i.lvEVdf1.toString(),
                                  'lvEVdf2  ': i.lvEVdf2.toString(),
                                  'lvEVdf3  ': i.lvEVdf3.toString(),
                                  'lvE_G_u1  ': i.lvE_G_u1.toString(),
                                  'lvE_G_u2  ': i.lvE_G_u2.toString(),
                                  'lvE_G_u3  ': i.lvE_G_u3.toString(),
                                  'lvE_G_i1  ': i.lvE_G_i1.toString(),
                                  'lvE_G_i2  ': i.lvE_G_i2.toString(),
                                  'lvE_G_i3  ': i.lvE_G_i3.toString(),
                                  'lvE_G_c1  ': i.lvE_G_c1.toString(),
                                  'lvE_G_c2  ': i.lvE_G_c2.toString(),
                                  'lvE_G_c3  ': i.lvE_G_c3.toString(),
                                  'lvE_G_tanD1  ': i.lvE_G_tanD1.toString(),
                                  'lvE_G_tanD2  ': i.lvE_G_tanD2.toString(),
                                  'lvE_G_tanD3  ': i.lvE_G_tanD3.toString(),
                                  'lvE_G_p1  ': i.lvE_G_p1.toString(),
                                  'lvE_G_p2  ': i.lvE_G_p2.toString(),
                                  'lvE_G_p3  ': i.lvE_G_p3.toString(),
                                  'lvE_G_Vdf1  ': i.lvE_G_Vdf1.toString(),
                                  'lvE_G_Vdf2  ': i.lvE_G_Vdf2.toString(),
                                  'lvE_G_Vdf3  ': i.lvE_G_Vdf3.toString(),
                                  'lvE_Grnd_u1  ': i.lvE_Grnd_u1.toString(),
                                  'lvE_Grnd_u2  ': i.lvE_Grnd_u2.toString(),
                                  'lvE_Grnd_u3  ': i.lvE_Grnd_u3.toString(),
                                  'lvE_Grnd_i1  ': i.lvE_Grnd_i1.toString(),
                                  'lvE_Grnd_i2  ': i.lvE_Grnd_i2.toString(),
                                  'lvE_Grnd_i3  ': i.lvE_Grnd_i3.toString(),
                                  'lvE_Grnd_c1  ': i.lvE_Grnd_c1.toString(),
                                  'lvE_Grnd_c2  ': i.lvE_Grnd_c2.toString(),
                                  'lvE_Grnd_c3  ': i.lvE_Grnd_c3.toString(),
                                  'lvE_Grnd_tanD1  ':
                                      i.lvE_Grnd_tanD1.toString(),
                                  'lvE_Grnd_tanD2  ':
                                      i.lvE_Grnd_tanD2.toString(),
                                  'lvE_Grnd_tanD3  ':
                                      i.lvE_Grnd_tanD3.toString(),
                                  'lvE_Grnd_p1  ': i.lvE_Grnd_p1.toString(),
                                  'lvE_Grnd_p2  ': i.lvE_Grnd_p2.toString(),
                                  'lvE_Grnd_p3  ': i.lvE_Grnd_p3.toString(),
                                  'lvE_Grnd_Vdf1  ': i.lvE_Grnd_Vdf1.toString(),
                                  'lvE_Grnd_Vdf2  ': i.lvE_Grnd_Vdf2.toString(),
                                  'lvE_Grnd_Vdf3  ': i.lvE_Grnd_Vdf3.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<PowttdProvider>().updatePowttd(
                                      PowttdModel(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        ru1: i.ru1,
                                        ru2: i.ru2,
                                        ru3: i.ru3,
                                        ri1: i.ri1,
                                        ri2: i.ri2,
                                        ri3: i.ri3,
                                        rc1: i.rc1,
                                        rc2: i.rc2,
                                        rc3: i.rc3,
                                        rtanD1: i.rtanD1,
                                        rtanD2: i.rtanD2,
                                        rtanD3: i.rtanD3,
                                        rp1: i.rp1,
                                        rp2: i.rp2,
                                        rp3: i.rp3,
                                        rVdf1: i.rVdf1,
                                        rVdf2: i.rVdf2,
                                        rVdf3: i.rVdf3,
                                        yu1: i.yu1,
                                        yu2: i.yu2,
                                        yu3: i.yu3,
                                        yi1: i.yi1,
                                        yi2: i.yi2,
                                        yi3: i.yi3,
                                        yc1: i.yc1,
                                        yc2: i.yc2,
                                        yc3: i.yc3,
                                        ytanD1: i.ytanD1,
                                        ytanD2: i.ytanD2,
                                        ytanD3: i.ytanD3,
                                        yp1: i.yp1,
                                        yp2: i.yp2,
                                        yp3: i.yp3,
                                        yVdf1: i.yVdf1,
                                        yVdf2: i.yVdf2,
                                        yVdf3: i.yVdf3,
                                        bu1: i.bu1,
                                        bu2: i.bu2,
                                        bu3: i.bu3,
                                        bi1: i.bi1,
                                        bi2: i.bi2,
                                        bi3: i.bi3,
                                        bc1: i.bc1,
                                        bc2: i.bc2,
                                        bc3: i.bc3,
                                        btanD1: i.btanD1,
                                        btanD2: i.btanD2,
                                        btanD3: i.btanD3,
                                        bp1: i.bp1,
                                        bp2: i.bp2,
                                        bp3: i.bp3,
                                        bVdf1: i.bVdf1,
                                        bVdf2: i.bVdf2,
                                        bVdf3: i.bVdf3,
                                        hv_lv_u1: i.hv_lv_u1,
                                        hv_lv_u2: i.hv_lv_u2,
                                        hv_lv_u3: i.hv_lv_u3,
                                        hv_lv_i1: i.hv_lv_i1,
                                        hv_lv_i2: i.hv_lv_i2,
                                        hv_lv_i3: i.hv_lv_i3,
                                        hv_lv_c1: i.hv_lv_c1,
                                        hv_lv_c2: i.hv_lv_c2,
                                        hv_lv_c3: i.hv_lv_c3,
                                        hv_lv_tanD1: i.hv_lv_tanD1,
                                        hv_lv_tanD2: i.hv_lv_tanD2,
                                        hv_lv_tanD3: i.hv_lv_tanD3,
                                        hv_lv_p1: i.hv_lv_p1,
                                        hv_lv_p2: i.hv_lv_p2,
                                        hv_lv_p3: i.hv_lv_p3,
                                        hv_lv_Vdf1: i.hv_lv_Vdf1,
                                        hv_lv_Vdf2: i.hv_lv_Vdf2,
                                        hv_lv_Vdf3: i.hv_lv_Vdf3,
                                        hvE_G_u1: i.hvE_G_u1,
                                        hvE_G_u2: i.hvE_G_u2,
                                        hvE_G_u3: i.hvE_G_u3,
                                        hvE_G_i1: i.hvE_G_i1,
                                        hvE_G_i2: i.hvE_G_i2,
                                        hvE_G_i3: i.hvE_G_i3,
                                        hvE_G_c1: i.hvE_G_c1,
                                        hvE_G_c2: i.hvE_G_c2,
                                        hvE_G_c3: i.hvE_G_c3,
                                        hvE_G_tanD1: i.hvE_G_tanD1,
                                        hvE_G_tanD2: i.hvE_G_tanD2,
                                        hvE_G_tanD3: i.hvE_G_tanD3,
                                        hvE_G_p1: i.hvE_G_p1,
                                        hvE_G_p2: i.hvE_G_p2,
                                        hvE_G_p3: i.hvE_G_p3,
                                        hvE_G_Vdf1: i.hvE_G_Vdf1,
                                        hvE_G_Vdf2: i.hvE_G_Vdf2,
                                        hvE_G_Vdf3: i.hvE_G_Vdf3,
                                        hvE_Grnd_u1: i.hvE_Grnd_u1,
                                        hvE_Grnd_u2: i.hvE_Grnd_u2,
                                        hvE_Grnd_u3: i.hvE_Grnd_u3,
                                        hvE_Grnd_i1: i.hvE_Grnd_i1,
                                        hvE_Grnd_i2: i.hvE_Grnd_i2,
                                        hvE_Grnd_i3: i.hvE_Grnd_i3,
                                        hvE_Grnd_c1: i.hvE_Grnd_c1,
                                        hvE_Grnd_c2: i.hvE_Grnd_c2,
                                        hvE_Grnd_c3: i.hvE_Grnd_c3,
                                        hvE_Grnd_tanD1: i.hvE_Grnd_tanD1,
                                        hvE_Grnd_tanD2: i.hvE_Grnd_tanD2,
                                        hvE_Grnd_tanD3: i.hvE_Grnd_tanD3,
                                        hvE_Grnd_p1: i.hvE_Grnd_p1,
                                        hvE_Grnd_p2: i.hvE_Grnd_p2,
                                        hvE_Grnd_p3: i.hvE_Grnd_p3,
                                        hvE_Grnd_Vdf1: i.hvE_Grnd_Vdf1,
                                        hvE_Grnd_Vdf2: i.hvE_Grnd_Vdf2,
                                        hvE_Grnd_Vdf3: i.hvE_Grnd_Vdf3,
                                        lvEu1: i.lvEu1,
                                        lvEu2: i.lvEu2,
                                        lvEu3: i.lvEu3,
                                        lvEi1: i.lvEi1,
                                        lvEi2: i.lvEi2,
                                        lvEi3: i.lvEi3,
                                        lvEc1: i.lvEc1,
                                        lvEc2: i.lvEc2,
                                        lvEc3: i.lvEc3,
                                        lvEtanD1: i.lvEtanD1,
                                        lvEtanD2: i.lvEtanD2,
                                        lvEtanD3: i.lvEtanD3,
                                        lvEp1: i.lvEp1,
                                        lvEp2: i.lvEp2,
                                        lvEp3: i.lvEp3,
                                        lvEVdf1: i.lvEVdf1,
                                        lvEVdf2: i.lvEVdf2,
                                        lvEVdf3: i.lvEVdf3,
                                        lvE_G_u1: i.lvE_G_u1,
                                        lvE_G_u2: i.lvE_G_u2,
                                        lvE_G_u3: i.lvE_G_u3,
                                        lvE_G_i1: i.lvE_G_i1,
                                        lvE_G_i2: i.lvE_G_i2,
                                        lvE_G_i3: i.lvE_G_i3,
                                        lvE_G_c1: i.lvE_G_c1,
                                        lvE_G_c2: i.lvE_G_c2,
                                        lvE_G_c3: i.lvE_G_c3,
                                        lvE_G_tanD1: i.lvE_G_tanD1,
                                        lvE_G_tanD2: i.lvE_G_tanD2,
                                        lvE_G_tanD3: i.lvE_G_tanD3,
                                        lvE_G_p1: i.lvE_G_p1,
                                        lvE_G_p2: i.lvE_G_p2,
                                        lvE_G_p3: i.lvE_G_p3,
                                        lvE_G_Vdf1: i.lvE_G_Vdf1,
                                        lvE_G_Vdf2: i.lvE_G_Vdf2,
                                        lvE_G_Vdf3: i.lvE_G_Vdf3,
                                        lvE_Grnd_u1: i.lvE_Grnd_u1,
                                        lvE_Grnd_u2: i.lvE_Grnd_u2,
                                        lvE_Grnd_u3: i.lvE_Grnd_u3,
                                        lvE_Grnd_i1: i.lvE_Grnd_i1,
                                        lvE_Grnd_i2: i.lvE_Grnd_i2,
                                        lvE_Grnd_i3: i.lvE_Grnd_i3,
                                        lvE_Grnd_c1: i.lvE_Grnd_c1,
                                        lvE_Grnd_c2: i.lvE_Grnd_c2,
                                        lvE_Grnd_c3: i.lvE_Grnd_c3,
                                        lvE_Grnd_tanD1: i.lvE_Grnd_tanD1,
                                        lvE_Grnd_tanD2: i.lvE_Grnd_tanD2,
                                        lvE_Grnd_tanD3: i.lvE_Grnd_tanD3,
                                        lvE_Grnd_p1: i.lvE_Grnd_p1,
                                        lvE_Grnd_p2: i.lvE_Grnd_p2,
                                        lvE_Grnd_p3: i.lvE_Grnd_p3,
                                        lvE_Grnd_Vdf1: i.lvE_Grnd_Vdf1,
                                        lvE_Grnd_Vdf2: i.lvE_Grnd_Vdf2,
                                        lvE_Grnd_Vdf3: i.lvE_Grnd_Vdf3,
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
                Navigator.pushNamed(context, '/detail_Powttd', arguments: {
                  'id': report.id,
                  'POWT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo,
                  'powtDatabaseID': args['powtDatabaseID'],
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_Powttd', arguments: {
                  'id': report.id,
                  'POWT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo,
                  'powtDatabaseID': args['powtDatabaseID'],
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
                              ntr.etype == 'powt'
                                  ? const Text(
                                      'Powttd Details ',
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
                              ntr.etype == 'powt'
                                  ? const Text(
                                      'Powttd Details ',
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
                    Text('Serial No : ' + report.serialNo,
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

  generate_list_of_Powt_bNamePlate(PowtModel ntr) {
    getX((PowtbNamePlateProvider x) =>
        x.getPowtbNamePlateserialNo(ntr.serialNo));
    final List<PowtbNamePlateModel> reports =
        watchOnly((PowtbNamePlateProvider x) => x.powtbNamePlate_serialNoList);

    getX((PowtProvider x) => x.getPowtLocalData());
    final List<PowtModel> reportsForArgsfrom_Powtmodel =
        watchOnly((PowtProvider x) => x.powtlocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((PowtbNamePlateProvider x) => x.getPowtbNameplateEquipmentList());
    final List<PowtbNamePlateModel> reportsFormPowtbnameplateLocalData =
        watchOnly(
            (PowtbNamePlateProvider x) => x.powtbNamePlate_loacaldataList);

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
                for (var i in reportsFormPowtbnameplateLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_Powtmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo;
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                // add to remote databse
                                var url = Uri.parse(
                                    '${Env.URL_PREFIX}/powtbNamePlate/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'R_serialNo': i.R_serialNo.toString(),
                                  'R_ratedVoltage': i.R_ratedVoltage.toString(),
                                  'R_ratedCurrent': i.R_ratedCurrent.toString(),
                                  'R_Make': i.R_Make.toString(),
                                  'Y_serialNo': i.Y_serialNo.toString(),
                                  'Y_ratedVoltage': i.Y_ratedVoltage.toString(),
                                  'Y_ratedCurrent': i.Y_ratedCurrent.toString(),
                                  'Y_Make': i.Y_Make.toString(),
                                  'B_serialNo': i.B_serialNo.toString(),
                                  'B_ratedVoltage': i.B_ratedVoltage.toString(),
                                  'B_ratedCurrent': i.B_ratedCurrent.toString(),
                                  'B_Make': i.B_Make.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then(
                                  (value) {
                                    sl<PowtbNamePlateProvider>()
                                        .updatePowtbNamePlate(
                                            PowtbNamePlateModel(
                                              id: i.id,
                                              trNo: i.trNo,
                                              serialNo: i.serialNo,
                                              R_serialNo: i.R_serialNo,
                                              R_ratedVoltage: i.R_ratedVoltage,
                                              R_ratedCurrent: i.R_ratedCurrent,
                                              R_Make: i.R_Make,
                                              Y_serialNo: i.Y_serialNo,
                                              Y_ratedVoltage: i.Y_ratedVoltage,
                                              Y_ratedCurrent: i.Y_ratedCurrent,
                                              Y_Make: i.Y_Make,
                                              B_serialNo: i.B_serialNo,
                                              B_ratedVoltage: i.B_ratedVoltage,
                                              B_ratedCurrent: i.B_ratedCurrent,
                                              B_Make: i.B_Make,
                                              databaseID:
                                                  json.decode(value.body)['id'],
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
                // --------------------------------------------------
                Navigator.pushNamed(context, '/detail_PowtbNameplate',
                    arguments: {
                      'id': report.id,
                      'POWT_ID': report.databaseID,
                      'serial_no_bph': ntr.serialNo,
                      'powtDatabaseID': args['powtDatabaseID'],
                      'trDatabaseID': args['trDatabaseID'],
                    });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_PowtbNameplate',
                    arguments: {
                      'id': report.id,
                      'POWT_ID': report.databaseID,
                      'serial_no_bph': ntr.serialNo,
                      'powtDatabaseID': args['powtDatabaseID'],
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
                              ntr.etype == 'powt'
                                  ? const Text(
                                      'Powt bNamePlate Details ',
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
                              ntr.etype == 'powt'
                                  ? const Text(
                                      'Powt bNamePlate Details ',
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
                    Text('Serial No : ' + report.serialNo,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('R_serialNo : ' + report.R_serialNo,
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
