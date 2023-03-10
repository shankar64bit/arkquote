// ignore_for_file: prefer_final_fields, missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/EE/ee_rtest_local_datasource copy.dart';
import '../../../data/models/equipment/EE/ee_r_test_model.dart';

class EERTestProvider extends ChangeNotifier {
  List<EERTestModel> _eeRTestTrNoList = [];
  List<EERTestModel> get eeRTestTrNoList => _eeRTestTrNoList;
  List<EERTestModel> _eeRTestLocNoList = [];
  List<EERTestModel> get eeRTestLocNoList => _eeRTestLocNoList;
  List<EERTestModel> _eeRTestEquipmentList = [];
  List<EERTestModel> get eeRTestEquipmentList => _eeRTestEquipmentList;
  EERTestModel _eeRTestModel;
  EERTestModel get eeRTestModel => _eeRTestModel;

  String _error = 'ErroR';
  String get error => _error;

  void getEERTestByTrNo(int trNo) async {
    _eeRTestTrNoList = await sl<EERTestLocalDatasourceImpl>()
        .getEERTestByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getEERTestByLocNo(int locNo) async {
    _eeRTestLocNoList = await sl<EERTestLocalDatasourceImpl>()
        .getEERTestByLocNo(locNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getEERTestByID(int id) async {
    _eeRTestModel = await sl<EERTestLocalDatasourceImpl>()
        .getEERTestById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addEERTest(EERTestModel eeLoctoLocal) async {
    await sl<EERTestLocalDatasourceImpl>()
        .localEERTest(eeLoctoLocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteEERTest(int id) async {
    await sl<EERTestLocalDatasourceImpl>()
        .deleteEERTestById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateEERTest(EERTestModel eeLoctoUpdate, int id) async {
    await sl<EERTestLocalDatasourceImpl>()
        .updateEERTest(eeLoctoUpdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getEERTestEquipmentList() async {
    await sl<AppDatabase>()
        .getEERTestEquipmentList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
