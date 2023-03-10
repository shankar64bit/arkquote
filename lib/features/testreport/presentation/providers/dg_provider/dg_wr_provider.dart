// ignore_for_file: prefer_final_fields, missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/DG/dg_wr_local_datasource.dart';
import '../../../data/models/equipment/DG/dg_wr_test_model.dart';

class DgWrProvider extends ChangeNotifier {
  List<DgWrTestModel> _dgWrTrNoList = [];
  List<DgWrTestModel> get dgWrTrNoList => _dgWrTrNoList;
  List<DgWrTestModel> _dgWrSerialNoList = [];
  List<DgWrTestModel> get dgWrSerialNoList => _dgWrSerialNoList;
  List<DgWrTestModel> _dgWrEquipmentList = [];
  List<DgWrTestModel> get dgWrEquipmentList => _dgWrEquipmentList;
  DgWrTestModel _dgWrModel;
  DgWrTestModel get dgWrModel => _dgWrModel;

  String _error = 'ErroR';
  String get error => _error;

  void getDgWrByTrNo(int trNo) async {
    _dgWrTrNoList = await sl<DgWrLocalDatasourceImpl>()
        .getDgWrByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getDgWrBySerialNo(String serialNo) async {
    _dgWrSerialNoList = await sl<DgWrLocalDatasourceImpl>()
        .getDgWrBySerialNo(serialNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getDgWrByID(int id) async {
    _dgWrModel = await sl<DgWrLocalDatasourceImpl>()
        .getDgWrById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addDgWr(DgWrTestModel dgWrModel) async {
    await sl<DgWrLocalDatasourceImpl>()
        .localDgWr(dgWrModel)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteDgWr(int id) async {
    await sl<DgWrLocalDatasourceImpl>()
        .deleteDgWrById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateDgWr(DgWrTestModel dgWrModel, int id) async {
    await sl<DgWrLocalDatasourceImpl>()
        .updateDgWr(dgWrModel, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getDgWrEquipmentList() async {
    _dgWrEquipmentList = await sl<DgWrLocalDatasourceImpl>()
        .getDgWrEquipmentList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
