// ignore_for_file: prefer_final_fields, missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/SC/sc_c_local_datasource.dart';
import '../../../data/models/equipment/SC/sc_c_test_model.dart';

class ScCProvider extends ChangeNotifier {
  List<ScCTestModel> _scCTrNoList = [];
  List<ScCTestModel> get scCTrNoList => _scCTrNoList;
  List<ScCTestModel> _scCSerialNoList = [];
  List<ScCTestModel> get scCSerialNoList => _scCSerialNoList;
  List<ScCTestModel> _scCEquipmentList = [];
  List<ScCTestModel> get scCEquipmentList => _scCEquipmentList;
  ScCTestModel _scCModel;
  ScCTestModel get scCModel => _scCModel;

  String _error = 'ErroR';
  String get error => _error;

  void getScCByTrNo(int trNo) async {
    _scCTrNoList = await sl<ScCLocalDatasourceImpl>()
        .getScCByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getScCBySerialNo(String serialNo) async {
    _scCSerialNoList = await sl<ScCLocalDatasourceImpl>()
        .getScCBySerialNo(serialNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getScCByID(int id) async {
    _scCModel = await sl<ScCLocalDatasourceImpl>()
        .getScCById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addScC(ScCTestModel scCTestModel) async {
    await sl<ScCLocalDatasourceImpl>()
        .localScC(scCTestModel)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteScC(int id) async {
    await sl<ScCLocalDatasourceImpl>()
        .deleteScCById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateScC(ScCTestModel scCToUpdate, int id) async {
    await sl<ScCLocalDatasourceImpl>()
        .updateScC(scCToUpdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getScCEquipmentList() async {
    _scCEquipmentList = await sl<ScCLocalDatasourceImpl>()
        .getScCEquipmentList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
