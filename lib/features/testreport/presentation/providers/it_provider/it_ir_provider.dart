// ignore_for_file: prefer_final_fields, missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/IT/it_ir_local_datasource.dart';
import '../../../data/models/equipment/IT/it_ir_model.dart';

class ItIrProvider extends ChangeNotifier {
  List<ItIrTestModel> _itIrTrNoList = [];
  List<ItIrTestModel> get itIrTrNoList => _itIrTrNoList;
  List<ItIrTestModel> _itIrSerialNoList = [];
  List<ItIrTestModel> get itIrSerialNoList => _itIrSerialNoList;
  List<ItIrTestModel> _itIrEquipmentList = [];
  List<ItIrTestModel> get itIrEquipmentList => _itIrEquipmentList;
  ItIrTestModel _itIrModel;
  ItIrTestModel get itIrModel => _itIrModel;

  String _error = 'ErroR';
  String get error => _error;

  void getItIrByTrNo(int trNo) async {
    _itIrTrNoList = await sl<ItIrLocalDatasourceImpl>()
        .getItIrByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getItIrBySerialNo(String serialNo) async {
    _itIrSerialNoList = await sl<ItIrLocalDatasourceImpl>()
        .getItIrBySerialNo(serialNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getItIrByID(int id) async {
    _itIrModel = await sl<ItIrLocalDatasourceImpl>()
        .getItIrById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addItIr(ItIrTestModel itIrTestModel) async {
    await sl<ItIrLocalDatasourceImpl>()
        .localItIr(itIrTestModel)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteItIr(int id) async {
    await sl<ItIrLocalDatasourceImpl>()
        .deleteItIrById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateItIr(ItIrTestModel itIrToUpdate, int id) async {
    await sl<ItIrLocalDatasourceImpl>()
        .updateItIr(itIrToUpdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getItIrEquipmentList() async {
    _itIrEquipmentList = await sl<ItIrLocalDatasourceImpl>()
        .getItIrEquipmentList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
