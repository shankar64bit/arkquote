// ignore_for_file: prefer_final_fields, missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/EE/ee_test_local_datasource.dart';
import '../../../data/models/equipment/EE/ee_test_model.dart';

class EETestProvider extends ChangeNotifier {
  List<EETestModel> _eeTestTrNoList = [];
  List<EETestModel> get eeTestTrNoList => _eeTestTrNoList;
  List<EETestModel> _eeTestLocNoList = [];
  List<EETestModel> get eeTestLocNoList => _eeTestLocNoList;
  List<EETestModel> _eeTestEquipmentList = [];
  List<EETestModel> get eeTestEquipmentList => _eeTestEquipmentList;
  EETestModel _eeTestModel;
  EETestModel get eeTestModel => _eeTestModel;

  String _error = 'ErroR';
  String get error => _error;

  void getEETestByTrNo(int trNo) async {
    _eeTestTrNoList = await sl<EETestLocalDatasourceImpl>()
        .getEETestByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getEETestByLocNo(int locNo) async {
    _eeTestLocNoList = await sl<EETestLocalDatasourceImpl>()
        .getEETestByLocNo(locNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getEETestByID(int id) async {
    _eeTestModel = await sl<EETestLocalDatasourceImpl>()
        .getEETestById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addEETest(EETestModel eeTestModel) async {
    await sl<EETestLocalDatasourceImpl>()
        .localEETest(eeTestModel)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteEETest(int id) async {
    await sl<EETestLocalDatasourceImpl>()
        .deleteEETestById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateEETest(EETestModel eeTestModel, int id) async {
    await sl<EETestLocalDatasourceImpl>()
        .updateEETest(eeTestModel, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getEETestEquipmentList() async {
    await sl<AppDatabase>()
        .getEETestEquipmentList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
