// ignore_for_file: prefer_final_fields, missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/DG/dg_ir_local_datasource.dart';
import '../../../data/models/equipment/DG/dg_ir_test_model.dart';

class DgIrProvider extends ChangeNotifier {
  List<DgIrTestModel> _dgIrTrNoList = [];
  List<DgIrTestModel> get dgIrTrNoList => _dgIrTrNoList;
  List<DgIrTestModel> _dgIrSerialNoList = [];
  List<DgIrTestModel> get dgIrSerialNoList => _dgIrSerialNoList;
  List<DgIrTestModel> _dgIrEquipmentList = [];
  List<DgIrTestModel> get dgIrEquipmentList => _dgIrEquipmentList;
  DgIrTestModel _dgIrModel;
  DgIrTestModel get dgIrModel => _dgIrModel;

  String _error = 'ErroR';
  String get error => _error;

  void getDgIrByTrNo(int trNo) async {
    _dgIrTrNoList = await sl<DgIrLocalDatasourceImpl>()
        .getDgIrByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getDgIrBySerialNo(String serialNo) async {
    _dgIrSerialNoList = await sl<DgIrLocalDatasourceImpl>()
        .getDgIrBySerialNo(serialNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getDgIrByID(int id) async {
    _dgIrModel = await sl<DgIrLocalDatasourceImpl>()
        .getDgIrById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addDgIr(DgIrTestModel dgIrTestModel) async {
    await sl<DgIrLocalDatasourceImpl>()
        .localDgIr(dgIrTestModel)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteDgIr(int id) async {
    await sl<DgIrLocalDatasourceImpl>()
        .deleteDgIrById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateDgIr(DgIrTestModel dgIrToUpdate, int id) async {
    await sl<DgIrLocalDatasourceImpl>()
        .updateDgIr(dgIrToUpdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getDgIrEquipmentList() async {
    _dgIrEquipmentList = await sl<DgIrLocalDatasourceImpl>()
        .getDgIrEquipmentList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
