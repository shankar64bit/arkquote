// ignore_for_file: prefer_final_fields, missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/busbar/bb_hv_local_datasource.dart';
import '../../../data/models/equipment/busbar/bb_hv_test_model.dart';

class BbHvProvider extends ChangeNotifier {
  List<BbHvTestModel> _bbHvTrNoList = [];
  List<BbHvTestModel> get bbHvTrNoList => _bbHvTrNoList;
  List<BbHvTestModel> _bbHvBbRefIdList = [];
  List<BbHvTestModel> get bbHvBbRefIdList => _bbHvBbRefIdList;
  List<BbHvTestModel> _bbHvEquipmentList = [];
  List<BbHvTestModel> get bbHvEquipmentList => _bbHvEquipmentList;
  BbHvTestModel _bbHvModel;
  BbHvTestModel get bbHvModel => _bbHvModel;

  String _error = 'ErroR';
  String get error => _error;

  void getBbHvByTrNo(int trNo) async {
    _bbHvTrNoList = await sl<BbHvLocalDatasourceImpl>()
        .getBbHvByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getBbHvBybbRefId(int bbRefId) async {
    _bbHvBbRefIdList = await sl<BbHvLocalDatasourceImpl>()
        .getBbHvByBbRefId(bbRefId)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getBbHvByID(int id) async {
    _bbHvModel = await sl<BbHvLocalDatasourceImpl>()
        .getBbHvById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addBbHv(BbHvTestModel bbHvModel) async {
    await sl<BbHvLocalDatasourceImpl>()
        .localBbHv(bbHvModel)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteBbHv(int id) async {
    await sl<BbHvLocalDatasourceImpl>()
        .deleteBbHvById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateBbHv(BbHvTestModel bbHvModel, int id) async {
    await sl<BbHvLocalDatasourceImpl>()
        .updateBbHv(bbHvModel, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getBbHvEquipmentList() async {
    _bbHvEquipmentList = await sl<BbHvLocalDatasourceImpl>()
        .getBbHvEquipmentList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
