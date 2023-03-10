// ignore_for_file: missing_return

import 'package:flutter/foundation.dart';
import 'package:flutter_testreports/injection_container.dart';

import '../../../data/datasources/equipment/powt_3_winding/powt3win_mcLv_local_datasource.dart';
import '../../../data/models/equipment/powt_3_winding/powt3win_mcLv_model.dart';

class Powt3win_mcLv_Provider extends ChangeNotifier {
  List<Powt3win_mcLv_Model> _powt3win_mcLv_loacaldataList = [];
  List<Powt3win_mcLv_Model> get powt3win_mcLv_loacaldataList =>
      _powt3win_mcLv_loacaldataList;

  List<Powt3win_mcLv_Model> _powt3win_mcLv_trNoIDList = [];
  List<Powt3win_mcLv_Model> get powt3win_mcLv_trNoIDList =>
      _powt3win_mcLv_trNoIDList;

  List<Powt3win_mcLv_Model> _powt3win_mcLv_serialNoList = [];
  List<Powt3win_mcLv_Model> get powt3win_mcLv_serialNoList =>
      _powt3win_mcLv_serialNoList;

  Powt3win_mcLv_Model _powt3win_mcLv_Model;
  Powt3win_mcLv_Model get powt3win_mcLv_Model => _powt3win_mcLv_Model;

  String _error = 'ErroR';
  String get error => _error;

  void getPowt3win_mcLvBytrNoID(int trNo) async {
    _powt3win_mcLv_trNoIDList = await sl<Powt3win_mcLv_LocalDatasourceImpl>()
        .getPowt3win_mcLvTrNoID(trNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowt3win_mcLvserialNo(String sNo) async {
    _powt3win_mcLv_serialNoList = await sl<Powt3win_mcLv_LocalDatasourceImpl>()
        .getPowt3win_mcLvSerialNo(sNo)
        .onError((error, stackTrace) {
      _error = error.toString();
    });
    notifyListeners();
  }

  void getPowt3win_mcLvById(int id) async {
    _powt3win_mcLv_Model = await sl<Powt3win_mcLv_LocalDatasourceImpl>()
        .getPowt3win_mcLv_ById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void addPowt3win_mcLv(Powt3win_mcLv_Model p3wmclvtolocal) async {
    await sl<Powt3win_mcLv_LocalDatasourceImpl>()
        .localPowt3win_mcLv(p3wmclvtolocal)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void deletePowt3win_mcLv(int id) async {
    await sl<Powt3win_mcLv_LocalDatasourceImpl>()
        .deletePowt3win_mcLvById(id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void updatePowt3win_mcLv(Powt3win_mcLv_Model p3wmclvtoupdate, int id) async {
    await sl<Powt3win_mcLv_LocalDatasourceImpl>()
        .updatePowt3win_mcLv(p3wmclvtoupdate, id)
        .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }

  void getPowt3winmclvEquipmentList() async {
    _powt3win_mcLv_loacaldataList =
        await sl<Powt3win_mcLv_LocalDatasourceImpl>()
            .getpowt3winmclvEquipmentLists()
            .onError((error, stackTrace) {
      error = error.toString();
    });
    notifyListeners();
  }
}
