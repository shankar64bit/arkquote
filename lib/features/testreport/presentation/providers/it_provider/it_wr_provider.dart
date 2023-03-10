// ignore_for_file: prefer_final_fields, missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/IT/it_wr_local_datasource.dart';
import '../../../data/models/equipment/IT/it_wr_model.dart';

class ItWrProvider extends ChangeNotifier {
  List<ItWrTestModel> _itWrTrNoList = [];
  List<ItWrTestModel> get itWrTrNoList => _itWrTrNoList;
  List<ItWrTestModel> _itWrSerialNoList = [];
  List<ItWrTestModel> get itWrSerialNoList => _itWrSerialNoList;
  List<ItWrTestModel> _itWrEquipmentList = [];
  List<ItWrTestModel> get itWrEquipmentList => _itWrEquipmentList;
  ItWrTestModel _itWrModel;
  ItWrTestModel get itWrModel => _itWrModel;

  String _error = 'ErroR';
  String get error => _error;

  void getItWrByTrNo(int trNo) async {
    _itWrTrNoList = await sl<ItWrLocalDatasourceImpl>()
        .getItWrByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getItWrBySerialNo(String serialNo) async {
    _itWrSerialNoList = await sl<ItWrLocalDatasourceImpl>()
        .getItWrBySerialNo(serialNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getItWrByID(int id) async {
    _itWrModel = await sl<ItWrLocalDatasourceImpl>()
        .getItWrById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addItWr(ItWrTestModel itWrModel) async {
    await sl<ItWrLocalDatasourceImpl>()
        .localItWr(itWrModel)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteItWr(int id) async {
    await sl<ItWrLocalDatasourceImpl>()
        .deleteItWrById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateItWr(ItWrTestModel itWrModel, int id) async {
    await sl<ItWrLocalDatasourceImpl>()
        .updateItWr(itWrModel, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getItWrEquipmentList() async {
    _itWrEquipmentList = await sl<ItWrLocalDatasourceImpl>()
        .getItWrEquipmentList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
