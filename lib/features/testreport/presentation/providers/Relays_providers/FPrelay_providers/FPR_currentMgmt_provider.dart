// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../../data/datasources/equipment/Relays/FPrelay/FPR_currentMgmt_local_datasource.dart';
import '../../../../data/models/equipment/Relays/FPrelay/FPR_currentMgmt_model.dart';

class FPRcurrentMgmtProvider extends ChangeNotifier {
  List<FPRcurrentMgmtModel> _fprcurrentMgmt_loacaldataList = [];
  List<FPRcurrentMgmtModel> get fprcurrentMgmt_loacaldataList =>
      _fprcurrentMgmt_loacaldataList;

  List<FPRcurrentMgmtModel> _fprcurrentMgmt_trNoIDList = [];
  List<FPRcurrentMgmtModel> get fprcurrentMgmt_trNoIDList =>
      _fprcurrentMgmt_trNoIDList;

  List<FPRcurrentMgmtModel> _fprcurrentMgmt_serialNoList = [];
  List<FPRcurrentMgmtModel> get fprcurrentMgmt_serialNoList =>
      _fprcurrentMgmt_serialNoList;

  FPRcurrentMgmtModel _fprcurrentMgmt_Model;
  FPRcurrentMgmtModel get fprcurrentMgmt_Model => _fprcurrentMgmt_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getFPRcurrentMgmttrNoID(int trNo) async {
    _fprcurrentMgmt_trNoIDList = await sl<FPRcurrentMgmtLocalDatasourceImpl>()
        .getFPRcurrentMgmtTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getFPRcurrentMgmtserialNo(String sNo) async {
    _fprcurrentMgmt_serialNoList = await sl<FPRcurrentMgmtLocalDatasourceImpl>()
        .getFPRcurrentMgmtSerialNo(sNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getFPRcurrentMgmtById(int id) async {
    _fprcurrentMgmt_Model = await sl<FPRcurrentMgmtLocalDatasourceImpl>()
        .getFPRcurrentMgmtById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addFPRcurrentMgmt(FPRcurrentMgmtModel fprcurrentMgmttoLocal) async {
    await sl<FPRcurrentMgmtLocalDatasourceImpl>()
        .localFPRcurrentMgmt(fprcurrentMgmttoLocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteFPRcurrentMgmt(int id) async {
    await sl<FPRcurrentMgmtLocalDatasourceImpl>()
        .deleteFPRcurrentMgmtById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateFPRcurrentMgmt(
      FPRcurrentMgmtModel fprcurrentMgmtUpdate, int id) async {
    await sl<FPRcurrentMgmtLocalDatasourceImpl>()
        .updateFPRcurrentMgmt(fprcurrentMgmtUpdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getFPRcurrentmgmtEquipmentList() async {
    _fprcurrentMgmt_loacaldataList =
        await sl<FPRcurrentMgmtLocalDatasourceImpl>()
            .getFPRcurrentmgmtEquipmentLists()
            .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
