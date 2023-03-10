// ignore_for_file: prefer_const_constructors, missing_return, prefer_interpolation_to_compose_strings, file_names, use_build_context_synchronously

// import 'dart:html';

import 'dart:convert';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/CT/ct_core_model.dart';
import 'package:flutter_testreports/features/testreport/data/models/equipment/CT/ct_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/ct_provider/ct_core_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/ct_provider/ct_provider.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:readmore/readmore.dart';
import '../../../../../env.sample.dart';
import '../../../../../injection_container.dart';
import '../../../data/datasources/inventory_remote_database.dart';
import '../../../data/datasources/user_remote_database.dart';
import '../../../data/models/equipment/CT/ct_core_ir_model.dart';
import '../../../data/models/equipment/CT/ct_core_kvp_model.dart';
import '../../../data/models/equipment/CT/ct_core_p_model.dart';
import '../../../data/models/equipment/CT/ct_core_r_model.dart';
import '../../../data/models/equipment/CT/ct_core_wr_model.dart';
import '../../../data/models/test_report_model.dart';
import '../../providers/ct_provider/ct_core_ir_provider.dart';
import '../../providers/ct_provider/ct_core_kvp_provider.dart';
import '../../providers/ct_provider/ct_core_p_provider.dart';
import '../../providers/ct_provider/ct_core_r_provider.dart';
import '../../providers/ct_provider/ct_core_wr_provider.dart';
import '../../providers/equipment_acb_provider/inventory_provider.dart';
import '../../providers/equipment_acb_provider/test_report_provider.dart';
import '../../providers/user_table_provider.dart';
import '../dropdown_All/MegaGigaTeraRadioButton/simplified_MGT_polarityCT.dart';
import '../dropdown_All/a_location_enum_drop_list.dart';
import '../dropdown_All/a_make_drop_list.dart';
import '../dropdown_All/equipmentUsed.dart';
import '../dropdown_All/no_of_poles_drop_list.dart';
import '../dropdown_All/responsive_tool/google_sign_in_out/InternetConnChecker.dart';
import '../dropdown_All/testedbyuser.dart';
import '../dropdown_All/vcb_ocb_sfe_rsv_kv_drop.dart';
import '../dropdown_All/verifiedbyuser.dart';
import '../dropdown_All/yom_drop_list.dart';
import '../equipment_acb/detail_test_report_page.dart';

class Detail_CT_Page extends StatelessWidget with GetItMixin {
  Map args = {};
  CTModel ntr;
  var kvp = 0;
  var coreCheckNull = false;

  passkvp() {
    return kvp;
  }

  Detail_CT_Page(@required this.args, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getX((CTProvider x) => x.getCTByID(args['id']));
    final CTModel ntr = watchOnly((CTProvider x) => x.ctModel);

    print('kvp' + kvp.toString());

    var mob = const Text('CT  Details', style: TextStyle(fontSize: 15));
    var desk = const Text('CT  Details', style: TextStyle(fontSize: 20));
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
                  Navigator.popAndPushNamed(context, '/edit_CT',
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
                          child: display_CT_details(ntr)),
                      SizedBox(
                          width: 500,
                          height: 100,
                          child: generate_list_of_CT_core(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_CTcoreIR(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_CTcoreWR(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_CTcoreP(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_CTcoreR(ntr)),
                      SizedBox(
                          width: 500,
                          height: 130,
                          child: generate_list_of_CTcoreKVP(ntr)),
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
                          child: display_CT_details(ntr)),
                      SizedBox(
                          width: 350,
                          height: 100,
                          child: generate_list_of_CT_core(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_CTcoreIR(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_CTcoreWR(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_CTcoreP(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_CTcoreR(ntr)),
                      SizedBox(
                          width: 350,
                          height: 130,
                          child: generate_list_of_CTcoreKVP(ntr)),
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
                        heroTag: 'addCTcore',
                        onPressed: () {
                          load_Inventry_User();

                          Navigator.popAndPushNamed(context, '/add_CT_core',
                              arguments: {
                                'TrNo': ntr.trNo,
                                'CT_ID': ntr.id,
                                'serial_no_bph': ntr.serialNo_Bph,
                                'ctDatabaseID': ntr.databaseID,
                                'trDatabaseID': args['trDatabaseID'],
                              });
                        },
                        label: const Text('Add CT core',
                            style:
                                TextStyle(fontSize: 10, color: Colors.white)),
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                    coreCheckNull
                        ? Container()
                        : Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FloatingActionButton.extended(
                                  heroTag: 'addCTcoreIR',
                                  onPressed: () async {
                                    load_Inventry_User();

                                    Navigator.popAndPushNamed(
                                        context, '/add_CTcoreIR',
                                        arguments: {
                                          'TrNo': ntr.trNo,
                                          'CT_ID': ntr.id,
                                          'serial_no_bph': ntr.serialNo_Bph,
                                          'ctDatabaseID': ntr.databaseID,
                                          'trDatabaseID': args['trDatabaseID'],
                                        });
                                  },
                                  label: const Text('Add CT IR',
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.white)),
                                  icon: const Icon(Icons.add,
                                      color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FloatingActionButton.extended(
                                  heroTag: 'addCTcoreWR',
                                  onPressed: () async {
                                    load_Inventry_User();

                                    Navigator.popAndPushNamed(
                                        context, '/add_CTcoreWR',
                                        arguments: {
                                          'TrNo': ntr.trNo,
                                          'CT_ID': ntr.id,
                                          'serial_no_bph': ntr.serialNo_Bph,
                                          'ctDatabaseID': ntr.databaseID,
                                          'trDatabaseID': args['trDatabaseID'],
                                        });
                                  },
                                  label: const Text('Add CT WR',
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.white)),
                                  icon: const Icon(Icons.add,
                                      color: Colors.white),
                                ),
                              ),
                              ///////////////////////////////////////////////////////////
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FloatingActionButton.extended(
                                  heroTag: 'addCTcoreP',
                                  onPressed: () async {
                                    load_Inventry_User();
                                    // MGT().get_MGT_default_value();
                                    MGT().functionR_1S1_1S2_null();
                                    MGT().functionR_2S1_2S2_null();
                                    MGT().functionR_3S1_3S2_null();
                                    MGT().functionR_4S1_4S2_null();
                                    MGT().functionR_5S1_5S2_null();
                                    MGT().functionY_1S1_1S2_null();
                                    MGT().functionY_2S1_2S2_null();
                                    MGT().functionY_3S1_3S2_null();
                                    MGT().functionY_4S1_4S2_null();
                                    MGT().functionY_5S1_5S2_null();
                                    MGT().functionB_1S1_1S2_null();
                                    MGT().functionB_2S1_2S2_null();
                                    MGT().functionB_3S1_3S2_null();
                                    MGT().functionB_4S1_4S2_null();
                                    MGT().functionB_5S1_5S2_null();

                                    Navigator.popAndPushNamed(
                                        context, '/add_CTcoreP',
                                        arguments: {
                                          'TrNo': ntr.trNo,
                                          'CT_ID': ntr.id,
                                          'serial_no_bph': ntr.serialNo_Bph,
                                          'ctDatabaseID': ntr.databaseID,
                                          'trDatabaseID': args['trDatabaseID'],
                                        });
                                  },
                                  label: const Text('Add CT Polarity',
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.white)),
                                  icon: const Icon(Icons.add,
                                      color: Colors.white),
                                ),
                              ),
                              ///////////////////////////////////////////////////////////
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: FloatingActionButton.extended(
                                  heroTag: 'addCTcoreR',
                                  onPressed: () async {
                                    load_Inventry_User();

                                    Navigator.popAndPushNamed(
                                        context, '/add_CTcoreR',
                                        arguments: {
                                          'TrNo': ntr.trNo,
                                          'CT_ID': ntr.id,
                                          'serial_no_bph': ntr.serialNo_Bph,
                                          'ctDatabaseID': ntr.databaseID,
                                          'trDatabaseID': args['trDatabaseID'],
                                        });
                                  },
                                  label: const Text('Add CT Ratio',
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.white)),
                                  icon: const Icon(Icons.add,
                                      color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: FloatingActionButton.extended(
                                  heroTag: 'addCTcoreKVP',
                                  onPressed: () async {
                                    load_Inventry_User();

                                    Navigator.popAndPushNamed(
                                        context, '/add_CTcoreKVP',
                                        arguments: {
                                          'TrNo': ntr.trNo,
                                          'CT_ID': ntr.id,
                                          'serial_no_bph': ntr.serialNo_Bph,
                                          'ctDatabaseID': ntr.databaseID,
                                          'trDatabaseID': args['trDatabaseID'],
                                        });
                                  },
                                  label: Text('Add CT knee point volt',
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.white)),
                                  icon: Icon(Icons.add, color: Colors.white),
                                ),
                              )
                            ],
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
      getX((CTProvider x) => x.deleteCT(args['id']));
      Navigator.pop(context);
    });
  }

  ReadMoreDisplay_CT_details(CTModel ntr) {
    var datetime =
        DateFormat('dd-MM-yyyy').format(ntr.dateOfTesting).toString();

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
        'serialNo_Bph : ' +
        ntr.serialNo_Bph +
        '\n' +
        'serialNo_Rph : ' +
        ntr.serialNo_Rph +
        '\n' +
        'serialNo_Yph : ' +
        ntr.serialNo_Yph +
        '\n' +
        'Panel : ' +
        ntr.panel +
        '\n' +
        'Make : ' +
        ntr.make +
        '\n' +
        'pRatio : ' +
        ntr.pRatio.toString() +
        '\n' +
        'sRatio : ' +
        ntr.sRatio.toString() +
        '\n' +
        'ratedVoltage : ' +
        ntr.ratedVoltage.toString() +
        '\n' +
        'noOfCores : ' +
        ntr.noOfCores.toString() +
        '\n' +
        'noOfTaps : ' +
        ntr.noOfTaps.toString() +
        '\n' +
        'vk : ' +
        ntr.vk.toString() +
        '\n' +
        'connectedTap : ' +
        ntr.connectedTap +
        '\n' +
        'yom : ' +
        ntr.yom.toString() +
        '\n' +
        'DateOfTest : ' +
        datetime +
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

  Future<void> load_Inventry_User() async {
    await sl<UserRemoteDatasourceImpl>().getNewUsers();
    sl<UserProvider>().FutureGetUserLocalDataList();
    await sl<InventoryRemoteDatasourceImpl>().getNewEquipments();
    sl<InventoryProvider>().FutureGetEquipmentLocalDataList();

    TestedByUser().getTestByUsertoDefaultValue();
    VerifiedByUser().getTestByUsertoDefaultValue();
    vcb_ocb_sfe_RSV().getRSVtoDefaultValue();
    no_of_poles_drop().get_No_Of_Poles_Default_value();
    yom_drop().get_YOM_Default_value();
    make_drop_lits().get_Make_Default_value();
    Location_dropDown().get_selectedValueLocation_Default_value();
    EquipmentTypeList().getEquipUsetoDefaultValue();
  }

  display_CT_details(CTModel ntr) {
    return Container(
      alignment: Alignment.center,
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(80, 10, 80, 10),
          child: ReadMoreText(
            ReadMoreDisplay_CT_details(ntr),
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
                      getX((CTProvider x) => x.deleteCT(args['id']));
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'YES',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
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

  generate_list_of_CT_core(CTModel ntr) {
    getX((CT_core_Provider x) => x.getCTcoreByctNoID(ntr.id));
    final List<CT_core_Model> reports =
        watchOnly((CT_core_Provider x) => x.ct_core_ctNoIDList);

    // getX((CTProvider x) => x.getCTLocalData());
    // final List<CTModel> reportsForArgsfrom_CTmodel =
    //     watchOnly((CTProvider x) => x.ctlocaldataist);

    // getX((TestReportsProvider x) => x.getReportFuture());
    // final List<TestReportModel> reportsForArgsfrom_TestReports =
    //     watchOnly((TestReportsProvider x) => x.reportListFuture);

    // getX((CT_core_Provider x) => x.getCTcoreEquipmentList());
    // final List<CT_core_Model> reportsFormCTirLocalData =
    //     watchOnly((CT_core_Provider x) => x.ct_core_loacaldataList);

    if (reports.length == 0) {
      coreCheckNull = true;
    } else {
      coreCheckNull = false;
    }

    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 20, 0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/detail_CT_core', arguments: {
                'id': report.id,
                'CT_ID': report.databaseID,
                'serial_no_bph': ntr.serialNo_Bph,
                'ctDatabaseID': args['ctDatabaseID'],
                'trDatabaseID': args['trDatabaseID'],
              });
            },
            child: Card(
              color: Colors.white,
              elevation: 2,
              //margin: EdgeInsets.fromLTRB(20, 10, 0, 70),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 40, 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ntr.etype == 'CT'
                        ? const Text(
                            'CT core Details ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 11.5,
                                letterSpacing: 1.5),
                          )
                        : Container(),
                    Text('coreNo : ' + report.coreNo.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 13)),
                    Text('ctNo : ' + report.ctNo.toString(),
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

  generate_list_of_CTcoreIR(CTModel ntr) {
    getX((CTcoreIRProvider x) => x.getCTcoreIR_BySerialNo(ntr.serialNo_Bph));
    final List<CTcoreIRModel> reports =
        watchOnly((CTcoreIRProvider x) => x.ctcoreIR_serialNoList);

    getX((CTProvider x) => x.getCTLocalData());
    final List<CTModel> reportsForArgsfrom_CTmodel =
        watchOnly((CTProvider x) => x.ctlocaldataist);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((CTcoreIRProvider x) => x.getCTirEquipmentList());
    final List<CTcoreIRModel> reportsFormCTirLocalData =
        watchOnly((CTcoreIRProvider x) => x.ctcoreIR_localdataList);

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
                for (var i in reportsFormCTirLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_CTmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo_Bph;
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                // add to remote database
                                var url = Uri.parse(
                                    '${Env.URL_PREFIX}/ctCoreIrTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                  'peR': i.peR.toString(),
                                  'peY': i.peY.toString(),
                                  'peB': i.peB.toString(),
                                  'pc1R': i.pc1R.toString(),
                                  'pc2R': i.pc2R.toString(),
                                  'pc3R': i.pc3R.toString(),
                                  'pc4R': i.pc4R.toString(),
                                  'pc5R': i.pc5R.toString(),
                                  'pc1Y': i.pc1Y.toString(),
                                  'pc2Y': i.pc2Y.toString(),
                                  'pc3Y': i.pc3Y.toString(),
                                  'pc4Y': i.pc4Y.toString(),
                                  'pc5Y': i.pc5Y.toString(),
                                  'pc1B': i.pc1B.toString(),
                                  'pc2B': i.pc2B.toString(),
                                  'pc3B': i.pc3B.toString(),
                                  'pc4B': i.pc4B.toString(),
                                  'pc5B': i.pc5B.toString(),
                                  'c1eR': i.c1eR.toString(),
                                  'c2eR': i.c2eR.toString(),
                                  'c3eR': i.c3eR.toString(),
                                  'c4eR': i.c4eR.toString(),
                                  'c5eR': i.c5eR.toString(),
                                  'c1eY': i.c1eY.toString(),
                                  'c2eY': i.c2eY.toString(),
                                  'c3eY': i.c3eY.toString(),
                                  'c4eY': i.c4eY.toString(),
                                  'c5eY': i.c5eY.toString(),
                                  'c1eB': i.c1eB.toString(),
                                  'c2eB': i.c2eB.toString(),
                                  'c3eB': i.c3eB.toString(),
                                  'c4eB': i.c4eB.toString(),
                                  'c5eB': i.c5eB.toString(),
                                  'c1c2R': i.c1c2R.toString(),
                                  'c1c2Y': i.c1c2Y.toString(),
                                  'c1c2B': i.c1c2B.toString(),
                                  'c2c3R': i.c2c3R.toString(),
                                  'c2c3Y': i.c2c3Y.toString(),
                                  'c2c3B': i.c2c3B.toString(),
                                  'c3c4R': i.c3c4R.toString(),
                                  'c3c4Y': i.c3c4Y.toString(),
                                  'c3c4B': i.c3c4B.toString(),
                                  'c4c5R': i.c4c5R.toString(),
                                  'c4c5Y': i.c4c5Y.toString(),
                                  'c4c5B': i.c4c5B.toString(),
                                  'clc1R': i.clc1R.toString(),
                                  'clc1Y': i.clc1Y.toString(),
                                  'clc1B': i.clc1B.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<CTcoreIRProvider>().updateCTcoreIR(
                                      CTcoreIRModel(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        peR: i.peR,
                                        peY: i.peY,
                                        peB: i.peB,
                                        pc1R: i.pc1R,
                                        pc2R: i.pc2R,
                                        pc3R: i.pc3R,
                                        pc4R: i.pc4R,
                                        pc5R: i.pc5R,
                                        pc1Y: i.pc1Y,
                                        pc2Y: i.pc2Y,
                                        pc3Y: i.pc3Y,
                                        pc4Y: i.pc4Y,
                                        pc5Y: i.pc5Y,
                                        pc1B: i.pc1B,
                                        pc2B: i.pc2B,
                                        pc3B: i.pc3B,
                                        pc4B: i.pc4B,
                                        pc5B: i.pc5B,
                                        c1eR: i.c1eR,
                                        c2eR: i.c2eR,
                                        c3eR: i.c3eR,
                                        c4eR: i.c4eR,
                                        c5eR: i.c5eR,
                                        c1eY: i.c1eY,
                                        c2eY: i.c2eY,
                                        c3eY: i.c3eY,
                                        c4eY: i.c4eY,
                                        c5eY: i.c5eY,
                                        c1eB: i.c1eB,
                                        c2eB: i.c2eB,
                                        c3eB: i.c3eB,
                                        c4eB: i.c4eB,
                                        c5eB: i.c5eB,
                                        c1c2R: i.c1c2R,
                                        c1c2Y: i.c1c2Y,
                                        c1c2B: i.c1c2B,
                                        c2c3R: i.c2c3R,
                                        c2c3Y: i.c2c3Y,
                                        c2c3B: i.c2c3B,
                                        c3c4R: i.c3c4R,
                                        c3c4Y: i.c3c4Y,
                                        c3c4B: i.c3c4B,
                                        c4c5R: i.c4c5R,
                                        c4c5Y: i.c4c5Y,
                                        c4c5B: i.c4c5B,
                                        clc1R: i.clc1R,
                                        clc1Y: i.clc1Y,
                                        clc1B: i.clc1B,
                                        equipmentUsed: i.serialNo,
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
                Navigator.pushNamed(context, '/detail_CTcoreIR', arguments: {
                  'id': report.id,
                  'CT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo_Bph,
                  'ctDatabaseID': args['ctDatabaseID'],
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_CTcoreIR', arguments: {
                  'id': report.id,
                  'CT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo_Bph,
                  'ctDatabaseID': args['ctDatabaseID'],
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
                              ntr.etype == 'CT'
                                  ? const Text(
                                      ' CT IR Details ',
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
                              ntr.etype == 'CT'
                                  ? const Text(
                                      ' CT IR Details ',
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

  generate_list_of_CTcoreWR(CTModel ntr) {
    getX((CTcoreWRProvider x) => x.getCTcoreWR_BySerialNo(ntr.serialNo_Bph));
    final List<CTcoreWRModel> reports =
        watchOnly((CTcoreWRProvider x) => x.ctcoreWR_serialNoList);

    getX((CTProvider x) => x.getCTLocalData());
    final List<CTModel> reportsForArgsfrom_CTmodel =
        watchOnly((CTProvider x) => x.ctlocaldataist);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((CTcoreWRProvider x) => x.getCTlocaldataEquipmentList());
    final List<CTcoreWRModel> reportsFormCTwrLocalData =
        watchOnly((CTcoreWRProvider x) => x.ctcoreWR_localdataList);

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
                for (var i in reportsFormCTwrLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_CTmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo_Bph;
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                // add to remote database
                                var url = Uri.parse(
                                    '${Env.URL_PREFIX}/ctCoreWrTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                  'R_1S1_1S2': i.R_1S1_1S2.toString(),
                                  'R_2S1_2S2': i.R_2S1_2S2.toString(),
                                  'R_3S1_3S2': i.R_3S1_3S2.toString(),
                                  'R_4S1_4S2': i.R_4S1_4S2.toString(),
                                  'R_5S1_5S2': i.R_5S1_5S2.toString(),
                                  'Y_1S1_1S2': i.Y_1S1_1S2.toString(),
                                  'Y_2S1_2S2': i.Y_2S1_2S2.toString(),
                                  'Y_3S1_3S2': i.Y_3S1_3S2.toString(),
                                  'Y_4S1_4S2': i.Y_4S1_4S2.toString(),
                                  'Y_5S1_5S2': i.Y_5S1_5S2.toString(),
                                  'B_1S1_1S2': i.B_1S1_1S2.toString(),
                                  'B_2S1_2S2': i.B_2S1_2S2.toString(),
                                  'B_3S1_3S2': i.B_3S1_3S2.toString(),
                                  'B_4S1_4S2': i.B_4S1_4S2.toString(),
                                  'B_5S1_5S2': i.B_5S1_5S2.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<CTcoreWRProvider>().updateCTcoreWR(
                                      CTcoreWRModel(
                                          id: i.id,
                                          trNo: i.trNo,
                                          serialNo: i.serialNo,
                                          R_1S1_1S2: i.R_1S1_1S2,
                                          R_2S1_2S2: i.R_2S1_2S2,
                                          R_3S1_3S2: i.R_3S1_3S2,
                                          R_4S1_4S2: i.R_4S1_4S2,
                                          R_5S1_5S2: i.R_5S1_5S2,
                                          Y_1S1_1S2: i.Y_1S1_1S2,
                                          Y_2S1_2S2: i.Y_2S1_2S2,
                                          Y_3S1_3S2: i.Y_3S1_3S2,
                                          Y_4S1_4S2: i.Y_4S1_4S2,
                                          Y_5S1_5S2: i.Y_5S1_5S2,
                                          B_1S1_1S2: i.B_1S1_1S2,
                                          B_2S1_2S2: i.B_2S1_2S2,
                                          B_3S1_3S2: i.B_3S1_3S2,
                                          B_4S1_4S2: i.B_4S1_4S2,
                                          B_5S1_5S2: i.B_5S1_5S2,
                                          equipmentUsed: i.equipmentUsed,
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
                // -------------------------------------------------------
                Navigator.pushNamed(context, '/detail_CTcoreWR', arguments: {
                  'id': report.id,
                  'CT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo_Bph,
                  'ctDatabaseID': args['ctDatabaseID'],
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_CTcoreWR', arguments: {
                  'id': report.id,
                  'CT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo_Bph,
                  'ctDatabaseID': args['ctDatabaseID'],
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
                              ntr.etype == 'CT'
                                  ? const Text(
                                      'CT WR Details ',
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
                              ntr.etype == 'CT'
                                  ? const Text(
                                      'CT WR Details ',
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

  generate_list_of_CTcoreP(CTModel ntr) {
    getX((CTcorePProvider x) => x.getCTcoreP_BySerialNo(ntr.serialNo_Bph));
    final List<CTcorePModel> reports =
        watchOnly((CTcorePProvider x) => x.ctcoreP_serialNoList);

    getX((CTProvider x) => x.getCTLocalData());
    final List<CTModel> reportsForArgsfrom_CTmodel =
        watchOnly((CTProvider x) => x.ctlocaldataist);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((CTcorePProvider x) => x.getCTpEquipmentList());
    final List<CTcorePModel> reportsFormCTpLocalData =
        watchOnly((CTcorePProvider x) => x.ctcoreP_localdataList);

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
                for (var i in reportsFormCTpLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_CTmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo_Bph;
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                // add to remote database
                                var url =
                                    Uri.parse('${Env.URL_PREFIX}/ctCorePTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                  'R_1S1_1S2': i.R_1S1_1S2.toString(),
                                  'R_2S1_2S2': i.R_2S1_2S2.toString(),
                                  'R_3S1_3S2': i.R_3S1_3S2.toString(),
                                  'R_4S1_4S2': i.R_4S1_4S2.toString(),
                                  'R_5S1_5S2': i.R_5S1_5S2.toString(),
                                  'Y_1S1_1S2': i.Y_1S1_1S2.toString(),
                                  'Y_2S1_2S2': i.Y_2S1_2S2.toString(),
                                  'Y_3S1_3S2': i.Y_3S1_3S2.toString(),
                                  'Y_4S1_4S2': i.Y_4S1_4S2.toString(),
                                  'Y_5S1_5S2': i.Y_5S1_5S2.toString(),
                                  'B_1S1_1S2': i.B_1S1_1S2.toString(),
                                  'B_2S1_2S2': i.B_2S1_2S2.toString(),
                                  'B_3S1_3S2': i.B_3S1_3S2.toString(),
                                  'B_4S1_4S2': i.B_4S1_4S2.toString(),
                                  'B_5S1_5S2': i.B_5S1_5S2.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<CTcorePProvider>().updateCTcoreP(
                                      CTcorePModel(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        R_1S1_1S2: i.R_1S1_1S2,
                                        R_2S1_2S2: i.R_2S1_2S2,
                                        R_3S1_3S2: i.R_3S1_3S2,
                                        R_4S1_4S2: i.R_4S1_4S2,
                                        R_5S1_5S2: i.R_5S1_5S2,
                                        Y_1S1_1S2: i.Y_1S1_1S2,
                                        Y_2S1_2S2: i.Y_2S1_2S2,
                                        Y_3S1_3S2: i.Y_3S1_3S2,
                                        Y_4S1_4S2: i.Y_4S1_4S2,
                                        Y_5S1_5S2: i.Y_5S1_5S2,
                                        B_1S1_1S2: i.B_1S1_1S2,
                                        B_2S1_2S2: i.B_2S1_2S2,
                                        B_3S1_3S2: i.B_3S1_3S2,
                                        B_4S1_4S2: i.B_4S1_4S2,
                                        B_5S1_5S2: i.B_5S1_5S2,
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
                Navigator.pushNamed(context, '/detail_CTcoreP', arguments: {
                  'id': report.id,
                  'CT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo_Bph,
                  'ctDatabaseID': args['ctDatabaseID'],
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_CTcoreP', arguments: {
                  'id': report.id,
                  'CT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo_Bph,
                  'ctDatabaseID': args['ctDatabaseID'],
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
                              ntr.etype == 'CT'
                                  ? const Text(
                                      ' CT Polarity Details ',
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
                              ntr.etype == 'CT'
                                  ? const Text(
                                      ' CT Polarity Details ',
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

  generate_list_of_CTcoreR(CTModel ntr) {
    getX((CTcoreRProvider x) => x.getCTcoreR_BySerialNo(ntr.serialNo_Bph));
    final List<CTcoreRModel> reports =
        watchOnly((CTcoreRProvider x) => x.ctcoreR_serialNoList);

    getX((CTProvider x) => x.getCTLocalData());
    final List<CTModel> reportsForArgsfrom_CTmodel =
        watchOnly((CTProvider x) => x.ctlocaldataist);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((CTcoreRProvider x) => x.getCTcoreREquipmentList());
    final List<CTcoreRModel> reportsFormCTrLocalData =
        watchOnly((CTcoreRProvider x) => x.ctcoreR_localdataList);

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
                for (var i in reportsFormCTrLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_CTmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo_Bph;
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                // add to remote database
                                var url =
                                    Uri.parse('${Env.URL_PREFIX}/ctCoreRTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                  'R_1S1_1S2_200': i.R_1S1_1S2_200.toString(),
                                  'R_2S1_2S2_200': i.R_2S1_2S2_200.toString(),
                                  'R_3S1_3S2_200': i.R_3S1_3S2_200.toString(),
                                  'R_4S1_4S2_200': i.R_4S1_4S2_200.toString(),
                                  'R_5S1_5S2_200': i.R_5S1_5S2_200.toString(),
                                  'Y_1S1_1S2_200': i.Y_1S1_1S2_200.toString(),
                                  'Y_2S1_2S2_200': i.Y_2S1_2S2_200.toString(),
                                  'Y_3S1_3S2_200': i.Y_3S1_3S2_200.toString(),
                                  'Y_4S1_4S2_200': i.Y_4S1_4S2_200.toString(),
                                  'Y_5S1_5S2_200': i.Y_5S1_5S2_200.toString(),
                                  'B_1S1_1S2_200': i.B_1S1_1S2_200.toString(),
                                  'B_2S1_2S2_200': i.B_2S1_2S2_200.toString(),
                                  'B_3S1_3S2_200': i.B_3S1_3S2_200.toString(),
                                  'B_4S1_4S2_200': i.B_4S1_4S2_200.toString(),
                                  'B_5S1_5S2_200': i.B_5S1_5S2_200.toString(),
                                  'R_1S1_1S2_400': i.R_1S1_1S2_400.toString(),
                                  'R_2S1_2S2_400': i.R_2S1_2S2_400.toString(),
                                  'R_3S1_3S2_400': i.R_3S1_3S2_400.toString(),
                                  'R_4S1_4S2_400': i.R_4S1_4S2_400.toString(),
                                  'R_5S1_5S2_400': i.R_5S1_5S2_400.toString(),
                                  'Y_1S1_1S2_400': i.Y_1S1_1S2_400.toString(),
                                  'Y_2S1_2S2_400': i.Y_2S1_2S2_400.toString(),
                                  'Y_3S1_3S2_400': i.Y_3S1_3S2_400.toString(),
                                  'Y_4S1_4S2_400': i.Y_4S1_4S2_400.toString(),
                                  'Y_5S1_5S2_400': i.Y_5S1_5S2_400.toString(),
                                  'B_1S1_1S2_400': i.B_1S1_1S2_400.toString(),
                                  'B_2S1_2S2_400': i.B_2S1_2S2_400.toString(),
                                  'B_3S1_3S2_400': i.B_3S1_3S2_400.toString(),
                                  'B_4S1_4S2_400': i.B_4S1_4S2_400.toString(),
                                  'B_5S1_5S2_400': i.B_5S1_5S2_400.toString(),
                                  'R_1S1_1S2_600': i.R_1S1_1S2_600.toString(),
                                  'R_2S1_2S2_600': i.R_2S1_2S2_600.toString(),
                                  'R_3S1_3S2_600': i.R_3S1_3S2_600.toString(),
                                  'R_4S1_4S2_600': i.R_4S1_4S2_600.toString(),
                                  'R_5S1_5S2_600': i.R_5S1_5S2_600.toString(),
                                  'Y_1S1_1S2_600': i.Y_1S1_1S2_600.toString(),
                                  'Y_2S1_2S2_600': i.Y_2S1_2S2_600.toString(),
                                  'Y_3S1_3S2_600': i.Y_3S1_3S2_600.toString(),
                                  'Y_4S1_4S2_600': i.Y_4S1_4S2_600.toString(),
                                  'Y_5S1_5S2_600': i.Y_5S1_5S2_600.toString(),
                                  'B_1S1_1S2_600': i.B_1S1_1S2_600.toString(),
                                  'B_2S1_2S2_600': i.B_2S1_2S2_600.toString(),
                                  'B_3S1_3S2_600': i.B_3S1_3S2_600.toString(),
                                  'B_4S1_4S2_600': i.B_4S1_4S2_600.toString(),
                                  'B_5S1_5S2_600': i.B_5S1_5S2_600.toString(),
                                  'R_1S1_1S2_800': i.R_1S1_1S2_800.toString(),
                                  'R_2S1_2S2_800': i.R_2S1_2S2_800.toString(),
                                  'R_3S1_3S2_800': i.R_3S1_3S2_800.toString(),
                                  'R_4S1_4S2_800': i.R_4S1_4S2_800.toString(),
                                  'R_5S1_5S2_800': i.R_5S1_5S2_800.toString(),
                                  'Y_1S1_1S2_800': i.Y_1S1_1S2_800.toString(),
                                  'Y_2S1_2S2_800': i.Y_2S1_2S2_800.toString(),
                                  'Y_3S1_3S2_800': i.Y_3S1_3S2_800.toString(),
                                  'Y_4S1_4S2_800': i.Y_4S1_4S2_800.toString(),
                                  'Y_5S1_5S2_800': i.Y_5S1_5S2_800.toString(),
                                  'B_1S1_1S2_800': i.B_1S1_1S2_800.toString(),
                                  'B_2S1_2S2_800': i.B_2S1_2S2_800.toString(),
                                  'B_3S1_3S2_800': i.B_3S1_3S2_800.toString(),
                                  'B_4S1_4S2_800': i.B_4S1_4S2_800.toString(),
                                  'B_5S1_5S2_800': i.B_5S1_5S2_800.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<CTcoreRProvider>().updateCTcoreR(
                                      CTcoreRModel(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        R_1S1_1S2_200: i.R_1S1_1S2_200,
                                        R_2S1_2S2_200: i.R_2S1_2S2_200,
                                        R_3S1_3S2_200: i.R_3S1_3S2_200,
                                        R_4S1_4S2_200: i.R_4S1_4S2_200,
                                        R_5S1_5S2_200: i.R_5S1_5S2_200,
                                        Y_1S1_1S2_200: i.Y_1S1_1S2_200,
                                        Y_2S1_2S2_200: i.Y_2S1_2S2_200,
                                        Y_3S1_3S2_200: i.Y_3S1_3S2_200,
                                        Y_4S1_4S2_200: i.Y_4S1_4S2_200,
                                        Y_5S1_5S2_200: i.Y_5S1_5S2_200,
                                        B_1S1_1S2_200: i.B_1S1_1S2_200,
                                        B_2S1_2S2_200: i.B_2S1_2S2_200,
                                        B_3S1_3S2_200: i.B_3S1_3S2_200,
                                        B_4S1_4S2_200: i.B_4S1_4S2_200,
                                        B_5S1_5S2_200: i.B_5S1_5S2_200,
                                        R_1S1_1S2_400: i.R_1S1_1S2_400,
                                        R_2S1_2S2_400: i.R_2S1_2S2_400,
                                        R_3S1_3S2_400: i.R_3S1_3S2_400,
                                        R_4S1_4S2_400: i.R_4S1_4S2_400,
                                        R_5S1_5S2_400: i.R_5S1_5S2_400,
                                        Y_1S1_1S2_400: i.Y_1S1_1S2_400,
                                        Y_2S1_2S2_400: i.Y_2S1_2S2_400,
                                        Y_3S1_3S2_400: i.Y_3S1_3S2_400,
                                        Y_4S1_4S2_400: i.Y_4S1_4S2_400,
                                        Y_5S1_5S2_400: i.Y_5S1_5S2_400,
                                        B_1S1_1S2_400: i.B_1S1_1S2_400,
                                        B_2S1_2S2_400: i.B_2S1_2S2_400,
                                        B_3S1_3S2_400: i.B_3S1_3S2_400,
                                        B_4S1_4S2_400: i.B_4S1_4S2_400,
                                        B_5S1_5S2_400: i.B_5S1_5S2_400,
                                        R_1S1_1S2_600: i.R_1S1_1S2_600,
                                        R_2S1_2S2_600: i.R_2S1_2S2_600,
                                        R_3S1_3S2_600: i.R_3S1_3S2_600,
                                        R_4S1_4S2_600: i.R_4S1_4S2_600,
                                        R_5S1_5S2_600: i.R_5S1_5S2_600,
                                        Y_1S1_1S2_600: i.Y_1S1_1S2_600,
                                        Y_2S1_2S2_600: i.Y_2S1_2S2_600,
                                        Y_3S1_3S2_600: i.Y_3S1_3S2_600,
                                        Y_4S1_4S2_600: i.Y_4S1_4S2_600,
                                        Y_5S1_5S2_600: i.Y_5S1_5S2_600,
                                        B_1S1_1S2_600: i.B_1S1_1S2_600,
                                        B_2S1_2S2_600: i.B_2S1_2S2_600,
                                        B_3S1_3S2_600: i.B_3S1_3S2_600,
                                        B_4S1_4S2_600: i.B_4S1_4S2_600,
                                        B_5S1_5S2_600: i.B_5S1_5S2_600,
                                        R_1S1_1S2_800: i.R_1S1_1S2_800,
                                        R_2S1_2S2_800: i.R_2S1_2S2_800,
                                        R_3S1_3S2_800: i.R_3S1_3S2_800,
                                        R_4S1_4S2_800: i.R_4S1_4S2_800,
                                        R_5S1_5S2_800: i.R_5S1_5S2_800,
                                        Y_1S1_1S2_800: i.Y_1S1_1S2_800,
                                        Y_2S1_2S2_800: i.Y_2S1_2S2_800,
                                        Y_3S1_3S2_800: i.Y_3S1_3S2_800,
                                        Y_4S1_4S2_800: i.Y_4S1_4S2_800,
                                        Y_5S1_5S2_800: i.Y_5S1_5S2_800,
                                        B_1S1_1S2_800: i.B_1S1_1S2_800,
                                        B_2S1_2S2_800: i.B_2S1_2S2_800,
                                        B_3S1_3S2_800: i.B_3S1_3S2_800,
                                        B_4S1_4S2_800: i.B_4S1_4S2_800,
                                        B_5S1_5S2_800: i.B_5S1_5S2_800,
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
                Navigator.pushNamed(context, '/detail_CTcoreR', arguments: {
                  'id': report.id,
                  'CT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo_Bph,
                  'ctDatabaseID': args['ctDatabaseID'],
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_CTcoreR', arguments: {
                  'id': report.id,
                  'CT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo_Bph,
                  'ctDatabaseID': args['ctDatabaseID'],
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
                              ntr.etype == 'CT'
                                  ? const Text(
                                      ' CT Ratio Details ',
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
                              ntr.etype == 'CT'
                                  ? const Text(
                                      ' CT Ratio Details ',
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

  generate_list_of_CTcoreKVP(CTModel ntr) {
    getX((CTcoreKVPProvider x) => x.getCTcoreKVP_BySerialNo(ntr.serialNo_Bph));
    final List<CTcoreKVPModel> reports =
        watchOnly((CTcoreKVPProvider x) => x.ctcoreKVP_serialNoList);

    getX((CTProvider x) => x.getCTLocalData());
    final List<CTModel> reportsForArgsfrom_CTmodel =
        watchOnly((CTProvider x) => x.ctlocaldataist);

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reportsForArgsfrom_TestReports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    getX((CTcoreKVPProvider x) => x.getCTkvpEquipmentList());
    final List<CTcoreKVPModel> reportsFormCTkvpLocalData =
        watchOnly((CTcoreKVPProvider x) => x.ctcoreKVP_localdataList);

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
                for (var i in reportsFormCTkvpLocalData) {
                  if (i.id == report.id) {
                    if (report.databaseID == 0 || i.databaseID == 0) {
                      var tempvar = i.trNo;
                      print(tempvar); // current TrNo of Acbcrm Test

                      for (var t in reportsForArgsfrom_TestReports) {
                        if (t.trNo == tempvar) {
                          var tDatabaseID = t.databaseID;
                          print(tDatabaseID); // current TrNo of TestReport args

                          for (var q in reportsForArgsfrom_CTmodel) {
                            if (q.trNo == tempvar) {
                              var argsSerialNo = q.serialNo_Bph;
                              print(
                                  argsSerialNo); // current serialNo of Acb args

                              if (report.serialNo == argsSerialNo &&
                                  i.serialNo == argsSerialNo) {
                                var argsSnoDB = q.databaseID;

                                // add to remote database
                                var url = Uri.parse(
                                    '${Env.URL_PREFIX}/ctCoreKpvTest/');
                                var response = await http.post(url, body: {
                                  'trNo': tDatabaseID.toString(),
                                  'serialNo': argsSnoDB.toString(),
                                  'equipmentUsed': i.equipmentUsed.toString(),
                                  'R_35': i.R_35.toString(),
                                  'R_70': i.R_70.toString(),
                                  'R_105': i.R_105.toString(),
                                  'R_140': i.R_140.toString(),
                                  'R_175': i.R_175.toString(),
                                  'R_210': i.R_210.toString(),
                                  'R_245': i.R_245.toString(),
                                  'R_280': i.R_280.toString(),
                                  'R_315': i.R_315.toString(),
                                  'R_350': i.R_350.toString(),
                                  'R_385': i.R_385.toString(),
                                  'Y_35': i.Y_35.toString(),
                                  'Y_70': i.Y_70.toString(),
                                  'Y_105': i.Y_105.toString(),
                                  'Y_140': i.Y_140.toString(),
                                  'Y_175': i.Y_175.toString(),
                                  'Y_210': i.Y_210.toString(),
                                  'Y_245': i.Y_245.toString(),
                                  'Y_280': i.Y_280.toString(),
                                  'Y_315': i.Y_315.toString(),
                                  'Y_350': i.Y_350.toString(),
                                  'Y_385': i.Y_385.toString(),
                                  'B_35': i.B_35.toString(),
                                  'B_70': i.B_70.toString(),
                                  'B_105': i.B_105.toString(),
                                  'B_140': i.B_140.toString(),
                                  'B_175': i.B_175.toString(),
                                  'B_210': i.B_210.toString(),
                                  'B_245': i.B_245.toString(),
                                  'B_280': i.B_280.toString(),
                                  'B_315': i.B_315.toString(),
                                  'B_350': i.B_350.toString(),
                                  'B_385': i.B_385.toString(),
                                }, headers: {
                                  'Authorization': 'Bearer $acc_token',
                                }).then((value) {
                                  sl<CTcoreKVPProvider>().updateCTcoreKVP(
                                      CTcoreKVPModel(
                                        id: i.id,
                                        trNo: i.trNo,
                                        serialNo: i.serialNo,
                                        R_35: i.R_35,
                                        R_70: i.R_70,
                                        R_105: i.R_105,
                                        R_140: i.R_140,
                                        R_175: i.R_175,
                                        R_210: i.R_210,
                                        R_245: i.R_245,
                                        R_280: i.R_280,
                                        R_315: i.R_315,
                                        R_350: i.R_350,
                                        R_385: i.R_385,
                                        Y_35: i.Y_35,
                                        Y_70: i.Y_70,
                                        Y_105: i.Y_105,
                                        Y_140: i.Y_140,
                                        Y_175: i.Y_175,
                                        Y_210: i.Y_210,
                                        Y_245: i.Y_245,
                                        Y_280: i.Y_280,
                                        Y_315: i.Y_315,
                                        Y_350: i.Y_350,
                                        Y_385: i.Y_385,
                                        B_35: i.B_35,
                                        B_70: i.B_70,
                                        B_105: i.B_105,
                                        B_140: i.B_140,
                                        B_175: i.B_175,
                                        B_210: i.B_210,
                                        B_245: i.B_245,
                                        B_280: i.B_280,
                                        B_315: i.B_315,
                                        B_350: i.B_350,
                                        B_385: i.B_385,
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
                // --------------------------------------------------------
                Navigator.pushNamed(context, '/detail_CTcoreKVP', arguments: {
                  'id': report.id,
                  'CT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo_Bph,
                  'ctDatabaseID': args['ctDatabaseID'],
                  'trDatabaseID': args['trDatabaseID'],
                });
              } else if (status == DataConnectionStatus.disconnected) {
                Navigator.pushNamed(context, '/detail_CTcoreKVP', arguments: {
                  'id': report.id,
                  'CT_ID': report.databaseID,
                  'serial_no_bph': ntr.serialNo_Bph,
                  'ctDatabaseID': args['ctDatabaseID'],
                  'trDatabaseID': args['trDatabaseID'],
                });
              }
              // ----------------------------------
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
                              ntr.etype == 'CT'
                                  ? const Text(
                                      'CT KVP Details ',
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
                              ntr.etype == 'CT'
                                  ? const Text(
                                      'CT KVP Details ',
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
}
