// ignore_for_file: prefer_final_fields, missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/features/testreport/data/datasources/test_report_local_datasource.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/IT/it_mc_local_datasource.dart';
import '../../../data/models/equipment/IT/it_mc_model.dart';

class ItMcProvider extends ChangeNotifier {
  List<ItMcTestModel> _itMcTrNoList = [];
  List<ItMcTestModel> get itMcTrNoList => _itMcTrNoList;
  List<ItMcTestModel> _itMcSerialNoList = [];
  List<ItMcTestModel> get itMcSerialNoList => _itMcSerialNoList;
  List<ItMcTestModel> _itMcEquipmentList = [];
  List<ItMcTestModel> get itMcEquipmentList => _itMcEquipmentList;
  ItMcTestModel _itMcModel;
  ItMcTestModel get itMcModel => _itMcModel;

  String _error = 'ErroR';
  String get error => _error;

  void getItMcByTrNo(int trNo) async {
    _itMcTrNoList = await sl<ItMcLocalDatasourceImpl>()
        .getItMcByTrNo(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getItMcBySerialNo(String serialNo) async {
    _itMcSerialNoList = await sl<ItMcLocalDatasourceImpl>()
        .getItMcBySerialNo(serialNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getItMcByID(int id) async {
    _itMcModel = await sl<ItMcLocalDatasourceImpl>()
        .getItMcById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addItMc(ItMcTestModel itMcTestModel) async {
    await sl<ItMcLocalDatasourceImpl>()
        .localItMc(itMcTestModel)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteItMc(int id) async {
    await sl<ItMcLocalDatasourceImpl>()
        .deleteItMcById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateItMc(ItMcTestModel itMcToUpdate, int id) async {
    await sl<ItMcLocalDatasourceImpl>()
        .updateItMc(itMcToUpdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getItMcEquipmentList() async {
    _itMcEquipmentList = await sl<ItMcLocalDatasourceImpl>()
        .getItMcEquipmentList()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
