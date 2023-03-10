// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/google_sign_in_out/google_login_controller.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import '../../../../../env.sample.dart';
import '../../../../../injection_container.dart';
import '../../../domain/entities/test_report.dart';
import 'package:flutter_testreports/features/testreport/data/models/test_report_model.dart';
import 'package:flutter_testreports/features/testreport/presentation/providers/equipment_acb_provider/test_report_provider.dart';
import 'package:flutter_testreports/features/testreport/presentation/pages/dropdown_All/responsive_tool/constants.dart';
import 'package:http/http.dart' as http;

import '../dropdown_All/responsive_tool/google_sign_in_out/InternetConnChecker.dart';

var acc_token = sl<GoogleSignInController>().ACCESS_TOKEN;
var gotted = sl<TestReportsProvider>().gotStatus;
var listOFrep = sl<TestReportsProvider>().reportListFuture;
var wss_conn_checker = sl<GoogleSignInController>().wss_checker;

class TestReportPage extends StatelessWidget with GetItMixin {
  final TestReports testReports;

  TestReportPage({Key key, this.testReports}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getX((TestReportsProvider y) => y.CheckInterNetConnection());

    getX((TestReportsProvider x) => x.getReportFuture());
    final List<TestReportModel> reports =
        watchOnly((TestReportsProvider x) => x.reportListFuture);

    var gotted = watchOnly((TestReportsProvider x) => x.gotStatus);
    var wss_conn_checker =
        watchOnly((GoogleSignInController y) => y.wss_checker);

    var mob = const Text('TEST  REPORTS',
        style: TextStyle(fontSize: 16, letterSpacing: 1));
    var desk = const Text('TEST   REPORTS',
        style: TextStyle(fontSize: 25, letterSpacing: 1));

    return Scaffold(
      appBar: AppBar(
        title: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth > 400) {
            return desk;
          } else {
            return mob;
          }
        }),
        actions: [
          // IconButton(
          //     onPressed: () {
          //       // Navigator.pushNamed(context, '/pending_testreports');
          //     },
          //     icon: const Icon(Icons.pending_actions)),
          // ---------------------------------------------
          gotted == DataConnectionStatus.connected
              ? wss_conn_checker == 'ERROR'
                  ? IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.signal_cellular_alt_outlined,
                        color: Color.fromARGB(255, 255, 251, 11),
                      ))
                  : IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.signal_cellular_alt_outlined,
                        color: Color.fromARGB(255, 64, 230, 8),
                      ))
              : IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.signal_cellular_off_sharp,
                    color: Color.fromARGB(255, 255, 75, 39),
                  )),
        ],
        centerTitle: true,
      ),
      drawer: myDrawer,
      body: LayoutBuilder(
        // ignore: missing_return
        builder: (context, constraints) {
          ///////////////////////////////DESKTOP-VIEW-STARTS//////////////////////////////////////
          if (constraints.maxWidth >= 799) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // opened visible drawer
                  myDrawer,
                  // first half of page
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        // first 4 boxes in grid
                        AspectRatio(
                          aspectRatio: 40,
                          child: SizedBox(
                            width: double.infinity,
                            child: GridView.builder(
                              itemCount: 0,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4),
                              itemBuilder: (context, index) {
                                //return MyBox();
                              },
                            ),
                          ),
                        ),

                        // list of Test-Reports-In-Dashboard
                        Expanded(
                          child: ListView.builder(
                              itemCount: reports.length,
                              itemBuilder: (context, index) {
                                final report = reports[index];
                                return GestureDetector(
                                  onTap: () async {
                                    if (report.databaseID == 0 ||
                                        report.databaseID == '0') {
                                      var url = Uri.parse(
                                          '${Env.URL_PREFIX}/testReport/');
                                      var response =
                                          await http.post(url, body: {
                                        'timeStamp': report.testDate.toString(),
                                        'client': report.client.toString(),
                                        'customer': report.customer.toString(),
                                        'project': report.project.toString(),
                                        'trNo': report.trNo.toString(),
                                        // 'updateDate': _dateOfTest,
                                      }, headers: {
                                        'Authorization': 'Bearer $acc_token',
                                      }).then((value) {
                                        sl<TestReportsProvider>().updateReport(
                                            TestReportModel(
                                              id: report.id,
                                              databaseID:
                                                  json.decode(value.body)['id'],
                                              client: report.client,
                                              customer: report.customer,
                                              project: report.project,
                                              trNo: report.trNo,
                                              testDate: report.testDate,
                                              lastUpdated: DateTime.now(),
                                            ),
                                            report.id);

                                        print(
                                            'Response status: ${value.statusCode}');
                                        print('Response body: ${value.body}');
                                        print('Stored successfully');
                                      });
                                    }

                                    Navigator.pushNamed(
                                        context, '/detail_report',
                                        arguments: report.id);
                                  },
                                  child: Card(
                                    elevation: 5,
                                    margin:
                                        EdgeInsets.fromLTRB(150, 10, 450, 0),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text(report.client.toString()),
                                          subtitle: report.customer == "0"
                                              ? Container()
                                              : Row(
                                                  children: [
                                                    report.databaseID == 0 ||
                                                            report.databaseID ==
                                                                '0'
                                                        ? Icon(
                                                            Icons
                                                                .replay_circle_filled_rounded,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    188,
                                                                    24,
                                                                    13),
                                                            size: 15.0,
                                                          )
                                                        : Icon(
                                                            Icons
                                                                .circle_rounded,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    9,
                                                                    230,
                                                                    9),
                                                            size: 10.0,
                                                          ),
                                                    Text('  ' +
                                                        report.customer
                                                            .toString()),
                                                  ],
                                                ),
                                          trailing: Text('  TrNo [ ' +
                                              report.trNo.toString() +
                                              ' ]'),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );

            ////////////////////////////////MOBILE-VIEW-STARTS-BASED-ON-CONDITION////////////////////////////////////////////
          } else if (constraints.maxWidth <= 800) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: reports.length,
                            itemBuilder: (context, index) {
                              final report = reports[index];

                              return GestureDetector(
                                onTap: () async {
                                  if (report.databaseID == 0 ||
                                      report.databaseID == '0') {
                                    DataConnectionStatus status =
                                        await CheckInternet();

                                    if (status ==
                                        DataConnectionStatus.connected) {
                                      var url = Uri.parse(
                                          '${Env.URL_PREFIX}/testReport/');
                                      var response =
                                          await http.post(url, body: {
                                        'timeStamp': report.testDate.toString(),
                                        'client': report.client.toString(),
                                        'customer': report.customer.toString(),
                                        'project': report.project.toString(),
                                        'trNo': report.trNo.toString(),
                                        // 'updateDate': _dateOfTest,
                                      }, headers: {
                                        'Authorization': 'Bearer $acc_token',
                                      }).then((value) {
                                        sl<TestReportsProvider>().updateReport(
                                            TestReportModel(
                                              id: report.id,
                                              databaseID:
                                                  json.decode(value.body)['id'],
                                              client: report.client,
                                              customer: report.customer,
                                              project: report.project,
                                              trNo: report.trNo,
                                              testDate: report.testDate,
                                              lastUpdated: DateTime.now(),
                                            ),
                                            report.id);

                                        print(
                                            'Response status: ${value.statusCode}');
                                        print('Response body: ${value.body}');
                                        print('Stored successfully');
                                      });
                                    } else if (status ==
                                        DataConnectionStatus.disconnected) {
                                      print('Connection Not Available');
                                    }
                                  }
                                  Navigator.pushNamed(context, '/detail_report',
                                      arguments: report.id);
                                },
                                child: Card(
                                  elevation: 5,
                                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text(report.client.toString()),
                                        subtitle: report.databaseID == "0"
                                            ? Container()
                                            : Row(
                                                children: [
                                                  report.databaseID == 0 ||
                                                          report.databaseID ==
                                                              '0'
                                                      ? Icon(
                                                          Icons
                                                              .replay_circle_filled_rounded,
                                                          color: Color.fromARGB(
                                                              255, 188, 24, 13),
                                                          size: 15.0,
                                                        )
                                                      : Material(
                                                          type: MaterialType
                                                              .transparency,
                                                          child: Ink(
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 1.1),
                                                                shape: BoxShape
                                                                    .circle),
                                                            child: InkWell(
                                                              child: Icon(
                                                                Icons
                                                                    .circle_rounded,
                                                                size: 11.0,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        9,
                                                                        230,
                                                                        9),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                  // : Icon(
                                                  //     Icons.circle_rounded,
                                                  //     color: Color.fromARGB(
                                                  //         255, 9, 230, 9),
                                                  //     size: 10.0,
                                                  //   ),
                                                  report.customer == '0'
                                                      ? Text('  ----')
                                                      : Text('  ' +
                                                          report.customer
                                                              .toString())
                                                ],
                                              ),
                                        trailing: Text('  TrNo [ ' +
                                            report.trNo.toString() +
                                            ' ]'),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.pushNamed(context, '/add_report');
        },
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          'Add Report',
          style: TextStyle(fontSize: 13, color: Colors.white),
        ),
      ),
    );
  }
}
