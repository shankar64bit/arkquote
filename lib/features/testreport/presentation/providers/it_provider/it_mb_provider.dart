// ignore_for_file: prefer_final_fields, missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import 'package:flutter_testreports/injection_container.dart';
import '../../../data/datasources/equipment/IT/it_mb_local_datasource.dart';
import '../../../data/models/equipment/IT/it_mb_model.dart';

class ItMbProvider extends ChangeNotifier {
  List<ItMbTestModel> _itMbTrNoList = [];
  List<ItMbTestModel> get itMbTrNoList => _itMbTrNoList;
  List<ItMbTestModel> _itMbSerialNoList = [];
  List<ItMbTestModel> get itMbSerialNoList => _itMbSerialNoList;
  List<ItMbTestModel> _itMbEquipmentList = [];
  List<ItMbTestModel> get itMbEquipmentList => _itMbEquipmentList;
  ItMbTestModel _itMbModel;
  ItMbTestModel get itMbModel => _itMbModel;

  String _error = 'ErroR';
  String get error => _error;

  void getItMbByTrNo(int trNo) async {
    _itMbTrNoList = await sl<ItMbLocalDatasourceImpl>()
        .getItMbByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getItMbBySerialNo(String serialNo) async {
    _itMbSerialNoList = await sl<ItMbLocalDatasourceImpl>()
        .getItMbBySerialNo(serialNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getItMbByID(int id) async {
    _itMbModel = await sl<ItMbLocalDatasourceImpl>()
        .getItMbById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addItMb(ItMbTestModel itMbTestModel) async {
    await sl<ItMbLocalDatasourceImpl>()
        .localItMb(itMbTestModel)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteItMb(int id) async {
    await sl<ItMbLocalDatasourceImpl>()
        .deleteItMbById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateItMb(ItMbTestModel itMbToUpdate, int id) async {
    await sl<ItMbLocalDatasourceImpl>()
        .updateItMb(itMbToUpdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getItMbEquipmentList() async {
    _itMbEquipmentList = await sl<ItMbLocalDatasourceImpl>()
        .getItMbEquipmentList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
