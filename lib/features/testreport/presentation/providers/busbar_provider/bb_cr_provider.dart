// ignore_for_file: prefer_final_fields, missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/busbar/bb_cr_local_datasource copy.dart';
import '../../../data/models/equipment/busbar/bb_cr_test_model.dart';

class BbCrProvider extends ChangeNotifier {
  List<BbCrTestModel> _bbCrTrNoList = [];
  List<BbCrTestModel> get bbCrTrNoList => _bbCrTrNoList;
  List<BbCrTestModel> _bbCrBbRefIdList = [];
  List<BbCrTestModel> get bbCrBbRefIdList => _bbCrBbRefIdList;
  List<BbCrTestModel> _bbCrEquipmentList = [];
  List<BbCrTestModel> get bbCrEquipmentList => _bbCrEquipmentList;
  BbCrTestModel _bbCrModel;
  BbCrTestModel get bbCrModel => _bbCrModel;

  String _error = 'ErroR';
  String get error => _error;

  void getBbCrByTrNo(int trNo) async {
    _bbCrTrNoList = await sl<BbCrLocalDatasourceImpl>()
        .getBbCrByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getBbCrBybbRefId(int bbRefId) async {
    _bbCrBbRefIdList = await sl<BbCrLocalDatasourceImpl>()
        .getBbCrByBbRefId(bbRefId)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getBbCrByID(int id) async {
    _bbCrModel = await sl<BbCrLocalDatasourceImpl>()
        .getBbCrById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addBbCr(BbCrTestModel bbcrtolocal) async {
    await sl<BbCrLocalDatasourceImpl>()
        .localBbCr(bbcrtolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteBbCr(int id) async {
    await sl<BbCrLocalDatasourceImpl>()
        .deleteBbCrById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateBbCr(BbCrTestModel bbcrtoupdate, int id) async {
    await sl<BbCrLocalDatasourceImpl>()
        .updateBbCr(bbcrtoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getBbCrEquipmentList() async {
    _bbCrEquipmentList = await sl<BbCrLocalDatasourceImpl>()
        .getBbCrEquipmentList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
