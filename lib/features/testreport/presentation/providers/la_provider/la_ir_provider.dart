// ignore_for_file: prefer_final_fields, missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/LA/la_ir_local_datasource.dart';
import '../../../data/models/equipment/LA/la_ir_test_model.dart';

class LaIrProvider extends ChangeNotifier {
  List<LaIrTestModel> _laIrTrNoList = [];
  List<LaIrTestModel> get laIrTrNoList => _laIrTrNoList;
  List<LaIrTestModel> _laIrSerialNoList = [];
  List<LaIrTestModel> get laIrSerialNoList => _laIrSerialNoList;
  List<LaIrTestModel> _laIrEquipmentList = [];
  List<LaIrTestModel> get laIrEquipmentList => _laIrEquipmentList;
  LaIrTestModel _laIrModel;
  LaIrTestModel get laIrModel => _laIrModel;

  String _error = 'ErroR';
  String get error => _error;

  void getLaIrByTrNo(int trNo) async {
    _laIrTrNoList = await sl<LaIrLocalDatasourceImpl>()
        .getLaIrByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getLaIrBySerialNo(String serialNo) async {
    _laIrSerialNoList = await sl<LaIrLocalDatasourceImpl>()
        .getLaIrBySerialNo(serialNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getLaIrByID(int id) async {
    _laIrModel = await sl<LaIrLocalDatasourceImpl>()
        .getLaIrById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addLaIr(LaIrTestModel lairtolocal) async {
    await sl<LaIrLocalDatasourceImpl>()
        .localLaIr(lairtolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteLaIr(int id) async {
    await sl<LaIrLocalDatasourceImpl>()
        .deleteLaIrById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateLaIr(LaIrTestModel lairtoupdate, int id) async {
    await sl<LaIrLocalDatasourceImpl>()
        .updateLaIr(lairtoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getLaIrEquipmentList() async {
    _laIrEquipmentList = await sl<LaIrLocalDatasourceImpl>()
        .getLaIrEquipmentList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
