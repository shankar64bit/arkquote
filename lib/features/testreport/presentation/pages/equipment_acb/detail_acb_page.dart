// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/acb/acb_crm_test_model.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/acb/acb_model.dart';

import 'package:flutter_testreports/features/testreport/presentation/providers/equipment_acb_provider/acb_ir_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/user_table_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../../../../../env.sample.dart';
import '../../../../../injection_container.dart';
import '../../../data/models/equipment/acb/acb_cr_test_model.dart';
import '../../../data/models/equipment/acb/acb_ir_test_model.dart';
import '../../../data/models/equipment/acb/vcb_timing_test_model.dart';
import '../../../data/models/test_report_model.dart';
import '../../providers/equipment_acb_provider/acb_cr_provider.dart';
import '../../providers/equipment_acb_provider/acb_crm_provider.dart';
import '../../providers/equipment_acb_provider/acb_provider.dart';
import '../../providers/equipment_acb_provider/test_report_provider.dart';
import '../../providers/vcb_timing_provider.dart';

import '../dropdown_All/equipmentUsed.dart';
import '../dropdown_All/responsive_tool/google_sign_in_out/InternetConnChecker.dart';
import 'detail_test_report_page.dart';

class DetailAcbPage extends StatelessWidget with GetItMixin {
  Map args = {};
  AcbModel ntr;
  int trDbId;

  // String get selectedUserName => TestedByUser().getTestedByUserNameValue();

  DetailAcbPage({@required this.args, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getX((AcbProvider x) => x.getAcbByID(args['id']));
    final AcbModel ntr = watchOnly((AcbProvider x) => x.acbModel);
    //final UserModel ntr1 = watchOnly((UserProvider x) => x.usersModel);

    var mob = const Text('ACB Details', style: TextStyle(fontSize: 15));
    var desk = const Text('ACB Details', style: TextStyle(fontSize: 20));
    var mobV = const Text('VCB Details', style: TextStyle(fontSize: 15));
    var deskV = const Text('VCB Details', style: TextStyle(fontSize: 20));
    var mobO = const Text('OCB Details', style: TextStyle(fontSize: 15));
    var deskO = const Text('OCB Details', style: TextStyle(fontSize: 20));
    var mobS = const Text('SF6 Details', style: TextStyle(fontSize: 15));
    var deskS = const Text('SF6 Details', style: TextStyle(fontSize: 20));
    return Scaffold(
        appBar: AppBar(
          // ignore: missing_return
          title: LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 400) {
              if (ntr.etype == 'acb') {
                return ntr.etype == 'acb' ? desk : mob;
              } else if (ntr.etype == 'vcb') {
                return ntr.etype == 'vcb' ? deskV : mobV;
              } else if (ntr.etype == 'ocb') {
                return ntr.etype == 'ocb' ? deskO : mobO;
              } else if (ntr.etype == 'sf6') {
                return ntr.etype == 'sf6' ? deskS : mobS;
              }
            } else {
              if (ntr.etype == 'acb') {
                return ntr.etype == 'acb' ? mob : desk;
              } else if (ntr.etype == 'vcb') {
                return ntr.etype == 'vcb' ? mobV : deskV;
              } else if (ntr.etype == 'ocb') {
                return ntr.etype == 'ocb' ? mobO : deskO;
              } else if (ntr.etype == 'sf6') {
                return ntr.etype == 'sf6' ? mobS : deskS;
              }
            }
          }),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/edit_ACB',
                      arguments: ntr.id);
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
        body: LayoutBuilder(builder: (context, constraints) {
          /////////////////////////////////////DESKTOP-VIEW///////////////////////////////////////////////////////////
          if (constraints.maxWidth > 770) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      ConstrainedBox(
                          constraints:
                              BoxConstraints(minHeight: 0, maxWidth: 1000),
                          child: display_acb_details(ntr)),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width: 250,
                                    height: 150,
                                    child: generate_list_of_ACB_IR(ntr)),
                                SizedBox(
                                    width: 250,
                                    height: 150,
                                    child: generate_list_of_ACB_crm(ntr)),
                                SizedBox(
                                    width: 250,
                                    height: 150,
                                    child: generate_list_of_Vcb_timing(ntr)),
                                SizedBox(
                                    width: 250,
                                    height: 150,
                                    child: generate_list_of_ACB_CR(ntr)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
                        child: display_acb_details(ntr)),
                    // ConstrainedBox(
                    //     constraints: BoxConstraints(minHeight: 0),
                    //     child: display_testUser(ntr1)),
                  ],
                ),
                Container(
                  child: Expanded(
                      child: ListView.builder(
                    //Represents the number of expanded rows that can be scrollable vertically,
                    itemCount: 1,
                    //Represents the number of expanded rows that can be scrollable vertically,
                    itemBuilder: ((context, index) {
                      //Represents the number of expanded rows that can be scrollable vertically, and also can return multiple row for diffrent functionality report details
                      return Column(children: [
                        Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 100),
                            child: Column(children: [
                              SizedBox(
                                  width: 330,
                                  height: 150,
                                  child: generate_list_of_ACB_IR(ntr)),
                              SizedBox(
                                  width: 330,
                                  height: 150,
                                  child: generate_list_of_ACB_crm(ntr)),
                              SizedBox(
                                  width: 330,
                                  height: 150,
                                  child: generate_list_of_Vcb_timing(ntr)),
                              SizedBox(
                                  width: 330,
                                  height: 150,
                                  child: generate_list_of_ACB_CR(ntr)),
                            ]))
                      ]);
                    }),
                  )),
                )
              ]),
            );
          }
        }),
        floatingActionButton: PopupMenuButton(
            // ignore: missing_required_param
            child: FloatingActionButton.extended(
              label: Text(
                'Add Test',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              icon:
                  const Icon(Icons.account_tree_outlined, color: Colors.white),
            ),
            itemBuilder: (context) {
              return List.generate(1, (index) {
                //list.generate
                return PopupMenuItem(
                    child: Column(children: [
                  ///////////////////////////////ALL-POP-UP-MENU-BUTTON-STARTS-FROM-HERE///////////////////////////

                  ///////////////////////////Add ACB_IR button///////////////////////////////
                  ntr.etype == 'acb'
                      ? Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FloatingActionButton.extended(
                              heroTag: 'addACBIR',
                              onPressed: () {
                                EquipmentTypeList().getEquipUsetoDefaultValue();

                                Navigator.popAndPushNamed(
                                    context, '/add_ACB_Ir',
                                    arguments: {
                                      'TrNo': ntr.trNo,
                                      'ACB_ID': ntr.id,
                                      'Serial_No': ntr.serialNo,
                                      'acbDatabaseID': ntr.databaseID,
                                      'trDatabaseID': args['trDatabaseID'],
                                    });
                              },
                              label: const Text('ACB Ir',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white)),
                              icon: const Icon(Icons.add, color: Colors.white)))
                      : Container(),
                  ///////////////////////////Add ACB_CRM button///////////////////////////////
                  ntr.etype == 'acb'
                      ? Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FloatingActionButton.extended(
                              heroTag: 'addACBCRM',
                              onPressed: () {
                                EquipmentTypeList().getEquipUsetoDefaultValue();

                                Navigator.popAndPushNamed(
                                    context, '/add_ACB_Crm',
                                    arguments: {
                                      'TrNo': ntr.trNo,
                                      'ACB_ID': ntr.id,
                                      'Serial_No': ntr.serialNo,
                                      'acbDatabaseID': ntr.databaseID,
                                      'trDatabaseID': args['trDatabaseID'],
                                    });
                              },
                              label: const Text('ACB Crm',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white)),
                              icon: const Icon(Icons.add, color: Colors.white)))
                      : Container(),

                  ///////////////////////////Add VCB_IR button///////////////////////////////
                  ntr.etype == 'vcb'
                      ? Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FloatingActionButton.extended(
                              heroTag: 'addVCBIR',
                              onPressed: () {
                                EquipmentTypeList().getEquipUsetoDefaultValue();

                                Navigator.popAndPushNamed(
                                    context, '/add_ACB_Ir',
                                    arguments: {
                                      'TrNo': ntr.trNo,
                                      'ACB_ID': ntr.id,
                                      'Serial_No': ntr.serialNo,
                                      'acbDatabaseID': ntr.databaseID,
                                      'trDatabaseID': args['trDatabaseID'],
                                    });
                              },
                              label: const Text('VCB Ir',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white)),
                              icon: const Icon(Icons.add, color: Colors.white)))
                      : Container(),
                  ///////////////////////////Add VCB_CRM button///////////////////////////////
                  ntr.etype == 'vcb'
                      ? Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FloatingActionButton.extended(
                              heroTag: 'addVCBCRM',
                              onPressed: () {
                                EquipmentTypeList().getEquipUsetoDefaultValue();
                                Navigator.popAndPushNamed(
                                    context, '/add_ACB_Crm',
                                    arguments: {
                                      'TrNo': ntr.trNo,
                                      'ACB_ID': ntr.id,
                                      'Serial_No': ntr.serialNo,
                                      'acbDatabaseID': ntr.databaseID,
                                      'trDatabaseID': args['trDatabaseID'],
                                    });
                              },
                              label: const Text('VCB Crm',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white)),
                              icon: const Icon(Icons.add, color: Colors.white)))
                      : Container(),
                  ///////////////////////////Add OCB_IR button///////////////////////////////
                  ntr.etype == 'ocb'
                      ? Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FloatingActionButton.extended(
                              heroTag: 'addOCBIR',
                              onPressed: () {
                                EquipmentTypeList().getEquipUsetoDefaultValue();

                                Navigator.popAndPushNamed(
                                    context, '/add_ACB_Ir',
                                    arguments: {
                                      'TrNo': ntr.trNo,
                                      'ACB_ID': ntr.id,
                                      'Serial_No': ntr.serialNo,
                                      'acbDatabaseID': ntr.databaseID,
                                      'trDatabaseID': args['trDatabaseID'],
                                    });
                              },
                              label: const Text('OCB Ir',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white)),
                              icon: const Icon(Icons.add, color: Colors.white)))
                      : Container(),
                  ///////////////////////////Add OCB_CRM button///////////////////////////////
                  ntr.etype == 'ocb'
                      ? Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FloatingActionButton.extended(
                              heroTag: 'addOCBCRM',
                              onPressed: () {
                                EquipmentTypeList().getEquipUsetoDefaultValue();
                                Navigator.popAndPushNamed(
                                    context, '/add_ACB_Crm',
                                    arguments: {
                                      'TrNo': ntr.trNo,
                                      'ACB_ID': ntr.id,
                                      'Serial_No': ntr.serialNo,
                                      'acbDatabaseID': ntr.databaseID,
                                      'trDatabaseID': args['trDatabaseID'],
                                    });
                              },
                              label: const Text('OCB Crm',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white)),
                              icon: const Icon(Icons.add, color: Colors.white)))
                      : Container(),
                  ///////////////////////////Add SFE_IR button///////////////////////////////
                  ntr.etype == 'sf6'
                      ? Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FloatingActionButton.extended(
                              heroTag: 'addSF6IR',
                              onPressed: () {
                                EquipmentTypeList().getEquipUsetoDefaultValue();

                                Navigator.popAndPushNamed(
                                    context, '/add_ACB_Ir',
                                    arguments: {
                                      'TrNo': ntr.trNo,
                                      'ACB_ID': ntr.id,
                                      'Serial_No': ntr.serialNo,
                                      'acbDatabaseID': ntr.databaseID,
                                      'trDatabaseID': args['trDatabaseID'],
                                    });
                              },
                              label: const Text('SF6 Ir',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white)),
                              icon: const Icon(Icons.add, color: Colors.white)))
                      : Container(),
                  ///////////////////////////Add SFE_CRM button///////////////////////////////
                  ntr.etype == 'sf6'
                      ? Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FloatingActionButton.extended(
                              heroTag: 'addSF6CRM',
                              onPressed: () {
                                EquipmentTypeList().getEquipUsetoDefaultValue();
                                Navigator.popAndPushNamed(
                                    context, '/add_ACB_Crm',
                                    arguments: {
                                      'TrNo': ntr.trNo,
                                      'ACB_ID': ntr.id,
                                      'Serial_No': ntr.serialNo,
                                      'acbDatabaseID': ntr.databaseID,
                                      'trDatabaseID': args['trDatabaseID'],
                                    });
                              },
                              label: const Text('SF6 Crm',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white)),
                              icon: const Icon(Icons.add, color: Colors.white)))
                      : Container(),

                  ////////////////////////Add Timing For VCB/OCB/SFE  button//////////////////////////////

                  ntr.etype == 'acb'
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FloatingActionButton.extended(
                            heroTag: 'addVCBTiming',
                            onPressed: () {
                              EquipmentTypeList().getEquipUsetoDefaultValue();
                              Navigator.popAndPushNamed(
                                  context, '/add_VCB_timing',
                                  arguments: {
                                    'TrNo': ntr.trNo,
                                    'ACB_ID': ntr.id,
                                    'Serial_No': ntr.serialNo,
                                    'acbDatabaseID': ntr.databaseID,
                                    'trDatabaseID': args['trDatabaseID'],
                                  });
                            },
                            label: const Text('Add Timing',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white)),
                            icon: const Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                  ntr.etype == 'acb'
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FloatingActionButton.extended(
                            heroTag: 'addCR',
                            onPressed: () {
                              EquipmentTypeList().getEquipUsetoDefaultValue();
                              Navigator.popAndPushNamed(context, '/add_ACB_CR',
                                  arguments: {
                                    'TrNo': ntr.trNo,
                                    'ACB_ID': ntr.id,
                                    'Serial_No': ntr.serialNo,
                                    'acbDatabaseID': ntr.databaseID,
                                    'trDatabaseID': args['trDatabaseID'],
                                  });
                            },
                            label: const Text('Add CR Test',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white)),
                            icon: const Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                  ///////////////////////////////ALL-POP-UP-MENU-BUTTON-STARTS-FROM-HERE///////////////////////////
                ]));
              });
            }));
  }

  Function dialog_box_action(BuildContext context) {
    return (() {
      getX((AcbProvider x) => x.deleteACB(args['id']));
      //watchOnly((TestReportsProvider x) => {});
      Navigator.pop(context);
    });
  }

  // List<keyvaluemodelforName> gotuser = [];
  // var tested;
  // var verfiy;

  display_acb_details(AcbModel ntr) {
    //sl<UserProvider>().getTestVerDetails(ntr);

    var testedName = sl<UserProvider>().testedTO;

    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    // if (gotuser.contains(name) || gotuser.contains(DBid)) {
    //     gotuser.add(name);
    //     gotuser.add(DBid);
    //     print('Existed username');
    //   } else {
    //     if (DBid == test) {
    //       tested = name;
    //     } else if (DBid == ver) {
    //       verfiy = name;
    //     } else if (DBid == test && DBid == ver) {
    //       tested = null;
    //       ver = null;
    //     }
    //   }
    // }
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
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12)),
                    Divider(height: 5),
                    Text('Etype : ' + ntr.etype.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12)),
                    Divider(height: 5),
                    Text('TrNo : ' + ntr.trNo.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12)),
                    Divider(height: 5),
                    Text('Designation : ' + ntr.designation,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12)),
                    Divider(height: 5),
                    Text('Location : ' + ntr.location,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 12)),
                  ],
                ),
              ),
            ),
            Divider(height: 5, color: Colors.grey[100]),
            Card(
              elevation: 2,
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                          child: Text(
                            ' Nameplate  Details ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                fontSize: 12),
                          ),
                        ),
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
                            Text('Type : ' + ntr.type,
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Divider(height: 5),
                            Text(
                                'RatedSystemCurrent : ' +
                                    ntr.ratedSystemCurrent.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Divider(height: 5),
                            Text(
                                'RatedSystemVolt : ' +
                                    ntr.ratedSystemVoltage.toString() +
                                    ' kv',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Divider(height: 5),
                            Text('YOM : ' + ntr.yom.toString(),
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
                            Text(
                                'DueDateOfTest : ' +
                                    DateFormat('dd-MM-yyyy')
                                        .format(ntr.dueDateOfTesting)
                                        .toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Divider(height: 5),
                            Text('NoOfPoles : ' + ntr.noOfPoles.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            Divider(height: 5),
                            Text('IECstandard : ' + ntr.iecStandard.toString(),
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
                            ntr.etype == 'acb'
                                ? Container()
                                : Column(
                                    children: [
                                      Divider(height: 5),
                                      Text(
                                          'Motor Voltage : ' +
                                              ntr.motorVoltage.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 12)),
                                    ],
                                  ),
                            ntr.etype == 'acb'
                                ? Container()
                                : Column(
                                    children: [
                                      Divider(height: 5),
                                      Text(
                                          'close Coil & TripVolt : ' +
                                              ntr.closeCoilTripVolt.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 12)),
                                    ],
                                  ),

                            //////////////////////////
                            // Divider(height: 5),
                            // Text('TestedBy : ' + testedName.toString(),
                            //     style: const TextStyle(
                            //         color: Colors.black, fontSize: 12)),
                            // Divider(height: 5),
                            // Text('VerifiedBy : ' + verifiedName.toString(),
                            //     style: const TextStyle(
                            //         color: Colors.black, fontSize: 12)),
                            //////////////////////////

                            Divider(height: 5),
                            Text('WitnessedBy : ' + ntr.WitnessedBy.toString(),
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 12)),
                          ]),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  generate_list_of_ACB_IR(AcbModel ntr) {
    getX((AcbIrProvider x) => x.getAcbIrBySerialNo(ntr.serialNo));
    final List<AcbIrTestModel> reports =
        watchOnly((AcbIrProvider x) => x.acbIrSerialNoList);

    getX((AcbProvider x) => x.getAcbLocalData());
    final List<AcbModel> reportsForArgsfrom_Acbmodel =
        watchOnly((AcbProvider x) => x.acblocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((AcbIrProvider x) => x.getAcbIrEquipmentList());
    final List<AcbIrTestModel> reportsFormAcbIRLocalData =
        watchOnly((AcbIrProvider x) => x.acbIrEquipmentList);

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
                for (var i in reportsFormAcbIRLocalData) {
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
                                //add to remote database
                                var url =
                                    Uri.parse('${Env.URL_PREFIX}/irTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'rR': i.rR.toString(),
                                  'yY': i.yY.toString(),
                                  'ry': i.ry.toString(),
                                  'yb': i.yb.toString(),
                                  'br': i.br.toString(),
                                  'rn': i.rn.toString(),
                                  'yn': i.yn.toString(),
                                  'bn': i.bn.toString(),
                                  're': i.re.toString(),
                                  'ye': i.ye.toString(),
                                  'be': i.be.toString(),
                                  'ne': i.ne.toString(),
                                  'bB': i.bB.toString(),
                                  'nN': i.nN.toString(),
                                  'cb': i.cb.toString(),
                                  'cr': i.cr.toString(),
                                  'cy': i.cy.toString(),
                                  'equipmentUsed': i.EquipmentType.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<AcbIrProvider>().updateACBIr(
                                      AcbIrTestModel(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        ry: i.ry,
                                        yb: i.yb,
                                        br: i.br,
                                        rn: i.rn,
                                        yn: i.yn,
                                        bn: i.bn,
                                        re: i.re,
                                        ye: i.ye,
                                        be: i.be,
                                        ne: i.ne,
                                        rR: i.rR,
                                        yY: i.yY,
                                        bB: i.bB,
                                        nN: i.nN,
                                        cb: i.cb,
                                        cr: i.cr,
                                        cy: i.cy,
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
                Navigator.pushNamed(context, '/detail_ACB_IR', arguments: {
                  'id': report.id,
                  'ACB_ID': ntr.id,
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_ACB_IR', arguments: {
                  'id': report.id,
                  'ACB_ID': ntr.id,
                  'trDatabaseID': args['trDatabaseID'],
                });
              }
            },
            child: Card(
              color: Colors.white,
              elevation: 5,
              margin: EdgeInsets.fromLTRB(20, 10, 10, 20),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 100, 0),
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
                              HeaderFunctionForHeadLines(ntr),
                            ],
                          )
                        : Row(
                            children: [
                              Icon(
                                Icons.circle_rounded,
                                color: Color.fromARGB(255, 9, 230, 9),
                                size: 10.0,
                              ),
                              HeaderFunctionForHeadLines(ntr),
                            ],
                          ),

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
                    Text('bB : ' + report.bB.toString(),
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

  generate_list_of_ACB_crm(AcbModel ntr) {
    getX((AcbCrmProvider x) => x.getAcbCrmBySerialNo(ntr.serialNo));
    final List<AcbCrmTestModel> reports =
        watchOnly((AcbCrmProvider x) => x.acbCrmSerialNoList);

    getX((AcbProvider x) => x.getAcbLocalData());
    final List<AcbModel> reportsForArgsfrom_Acbmodel =
        watchOnly((AcbProvider x) => x.acblocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((AcbCrmProvider x) => x.getAcbCrmEquipmentList());
    final List<AcbCrmTestModel> reportsFormCrmLocalData =
        watchOnly((AcbCrmProvider x) => x.acbCrmEquipmentList);

    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return GestureDetector(
            onTap: () async {
              DataConnectionStatus internet_status = await CheckInternet();

              if (internet_status == DataConnectionStatus.connected) {
                for (var i in reportsFormCrmLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print('tDatabaseID >> ');
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_Acbmodel) {
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

                                //add to remote database
                                var url =
                                    Uri.parse('${Env.URL_PREFIX}/crmTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'rR1': i.rR.toString(),
                                  'yY1': i.yY.toString(),
                                  'bB1': i.bB.toString(),
                                  'nN1': i.nN.toString(),
                                  'equipmentUsed': i.EquipmentType.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<AcbCrmProvider>().updateACBCrm(
                                      AcbCrmTestModel(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        rR: i.rR,
                                        yY: i.yY,
                                        bB: i.bB,
                                        nN: i.nN,
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
                Navigator.pushNamed(context, '/detail_ACB_CRM', arguments: {
                  'id': report.id,
                  'ACB_ID': ntr.id,
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (internet_status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_ACB_CRM', arguments: {
                  'id': report.id,
                  'ACB_ID': ntr.id,
                  'trDatabaseID': args['trDatabaseID'],
                });
              }
            },
            child: Card(
              // color: Color.fromARGB(255, 42, 54, 76),
              color: Colors.white,
              elevation: 5,
              margin: EdgeInsets.fromLTRB(20, 10, 10, 20),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 100, 0),
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
                              HeaderFunctionForHeadLinesACBcrm(ntr),
                            ],
                          )
                        : Row(
                            children: [
                              Icon(
                                Icons.circle_rounded,
                                color: Color.fromARGB(255, 9, 230, 9),
                                size: 10.0,
                              ),
                              HeaderFunctionForHeadLinesACBcrm(ntr),
                            ],
                          ),

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
                    Text('bB : ' + report.bB.toString(),
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

  generate_list_of_ACB_CR(AcbModel ntr) {
    getX((AcbCRProvider x) => x.getAcbCRBySerialNo(ntr.serialNo));
    final List<AcbCRTestModel> reports =
        watchOnly((AcbCRProvider x) => x.acbCRSerialNoList);

    getX((AcbProvider x) => x.getAcbLocalData());
    final List<AcbModel> reportsForArgsfrom_Acbmodel =
        watchOnly((AcbProvider x) => x.acblocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((AcbCRProvider x) => x.getAcbCrEquipmentList());
    final List<AcbCRTestModel> reportsFormCrLocalData =
        watchOnly((AcbCRProvider x) => x.acbCRlocaldataList);

    return Container(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: reports.length,
            itemBuilder: (context, index) {
              final report = reports[index];
              return GestureDetector(
                onTap: () async {
                  // ---------------------------------------------------

                  for (var i in reportsFormCrLocalData) {
                    if (i.id == report.id) {
                      if (report.databaseID == 0 || i.databaseID == 0) {
                        var tempvar = i.trNo;
                        print(tempvar); // current TrNo of Acbcrm Test

                        for (var t in reportsForArgsfrom_TestReports) {
                          if (t.trNo == tempvar) {
                            var tDatabaseID = t.databaseID;
                            print(
                                tDatabaseID); // current TrNo of TestReport args

                            for (var q in reportsForArgsfrom_Acbmodel) {
                              if (q.trNo == tempvar) {
                                var argsSerialNo = q.serialNo;
                                print(argsSerialNo); // current serial Acb args

                                if (report.serialNo == argsSerialNo &&
                                    i.serialNo == argsSerialNo) {
                                  var argsSnoDB = q.databaseID;

                                  //add to remote database
                                  var url =
                                      Uri.parse('${Env.URL_PREFIX}/crTest/');
                                  var response = await http.post(url, body: {
                                    'trNo': tDatabaseID.toString(),
                                    'serialNo': argsSnoDB.toString(),
                                    'motorCoil': i.motorCoil.toString(),
                                    'closeCoil': i.closeCoil.toString(),
                                    'tripCoil': i.tripCoil.toString(),
                                    'equipmentUsed': i.EquipmentType.toString(),
                                  }, headers: {
                                    'Authorization': 'Bearer $acc_token',
                                  }).then((value) {
                                    sl<AcbCRProvider>().updateACBCR(
                                        AcbCRTestModel(
                                          id: i.id,
                                          trNo: i.trNo,
                                          serialNo: i.serialNo,
                                          motorCoil: i.motorCoil,
                                          closeCoil: i.closeCoil,
                                          tripCoil: i.tripCoil,
                                          EquipmentType:
                                              i.EquipmentType.toString(),
                                          databaseID:
                                              json.decode(value.body)['id'],
                                          lastUpdated: DateTime.now(),
                                        ),
                                        report.id);
                                    print(
                                        'Responsestatus: ${value.statusCode}');
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
                  Navigator.pushNamed(context, '/detail_ACB_CR', arguments: {
                    'id': report.id,
                    'ACB_ID': ntr.id,
                    'trDatabaseID': args['trDatabaseID'],
                  });
                },
                child: Card(
                  // color: Color.fromARGB(255, 42, 54, 76),
                  color: Colors.white,
                  elevation: 5,
                  margin: EdgeInsets.fromLTRB(20, 10, 10, 20),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 100, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ////////////////////////CARD-TITLE-Controller////////////////////
                        report.databaseID == 0
                            ? Row(
                                children: [
                                  Icon(
                                    Icons.replay_circle_filled_rounded,
                                    color: Color.fromARGB(255, 188, 24, 13),
                                    size: 15.0,
                                  ),
                                  HeaderFunctionForHeadLinesACBcr(ntr),
                                ],
                              )
                            : Row(
                                children: [
                                  Icon(
                                    Icons.circle_rounded,
                                    color: Color.fromARGB(255, 9, 230, 9),
                                    size: 10.0,
                                  ),
                                  HeaderFunctionForHeadLinesACBcr(ntr),
                                ],
                              ),
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
                        Text('motor coil : ' + report.motorCoil.toString(),
                            style: const TextStyle(
                                color: Colors.black, fontSize: 13)),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }

  generate_list_of_Vcb_timing(AcbModel ntr) {
    getX((VcbTimingProvider x) => x.getVcbTimingBySerialNo(ntr.serialNo));
    final List<VcbTimingTestModel> reports =
        watchOnly((VcbTimingProvider x) => x.vcbTimingSerialNoList);

    getX((AcbProvider x) => x.getAcbLocalData());
    final List<AcbModel> reportsForArgsfrom_Acbmodel =
        watchOnly((AcbProvider x) => x.acblocaldataList);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((VcbTimingProvider x) => x.getVcbtimeEquipmentList());
    final List<VcbTimingTestModel> reportsFormtimeLocalData =
        watchOnly((VcbTimingProvider x) => x.vcbTiminglocaldataList);

    return Container(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: reports.length,
          itemBuilder: (context, index) {
            final report = reports[index];
            return GestureDetector(
              onTap: () async {
                // ----------------------------------------------------------

                for (var i in reportsFormtimeLocalData) {
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
                              print(argsSerialNo); // current serialno Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                //add to remote database
                                var url =
                                    Uri.parse('${Env.URL_PREFIX}/timingTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'closeY': i.closeY.toString(),
                                  'closeB': i.closeB.toString(),
                                  'closeR': i.closeR.toString(),
                                  'tc1OpenR': i.tc1OpenR.toString(),
                                  'tc1OpenY': i.tc1OpenY.toString(),
                                  'tc1OpenB': i.tc1OpenB.toString(),
                                  'tc1CloseR': i.tc1CloseR.toString(),
                                  'tc1CloseY': i.tc1CloseY.toString(),
                                  'tc1CloseB': i.tc1CloseB.toString(),
                                  'tc2OpenR': i.tc2OpenR.toString(),
                                  'tc2OpenY': i.tc2OpenY.toString(),
                                  'tc2OpenB': i.tc2OpenB.toString(),
                                  'tc2CloseR': i.tc2CloseR.toString(),
                                  'tc2CloseY': i.tc2CloseY.toString(),
                                  'tc2CloseB': i.tc2CloseB.toString(),
                                  'equipmentUsed': i.EquipmentType.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<VcbTimingProvider>().updateVCBTiming(
                                      VcbTimingTestModel(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        closeY: i.closeY,
                                        closeB: i.closeB,
                                        closeR: i.closeR,
                                        tc1OpenR: i.tc1OpenR,
                                        tc1OpenY: i.tc1OpenY,
                                        tc1OpenB: i.tc1OpenB,
                                        tc1CloseR: i.tc1CloseR,
                                        tc1CloseY: i.tc1CloseY,
                                        tc1CloseB: i.tc1CloseB,
                                        tc2OpenR: i.tc2OpenR,
                                        tc2OpenY: i.tc2OpenY,
                                        tc2OpenB: i.tc2OpenB,
                                        tc2CloseR: i.tc2CloseR,
                                        tc2CloseY: i.tc2CloseY,
                                        tc2CloseB: i.tc2CloseB,
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

                Navigator.pushNamed(context, '/detail_VCB_timing', arguments: {
                  'id': report.id,
                  'ACB_ID': ntr.id,
                  'trDatabaseID': args['trDatabaseID'],
                });
              },
              child: Card(
                // color: Color.fromARGB(255, 42, 54, 76),

                elevation: 5,
                margin: EdgeInsets.fromLTRB(20, 10, 10, 20),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 100, 0),
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
                                HeaderFunctionForHeadLinesVcbtime(ntr),
                              ],
                            )
                          : Row(
                              children: [
                                Icon(
                                  Icons.circle_rounded,
                                  color: Color.fromARGB(255, 9, 230, 9),
                                  size: 10.0,
                                ),
                                HeaderFunctionForHeadLinesVcbtime(ntr),
                              ],
                            ),
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
                      Text('CloseR : ' + report.closeR.toString(),
                          style: const TextStyle(
                              color: Colors.black, fontSize: 13)),
                    ],
                  ),
                ),
              ),
            );
          }),
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
                      getX((AcbProvider x) => x.deleteACB(args['id']));
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

  HeaderFunctionForHeadLines(AcbModel ntr) {
    return Column(
      children: [
        ntr.etype == 'acb'
            ? const Text(
                ' ACB IR Details',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 11.5,
                    letterSpacing: 1.5),
              )
            : Container(),
        ntr.etype == 'vcb'
            ? const Text(
                ' VCB IR Details',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 11.5,
                    letterSpacing: 1.5),
              )
            : Container(),
        ntr.etype == 'ocb'
            ? const Text(
                ' OCB IR Details',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 11.5,
                    letterSpacing: 1.5),
              )
            : Container(),
        ntr.etype == 'sf6'
            ? const Text(
                ' SF6 IR Details',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 11.5,
                    letterSpacing: 1.5),
              )
            : Container(),
      ],
    );
  }

  HeaderFunctionForHeadLinesACBcrm(AcbModel ntr) {
    return Column(
      children: [
        ntr.etype == 'acb'
            ? const Text(
                ' ACB CRM Details',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 11.5,
                    letterSpacing: 1.5),
              )
            : Container(),
        ntr.etype == 'vcb'
            ? const Text(
                ' VCB CRM Details',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 11.5,
                    letterSpacing: 1.5),
              )
            : Container(),
        ntr.etype == 'ocb'
            ? const Text(
                ' OCB CRM Details',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 11.5,
                    letterSpacing: 1.5),
              )
            : Container(),
        ntr.etype == 'sf6'
            ? const Text(
                ' SF6 CRM Details',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 11.5,
                    letterSpacing: 1.5),
              )
            : Container(),
      ],
    );
  }

  HeaderFunctionForHeadLinesACBcr(AcbModel ntr) {
    return Column(
      children: [
        ntr.etype == 'acb'
            ? const Text(
                ' ACB CR Details',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 11.5,
                    letterSpacing: 1.5),
              )
            : Container(),
        ntr.etype == 'vcb'
            ? const Text(
                ' VCB CR Details',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 11.5,
                    letterSpacing: 1.5),
              )
            : Container(),
        ntr.etype == 'ocb'
            ? const Text(
                ' OCB CR Details',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 11.5,
                    letterSpacing: 1.5),
              )
            : Container(),
        ntr.etype == 'sf6'
            ? const Text(
                ' SF6 CR Details',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 11.5,
                    letterSpacing: 1.5),
              )
            : Container(),
      ],
    );
  }

  HeaderFunctionForHeadLinesVcbtime(AcbModel ntr) {
    return Column(
      children: [
        ntr.etype == 'vcb'
            ? const Text(
                ' VCB Time Details',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 11.5,
                    letterSpacing: 1.5),
              )
            : Container(),
        ntr.etype == 'ocb'
            ? const Text(
                ' OCB Time Details',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 11.5,
                    letterSpacing: 1.5),
              )
            : Container(),
        ntr.etype == 'sf6'
            ? const Text(
                ' SF6 Time Details',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 11.5,
                    letterSpacing: 1.5),
              )
            : Container(),
      ],
    );
  }
}

class keyvaluemodelforName {
  int k;
  String v;
  keyvaluemodelforName({this.k, this.v});
}
