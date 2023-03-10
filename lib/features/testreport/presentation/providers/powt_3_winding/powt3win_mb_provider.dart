// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';
import '../../../data/datasources/equipment/powt_3_winding/powt3win_mb_local_datasource.dart';
import '../../../data/models/equipment/powt_3_winding/powt3win_mb_model.dart';

class Powt3win_mb_Provider extends ChangeNotifier {
  List<Powt3win_mb_Model> _powt3win_mb_loacaldataList = [];
  List<Powt3win_mb_Model> get powt3win_mb_loacaldataList =>
      _powt3win_mb_loacaldataList;

  List<Powt3win_mb_Model> _powt3win_mb_trNoIDList = [];
  List<Powt3win_mb_Model> get powt3win_mb_trNoIDList => _powt3win_mb_trNoIDList;

  List<Powt3win_mb_Model> _powt3win_mb_serialNoList = [];
  List<Powt3win_mb_Model> get powt3win_mb_serialNoList =>
      _powt3win_mb_serialNoList;

  Powt3win_mb_Model _powt3win_mb_Model;
  Powt3win_mb_Model get powt3win_mb_Model => _powt3win_mb_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getPowt3win_mbBytrNoID(int trNo) async {
    _powt3win_mb_trNoIDList = await sl<Powt3win_mb_LocalDatasourceImpl>()
        .getPowt3win_mbTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowt3win_mbserialNo(String sNo) async {
    _powt3win_mb_serialNoList = await sl<Powt3win_mb_LocalDatasourceImpl>()
        .getPowt3win_mbSerialNo(sNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowt3win_mbById(int id) async {
    _powt3win_mb_Model = await sl<Powt3win_mb_LocalDatasourceImpl>()
        .getPowt3win_mb_ById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addPowt3win_mb(Powt3win_mb_Model Powt3win_mbtoLocal) async {
    await sl<Powt3win_mb_LocalDatasourceImpl>()
        .localPowt3win_mb(Powt3win_mbtoLocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deletePowt3win_mb(int id) async {
    await sl<Powt3win_mb_LocalDatasourceImpl>()
        .deletePowt3win_mbById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updatePowt3win_mb(Powt3win_mb_Model powt3win_mbupdate, int id) async {
    await sl<Powt3win_mb_LocalDatasourceImpl>()
        .updatePowt3win_mb(powt3win_mbupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getPowt3winMBEquipmentList() async {
    _powt3win_mb_loacaldataList = await sl<Powt3win_mb_LocalDatasourceImpl>()
        .getPowt3winMBEquipmentLists()
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
