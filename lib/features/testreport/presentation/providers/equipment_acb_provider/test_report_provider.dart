// ignore_for_file: missing_return

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import 'package:flutter_testreports/features/testreport/data/models/test_report_model.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../pages/dropdown_All/responsive_tool/google_sign_in_out/InternetConnChecker.dart';

class TestReportsProvider extends ChangeNotifier {
  List<TestReportModel> _reportListFuture = [];
  List<TestReportModel> get reportListFuture => _reportListFuture;
  TestReportModel _reportModel;
  TestReportModel get reportModel => _reportModel;
  TestReportModel _reportListFutureBytrNo;
  TestReportModel get reportListFutureBytrNo => _reportListFutureBytrNo;
  TestReportModel _trModel;
  TestReportModel get trModel => _trModel;
  int _createdId;
  int get createdId => _createdId;
  String _error = 'ErroR';
  String get error => _error;
  var gotStatus;
  // DataConnectionStatus status;

  void getReportFuture() async {
    _reportListFuture = await sl<TestReportLocalDatasourceImpl>()
        .listOfReports()
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getReportByID(int id) async {
    _trModel = await sl<TestReportLocalDatasourceImpl>()
        .getTestReportById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  Future<TestReportModel> futuregetReportByTrNo(int trNo) async {
    _reportListFutureBytrNo = await sl<TestReportLocalDatasourceImpl>()
        .getReportByTrNo(trNo)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addReport(TestReportModel testReportModel) async {
    await sl<TestReportLocalDatasourceImpl>()
        .localTestReport(testReportModel)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteReport(int id) async {
    await sl<TestReportLocalDatasourceImpl>()
        .deleteReportById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteReportbyDatabaseID(int databaseID) async {
    await sl<TestReportLocalDatasourceImpl>()
        .deleteReportByDatabaseId(databaseID)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateReport(TestReportModel testReportModel, int id) async {
    await sl<TestReportLocalDatasourceImpl>()
        .updateTestReport(testReportModel, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  void CheckInterNetConnection() async {
    DataConnectionStatus status = await CheckInternet();
    gotStatus = status;
    notifyListeners();
  }
}
