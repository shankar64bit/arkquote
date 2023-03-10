// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../../data/datasources/equipment/Relays/FPrelay/FPR_voltageMgmt_local_datasource.dart';
import '../../../../data/models/equipment/Relays/FPrelay/FPR_voltageMgmt_model.dart';

class FPRvoltageMgmtProvider extends ChangeNotifier {
  List<FPRvoltageMgmtModel> _fprvoltageMgmt_loacaldataList = [];
  List<FPRvoltageMgmtModel> get fprvoltageMgmt_loacaldataList =>
      _fprvoltageMgmt_loacaldataList;

  List<FPRvoltageMgmtModel> _fprvoltageMgmt_trNoIDList = [];
  List<FPRvoltageMgmtModel> get fprvoltageMgmt_trNoIDList =>
      _fprvoltageMgmt_trNoIDList;

  List<FPRvoltageMgmtModel> _fprvoltageMgmt_serialNoList = [];
  List<FPRvoltageMgmtModel> get fprvoltageMgmt_serialNoList =>
      _fprvoltageMgmt_serialNoList;

  FPRvoltageMgmtModel _fprvoltageMgmt_Model;
  FPRvoltageMgmtModel get fprvoltageMgmt_Model => _fprvoltageMgmt_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getFPRvoltageMgmttrNoID(int trNo) async {
    _fprvoltageMgmt_trNoIDList = await sl<FPRvoltageMgmtLocalDatasourceImpl>()
        .getFPRvoltageMgmtTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getFPRvoltageMgmtserialNo(String sNo) async {
    _fprvoltageMgmt_serialNoList = await sl<FPRvoltageMgmtLocalDatasourceImpl>()
        .getFPRvoltageMgmtSerialNo(sNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getFPRvoltageMgmtById(int id) async {
    _fprvoltageMgmt_Model = await sl<FPRvoltageMgmtLocalDatasourceImpl>()
        .getFPRvoltageMgmtById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addFPRvoltageMgmt(FPRvoltageMgmtModel fprvoltageMgmttoLocal) async {
    await sl<FPRvoltageMgmtLocalDatasourceImpl>()
        .localFPRvoltageMgmt(fprvoltageMgmttoLocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteFPRvoltageMgmt(int id) async {
    await sl<FPRvoltageMgmtLocalDatasourceImpl>()
        .deleteFPRvoltageMgmtById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateFPRvoltageMgmt(
      FPRvoltageMgmtModel fprvoltageMgmtUpdate, int id) async {
    await sl<FPRvoltageMgmtLocalDatasourceImpl>()
        .updateFPRvoltageMgmt(fprvoltageMgmtUpdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getFPRvoltmgmtEquipmentList() async {
    _fprvoltageMgmt_loacaldataList =
        await sl<FPRvoltageMgmtLocalDatasourceImpl>()
            .getFPRvoltEquipmentLists()
            .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
