// ignore_for_file: prefer_final_fields, missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/busbar/bb_ir_local_datasource.dart';
import '../../../data/models/equipment/busbar/bb_ir_test_model.dart';

class BbIrProvider extends ChangeNotifier {
  List<BbIrTestModel> _bbIrTrNoList = [];
  List<BbIrTestModel> get bbIrTrNoList => _bbIrTrNoList;
  List<BbIrTestModel> _bbIrbbRefIdList = [];
  List<BbIrTestModel> get bbIrbbRefIdList => _bbIrbbRefIdList;
  List<BbIrTestModel> _bbIrEquipmentList = [];
  List<BbIrTestModel> get bbIrEquipmentList => _bbIrEquipmentList;
  BbIrTestModel _bbIrModel;
  BbIrTestModel get bbIrModel => _bbIrModel;

  String _error = 'ErroR';
  String get error => _error;

  void getBbIrByTrNo(int trNo) async {
    _bbIrTrNoList = await sl<BbIrLocalDatasourceImpl>()
        .getBbIrByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getBbIrBybbRefID(int bbRefId) async {
    _bbIrbbRefIdList = await sl<BbIrLocalDatasourceImpl>()
        .getBbIrByBbRefId(bbRefId)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getBbIrByID(int id) async {
    _bbIrModel = await sl<BbIrLocalDatasourceImpl>()
        .getBbIrById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addBbIr(BbIrTestModel bbirtolocal) async {
    await sl<BbIrLocalDatasourceImpl>()
        .localBbIr(bbirtolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteBbIr(int id) async {
    await sl<BbIrLocalDatasourceImpl>()
        .deleteBbIrById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateBbIr(BbIrTestModel bbirtoupdate, int id) async {
    await sl<BbIrLocalDatasourceImpl>()
        .updateBbIr(bbirtoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getBbIrEquipmentList() async {
    _bbIrEquipmentList = await sl<BbIrLocalDatasourceImpl>()
        .getBbIrEquipmentList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
