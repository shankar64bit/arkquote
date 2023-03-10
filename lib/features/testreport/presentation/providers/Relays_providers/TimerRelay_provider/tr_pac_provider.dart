// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../../data/datasources/equipment/Relays/TimerRelay/tr_pac_local_datasource.dart';
import '../../../../data/models/equipment/Relays/TRelay/tr_pac_model.dart';

class TrPacProvider extends ChangeNotifier {
  List<TrPacModel> _trPac_loacaldataList = [];
  List<TrPacModel> get trPac_loacaldataList => _trPac_loacaldataList;

  List<TrPacModel> _trPac_trNoIDList = [];
  List<TrPacModel> get trPac_trNoIDList => _trPac_trNoIDList;

  List<TrPacModel> _trPac_serialNoList = [];
  List<TrPacModel> get trPac_serialNoList => _trPac_serialNoList;

  TrPacModel _trPac_Model;
  TrPacModel get trPac_Model => _trPac_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getTrPactrNoID(int trNo) async {
    _trPac_trNoIDList = await sl<TrPacLocalDatasourceImpl>()
        .getTrPacTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getTrPacserialNo(String sNo) async {
    _trPac_serialNoList = await sl<TrPacLocalDatasourceImpl>()
        .getTrPacSerialNo(sNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getTrPacById(int id) async {
    _trPac_Model = await sl<TrPacLocalDatasourceImpl>()
        .getTrPacById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addTrPac(TrPacModel trPactoLocal) async {
    await sl<TrPacLocalDatasourceImpl>()
        .localTrPac(trPactoLocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deleteTrPac(int id) async {
    await sl<TrPacLocalDatasourceImpl>()
        .deleteTrPacById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updateTrPac(TrPacModel trPacToUpdate, int id) async {
    await sl<TrPacLocalDatasourceImpl>()
        .updateTrPac(trPacToUpdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getTrpacEquipmentList() async {
    _trPac_loacaldataList = await sl<TrPacLocalDatasourceImpl>()
        .getTrpacEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
